Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1834CD3445
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 19:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5uTy9Nsu+g7Aag4ddbKRtwspAPijQY5+AG+zDsLF3Z0=; b=KFjOpzam4UAZZbPb3Zx+hnHwmV
	NImLTTxBoDaTnGbY6WgTpBJ8Q85X8lYyPD8xqntZW7QCS9QQAmapCiI42tI9DlO8ZLELLq6DQORfF
	sAgsjLtZ2Rm3UBLZkWYk4Wjfp16sft2eMKeQ0NnhVu0PzhRHylOELSTMEPxnHtbT2fwt1/yI0kiTh
	aRgueuP1D2PgljUpX2l7Pm3+FHocr+NIv3ySM5a8T+mtB+HKYhlvzMfQzG12U2TmmjCkbqGX+GoJf
	xAwHh+yb74lgh5RzyUhFDOczR8NM+WwaCyWetZo3dvT0v3Di1yNyR5511kLMs8Hi4PTwVTD4z+XTy
	qFQpQnjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLQva-00000007M8P-0sWm;
	Fri, 08 May 2026 19:32:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLQvY-00000007M7u-27Ts;
	Fri, 08 May 2026 19:32:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 635786024D;
	Fri,  8 May 2026 19:31:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DC3D5C2BCF4;
	Fri,  8 May 2026 19:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778268718;
	bh=HY6HXz1rUxunVE83orvuh0gY4psjWh1saEXwMh/vrh4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=gTIXPTTf7+HzIc+xzZtuC8AK6Sp634SwkNyF8REqW9AjlSnZ7IMKD+90+3b4Ohtqt
	 lFqbHK+PUOFqvQ395xgco3zPhMr9/oQ+Vr7PIaJ06/t5eMGJH/zFcuI+YWv9oXffD+
	 UgKzovQnBzmNqbp9JeN93r8gU5m3HWKOVHBg+QNlJeqC7ni9L+asiXLfwz3ckdoPb6
	 Q8Rf70+oddf9RawwSg+UVYQO+0vPUT8YCoRGbOCAi5Q3UuflzsBiYuM6PDAFCKTsIz
	 bNcEGp69T/E94G/9gKAO76IpppNvO2NEDxbQJxwJgzBjumdQIm5ZBnGWWLevAcTIZW
	 4rQp2L/GSsdMw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D31ACCD342F;
	Fri,  8 May 2026 19:31:58 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Fri, 08 May 2026 21:31:51 +0200
Subject: [PATCH v4 8/8] arm64: defconfig: enable designware mipi csi-2
 receiver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-rk3588-vicap-v4-8-6a6cd6f7c90b@collabora.com>
References: <20260508-rk3588-vicap-v4-0-6a6cd6f7c90b@collabora.com>
In-Reply-To: <20260508-rk3588-vicap-v4-0-6a6cd6f7c90b@collabora.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 =?utf-8?q?=D0=9A=D1=83=D0=B7=D0=BD=D0=B5=D1=86=D0=BE=D0=B2_=D0=9C=D0=B8=D1=85=D0=B0=D0=B8=D0=BB?= <mai.kuznetsov.misha@gmail.com>, 
 Charalampos Mitrodimas <charmitro@posteo.net>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Collabora Kernel Team <kernel@collabora.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778268716; l=1048;
 i=michael.riesch@collabora.com; s=20260428; h=from:subject:message-id;
 bh=a8sioWJftfSyXN0rqDXq8bBppSiXX8eZImBE70llAi8=;
 b=k+9b89ylohfx4XhLo13ZZ8+1xS+5spcQu5ypNg2QKU4QuObf5FXVwZudj+nb4bW5JLkDETZsV
 E6/bPi+jYKaBNXJiVjojvUp0VQTHopdEZ5A9spZGsuw0nW8j9CBO/w8
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=tAbmpPTE1MELYweXqqDU40fa18uCO6s32GJL/RzyW2Y=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20260428
 with auth_id=759
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

The Synopsys DesignWare MIPI CSI-2 Receiver is integrated into recent
Rockchip SoCs, such as the RK3568 and the RK3588. As a consequence, they
are used on a lot of Rockchip-based single board computers and/or
corresponding camera modules, such as the Radxa Camera 4K. Enable the
driver for it in the default configuration.

Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>
Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index d905a0777f939c51cc39df6230591a31058b765f..9171f750337e540f0feec998c7aa33d3444b806e 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -918,6 +918,7 @@ CONFIG_SDR_PLATFORM_DRIVERS=y
 CONFIG_V4L_MEM2MEM_DRIVERS=y
 CONFIG_VIDEO_AMPHION_VPU=m
 CONFIG_VIDEO_CADENCE_CSI2RX=m
+CONFIG_VIDEO_DW_MIPI_CSI2RX=m
 CONFIG_VIDEO_MEDIATEK_JPEG=m
 CONFIG_VIDEO_MEDIATEK_VCODEC=m
 CONFIG_VIDEO_WAVE_VPU=m

-- 
2.47.3



