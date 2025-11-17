Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74261CEBF96
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 10:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6zwtGPNbtCojIQRcyx+WukjGChgHc3k451/INt35SVk=; b=KS73RBcctJhypb6Tff60Jj7BXT
	fHbDR75JJql1LTMbmo2vVwEiOOs6ZWUf8Bl+VNtHmuAzU5D62IjjWWKRZTK6JFo4YTEUucKBeJVFY
	9Kysy3H9ChQ2N+UjMqmk3LzwfxIIvYe/9xTw6HTpn5RlTAi2tpjoS1HLhoIBkWlN7OsrukhU2qbcA
	RNwkqBQM3xUvqh51Q8Y02PAFPiw75cM727rGRED+jHSRk0vkNh7LiZSOgx5AOwN2uZxVO/EnnE3/3
	KAtgyQq08yBiZ5q+EqyN31ypJ8CDCIW+SLq75IcWhDuUgev0ZRm+ubahhO3iKDkkGE+iWqaZoZK7I
	nCcV1/Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKw3I-0000000Fpz5-31Ox;
	Mon, 17 Nov 2025 10:01:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKw36-0000000FpsW-37qx;
	Mon, 17 Nov 2025 10:01:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 866594458F;
	Mon, 17 Nov 2025 10:01:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4FCADC2BCB0;
	Mon, 17 Nov 2025 10:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763373687;
	bh=xnocN+UVtEWIR/5avN8SC34bZiIurYSuuufPbeT/3Uc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=YSiz/Wn2WUwf1/cDcobK/ebDw4pmNBeumml+mqU/aGqmxtE1S4tTRX9viyw4k1461
	 gs/lnYRro6BFBVBAKfE0WTGMziADi6kpUzeXFhlcq2bNLcuwpfsO1sXfB18m8A2sNM
	 6FfEqJ+EHV84P0qbR00jXB2k9zFcs4V3zL8reIs0YOAH6u2AgtZ+jqJEu+0yTBeWdf
	 RX1ekx7K59OxYTUySh9Xky6aIETK9asTxiRpjQrtSTY9+aV5ns/gDKbMiIS60cKHJP
	 i93K8cnReLH8vQN8EOpp8MhxLRiJtYv2PbQj9OZ/KZPc0IPtrHWj/HdE2G69DPDywh
	 gTTQw5T6uHjog==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42AB1CEACEF;
	Mon, 17 Nov 2025 10:01:27 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Mon, 17 Nov 2025 11:01:11 +0100
Subject: [PATCH 3/3] arm64: defconfig: enable rockchip mipi csi-2 receiver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-rockchip-mipi-receiver-v1-3-d13086e810dd@collabora.com>
References: <20251114-rockchip-mipi-receiver-v1-0-d13086e810dd@collabora.com>
In-Reply-To: <20251114-rockchip-mipi-receiver-v1-0-d13086e810dd@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763373685; l=775;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=QnSDQN2WWfjs2EWe+e6kdAB9fFyLYhe37xUo+h6vPgM=;
 b=zt8JNwCZhzaZrzJAnP4ZyYk40HPoatQgt9OBh6t8KP0dO2nRZj4svhR/IY0A+8cfaJFYPlL1O
 1wVZnObfa4OBcWolGjElKd3Ivs92U1KAxP0nh9ccgok1HReq1sahHnZ
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_020128_813511_B493C2C4 
X-CRM114-Status: UNSURE (   9.42  )
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



