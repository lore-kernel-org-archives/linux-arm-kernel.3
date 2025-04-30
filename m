Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57668C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 05:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Zoyq2b47KUoBLTpaf6kYk2lqijmbbv99Jwz0kwupuY=; b=mr/WP+DyNel2f4i25rWWf6f67t
	BPR/Ik02aNfXbm+OA5TPVORtRDCbrX8z5/rICWVFyeDywK0SbP82/vok3LDKM7hU03opA/WbgXLXc
	5pylgisgj5mBofDTK2Zavb9HxN/+veXyorIJ7Vyz1uTxAJ3AKjrVJhE/oCvjP1eyul60td3fggIeD
	HRe+cgqf3mLTFdu7tN7pwFbR3/NTcpwqPG3v60wxYET8exe/HEQhn+E8RLqSKyCGXyQ/IrujDFjeR
	QEwsQPusbrOjS8JdK3UGS0LBPgQoen8QMQHXtLFTsvx42BosG1huYnVMwh+dOYeeJp4E8GFPRcesJ
	KK6D94eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA0Gq-0000000Bn4n-2LWA;
	Wed, 30 Apr 2025 05:46:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA07O-0000000Bm7z-1Qrh
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Apr 2025 05:36:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=+Zoyq2b47KUoBLTpaf6kYk2lqijmbbv99Jwz0kwupuY=; b=JkRnr/m6lV/ki0VNHvASPGvg65
	ZvK7Q3NXO8kzD4QutdemvD5atO/9iqY8tP/j2u5dMtVUzWKZXs0eukNuS6Ou9kbULJY0tcO7V/xaj
	MFwgs+rIe0vYF0x1bJYH/31ivWVB6eE+gaUu5bylmv06XnWX6bzyeBA6tAT2zGtgr8ZjfkBMmfZSA
	hEaWRRphwQO0vQqDODRkbLkm9I7NuhGLGT7+u2/zREaF8dKspCnydDIkK/rpYTRQhXUYyj3Jt6FEU
	x2C28tbCkVe9uX5PAnyhEKYIBBnjsL0qGcck1AdFbx2pR9CvruU2Ecg+aT9FhwTBS8OPdz4qInDo7
	kaDyGqRQ==;
Received: from mgamail.intel.com ([192.198.163.7])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uA07J-0000000DhP9-3LBV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 05:36:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745991382; x=1777527382;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qkNRqzaLetnXbthDZ+02HWpZDM7Dejcb6Ifv+OyI2gI=;
  b=nBEv/yzMEvk3lbiv27unaGmVWjxbbTZk5aO3skT0ncPRhWIenqtcmnYw
   FrKkX/F4Kvpmr2mI8sFYjItvZWUic4zpYoVyJPX737QphJhfwmH9z6KBh
   9dGCLf+zOOiTGdrZ9C2Se2+D4MDONE2JGMWvr9GDAx9roLkizWXAqldrd
   hnT3J3E3vFlcdsJvJwQ9oLpqLKw6AFfb/GGMZwRx5ebXbWroH4qqHM/Ro
   x6bmSUABOuYfTkhMd6EViQipGqHXnJXmUUDAz9kaNtLwAe0JwbTN1v5q3
   ZyukmRmJD3Rvs0ByjNAZb3geOuh+HuKT0kaPj7JYQQzCoSWlOr3C76Z8I
   Q==;
X-CSE-ConnectionGUID: JcdHDLGkRra4Rh1NnwjoqQ==
X-CSE-MsgGUID: 0rZpQPgvQQeoG7Mi0u0/2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="73022550"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="73022550"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 22:36:14 -0700
X-CSE-ConnectionGUID: Tm8+kCPLQKmrtyrTulHBOQ==
X-CSE-MsgGUID: rpoIVj1rTmaU9sTCPIEO3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="133929533"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 29 Apr 2025 22:36:06 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uA072-0003Bh-0e;
	Wed, 30 Apr 2025 05:36:04 +0000
Date: Wed, 30 Apr 2025 13:35:11 +0800
From: kernel test robot <lkp@intel.com>
To: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org
Cc: oe-kbuild-all@lists.linux.dev, ryan.roberts@arm.com, david@redhat.com,
	willy@infradead.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, catalin.marinas@arm.com,
	will@kernel.org, Liam.Howlett@oracle.com,
	lorenzo.stoakes@oracle.com, vbabka@suse.cz, jannh@google.com,
	anshuman.khandual@arm.com, peterx@redhat.com, joey.gouly@arm.com,
	ioworker0@gmail.com, baohua@kernel.org, kevin.brodsky@arm.com,
	quic_zhenhuah@quicinc.com, christophe.leroy@csgroup.eu,
	yangyicong@hisilicon.com, linux-arm-kernel@lists.infradead.org,
	namit@vmware.com, hughd@google.com, yang@os.amperecomputing.com,
	ziy@nvidia.com, Dev Jain <dev.jain@arm.com>
