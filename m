Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2CD9EF48D3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 05:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XblC5Vz/M1Vxol8nu1NVhs3I0ePBuV7aS29CclezUTs=; b=lJhmA8nXUA+gNx5hMYNObKhY1L
	SlyALllGU0wVDAtib1CZaYrCioHCycl1qU06jOxbJRiAZ4dHvzXivhZzQvuDcR0q0+Q5H4NRslusZ
	PhR3vHJiqzBb62n9xpEgdTw/sYbdyr552W4yB85UwNukO7JKnssx7SyiibsyzZrILOx5B0u4rHP9q
	HxIHhaZ0ARn1zoRsThylbBvuUMr5BU7dy3BDFoecNzfMgH9FeTjhK6Lf/sevd28Dd09TqpBnOoX0w
	x3HpJQfT8r8lZ5uX0Ps7IzVw0OGGE/Kxj3Mbo8QIRAlek27fls1rAGJxaZMkL2eDrNCun0vuF4M2D
	1ZnsEUyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqlUO-00000002zmD-16Ds;
	Fri, 13 Feb 2026 05:13:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqlUL-00000002zl8-3LWv;
	Fri, 13 Feb 2026 05:13:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DB8B86132E;
	Fri, 13 Feb 2026 05:13:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 831E0C2BCB0;
	Fri, 13 Feb 2026 05:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770959588;
	bh=Hqko3B+eU60qX6t1+qYYKZ1HEXCgSYoKp0YMBxJzQx0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=s0T56e58NSdt73zPF4GUKvSOp/jUHfHa4cLzYqFZTNhOuu9kmX/izGfQ1AUMd+Dih
	 1MJMQI3NBzgMB4+9wT+1RVAGoYqakEezM/8UkbaWPAq8oqM1o9QQQXNlZpPan0nn7s
	 tWZh7Sq/4nFaVSnmgV3bAR9VE32UzMZLbTW9splBANcGrfy44SMrRuO1PRbOPXP5KL
	 qr72YEpiA1ZX2VOZk996vjTFf9547w3V24jUvVDfj1ahuHUhAdIxOZ0Kx4CG69ZTlm
	 Zsawo2WStCJzvlJjqCBFO5j8ipDOsSXLzDl4gCVhojCRGQkaXJyq7N5rGAwPyxIc5r
	 GtMt4o972gyhQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 795A5EF48CC;
	Fri, 13 Feb 2026 05:13:08 +0000 (UTC)
From: Zhentao Guo via B4 Relay <devnull+zhentao.guo.amlogic.com@kernel.org>
Date: Fri, 13 Feb 2026 13:12:41 +0800
Subject: [PATCH RFC v4 4/4] arm64: defconfig: Enable VDEC driver for
 Amlogic SoCs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-b4-s4-vdec-upstream-v4-4-c7112d00d662@amlogic.com>
References: <20260213-b4-s4-vdec-upstream-v4-0-c7112d00d662@amlogic.com>
In-Reply-To: <20260213-b4-s4-vdec-upstream-v4-0-c7112d00d662@amlogic.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, Zhentao Guo <zhentao.guo@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770959584; l=650;
 i=zhentao.guo@amlogic.com; s=20251024; h=from:subject:message-id;
 bh=tZYyYrW/TB9dy7rEz6q886OC4BRJpy/nB4/purIpLWE=;
 b=ZiWA6cHH1VfHqOEpB6uGKoAT/cyVYPEBcCIgtwhKNvMtBLfnHI+UY5CjYQmtq3wPOhW3+4v0O
 VOnGidHAtxxCZWyjQMvfmLuQ1YDAe8OuJ1wZjbq3cSZ3KJTvQ4dCAop
X-Developer-Key: i=zhentao.guo@amlogic.com; a=ed25519;
 pk=5yfDKrjreXwcAoEUsdtWafy6YN500upXp/CgtnXjLVU=
X-Endpoint-Received: by B4 Relay for zhentao.guo@amlogic.com/20251024 with
 auth_id=555
X-Original-From: Zhentao Guo <zhentao.guo@amlogic.com>
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
Reply-To: zhentao.guo@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Zhentao Guo <zhentao.guo@amlogic.com>

Enable the driver for Amlogic's stateless decoder.

Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index b67d5b1fc45b..9c1dc377d519 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -905,6 +905,7 @@ CONFIG_USB_VIDEO_CLASS=m
 CONFIG_V4L_PLATFORM_DRIVERS=y
 CONFIG_SDR_PLATFORM_DRIVERS=y
 CONFIG_V4L_MEM2MEM_DRIVERS=y
+CONFIG_VIDEO_AMLOGIC_VDEC=m
 CONFIG_VIDEO_AMPHION_VPU=m
 CONFIG_VIDEO_CADENCE_CSI2RX=m
 CONFIG_VIDEO_MEDIATEK_JPEG=m

-- 
2.42.0



