Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEFDACAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 23:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HVQvJOSlsiCEqJk5KJsb37INLnqy+HE5xlNKAgWwAJ0=; b=YoF2/TfKM6n4JRCG8CGaOfKW9c
	NzlJY4GJ8iOX7UK3JeznBt4x2OmbHJrUL/MeMGxR6M30KC8cr3Xndzdtr2b7QMYVkjVj3V3cQWlk4
	/HwEYbSRcAZw08WRX8af40Pfmn6hoieWnenRRkcUArQIXoa/VAZYkKbv1BfpkiaqspPopOe0bhvZK
	owZDkdvWOZtsLTCr82s3dnczbo9tYJA95gPDI6733RQn8046pEmjrZgiHi5tPQn9rMY7U2a7EMmwv
	hUAxJQYfT+wQFO8b0trLvA0FKUlNY7vnAbfsq6kREw6c81ys7bbupBR8gdWanDo9Wdo/tHXzei+qd
	nH41NZYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1vDI-0000000Dtvw-1joj;
	Thu, 25 Sep 2025 23:17:24 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1vDF-0000000DtvU-2pwR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 23:17:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758842242; x=1790378242;
  h=date:from:to:cc:subject:message-id;
  bh=DL9xyFHPhxwKu8B5qLLTKr+DrLHo6ZlqTGDDpvXCBX4=;
  b=NcmiKMOOB/j3Wx9zMaWq9K3OjfsaQQ3l9BFOPEo4W/QXvvMp8iRZE6au
   B3WXRbhchSXycX597JKRLYkijCGEe2XaI3w/1dsKYN6aanPNe9zbtWvPb
   bo0M38zyh3aoOil/iQGOyhk356N+FKkKNH7XDAjb1pC8NCXzhz2zkY50c
   M0yuQC8S5iiVrVp8yY5H8tD0g0G0+H49FU8sxk9km6j1Q/uknyvEb+k5+
   P0QwDQ9DFFgro0l6jJUX5TySudMziBR/sG/36AMRN4+1g5k6ylYfSYYFf
   LNxx+Ed55FwR7TWHijaqSW6qBXPLBtPRkhaGK/Xk91LsVzf1qyUD/znhM
   g==;
X-CSE-ConnectionGUID: VYRs5pIUSi2lKQS5qjiM4A==
X-CSE-MsgGUID: q7PbhvmERP6dBRs6lWpyrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64987386"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="64987386"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2025 16:17:21 -0700
X-CSE-ConnectionGUID: VYbjaDLHRX6xfDt7Ig1IEw==
X-CSE-MsgGUID: 1m62FKRwTDi2rcWOxTzVRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; 
   d="scan'208";a="177076027"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 25 Sep 2025 16:17:20 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v1vDB-0005id-2a;
	Thu, 25 Sep 2025 23:17:17 +0000
Date: Fri, 26 Sep 2025 07:16:58 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:soc/defconfig] BUILD SUCCESS
 072c3547979053c575e819070074911b3d0bd4fb
Message-ID: <202509260751.nqWqh5pp-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_161721_763962_C34A48C3 
X-CRM114-Status: UNSURE (   5.62  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git soc/defconfig
branch HEAD: 072c3547979053c575e819070074911b3d0bd4fb  Merge tag 'riscv-config-for-v6.18' of https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux into soc/defconfig

elapsed time: 1463m

configs tested: 14
configs skipped: 99

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arm               allmodconfig    gcc-15.1.0
arm                allnoconfig    clang-22
arm    randconfig-001-20250925    gcc-11.5.0
arm    randconfig-002-20250925    gcc-10.5.0
arm    randconfig-003-20250925    gcc-8.5.0
arm    randconfig-004-20250925    gcc-14.3.0
arm64              allnoconfig    gcc-15.1.0
arm64  randconfig-001-20250925    gcc-11.5.0
arm64  randconfig-002-20250925    gcc-15.1.0
arm64  randconfig-003-20250925    clang-19
arm64  randconfig-004-20250925    gcc-8.5.0
riscv              allnoconfig    gcc-15.1.0
riscv  randconfig-001-20250925    clang-22
riscv  randconfig-002-20250925    clang-22

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

