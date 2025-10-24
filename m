Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B294CCCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 12:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4It/FexjX7Tb/YMQA8YIvotB/6NNP6gyn8HH1WX6xjs=; b=Ij2TQH678zEp2lkz6r0D4s55mj
	mYTEEGEd0KyEc7lj5hFAys8U+wrkAg+HNZ5S0I2A27ZacHUQzD4RHJIBNgmuRlwKWLylrJvQ/l9m8
	fTJYv5OKx+ZlLwCSDq3HA886+EdhZnbDSKSlWhkrLO2PwR+pJuwwB+aOloGlCAHJWaQ6jqOeplkDt
	P3o+szCYIyr3+SSgB6y891cSOeKu4b1eSvIQsMPp7BYP3/hWcZlepzmf3y9RY3TQ8xOlEw1lviJ/K
	QSFcKlg4R+6xBrw62EXHeQ3lqaXMUCgaPCTv8YZsxh+eYVc6uSk8ERqUjwFYxz9WQIIiKORxhdJJw
	ppw8kQUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCHHX-00000009RUT-3c1E;
	Fri, 24 Oct 2025 12:52:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCHGe-00000009QLA-3XZH;
	Fri, 24 Oct 2025 12:51:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 192E34B28F;
	Fri, 24 Oct 2025 12:51:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D80B5C2BCB2;
	Fri, 24 Oct 2025 12:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761310297;
	bh=aBigsactKw446CLi8wlsqginYIn3IhRT+6NDvM9c2F8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=WYIUeuI4Pzv7psdP8daRHCp55UiXjcCvldd8uv+KdgmHIF9Gqb9G+pEjSeDZY0QKq
	 2IiYg1h5UsBqdMQSrH7Afc+1UL6zaZZjQf342ag6Zrij04IVyWjHeu4YVNH+D9tQBm
	 OisIaRUJuczIkPBxug7R/FrfI6nb03rbWfC5zfJmEmEggJ6zLTcVuOiNg6DIEy55Dw
	 eWujhedIFJlKqecGr7VHSME/azDs7CANFlPq9ibdBheTNyXqJ0ujTw/B1pHpSLvJ8Y
	 FlTxUpCvDChLtM01DR+vJPkW8AevA2WADFRXVt/Nj9HnBiGtkGtB72pCEMYYOA83bG
	 l5hGrecY12h2Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA506CCF9E9;
	Fri, 24 Oct 2025 12:51:36 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Fri, 24 Oct 2025 14:51:42 +0200
Subject: [PATCH v14 13/18] arm64: defconfig: enable rockchip camera
 interface and mipi csi-2 receiver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240220-rk3568-vicap-v14-13-b38b6da0fc80@collabora.com>
References: <20240220-rk3568-vicap-v14-0-b38b6da0fc80@collabora.com>
In-Reply-To: <20240220-rk3568-vicap-v14-0-b38b6da0fc80@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761310293; l=950;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=6j0p86wA9iB9QT1kpUQbcTBHNdUs79VzNYjYvLw2zV4=;
 b=2kJEoaOdMnCXyz7AlDV3YUqPXk+f/bINnh3+MaaaWC5yXKJf15RjGuHtSjP8vkV0UDWvyp+ts
 7/DzblFXtJnBSNdnufWzf4oBHtR1ukOdsb8CNGocvSzw1IrI/qVgG2L
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_055141_267545_1E871B1B 
X-CRM114-Status: UNSURE (   9.17  )
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

The Rockchip Camera Interface (CIF) and the Rockchip MIPI CSI-2 Receiver
are featured in many Rockchip SoCs in different variations.
Enable the drivers for them in the default configuration.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>
Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e3a2d37bd104..86e39240979a 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -883,6 +883,8 @@ CONFIG_VIDEO_RENESAS_FCP=m
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



