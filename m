Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EF87CD5BBA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 21:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5uTy9Nsu+g7Aag4ddbKRtwspAPijQY5+AG+zDsLF3Z0=; b=LHN5Oj4sWkJKdJ+9clcKNgDw5o
	72Pvn7JHxQxbYCvN6Spgci10wJbHao0K1IQxUNxtPrhrEHLJpTDegj9Yjp1xsXmghREqj3bav9kFe
	URfN7E+djUYEJqpJFq8dFOxMh2F9r//ExL02uE4xKMjH8H86wlrDtTO1PSJ5ZRuu479UVzD6kdnr0
	Cc4TvHwsSCbzTpZIin3SvXIY3J5ghC9NwCkdJPvyUl/CkVMY0he37xx+/wFwLOL65UzSpyLTqU3Sr
	I1uwkzp+mCvf2P2zCa8kKhpl9oXVX5obbdB4kxiM+ocSt1Faw638EhrKsMjYzNwks8QaqO4VCqHD5
	zFclqrQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQXLH-0000000ByLG-0p0M;
	Fri, 22 May 2026 21:23:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQXKy-0000000By5F-04vd;
	Fri, 22 May 2026 21:23:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 60E1144470;
	Fri, 22 May 2026 21:23:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4416EC2BCC9;
	Fri, 22 May 2026 21:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779484997;
	bh=HY6HXz1rUxunVE83orvuh0gY4psjWh1saEXwMh/vrh4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=JFPDQ332VK/XtDPabk8fNoHSESgwzZjBUUbyotUVWAcuyiBQ/PkLAdB6o8c6Dhh6b
	 1xmR87vSarPT+2xab+Dt/O9wBPXT1RjeVWk1M8/Km00oqAI6RvbmMbHTuyIl7iZ/6Z
	 0FkqvRt00DNGKekWq5clt2+coo1jv8FmuNi2YJ5Tyc5m/aSDhEBnIbMqv1Qa//Rg5r
	 BEknQaodQd5i3xZGdBIQNJv1rVEnd008cQKebE74tDoYj/icNACTdZUHy9eyHbMMlo
	 DIEQGxxxjQKNqPuXq/kPQ37T0+xYhm8Cb8Mp4raJS+xAYaCdP2vaqoRdUYk08koCgu
	 q+tLKM4Ro6IyQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B029CD4F3D;
	Fri, 22 May 2026 21:23:17 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Fri, 22 May 2026 23:23:14 +0200
Subject: [PATCH v5 8/8] arm64: defconfig: enable designware mipi csi-2
 receiver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-rk3588-vicap-v5-8-d1d1f5265c56@collabora.com>
References: <20260522-rk3588-vicap-v5-0-d1d1f5265c56@collabora.com>
In-Reply-To: <20260522-rk3588-vicap-v5-0-d1d1f5265c56@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779484994; l=1048;
 i=michael.riesch@collabora.com; s=20260428; h=from:subject:message-id;
 bh=a8sioWJftfSyXN0rqDXq8bBppSiXX8eZImBE70llAi8=;
 b=IqmzJqKJkEHjtsNbaC/h3Bc2jLgWi0PGoQF+I307c9pB+aqLWY0c76oUHf57BbpVC+xz2Wtsh
 bNMI9SKvxgcD9ja101x3XnKmRLP60yM7U5tQL+Aq5v7j30/QtXQDhrT
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=tAbmpPTE1MELYweXqqDU40fa18uCO6s32GJL/RzyW2Y=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20260428
 with auth_id=759
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_142320_109827_2D9917E5 
X-CRM114-Status: UNSURE (   8.98  )
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



