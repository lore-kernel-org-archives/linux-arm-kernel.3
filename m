Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C14EF3382F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 09:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QqmiBlG5GZNPNrF8yE1ZigO2m45rU7LUeETLTvie+r4=; b=abh030y0ENEVwoHjon/H5PkJkZ
	gPlSxFtsmVZtknjHmDOGBTMhVfu+CCWwGmz+EcPHmqc0Gcxy1m5bTy31YEiDOUPxAcN1vrc24bmFo
	LWvlRleTxwfVK1Q9KJCRONAt8VRyIceP9224kwPB2VQXm33rc6WlUmNo0148OGC2bZ14W9A4Ut344
	pFJi9VbXoVxruIvj4UNcQTO6bRo8u/5tBPvFUqm2om5rp9E5MnFnbvFInATLv+C8qNB17gcVBODaA
	05qFtGK7s8J0xB7aVujwz54dLDI+7J5pTF34IrYNZ5SuhW8idZLHI7nSALdwJNpwKfBHCKtG6Q5XS
	abh4AOYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Qmq-00000005siD-43Su;
	Tue, 17 Mar 2026 09:32:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Qmn-00000005se1-3Gj5;
	Tue, 17 Mar 2026 09:32:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E8EDC61853;
	Tue, 17 Mar 2026 09:32:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7848AC2BCFD;
	Tue, 17 Mar 2026 09:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773739944;
	bh=GWeDLU9AFjoINA+09rq3vjmK00lublXB7/CSAH8fXo4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=kldvb0p5Ug7IYE4F6osJWcisQzrFuoau7Y61w4Nfhuy3Yerfl+dL6a3gPzEs27fwe
	 5Bf/TjfLvKeE3abL8AW+cO1nzW89lLos9IBkB+g9HD1DOwXqa3gPdLaA9DVPf0dMQw
	 DN1Q7+TCgVddyA15S4FLns5dD5SdOb0cezUnqvNTVZF194Wcq1fQhxuX9Y3ESan8jR
	 5tSPKIUPOVTGppdxo50q7cNjXgqgy5XqB1pxVZGb9z4lUuX++/vNgIsgi51aYqYI3I
	 JyniaqtHfmRy538LnPMC3ThNjbk7C1iQrGpkmkg2LZVO9g4TVfPRpCVH3G98UZUFrp
	 msuDmjH04qdxQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65205F3382B;
	Tue, 17 Mar 2026 09:32:24 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Tue, 17 Mar 2026 10:32:27 +0100
Subject: [PATCH v2 9/9] arm64: defconfig: enable designware mipi csi-2
 receiver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-rk3588-vicap-v2-9-77de5ee9048e@collabora.com>
References: <20250430-rk3588-vicap-v2-0-77de5ee9048e@collabora.com>
In-Reply-To: <20250430-rk3588-vicap-v2-0-77de5ee9048e@collabora.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 =?utf-8?q?=D0=9A=D1=83=D0=B7=D0=BD=D0=B5=D1=86=D0=BE=D0=B2_=D0=9C=D0=B8=D1=85=D0=B0=D0=B8=D0=BB?= <mai.kuznetsov.misha@gmail.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Collabora Kernel Team <kernel@collabora.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773739942; l=937;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=mcrIEvEtgTS/gcjDOYC5aehK60tx7gRZsU5sHfBlIbc=;
 b=A+dG1JrGPklOpVqi49SnGtHySOkEJ6dXRyta+U/NOVzew5dJYC9Ye71CQKLmcW9UbEbrUNtZC
 O/GQT0mD4xxDscHEKg2arA9q0U63v5adbUw2PDPtd/UDe11Ek3S3woD
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
As a consequence, they are used on a lot of Rockchip-based
single board computers and/or corresponding camera modules, such
as the Radxa Camera 4K.
Enable the driver for it in the default configuration.

Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index b67d5b1fc45b..a93ff73ae52c 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -907,6 +907,7 @@ CONFIG_SDR_PLATFORM_DRIVERS=y
 CONFIG_V4L_MEM2MEM_DRIVERS=y
 CONFIG_VIDEO_AMPHION_VPU=m
 CONFIG_VIDEO_CADENCE_CSI2RX=m
+CONFIG_VIDEO_DW_MIPI_CSI2RX=m
 CONFIG_VIDEO_MEDIATEK_JPEG=m
 CONFIG_VIDEO_MEDIATEK_VCODEC=m
 CONFIG_VIDEO_WAVE_VPU=m

-- 
2.39.5



