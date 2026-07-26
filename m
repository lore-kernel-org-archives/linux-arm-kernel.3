Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50127C531CC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 10:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mGz2WCNtbikZ54FQPI83u5ljHqNmnF0+VI57cNqwmmU=; b=k3BUrqzYyDtE72uR+v8NkOkqgA
	nNHd0vtLEJIj6u7yTJsZycO2IPDlmM0xoOMg8BJrazYclcroBplPgV1u3/eo56nDJWcg2oBejeKYZ
	ZXzzWmvkMhnwFw+B0NUm0MY3fVQVg64Vmx+nxmn6NC7lhKJpR62NVnnYsD3Cfcxs/MT3X+m8Ee9fi
	Sn0eQkUWNxJ1bAXP/WC2tJVfyRBAsohZYXlvy/FhcWz+qDy/DCLhd28XZqL0/bLweOoTeQefED3og
	K/n9rTgVeD6VVVqAjQ/X4gdW6JINQNHe3Epo5KGhjJfn1zJayaUm0nd/d1GVZurrLn+7dgrzxCnqV
	EH6nAIVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnwKD-0000000151L-30Pp;
	Sun, 26 Jul 2026 10:43:17 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnwKA-00000001512-3vcv
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jul 2026 10:43:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785062595; x=1816598595;
  h=date:from:to:cc:subject:message-id;
  bh=7sLiP+q7Ps65rT5OjOzubFD2NDR3us32eOv0i5ZQcAE=;
  b=i49MabZby89TAJ/zotkUO5F8HP7eYYjst57eRj6QOvvMcBv4rkHDHlV2
   8iyvtd/ZOFebBR/rkqLYLewJsZ0IGWr2fAE8jftZ9RUq/H+cQWC7QVeWF
   fF6ofQYSM31o17YCCe7bJxcnu+ISp1D07isFmh0CLFpdjMvgC7UwpavAm
   fy0IrnFrtw0T6yF7b+jGiiZQHADMA5dlF+CM+bGP37sKC3bw+vjLVQUlf
   CkIWgKiK74EUZs/0sxAo5tt9GidbF58gsexrR6UXZIUB/w/mcSF9cBwGJ
   1la0T2XOO7i60961iNJAgFP92gOccp2z5lhOGWMLUTUHTliASw7XlH9GZ
   A==;
X-CSE-ConnectionGUID: AoiDv2J/QBSQy/3Qvd47Bg==
X-CSE-MsgGUID: 7Df3Jc1qR7+oCsVrnzbGiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11856"; a="85524577"
X-IronPort-AV: E=Sophos;i="6.25,186,1779174000"; 
   d="scan'208";a="85524577"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2026 03:43:13 -0700
X-CSE-ConnectionGUID: A1yp0VvMRuGehO1ZBLcE+A==
X-CSE-MsgGUID: WgQws6aXR72FVRwDgZWLcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,186,1779174000"; 
   d="scan'208";a="263438458"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 26 Jul 2026 03:43:12 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wnwJy-00000000cTu-2Q9M;
	Sun, 26 Jul 2026 10:43:04 +0000
Date: Sun, 26 Jul 2026 18:42:20 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:soc/drivers] BUILD SUCCESS
 6bbf8038f8cae72f08007604b8c863492970c2f6
Message-ID: <202607261807.cMmmam5r-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_034315_016456_6BC7D23D 
X-CRM114-Status: UNSURE (   5.78  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git soc/drivers
branch HEAD: 6bbf8038f8cae72f08007604b8c863492970c2f6  Merge tag 'renesas-drivers-for-v7.3-tag1' of https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel into soc/drivers

elapsed time: 972m

configs tested: 36
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                  allnoconfig    gcc-16.1.0
alpha                 allyesconfig    gcc-16.1.0
alpha                    defconfig    gcc-16.1.0
arc                   allmodconfig    gcc-16.1.0
arc                   allyesconfig    gcc-16.1.0
arm              bcm2835_defconfig    clang-17
csky                  allmodconfig    gcc-16.1.0
hexagon    randconfig-001-20260726    clang-24
hexagon    randconfig-002-20260726    clang-24
i386                  allmodconfig    gcc-14
loongarch                defconfig    clang-24
loongarch  randconfig-001-20260726    gcc-12.5.0
loongarch  randconfig-002-20260726    gcc-14.3.0
nios2                 allmodconfig    gcc-11.5.0
nios2                  allnoconfig    gcc-11.5.0
nios2      randconfig-001-20260726    gcc-11.5.0
nios2      randconfig-002-20260726    gcc-11.5.0
parisc                allmodconfig    gcc-16.1.0
parisc                allyesconfig    gcc-16.1.0
parisc                   defconfig    gcc-16.1.0
riscv      randconfig-001-20260726    clang-24
riscv      randconfig-002-20260726    clang-24
s390       randconfig-001-20260726    clang-24
s390       randconfig-002-20260726    clang-24
sh                       defconfig    gcc-16.1.0
sh         randconfig-001-20260726    gcc-16.1.0
sh         randconfig-002-20260726    gcc-16.1.0
sparc               randconfig-001    gcc-16.1.0
sparc      randconfig-001-20260726    gcc-8.5.0
sparc      randconfig-002-20260726    gcc-8.5.0
sparc64    randconfig-001-20260726    gcc-8.5.0
sparc64    randconfig-002-20260726    clang-24
um         randconfig-001-20260726    clang-24
um         randconfig-002-20260726    gcc-14
xtensa     randconfig-001-20260726    gcc-8.5.0
xtensa     randconfig-002-20260726    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