Subject: Re: [PATCH v2 3/7] mm: Add batched versions of
 ptep_modify_prot_start/commit
Message-ID: <202504301319.aph2eccP-lkp@intel.com>
References: <20250429052336.18912-4-dev.jain@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429052336.18912-4-dev.jain@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_063622_539549_178D90D0 
X-CRM114-Status: GOOD (  15.28  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Dev,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on arm64/for-next/core linus/master v6.15-rc4 next-20250429]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dev-Jain/mm-Refactor-code-in-mprotect/20250429-133151
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250429052336.18912-4-dev.jain%40arm.com
patch subject: [PATCH v2 3/7] mm: Add batched versions of ptep_modify_prot_start/commit
config: arm-randconfig-001-20250430 (https://download.01.org/0day-ci/archive/20250430/202504301319.aph2eccP-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250430/202504301319.aph2eccP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504301319.aph2eccP-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/mm.h:31,
                    from arch/arm/kernel/asm-offsets.c:12:
   include/linux/pgtable.h: In function 'modify_prot_start_ptes':
   include/linux/pgtable.h:901:8: error: implicit declaration of function 'ptep_modify_prot_start' [-Werror=implicit-function-declaration]
     901 |  pte = ptep_modify_prot_start(vma, addr, ptep);
         |        ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/pgtable.h: In function 'modify_prot_commit_ptes':
   include/linux/pgtable.h:921:3: error: implicit declaration of function 'ptep_modify_prot_commit' [-Werror=implicit-function-declaration]
     921 |   ptep_modify_prot_commit(vma, addr, ptep, old_pte, pte);
         |   ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pgtable.h: At top level:
>> include/linux/pgtable.h:1356:21: error: conflicting types for 'ptep_modify_prot_start'
    1356 | static inline pte_t ptep_modify_prot_start(struct vm_area_struct *vma,
         |                     ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/pgtable.h:901:8: note: previous implicit declaration of 'ptep_modify_prot_start' was here
     901 |  pte = ptep_modify_prot_start(vma, addr, ptep);
         |        ^~~~~~~~~~~~~~~~~~~~~~
>> include/linux/pgtable.h:1367:20: warning: conflicting types for 'ptep_modify_prot_commit'
    1367 | static inline void ptep_modify_prot_commit(struct vm_area_struct *vma,
         |                    ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pgtable.h:1367:20: error: static declaration of 'ptep_modify_prot_commit' follows non-static declaration
   include/linux/pgtable.h:921:3: note: previous implicit declaration of 'ptep_modify_prot_commit' was here
     921 |   ptep_modify_prot_commit(vma, addr, ptep, old_pte, pte);
         |   ^~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
   make[3]: *** [scripts/Makefile.build:98: arch/arm/kernel/asm-offsets.s] Error 1 shuffle=2044487564
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1280: prepare0] Error 2 shuffle=2044487564
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=2044487564
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=2044487564
   make: Target 'prepare' not remade because of errors.


vim +/ptep_modify_prot_start +1356 include/linux/pgtable.h

1ea0704e0da65b include/asm-generic/pgtable.h Jeremy Fitzhardinge 2008-06-16  1340  
1ea0704e0da65b include/asm-generic/pgtable.h Jeremy Fitzhardinge 2008-06-16  1341  #ifndef __HAVE_ARCH_PTEP_MODIFY_PROT_TRANSACTION
1ea0704e0da65b include/asm-generic/pgtable.h Jeremy Fitzhardinge 2008-06-16  1342  /*
1ea0704e0da65b include/asm-generic/pgtable.h Jeremy Fitzhardinge 2008-06-16  1343   * Start a pte protection read-modify-write transaction, which
1ea0704e0da65b include/asm-generic/pgtable.h Jeremy Fitzhardinge 2008-06-16  1344   * protects against asynchronous hardware modifications to the pte.
1ea0704e0da65b include/asm-generic/pgtable.h Jeremy Fitzhardinge 2008-06-16  1345   * The intention is not to prevent the hardware from making pte
1ea0704e0da65b include/asm-generic/pgtable.h Jeremy Fitzhardinge 2008-06-16  1346   * updates, but to prevent any updates it may make from being lost.
1ea0704e0da65b include/asm-generic/pgtable.h Jeremy Fitzhardinge 2008-06-16  1347   *
1ea0704e0da65b include/asm-generic/pgtable.h Jeremy Fitzhardinge 2008-06-16  1348   * This does not protect against other software modifications of the
2eb70aab25dd9b include/linux/pgtable.h       Bhaskar Chowdhury   2021-05-06  1349   * pte; the appropriate pte lock must be held over the transaction.
1ea0704e0da65b include/asm-generic/pgtable.h Jeremy Fitzhardinge 2008-06-16  1350   *
1ea0704e0da65b include/asm-generic/pgtable.h Jeremy Fitzhardinge 2008-06-16  1351   * Note that this interface is intended to be batchable, meaning that
1ea0704e0da65b include/asm-generic/pgtable.h Jeremy Fitzhardinge 2008-06-16  1352   * ptep_modify_prot_commit may not actually update the pte, but merely
1ea0704e0da65b include/asm-generic/pgtable.h Jeremy Fitzhardinge 2008-06-16  1353   * queue the update to be done at some later time.  The update must be
1ea0704e0da65b include/asm-generic/pgtable.h Jeremy Fitzhardinge 2008-06-16  1354   * actually committed before the pte lock is released, however.
1ea0704e0da65b include/asm-generic/pgtable.h Jeremy Fitzhardinge 2008-06-16  1355   */
0cbe3e26abe0cf include/asm-generic/pgtable.h Aneesh Kumar K.V    2019-03-05 @1356  static inline pte_t ptep_modify_prot_start(struct vm_area_struct *vma,
1ea0704e0da65b include/asm-generic/pgtable.h Jeremy Fitzhardinge 2008-06-16  1357  					   unsigned long addr,
1ea0704e0da65b include/asm-generic/pgtable.h Jeremy Fitzhardinge 2008-06-16  1358  					   pte_t *ptep)
1ea0704e0da65b include/asm-generic/pgtable.h Jeremy Fitzhardinge 2008-06-16  1359  {
0cbe3e26abe0cf include/asm-generic/pgtable.h Aneesh Kumar K.V    2019-03-05  1360  	return __ptep_modify_prot_start(vma, addr, ptep);
1ea0704e0da65b include/asm-generic/pgtable.h Jeremy Fitzhardinge 2008-06-16  1361  }
1ea0704e0da65b include/asm-generic/pgtable.h Jeremy Fitzhardinge 2008-06-16  1362  
1ea0704e0da65b include/asm-generic/pgtable.h Jeremy Fitzhardinge 2008-06-16  1363  /*
1ea0704e0da65b include/asm-generic/pgtable.h Jeremy Fitzhardinge 2008-06-16  1364   * Commit an update to a pte, leaving any hardware-controlled bits in
1ea0704e0da65b include/asm-generic/pgtable.h Jeremy Fitzhardinge 2008-06-16  1365   * the PTE unmodified.
1ea0704e0da65b include/asm-generic/pgtable.h Jeremy Fitzhardinge 2008-06-16  1366   */
0cbe3e26abe0cf include/asm-generic/pgtable.h Aneesh Kumar K.V    2019-03-05 @1367  static inline void ptep_modify_prot_commit(struct vm_area_struct *vma,
1ea0704e0da65b include/asm-generic/pgtable.h Jeremy Fitzhardinge 2008-06-16  1368  					   unsigned long addr,
04a8645304500b include/asm-generic/pgtable.h Aneesh Kumar K.V    2019-03-05  1369  					   pte_t *ptep, pte_t old_pte, pte_t pte)
1ea0704e0da65b include/asm-generic/pgtable.h Jeremy Fitzhardinge 2008-06-16  1370  {
0cbe3e26abe0cf include/asm-generic/pgtable.h Aneesh Kumar K.V    2019-03-05  1371  	__ptep_modify_prot_commit(vma, addr, ptep, pte);
1ea0704e0da65b include/asm-generic/pgtable.h Jeremy Fitzhardinge 2008-06-16  1372  }
1ea0704e0da65b include/asm-generic/pgtable.h Jeremy Fitzhardinge 2008-06-16  1373  #endif /* __HAVE_ARCH_PTEP_MODIFY_PROT_TRANSACTION */
fe1a6875fcaaac include/asm-generic/pgtable.h Sebastian Siewior   2008-07-15  1374  #endif /* CONFIG_MMU */
1ea0704e0da65b include/asm-generic/pgtable.h Jeremy Fitzhardinge 2008-06-16  1375  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

