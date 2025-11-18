Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C734CED609
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 11:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6zwtGPNbtCojIQRcyx+WukjGChgHc3k451/INt35SVk=; b=E2J3LzcbfTdqKHHMEcl8tKtdq7
	mvhW/W+awatisoS64jU8hdBOKAIyav1WIDc/cFxGOCgiSByMrTSZmcm8x1ypbITisiE9Ppt1aBHto
	NLjUYCBIpQ/1dniGlj81/4qxPT4OtpQEEH82o4fj1LFOVQHRNeAc/xQnsukXcY1QlV71PCqs+Zo8h
	fkKOHDhp4/joCQqbK7VoUfYTKwr8vhnFTPfDi/A7hUmor0inMPN9/+ENLP3+xfdeXzn89qDfDp4zA
	vli1nYz4PAYiM6epbe6fXjlXxyt+Kmyboyp5e+7c16orGzh5ih5VqXYmM8zVX7hQODifchTNZ5j7/
	AoieyYsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLJdO-00000000JIy-2NGs;
	Tue, 18 Nov 2025 11:12:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLJdM-00000000JI7-2gzk;
	Tue, 18 Nov 2025 11:12:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DFB7C601AA;
	Tue, 18 Nov 2025 11:12:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 51285C2BCB6;
	Tue, 18 Nov 2025 11:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763464347;
	bh=xnocN+UVtEWIR/5avN8SC34bZiIurYSuuufPbeT/3Uc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=BGoYB7uqZrvv90OkHLoOlaRiBuZQ6Izgj98yvwZdyvUzmNpuTettRuXSf11pBDm1l
	 Lmd3u8rc6e8ImbthAa9crlxbKpeLTi3yGsoV13dT3C2NzcFd34nIP4L6EDtdrbvmt6
	 QUHZfxcFn8Ptd1Qk+oICiL/2NVgbMNaZBWzyMl8pectX6gHoo5H7CQMhcN9rUJLtau
	 xHyXJBFQ4/aLco+NF16aGx645y1cEnAT3e+onhSlBDo2oCcXx1wDDoflFVUvYOzuHX
	 j5rMVKS1VzxdnHn6hoV+la0fiAt+Idci3ExEF8Cf7zfIvmcH9R1roA48xpJrWAH97x
	 PUGwp3pzqowrg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 065E9CED61A;
	Tue, 18 Nov 2025 11:12:27 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Tue, 18 Nov 2025 12:12:27 +0100
Subject: [PATCH v2 3/3] arm64: defconfig: enable rockchip mipi csi-2
 receiver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-rockchip-mipi-receiver-v2-3-eb9b43377fc4@collabora.com>
References: <20251114-rockchip-mipi-receiver-v2-0-eb9b43377fc4@collabora.com>
In-Reply-To: <20251114-rockchip-mipi-receiver-v2-0-eb9b43377fc4@collabora.com>
To: Michael Riesch <michael.riesch@collabora.com>, 
 Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Collabora Kernel Team <kernel@collabora.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763464345; l=775;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=QnSDQN2WWfjs2EWe+e6kdAB9fFyLYhe37xUo+h6vPgM=;
 b=XeLsfJxVtIS8ozuzcmT1zTnkjSz5Yf2qGGwwLGRIxHjZ6cBA6BS/mf738D8ICgTQWu15nX4ss
 J0UOq+plGVWAC5GU1WU4jPL5DUd3E/asiExml3igaqeZAZ1EtAiKboF
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

The Rockchip MIPI CSI-2 Receiver is integrated into recent Rockchip
SoCs, such as the RK3568 and the RK3588.
Enable the driver for it in the default configuration.

Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e3a2d37bd104..a161666f2894 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -883,6 +883,7 @@ CONFIG_VIDEO_RENESAS_FCP=m
 CONFIG_VIDEO_RENESAS_FDP1=m
 CONFIG_VIDEO_RENESAS_VSP1=m
 CONFIG_VIDEO_RCAR_DRIF=m
+CONFIG_VIDEO_ROCKCHIP_CSI=m
 CONFIG_VIDEO_ROCKCHIP_RGA=m
 CONFIG_VIDEO_SAMSUNG_EXYNOS_GSC=m
 CONFIG_VIDEO_SAMSUNG_S5P_JPEG=m

-- 
2.39.5



