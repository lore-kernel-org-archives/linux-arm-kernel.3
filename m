Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C447D4660B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 18:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y7DmppaHdQk/4UXj7JyKveS4Kyqg512mjq0pelpEbq8=; b=E0I3w7G1lXVUAcVoaZlAci0TzC
	QipZtBBhLAXggM2657yfxa8Nxs13oTc2ujYqLSBdiv8EB7Yn8K53z2kOkH578YbAN3wFnmlNJpUkM
	U8CvtOiXb1utjgn2SSSWX9TviqScvoksDVSJUFWHrJqvd4m2811RB6Kkvwl+cssdPXllTu1VwYAWD
	xwWIGP6tSjFhEhi4qAp8hjWWiD1xrkyW6a87c0EZARCUrHAmJ+8j9KlkMH6d2uLsz5YPU+TEYOWi4
	QL5H0TnQESxyK/KZHm0JY+optlWHvxcBCdUZVn5xbmt+V1OQbiT+dkt+WHOM++qfdfI+7yiQZUS02
	/0IWxEmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgS36-0000000CxzH-1it1;
	Thu, 15 Jan 2026 18:26:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgS31-0000000Cxx6-20yC;
	Thu, 15 Jan 2026 18:26:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8E2D6601BC;
	Thu, 15 Jan 2026 18:26:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 02BE0C4AF0B;
	Thu, 15 Jan 2026 18:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768501577;
	bh=4CY5Ftxdqdf78iaz/GZPARSYtxXrYl4kHYgo18eZegU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=q3Jdpmn8EEbB3mWwupIToNeIyoBaKWdOXTKQGT6Uq+O9Jt0v6yXuIt+8g81EGeIPt
	 +66CbyhZIBH0x2F0rIGw6QiXI1+7hB/saOxV8M/chCS7A8qcr/Nvi8JpQElAFkgbkr
	 c7LjuyC7zFkUfrGZjQXlcU+1CJqNwh1gnVlxL3Jb6D9xSKIipkBYd3Ci5CNYJIzRNs
	 muhoM4nRPH7NSxns2ETLhEcFCXtuHq/Y3fkRs4eUQNiZM/3JNzqM6c4xs9MLORfpSH
	 S770KYjZDNrxpFopVkEzz0QF8eX5VXF9VtbQE7SOrxEP/kjg6zJSP6axYnVnqTgE42
	 P5kQFZwCXAoWg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED98ED4660D;
	Thu, 15 Jan 2026 18:26:16 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Thu, 15 Jan 2026 19:26:09 +0100
Subject: [PATCH v4 3/3] arm64: defconfig: enable designware mipi csi-2
 receiver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-rockchip-mipi-receiver-v4-3-a9c86fecd052@collabora.com>
References: <20251114-rockchip-mipi-receiver-v4-0-a9c86fecd052@collabora.com>
In-Reply-To: <20251114-rockchip-mipi-receiver-v4-0-a9c86fecd052@collabora.com>
To: Michael Riesch <michael.riesch@collabora.com>, 
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
 Kever Yang <kever.yang@rock-chips.com>, Frank Li <Frank.li@nxp.com>, 
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768501575; l=784;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=C9lnlkDzHuvbmOodwv1mUExRofM5smDG511gbhu0yVQ=;
 b=lcKel1VKfg/RAFBSyMUvAvqmAljYnMlAt/L20N08+aQR7aXL9B87XAr+ErJkQJhQyy35q0yc4
 eJt1IR32ZveBxL+D2I5TU3cjL8jFSu+n9++4AQH5yEGtyj6I/Dc/h2W
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

The Synopsys DesignWare MIPI CSI-2 Receiver is integrated into
recent Rockchip SoCs, such as the RK3568 and the RK3588.
Enable the driver for it in the default configuration.

Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 45288ec9eaf7..26532de26668 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -873,6 +873,7 @@ CONFIG_SDR_PLATFORM_DRIVERS=y
 CONFIG_V4L_MEM2MEM_DRIVERS=y
 CONFIG_VIDEO_AMPHION_VPU=m
 CONFIG_VIDEO_CADENCE_CSI2RX=m
+CONFIG_VIDEO_DW_MIPI_CSI2=m
 CONFIG_VIDEO_MEDIATEK_JPEG=m
 CONFIG_VIDEO_MEDIATEK_VCODEC=m
 CONFIG_VIDEO_WAVE_VPU=m

-- 
2.39.5



