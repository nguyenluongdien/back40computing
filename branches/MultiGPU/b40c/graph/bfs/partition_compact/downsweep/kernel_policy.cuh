/******************************************************************************
 * 
 * Copyright 2010-2011 Duane Merrill
 * 
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License. 
 * 
 * For more information, see our Google Code project site: 
 * http://code.google.com/p/back40computing/
 * 
 * Thanks!
 * 
 ******************************************************************************/


/******************************************************************************
 * Downsweep kernel configuration policy
 ******************************************************************************/

#pragma once

#include <b40c/util/cuda_properties.cuh>
#include <b40c/util/cta_work_distribution.cuh>

#include <b40c/partition/downsweep/kernel_policy.cuh>

namespace b40c {
namespace bfs {
namespace partition_compact {
namespace downsweep {


/**
 * A detailed downsweep kernel configuration policy type that specializes kernel
 * code for a specific compaction pass. It encapsulates tuning configuration
 * policy details derived from TuningPolicy.
 */
template <TuningPolicy>
struct KernelPolicy :
	partition::downsweep::KernelPolicy<TuningPolicy>
{
	//---------------------------------------------------------------------
	// Typedefs
	//---------------------------------------------------------------------

	typedef partition::downsweep::KernelPolicy<TuningPolicy> 	Base;			// Base class
	typedef typename TuningPolicy::SizeT 						SizeT;


	//---------------------------------------------------------------------
	// Storage
	//---------------------------------------------------------------------

	/**
	 * Shared storage
	 */
	struct SmemStorage : Base::SmemStorage
	{
		// Shared work-processing limits
		util::CtaWorkDistribution<SizeT>	work_decomposition;
	};

};
	


} // namespace downsweep
} // namespace partition_compact
} // namespace bfs
} // namespace b40c


