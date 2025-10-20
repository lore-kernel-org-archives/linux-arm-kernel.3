Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8BB1CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 04:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AVRBRA7+9Ky+LJWv6jCnuCdYB9gAOdEqcLdT3rmm6zI=; b=d1Y6v4oAwNBMVqp0RipMcv/Jpq
	EyBZCUo2p4CSIQFSTp5DJRJKnisyXDGgfYZo6kJb/yDYPfyMGmO6iB8gmOBYjf3pRJBfWAaQ2riTj
	ir8SliqG6Vqt1J60F4tgjTDMm3o/cLBHuWzoDx7apuAUksfW+SGjuCE6TNUmPihhOxLPLW6gBtLpv
	KqvgYWTZ/S7M/xdsjOrqeMgid/gJtIArLy3Er6dOXBpsJnrb7UgH23Nz85PPEukhTPVvR4nui2lh7
	bQqY+G1TIlISovwFPKVXyrjg35LpXf16dZQKTLHKny0qwst+xDAH3cJn4EqzrVTS82KQp/s6P/Hd+
	8Y/+wBWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAhwV-0000000Btpf-38lZ;
	Mon, 20 Oct 2025 04:56:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAhwS-0000000Btoh-42Yd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 04:56:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 94E4944D41;
	Mon, 20 Oct 2025 04:56:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52A0CC4CEF9;
	Mon, 20 Oct 2025 04:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760936179;
	bh=nrXnqlV7dTZ3tYdmSQOtQfvcxz6jaOoC+0u6XE9jwfs=;
	h=From:To:Cc:Subject:Date:From;
	b=ksOg13+zPrC8xxnakzV8VSglMoxWAQWwFCALpTQZjBj0uaOZIuqs5AsDrSQUiLu5x
	 deqimQfqaWCXc0ydoHo0xutavQJactWCZFIOkNG3dmJuEq1ATiLiyWJmqvY3p4ekxS
	 ofr1Tr34OLOxkZBFWSuMQJBhPDa1aPkTMMk2cVDaaXsWtxrXEEPHVv4E/LbiW+0+hJ
	 NKf0S6a3qxhC8E81lhMuVcv6BpRsEU6yCMsggk5MQYpbdHgn5L8x+1OcBvgnzeaWOA
	 wpmzEMM56UTcnailUMcW+r2o8ywQIkRyy+CHlCoZTT/IgDfg1hHI4JXls+exi+HCmA
	 Yk12jphbh2PCQ==
Received: by wens.tw (Postfix, from userid 1000)
	id 4EC1B5FDC3; Mon, 20 Oct 2025 12:56:17 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Lee Jones <lee@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	linux-sunxi@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH resend] MAINTAINERS: Update Chen-Yu's email address
Date: Mon, 20 Oct 2025 12:56:02 +0800
Message-ID: <20251020045603.2573544-1-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_215621_019983_6530E642 
X-CRM114-Status: GOOD (  11.27  )
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

The email forwarder I'm using has run into severe problems with Gmail
lately. Switch over to my kernel.org address for kernel development.

Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
(resent to correct dri-devel mailing list address)

This likely needs to go through drm-misc-next following a patch from
Maxime that removed himself from the Allwinner DRM driver entries.

 .mailmap    | 1 +
 MAINTAINERS | 8 ++++----
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/.mailmap b/.mailmap
index ea92027981fb..1a2a61c02ee7 100644
--- a/.mailmap
+++ b/.mailmap
@@ -173,6 +173,7 @@ Carlos Bilbao <carlos.bilbao@kernel.org> <bilbao@vt.edu>
 Changbin Du <changbin.du@intel.com> <changbin.du@gmail.com>
 Chao Yu <chao@kernel.org> <chao2.yu@samsung.com>
 Chao Yu <chao@kernel.org> <yuchao0@huawei.com>
+Chen-Yu Tsai <wens@kernel.org> <wens@csie.org>
 Chester Lin <chester62515@gmail.com> <clin@suse.com>
 Chris Chiu <chris.chiu@canonical.com> <chiu@endlessm.com>
 Chris Chiu <chris.chiu@canonical.com> <chiu@endlessos.org>
diff --git a/MAINTAINERS b/MAINTAINERS
index 1ce0b7628450..34acf513d7fc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2302,7 +2302,7 @@ S:	Maintained
 F:	drivers/clk/sunxi/
 
 ARM/Allwinner sunXi SoC support
-M:	Chen-Yu Tsai <wens@csie.org>
+M:	Chen-Yu Tsai <wens@kernel.org>
 M:	Jernej Skrabec <jernej.skrabec@gmail.com>
 M:	Samuel Holland <samuel@sholland.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
@@ -7641,7 +7641,7 @@ F:	drivers/accel/
 F:	include/drm/drm_accel.h
 
 DRM DRIVER FOR ALLWINNER DE2 AND DE3 ENGINE
-M:	Chen-Yu Tsai <wens@csie.org>
+M:	Chen-Yu Tsai <wens@kernel.org>
 R:	Jernej Skrabec <jernej.skrabec@gmail.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Supported
@@ -8255,7 +8255,7 @@ F:	drivers/gpu/nova-core/
 F:	rust/kernel/drm/
 
 DRM DRIVERS FOR ALLWINNER A10
-M:	Chen-Yu Tsai <wens@csie.org>
+M:	Chen-Yu Tsai <wens@kernel.org>
 L:	dri-devel@lists.freedesktop.org
 S:	Supported
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
@@ -27754,7 +27754,7 @@ F:	drivers/acpi/pmic/intel_pmic_xpower.c
 N:	axp288
 
 X-POWERS MULTIFUNCTION PMIC DEVICE DRIVERS
-M:	Chen-Yu Tsai <wens@csie.org>
+M:	Chen-Yu Tsai <wens@kernel.org>
 L:	linux-kernel@vger.kernel.org
 S:	Maintained
 N:	axp[128]
-- 
2.47.3


