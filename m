Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EDCC606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Oct 2026 17:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=usamJEGN;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Jpfuyzc+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=oUwvHq0P/9gsOPpgAsIiXBykttRf2wfXHYBWY4fgpX4=; b=usamJEGN/aSa7Ty8f+bAb2o29B
	kgyebIqXwat+CVNYCiw2KAbMs+re1l2rbPIDCVE4V4ABtnaV/JkSHGyokRh2Kdd3HRG6Rew04P3dq
	SNCgrDE07htnWKdUnss2PZvCjdVqeC/UYEBuCPgxoxgCHaLQ09hkB1hNqm/5owmYNHuxjuyK6nIp0
	jZy8HERsPkMZ0s2uIwc+wkAi7vXYy/WhzufguHjrqKVFfMheDpqkkKoeq/OdgNvKbGLE6m1TokWya
	SMIrWpmENDXFb8DRD3qUZSOQxjPJwfz4nRGT00yM+7BrX/Mg8YNItLOcL1UGo8tpY7Y61vQtKaJhc
	VjrHIg0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL1fd-00000001DCw-3yOz;
	Sun, 25 Oct 2026 17:06:09 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL1fa-00000001DCU-0nZm
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Oct 2026 17:06:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792947966; x=1824483966;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AxOjbFvh/NcIZrioJUJIpPem4ac7BqaQaQFD2sY7xA8=;
  b=Jpfuyzc+a7br68ER81tmna66JEAETrLktf7kIiMEnczopP0n7CUDMVUB
   575EFeqruYqiYLFrPP+L4+IOUhMR1MHYG3lAQAqMfu2KTrd3nl7mqzb2n
   gSiDepyWwdKZGrvrlpsM+GkNZ58auJvXW2K4SscdL/Cdt1PAvuUNL/vPE
   tJF9b2F5yVqpUghg+eYED0uqqFk4m97YuZdNddlnBm22PNmB6pXD7DM0G
   p0cUl9ItJDZAhIsJQ6yEADkW/6JTKA7o/a8ceMb1dhuFrySEMkSagJjh+
   UdGYt2XVTkIv0fia5XfP+7OEuW9iHq+aR7mrDTZ8VO+7028JtoUDaL833
   g==;
X-CSE-ConnectionGUID: OKwgKhW6Qemk5tC4IPlTmw==
X-CSE-MsgGUID: GrxHD7BPQHqhmL8STH824Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1611695"
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="1611695"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2026 10:06:02 -0700
X-CSE-ConnectionGUID: 58RfMdFWTXqNG1oYrD8erg==
X-CSE-MsgGUID: ITdobinPTCSRoDNVxb84cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="4051939"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 25 Oct 2026 10:05:58 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xL1fN-00000000UxW-3BwO;
	Sun, 25 Oct 2026 17:05:53 +0000
Date: Mon, 26 Oct 2026 01:05:39 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Ayupov <aaupov@fb.com>, James Clark <james.clark@linaro.org>,
	Leo Yan <leo.yan@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Daniel Pereira <danielmaraboo@gmail.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/7] perf: arm_pmuv3: Add pmuv3_event_implemented()
Message-ID: <202610260043.uPhMX80G-lkp@intel.com>
References: <cd3e622681f7254216b0488f09d2cb2d91a2d8ca.1792907333.git.aaupov@fb.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cd3e622681f7254216b0488f09d2cb2d91a2d8ca.1792907333.git.aaupov@fb.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_100606_299043_2BFF2F44 
X-CRM114-Status: GOOD (  12.09  )
X-Spam-Score: -4.7 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Amir,

kernel test robot noticed the following build errors:

[auto build test ERROR on 343cfcbb3ecfdb80aa576a428cfa3b65ad783842]

url:    https://github.com/intel-lab-lkp/linux/commits/Amir-Ayupov/coresight-etm4x-Fix-event-count-decoding/20261024-233901
base:   343cfcbb3ecfdb80aa576a428cfa3b65ad783842
patch link:    https://lore.kernel.org/r/cd3e622681f7254216b0488f09d2cb2d91a2d8ca.1792907333.git.aaupov%40fb.com
patch subject: [PATCH v3 5/7] perf: arm_pmuv3: Add pmuv3_event_implemented()
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261026/202610260043.uPhMX80G-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261026/202610260043.uPhMX80G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610260043.uPhMX80G-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/kvm/arm_pmu.h:11,
                    from arch/arm64/include/asm/kvm_host.h:38,
                    from arch/arm64/include/asm/arm_pmuv3.h:9,
                    from arch/arm64/kernel/cpufeature.c:80:
   include/linux/perf/arm_pmuv3.h: In function 'pmuv3_event_implemented':
