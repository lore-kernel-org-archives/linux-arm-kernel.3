Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EF20C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 10:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=liLtkU3MGUYaBlT4atSZJYYcKtTbrGW5Gl6wfgfS0lU=; b=ySHPPNW6iELD1gwhIbiAR1E/9D
	gyIY0XVplUym+gigK5wwWpBYDQ1CrD7IwZ+dovSzr/xE+phNB1U51ITy125oH0qUlGHRLLYsiNjMi
	9fRIQK9V7Hw47vyo2uCVViKLDh1d4mVMlaKRxzU7hYEtc9dlR/45VwhgnrPIQcUL0D2FUlKbDz/oc
	xqlsDfZhadUnL7sbRLprdQCEolcMRGHg9gh/ywDq5E5x3YC5A87srEbLx+WzkGJekFyRnrEbL//d2
	vtEJmQybPDcpX0ly+17/Ar21mK4oL/nxgbSLsAGy/1FgXmtFJxM5+qcZcnLLWMv+swWewVy5tZfSq
	SAVRiLcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueWr5-00000004i3a-3esk;
	Wed, 23 Jul 2025 10:37:47 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueWmR-00000004hYg-2yzn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 10:33:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753266779; x=1784802779;
  h=date:from:to:cc:subject:message-id;
  bh=3JYcOfrbwYMnm/nFjq6pC89xBJKhnbPlD/MgubM/JwY=;
  b=YU/xzCAKNZAFvdUud3eNd+aj3d7T/SXHQutdzg14lq2L5q/Rc0t624cI
   HDvzfUmnRe2xw6/jBcbMcc2yis1+zsZYWsckOarSSQ+/bvZLqzqXy4wUg
   +fv3F2u/Po0UnJESfejQFprMjqkY59xrxEAj2qIpNb8s4xbEcDfQo7RJ2
   coMLjt3B7D9VS1tUF48YlG7lLXokAAKFUFk1IJ/okbOJENojNa9ikX9eU
   UrAUEz0QRYjEh/txwrO5ZHK7sYyJjIaQdNZa+bfLLETM5sOM22kBQg9kB
   KA9E5IZsBS96n34L6v0QFz77NTGt/pVob58NAAfNQ/TXVHi27mqxjaUbt
   w==;
X-CSE-ConnectionGUID: FMXV5iILSBq3AMDDV0ZLJg==
X-CSE-MsgGUID: kLi4fBriS6mxQx6QcNkGOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="66234351"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; 
   d="scan'208";a="66234351"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2025 03:32:56 -0700
X-CSE-ConnectionGUID: ofB90/EVSUGdIh0fKhHfZw==
X-CSE-MsgGUID: O8MSpBsJR1ucsuqY4iFfHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; 
   d="scan'208";a="164862003"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 23 Jul 2025 03:32:55 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ueWmL-000JFh-1J;
	Wed, 23 Jul 2025 10:32:53 +0000
Date: Wed, 23 Jul 2025 18:32:06 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:arm/fixes] BUILD SUCCESS
 912b1f2a796ec73530a709b11821cb0c249fb23e
Message-ID: <202507231854.WgeWekrr-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_033259_756348_386B255E 
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git arm/fixes
branch HEAD: 912b1f2a796ec73530a709b11821cb0c249fb23e  arm64: dts: rockchip: Drop netdev led-triggers on NanoPi R5S

elapsed time: 822m

configs tested: 6
configs skipped: 125

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arm64             allmodconfig    clang-19
arm64              allnoconfig    gcc-15.1.0
arm64  randconfig-001-20250723    clang-22
arm64  randconfig-002-20250723    clang-16
arm64  randconfig-003-20250723    clang-16
arm64  randconfig-004-20250723    clang-22

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

