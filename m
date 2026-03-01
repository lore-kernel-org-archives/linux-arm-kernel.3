Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 562FDFD0048
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 02:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OEMzse+V31rXNCRaOLFcc2ANx86I0GXkz737rTN1xGs=; b=3cBRVQymvAzN4Tk7x6Sd8kYt98
	MN1sbz89NnDApBEy2d2i71hk2Lbg8dYVh1y9975SzJpX0Ymdqe6dsis6YuiDG6AyzjSG6osSWKmzt
	2EQOcF8xpe75E6G3gDaM3CC6qoj12gESDps/PruzS5C3n4IHjGHY5M+N5W3hZ3WRlKDhteyWH808t
	BHy8HRSey9/JsXZgQ898Py75Ia76mzUXUz8zikaLXdeAxHu72D8iGYQMBzdbMNpYQmN67rzGlMr2+
	7ZXzZMyuHCME6uh3oQyVRlo25DC4icVkQLv7YcSs7USeS/OCABRjOKYoy338rT/MKni0CQ+aTyEs8
	b0OqKr6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwW7F-0000000AiYe-3gB8;
	Sun, 01 Mar 2026 02:01:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwW7D-0000000AiXV-3QAV;
	Sun, 01 Mar 2026 02:01:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6F083438F8;
	Sun,  1 Mar 2026 02:01:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75DA5C19421;
	Sun,  1 Mar 2026 02:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772330463;
	bh=dyxHGjJI8DjxC6R5BVOEZ5pjv5AkreDImFcN1oum+pg=;
	h=From:To:Cc:Subject:Date:From;
	b=frswDLhTPIIQlnudDHnWQXOc5M6P6/VXzxVLDKLtQZg/d/rHlMEvPKUQjZoc3F5zi
	 AUwuHvPvMTF+yb54w8yNVyN5O0pqUQU9o86F2dOKyn4gjHEdU1Yyo8uiuowJmwidGw
	 G+oEG/docMbdBihbv89K9x7WYnyrPrRMOncQx7yv2i9L9wXV1c67qn4rfw/nzk8wBV
	 XoudCFi1SuOKqL7mmAWf2tQwnw832vpuVNECLwkTQYfW/RBqLRi8D5Mp2ceuc58s77
	 bDo0+05TsTggc8Q6AC9dzBPe0f3YisMnqeRLLvrqNUGTAuB079T08N5wHDPMFSvjoh
	 vgrgk80ahzUQA==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	jerrysteve1101@gmail.com
Cc: Peter Robinson <pbrobinson@gmail.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: FAILED: Patch "arm64: dts: rockchip: Do not enable hdmi_sound node on Pinebook Pro" failed to apply to 5.10-stable tree
Date: Sat, 28 Feb 2026 21:01:00 -0500
Message-ID: <20260301020101.1728010-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_180103_866506_DA271986 
X-CRM114-Status: GOOD (  13.52  )
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

The patch below does not apply to the 5.10-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From b18247f9dab735c9c2d63823d28edc9011e7a1ad Mon Sep 17 00:00:00 2001
From: Jun Yan <jerrysteve1101@gmail.com>
Date: Fri, 16 Jan 2026 23:12:53 +0800
Subject: [PATCH] arm64: dts: rockchip: Do not enable hdmi_sound node on
 Pinebook Pro

Remove the redundant enabling of the hdmi_sound node in the Pinebook Pro
board dts file, because the HDMI output is unused on this device. [1][2]

This change also eliminates the following kernel log warning, which is
caused by the unenabled dependent node of hdmi_sound that ultimately
results in the node's probe failure:

  platform hdmi-sound: deferred probe pending: asoc-simple-card: parse error

[1] https://files.pine64.org/doc/PinebookPro/pinebookpro_v2.1_mainboard_schematic.pdf
[2] https://files.pine64.org/doc/PinebookPro/pinebookpro_schematic_v21a_20220419.pdf

Cc: stable@vger.kernel.org
Fixes: 5a65505a69884 ("arm64: dts: rockchip: Add initial support for Pinebook Pro")
Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
Reviewed-by: Peter Robinson <pbrobinson@gmail.com>
Reviewed-by: Dragan Simic <dsimic@manjaro.org>
Link: https://patch.msgid.link/20260116151253.9223-1-jerrysteve1101@gmail.com
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts b/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
index eaaca08a76018..a6ac89567bafe 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
@@ -421,10 +421,6 @@ &gpu {
 	status = "okay";
 };
 
-&hdmi_sound {
-	status = "okay";
-};
-
 &i2c0 {
 	clock-frequency = <400000>;
 	i2c-scl-falling-time-ns = <4>;
-- 
2.51.0