>> include/linux/perf/arm_pmuv3.h:333:26: error: implicit declaration of function 'pmuv3_implemented'; did you mean 'pmuv3_event_implemented'? [-Wimplicit-function-declaration]
     333 |         if (id >= 64 || !pmuv3_implemented(read_pmuver()))
         |                          ^~~~~~~~~~~~~~~~~
         |                          pmuv3_event_implemented
>> include/linux/perf/arm_pmuv3.h:333:44: error: implicit declaration of function 'read_pmuver' [-Wimplicit-function-declaration]
     333 |         if (id >= 64 || !pmuv3_implemented(read_pmuver()))
         |                                            ^~~~~~~~~~~
>> include/linux/perf/arm_pmuv3.h:336:28: error: implicit declaration of function 'read_pmceid0' [-Wimplicit-function-declaration]
     336 |         pmceid = id < 32 ? read_pmceid0() : read_pmceid1();
         |                            ^~~~~~~~~~~~
>> include/linux/perf/arm_pmuv3.h:336:45: error: implicit declaration of function 'read_pmceid1' [-Wimplicit-function-declaration]
     336 |         pmceid = id < 32 ? read_pmceid0() : read_pmceid1();
         |                                             ^~~~~~~~~~~~
   arch/arm64/include/asm/arm_pmuv3.h: At top level:
>> arch/arm64/include/asm/arm_pmuv3.h:49:19: error: conflicting types for 'read_pmuver'; have 'u32(void)' {aka 'unsigned int(void)'}
      49 | static inline u32 read_pmuver(void)
         |                   ^~~~~~~~~~~
   include/linux/perf/arm_pmuv3.h:333:44: note: previous implicit declaration of 'read_pmuver' with type 'int()'
     333 |         if (id >= 64 || !pmuv3_implemented(read_pmuver()))
         |                                            ^~~~~~~~~~~
>> arch/arm64/include/asm/arm_pmuv3.h:160:19: error: conflicting types for 'read_pmceid0'; have 'u64(void)' {aka 'long long unsigned int(void)'}
     160 | static inline u64 read_pmceid0(void)
         |                   ^~~~~~~~~~~~
   include/linux/perf/arm_pmuv3.h:336:28: note: previous implicit declaration of 'read_pmceid0' with type 'int()'
     336 |         pmceid = id < 32 ? read_pmceid0() : read_pmceid1();
         |                            ^~~~~~~~~~~~
>> arch/arm64/include/asm/arm_pmuv3.h:165:19: error: conflicting types for 'read_pmceid1'; have 'u64(void)' {aka 'long long unsigned int(void)'}
     165 | static inline u64 read_pmceid1(void)
         |                   ^~~~~~~~~~~~
   include/linux/perf/arm_pmuv3.h:336:45: note: previous implicit declaration of 'read_pmceid1' with type 'int()'
     336 |         pmceid = id < 32 ? read_pmceid0() : read_pmceid1();
         |                                             ^~~~~~~~~~~~
>> arch/arm64/include/asm/arm_pmuv3.h:170:20: error: conflicting types for 'pmuv3_implemented'; have 'bool(int)' {aka '_Bool(int)'}
     170 | static inline bool pmuv3_implemented(int pmuver)
         |                    ^~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmuv3.h:333:26: note: previous implicit declaration of 'pmuv3_implemented' with type 'int()'
     333 |         if (id >= 64 || !pmuv3_implemented(read_pmuver()))
         |                          ^~~~~~~~~~~~~~~~~


vim +333 include/linux/perf/arm_pmuv3.h

   320	
   321	/*
   322	 * Whether this CPU's PMU implements a common event, as reported by
   323	 * PMCEID{0,1}: events 0x0000-0x003f in bits [31:0], and from PMUv3p1 events
   324	 * 0x4000-0x403f in bits [63:32], which read as zero before PMUv3p1.
   325	 * Must run on the CPU whose PMU is queried.
   326	 */
   327	static inline bool pmuv3_event_implemented(u16 event)
   328	{
   329		bool ext = event >= ARMV8_PMUV3_EXT_COMMON_EVENT_BASE;
   330		u16 id = ext ? event - ARMV8_PMUV3_EXT_COMMON_EVENT_BASE : event;
   331		u64 pmceid;
   332	
 > 333		if (id >= 64 || !pmuv3_implemented(read_pmuver()))
   334			return false;
   335	
 > 336		pmceid = id < 32 ? read_pmceid0() : read_pmceid1();
   337		return pmceid & BIT_ULL(id % 32 + (ext ? 32 : 0));
   338	}
   339	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

