// Copyright 2017-2019 Google Inc. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

// WARNING: this is a "restricted" source file; avoid including any headers
// unless they are also restricted. See arch_specific.h for details.

#define HH_TARGET_NAME NEON
// GCC 4.5.4 only defines the former; 5.4 defines both.
#if defined(__ARM_NEON__) || defined(__ARM_NEON)
#include "../highwayhash_target.cpp"
#endif