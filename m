Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5294ACA0EF5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 23:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5SIhYOAdJr2/z4ESTfD+DfWRjtJAB3L1N3RxG7z8Gws=; b=HfojHDg0fZAbj+Bd37Ev2OHlKe
	r6zcatCeIoCeHZEK5iR5oTzSsaaRBZSFlS2eVJe3M2g2efTM7DNBBkwGbgCM/1Cfe/KvJ6owdzlDm
	61EZwNSUapfNs/R8Fpi0tQynpUbnSTd4hmsApmdxhzR9TXXVRI/djntGc+pi6LVUmhlAGNcMjpkYE
	iEaW2NgAVWLpxiJ30y0yrZA5r6qNr1xNz8woBZr4PA1VHdS9sgXCWThCeef9jIpULAdSuxFO/Fq45
	uRhDuLds0Vw+bUjMTEfvhK96fTJSQyq8XjFw6Frox2Jy5J+G/bA3+pD9uumQp2xKz7+IFa7Zsl4JT
	SgP2SOHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo9Zp-00000008wpr-1EMg;
	Mon, 18 Aug 2025 23:47:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo9S9-00000008vZv-1ZIu;
	Mon, 18 Aug 2025 23:39:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AA7DA613FB;
	Mon, 18 Aug 2025 23:39:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B1A00C2BCC7;
	Mon, 18 Aug 2025 23:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755560387;
	bh=F8Qdm9wRtPFj1FUfpuDc+eSbRNZ/9N7OZarf51+gRh0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=cdZV7umlOBwLb24CcXHqVtwUyNjPqsa/XF28CHvX8VKh9w9FVmMkjy1hjQz6cvqaG
	 B+dmer9j8tY7B23GYNJQX6/rhB3G+rzKD5AYWkYD9rfwjdj2p/ESOCXkI4lJIYwH8B
	 v7wWydqvav1Z/04uszkpiuZCawMlz2YgKfZxURDGvdDtasDxwerQk+aYmr0EM0OJ7U
	 vzz9Vec7+hPocSDxbxT4+gQnyo+yV0Q88N2a79Oy75OK+Esk+Lcu2svhrKCMM4Iutz
	 7zMk1HMzf1+EPFAHX0YGcyK91vZRZphvzSLSZeRgnihmChXDT5yHWFYoPsX2M8K2gn
	 FpV1mBUPo0BNw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8395CA0EF7;
	Mon, 18 Aug 2025 23:39:47 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Tue, 19 Aug 2025 01:26:01 +0200
Subject: [PATCH v10 09/13] arm64: defconfig: enable rockchip camera
 interface and mipi csi-2 receiver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240220-rk3568-vicap-v10-9-62d8a7b209b4@collabora.com>
References: <20240220-rk3568-vicap-v10-0-62d8a7b209b4@collabora.com>
In-Reply-To: <20240220-rk3568-vicap-v10-0-62d8a7b209b4@collabora.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Gerald Loacker <gerald.loacker@wolfvision.net>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Markus Elfring <Markus.Elfring@web.de>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Collabora Kernel Team <kernel@collabora.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755559554; l=834;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=ODTHuQlKuPRMOWRDe0uxoXXXqr9wwzui1kpqREL2WCM=;
 b=oOSjRvi11TmPA+x0kQ9FXOuacWH6jgGRCHVkESPgw1DTL00NYUCqTmnbjridOQh1GUTzJjKil
 Ugsof0WjXmUCmPrkcQ4HO0yAmp0rLbrwIq8NM6/fd1XyfmceXLUPdV+
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
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
Reply-To: michael.riesch@collabora.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Michael Riesch <michael.riesch@collabora.com>

The Rockchip Camera Interface (CIF) and the Rockchip MIPI CSI-2 Receiver
are featured in many Rockchip SoCs in different variations.
Enable the drivers for them in the default configuration.

Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 58f87d09366c..625cb5b47fb5 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -876,6 +876,8 @@ CONFIG_VIDEO_RENESAS_FCP=m
 CONFIG_VIDEO_RENESAS_FDP1=m
 CONFIG_VIDEO_RENESAS_VSP1=m
 CONFIG_VIDEO_RCAR_DRIF=m
+CONFIG_VIDEO_ROCKCHIP_CIF=m
+CONFIG_VIDEO_ROCKCHIP_CSI=m
 CONFIG_VIDEO_ROCKCHIP_RGA=m
 CONFIG_VIDEO_SAMSUNG_EXYNOS_GSC=m
 CONFIG_VIDEO_SAMSUNG_S5P_JPEG=m

-- 
2.39.5



