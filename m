Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7F51C54F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 08:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gsXGM4UXXg5X82wsCG4Eg9IZLq9CvOeiqqMgouKb1g8=; b=O6OhoXvzwdPH5OExTBNC0nhXGk
	0DBwkTjZWhF+WnYh+RrF8T/bd7m5utINKhuBxrS3D0+oliA5EuhvQLeUC6mgRUu1SqI/Q2HUjW+Zm
	D0BEx3V9HSXMTOXxMR1DnidCK55NZkNaFBuP3KMjqWfk3P8NHUu085sgM7rZyPN44hA8KO3IylJ/n
	37oEpyO/usrEyGORbD6DuRwVD58VxR2cyZzuDdvNxW23FBMheL0f57kZl4Iq8N7GsbWc1zi+Hye8f
	q3cYnofKCUDoatqDNaQVTIn9LJl3Rn+l7AI34DhwcqXAYbjcdpiymQ/RNU3Nl4UE77z+ruDVRqyAF
	DKeQf6rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIO1Z-00000003Khh-1GRn;
	Fri, 23 May 2025 08:45:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uINfr-00000003IVG-0FR7
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 23 May 2025 08:22:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=gsXGM4UXXg5X82wsCG4Eg9IZLq9CvOeiqqMgouKb1g8=; b=IL+hronK7egGw3BgsqpHMRH9tL
	MT/H8LUZXdoqP5bLlRqU/6xF/waZWNoB/uPt6Oz49Eh6u3LX3YV7+tsK4vEgBOLQ4jsNo/HD8M6o9
	/qGwF62+4FW8rDP9CXmLkAmrBn0K7vr4Lln6/Y2WqRzEtWnYYxfFZX/pVUpdGioBGwkfLPEIB1JMS
	vDAvm5DH+u58/FsEQZqcyk81vQ2DPXB0EY77+iryhuQsub5bFSfvHjzeSsJwizVXX+ro+w/+dmIZH
	NAqnMRTLsNUtnJpmNigCbslwnj9dYwW8bYhyv08vT5Gf033tbNm5LekMRn1oWsbaRdUrJuwQrl0aK
	hBr8kxhg==;
Received: from mgamail.intel.com ([192.198.163.17])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uINfn-00000001DtH-2wqw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 08:22:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747988556; x=1779524556;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UktUFNhQpzGrRsFIwIpfLH+M+oX8xvKnPJijRRpkYXw=;
  b=S2Ju5RjYePAlqffSDpte1DZ/cft0fSgeoEieDoNUjRq7f2bQsA8moCjI
   /CieRcU2QBafl9KoSt7+H+vyTfYnsdfg1E7bGASxrLOHLFHhej8Op7ZFs
   0Ay0GdS8jUDlujdkV4pfN1VNVrND+r9CGxzQmGZxSxi+3YqsGIuWDcQSx
   9RUoURz4/QnOBGH5qlKe1WwFSSDguMYwx+cnMLM0cU5bvRDmgbecsIwPU
   JacjKZQToAJeaQFo7ehuNzeSNZURGCuXh7LnOGSh5TDAOyomvW0Wm9J2l
   w79v2UpZuw7lgbumlmBt79wSR4TjPzXVFKp2uJ3lM+VvaOvV52d9OPYel
   Q==;
X-CSE-ConnectionGUID: ahcG0/hiTsWxaR7P2LDQMw==
X-CSE-MsgGUID: YIE1tSchQrmby1FAtNiX9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="49958779"
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; 
   d="scan'208";a="49958779"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 01:22:31 -0700
X-CSE-ConnectionGUID: hbdtZnCZSp+nEANc3d6+Yw==
X-CSE-MsgGUID: aGhX6r3rRwu6bK0N6bagxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; 
   d="scan'208";a="146032463"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 23 May 2025 01:22:28 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uINfe-000QC8-0N;
	Fri, 23 May 2025 08:22:26 +0000
Date: Fri, 23 May 2025 16:21:55 +0800
From: kernel test robot <lkp@intel.com>
To: Paul Alvin <alvin.paulp@amd.com>, michal.simek@amd.com,
	adrian.hunter@intel.com, ulf.hansson@linaro.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, git@amd.com,
	alvin.paulp@amd.com, linux-arm-kernel@lists.infradead.org,
	linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mmc: sdhci-of-arasan: Add shutdown callback
Message-ID: <202505231550.RaoPUrmq-lkp@intel.com>
References: <20250522094932.4187301-1-alvin.paulp@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250522094932.4187301-1-alvin.paulp@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_092236_291398_7671826E 
X-CRM114-Status: GOOD (  12.06  )
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

Hi Paul,

kernel test robot noticed the following build errors:

[auto build test ERROR on v6.15-rc7]
[also build test ERROR on linus/master next-20250522]
[cannot apply to xilinx-xlnx/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Paul-Alvin/mmc-sdhci-of-arasan-Add-shutdown-callback/20250522-175110
base:   v6.15-rc7
patch link:    https://lore.kernel.org/r/20250522094932.4187301-1-alvin.paulp%40amd.com
patch subject: [PATCH] mmc: sdhci-of-arasan: Add shutdown callback
config: arm64-randconfig-002-20250523 (https://download.01.org/0day-ci/archive/20250523/202505231550.RaoPUrmq-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250523/202505231550.RaoPUrmq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505231550.RaoPUrmq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/mmc/host/sdhci-of-arasan.c:2063:2: error: call to undeclared function 'sdhci_arasan_suspend'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           sdhci_arasan_suspend(dev);
           ^
   1 error generated.


vim +/sdhci_arasan_suspend +2063 drivers/mmc/host/sdhci-of-arasan.c

  2058	
  2059	static void sdhci_arasan_shutdown(struct platform_device *pdev)
  2060	{
  2061		struct device *dev = &pdev->dev;
  2062	
> 2063		sdhci_arasan_suspend(dev);
  2064	}
  2065	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

