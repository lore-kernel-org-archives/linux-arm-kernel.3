Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47469CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 04:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/ODCD9uwW+OOByLO3HElZMOgLetyzxVlhVq/nfuI2z8=; b=Hu/RDtcrbdi0mI6Qowjk/g38Wb
	N2R1V+fkh4Z1VjfKjFXf8hVRolgTILzHRV/eEsnqEMgk1Un+ygrwKU8y59XGtFZ+e6wSQXl4J6WzH
	UtjQC3kdS28yWhgUykmndQ5iyym8n5rQJBumCgY0BuzKpUX8pIOzx2ZC3dQS5iwYvP2XIYm+pKdLP
	M2VWOdpEMxw2QWsOeLYQTge8zX1nd4wPPN32tt0JY/RK+rcZxGUYeIUwa5H1AHcTcBjJuDs1+JG6Q
	Qhy4Wfpstup5DUHMiJLAXQkD50/oj83QDLJ9ouF8tV87+Fg28eYErY11R87v55lvhL5cX7AmG28/x
	C9mv6IUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAhuR-0000000BtXo-0DSm;
	Mon, 20 Oct 2025 04:54:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAhuQ-0000000BtXe-2xPo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 04:54:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1712A60144;
	Mon, 20 Oct 2025 04:54:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 996F8C4CEF9;
	Mon, 20 Oct 2025 04:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760936051;
	bh=rQCfnU4y+Ys/8EJZN1Gwn/4+w69oR2ZqZEduSGJk0xQ=;
	h=From:To:Cc:Subject:Date:From;
	b=IUPJaQtUaPSbtanPTgHj1Itiw9rm+IYwpzLnLJnx9IyqzXI2CN2XvQvPh90RhHeV4
	 jQm7kauBT69LGdZq5nAL917ZszzAW2PUlzGJpTDPCnGW//mX4zPw7qGlvLWDnhXDH9
	 +CBjbPStxohPDAh1f71VC5H9/GvkFihm5aMgMyYy7UDVCZos8J7kuZiaPOgugQNTzp
	 GUZ8XTJsElpe5QCs4X9Oqhrki3s5P0PFnUKyCxpE3hT/Mss8m9LXUcEHts4vxytib7
	 ifdUcqSlgWVRW1hsqZtzty1IbuzknsdpG3M0gU0OVVMVPu4oPPdzMdsTefFCKicpkZ
	 D+hUCZ2iNx6XQ==
Received: by wens.tw (Postfix, from userid 1000)
	id 2B37B5FDC3; Mon, 20 Oct 2025 12:54:09 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Chen-Yu Tsai <wens@kernel.org>, Lee Jones <lee@kernel.org>,
	Maxime Ripard <mripard@kernel.org>, linux-sunxi@lists.linux.dev,
	dri-devel@wens.tw, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] MAINTAINERS: Update Chen-Yu's email address
Date: Mon, 20 Oct 2025 12:53:37 +0800
Message-ID: <20251020045340.2572507-1-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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


