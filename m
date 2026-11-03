Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C11B606A326
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 16:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Q9rYyhe4;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UUDPvPCn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=RtjWS+Rl15OxWIKAquzxeERLFmCYxpheVr2kTDLFGCs=; b=Q9rYyhe46CLOyCDtoigRyE/n7w
	j0Cpt+IVWNgejPxPx2OlWtS8UxGB760c0G7YLktgMCmoaeM2l6fdTLQTPyTRIPTCh1dFjUXuqMMqJ
	lJbYNN5Y3P2R2zKP5uTdX3n0HZnKxZQCSefUfVgvUATjwy8iIy/I6a1FpUE6qJ701VazfTCZsB21B
	9ZfXBnFSuvEoQio8YfbmSpakGZFessQQBdEwg/Ob0mU30I+xgT9qyHlO/iFNhHHBQE8Im2XgfBfDJ
	l6pLxJwijVhoFveEL8SVMLBEGeDGrPf9DB2RedVhZOsQzFANcG6+Bh0HGN0bhk0S6PqQaUpVJH1ve
	eYSvrdxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOH1S-000000033rX-1enj;
	Tue, 03 Nov 2026 16:06:06 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOH1P-000000033qW-0XEf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 16:06:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793721964; x=1825257964;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Q9SURTZ81MiAnKBH+kKXsgn9FP0ZpGgJ1Ua+t993uDM=;
  b=UUDPvPCndfck85e1eYpamkBXnCvXuWAzZvEWQoOcJxJ/Kaskt6LVp54G
   2sbpLZNEceMD5y2ZA48IDKKb+3cNQ4NZeBSOsc8wHUUYrHjfpKZ6Odo3j
   SUmBAEw5y8IOgI1Q+q6oTK0QHrqWbhpcTyOP3etIYL/hCO1xs6Mwwc/UC
   U3FrO+uZUipEQ3nnexpEM0u8d4ZN5BJ209AaBkS0bc9hbGshnAV1nRxIH
   3zO+IL/y9SpFw/wiQPDsG2sIC3eT9ooEwHiiwmSEpINkziFEvWm0hyP7O
   hvqTUMM5xbOOYO71KkMYuxE53EbvIPstU+vlZ9l8w+yWJB59BCyCVnDSh
   g==;
X-CSE-ConnectionGUID: i77rxrccRLmbJs1ExXF5/A==
X-CSE-MsgGUID: d//iEtU4Ra+reUu8SRGGTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2361999"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2361999"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 08:06:03 -0800
X-CSE-ConnectionGUID: HtgbmJs7QSujkf9Xu7ssGQ==
X-CSE-MsgGUID: ORJ8voURRfq4ObwiFyuizw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6468510"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 03 Nov 2026 08:06:00 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOH1J-00000000iwJ-24Wz;
	Tue, 03 Nov 2026 16:05:57 +0000
Date: Wed, 4 Nov 2026 00:05:33 +0800
From: kernel test robot <lkp@intel.com>
To: Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
	jassisinghbrar@gmail.com, michal.simek@amd.com, tanmay.shah@amd.com,
	saeed.nowshadi@amd.com, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, ssengar@linux.microsoft.com,
	tgopinath@linux.microsoft.com, srivatsa@csail.mit.edu
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 1/2] mailbox: zynqmp-ipi: Fix CPU hotplug state cleanup
Message-ID: <202611032308.xkvLFqmo-lkp@intel.com>
References: <20261103062051.676519-1-ptsm@linux.microsoft.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103062051.676519-1-ptsm@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_080603_181585_909D9551 
X-CRM114-Status: GOOD (  12.09  )
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Prasanna,

kernel test robot noticed the following build warnings:

[auto build test WARNING on jassibrar-mailbox/for-next]
[also build test WARNING on linus/master xilinx-xlnx/master v7.3 next-20261030]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Prasanna-Kumar-T-S-M/soc-xilinx-Fix-event-manager-CPU-hotplug-state-cleanup/20261102-223515
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jassibrar/mailbox.git for-next
patch link:    https://lore.kernel.org/r/20261103062051.676519-1-ptsm%40linux.microsoft.com
patch subject: [PATCH 1/2] mailbox: zynqmp-ipi: Fix CPU hotplug state cleanup
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20261103/202611032308.xkvLFqmo-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261103/202611032308.xkvLFqmo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611032308.xkvLFqmo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/mailbox/zynqmp-ipi-mailbox.c:141 struct member 'hp_state' not described in 'zynqmp_ipi_pdata'
>> Warning: drivers/mailbox/zynqmp-ipi-mailbox.c:141 struct member 'hp_state' not described in 'zynqmp_ipi_pdata'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

