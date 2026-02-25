Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F53EF55431
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 00:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Q5xBPE/Rqm6f+SYfaEcPhgeuDyyZWqcOIQRj2dmo/R8=; b=aaLZl68IH2olL5abaeh81yF3Um
	mQKLwjuTqVedWksCOMEUKfdmUDdmfuIJTalhz0mVUTCtAkU7r2YOjYHP5hitkUPXGjxguWlYMwsPM
	pGelfdQVzRLqrukQW8FYQyuoOBsEsAXegg5bcr/U8oLeLv2Bn4UAsl25dmku7eGeIOslS1unf4e7g
	sxQCXlc9cQwiPgiOouJ/PrdraSBh2HiPEbs1vzq/7RKz7XwurpUFytNn7+FF1E55VYUysEYyAE/mF
	sG2TrgxP/P0PMkPb931G1tQEgAE87P0tyruFqYqLkHoNu24Iou7u8M9Wx3AAKHB8bWy4sQI1cx27h
	cpstWUmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv2fv-00000002zPW-0yNJ;
	Wed, 25 Feb 2026 00:22:47 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv2fs-00000002zPD-3Qoc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 00:22:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771978965; x=1803514965;
  h=date:from:to:cc:subject:message-id;
  bh=errabppB0VlyJx21rxGmtbYBTGCYeAlRczU+j2XxbMs=;
  b=imIg8QDdAaLMRJJ9ypIQawsEii2wQA+mdFOO/Kx913zAqzigbHUT+UnA
   csUwiX5OaeHcxf2RTX2RHr+US5RAgRWumUsXCt/Jqx2WGT8c96HoRluVG
   U93uBow/FeT70LJZwt1EkaHpQwqCcuu0l/lenh0f3HMEutBLxSxa5bokn
   IDfCINwBjfZIsFqhTO+N6mn7hgIoI4AQ/z67woz6BZB8Hf6r/1C/ngbkO
   eqBkpVPZqSLRz++wc3Ra2hmECMwQrTpKunKk5u0r5tFKigBejFgAL3Ct4
   wNpHBcFAWeH1P6JbO9cWaRmWbZ+1x0MCDy30ZUblZaAbVTuTmIkOZxpL4
   Q==;
X-CSE-ConnectionGUID: SlSFuLxtTG6qftL+hLk8/Q==
X-CSE-MsgGUID: DZlQVuH+QcecsRfTI78++Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="98475680"
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; 
   d="scan'208";a="98475680"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 16:22:44 -0800
X-CSE-ConnectionGUID: HGweMCqqQs+EdvXSmdD5Jg==
X-CSE-MsgGUID: HvzaIz61QXSHiBN2m74aVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; 
   d="scan'208";a="246618602"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 24 Feb 2026 16:22:41 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vv2fV-000000002cN-1TIN;
	Wed, 25 Feb 2026 00:22:27 +0000
Date: Wed, 25 Feb 2026 08:19:17 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:for-next] BUILD SUCCESS
 862ad12fb14cdad9c647100fbc16f7d8171b4470
Message-ID: <202602250809.EhNAKXSn-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_162244_886924_8D6880C6 
X-CRM114-Status: UNSURE (   5.40  )
X-CRM114-Notice: Please train this message.
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
branch HEAD: 862ad12fb14cdad9c647100fbc16f7d8171b4470  soc: document merges

elapsed time: 720m

configs tested: 17
configs skipped: 159

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arm               allnoconfig    clang-23
arm              allyesconfig    gcc-15.2.0
arm         at91_dt_defconfig    clang-23
arm         bcm2835_defconfig    clang-23
arm                 defconfig    clang-23
arm        mvebu_v5_defconfig    gcc-15.2.0
arm   randconfig-001-20260224    clang-18
arm   randconfig-002-20260224    clang-23
arm   randconfig-003-20260224    gcc-8.5.0
arm   randconfig-004-20260224    clang-23
i386  randconfig-011-20260224    gcc-14
i386  randconfig-012-20260224    gcc-14
i386  randconfig-013-20260224    gcc-14
i386  randconfig-014-20260224    gcc-14
i386  randconfig-015-20260224    gcc-14
i386  randconfig-016-20260224    gcc-14
i386  randconfig-017-20260224    gcc-14

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

