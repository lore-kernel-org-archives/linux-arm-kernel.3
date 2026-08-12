Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11658C5CFCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 02:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t+9G9/mxgg/a6nfa/RjIZOdjnYk3TOa/hZMdheHx9eE=; b=fLau/f6G/LMs/zYXrhzQzT530N
	eywOf2X/BjfslmcA0eAjfcjwoc6hCM0SRtMPn2JmVymKpiqePFWnsI5nraaatJqAjcVD/5qptdXg+
	lgMn0ZxCokcReHTieslMRiDbx30Sk610MnTXqY3bE7h/MOMPXrIP52+6T4vIZl8Cb594rnlcVkq6K
	fJbTCKI9ZrlVVVlZn16bxS0aIcV8sLiA60lw3tMvcA5klUKgO3f8SKWeYKJtqAwB7tatv4tlSQBr0
	jeLM/CIPNw5nhZRu0RgN2j8z+ylyHhR4DuTge9AyNsFh/SDw5EgYr6BS8gcjOW6GJQsTYupUgo3O6
	kns0/gDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtyuZ-0000000FHuw-1wnU;
	Wed, 12 Aug 2026 02:41:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtyuP-0000000FHn9-3oFZ;
	Wed, 12 Aug 2026 02:41:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 11AB160A9E;
	Wed, 12 Aug 2026 02:41:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B1A76C32786;
	Wed, 12 Aug 2026 02:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786502495;
	bh=Zpmh8tNY6Pnt5n65mitKLOwn/ENmAmMsvrIVDSYl1f4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=QRoo3Lid1t/7wDbm4ZuWpfGTw0XFA2UYeIAqxnNvcZ+736DZOKSIaXaLj5lwLd5Wv
	 JdnRPs+ARyDUDugnYO3kirmDMbXL1uncl98b27+3/rp7KPxuuHkjwsj8CuCCH062+E
	 isM7lcrR/4HdeBE99MpQWpNYH1QHK7Hn01q36eupeWYaJGWDoGWFqSKVuUhP4S0Ol+
	 6yFTlmbXI/EmqStp/puIfsFlcO1gE7/yKqtw+mBedc22O2fb/w1NVJTXPtO4kz13yy
	 tRoPhHQ2zmN5OGyifC9S5Y22zF6Li742J4TfmgkykTnsKFn4lkmZDEQZDo5awUMFXj
	 6o2SZ3Jgdd1hw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0B70C5CFC1;
	Wed, 12 Aug 2026 02:41:35 +0000 (UTC)
From: Zhentao Guo via B4 Relay <devnull+zhentao.guo.amlogic.com@kernel.org>
Date: Wed, 12 Aug 2026 10:41:28 +0800
Subject: [PATCH v7 6/6] arm64: defconfig: Enable CONFIG_VIDEO_AMLOGIC_VDEC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-b4-s4-vdec-upstream-v7-6-3fae085861bd@amlogic.com>
References: <20260812-b4-s4-vdec-upstream-v7-0-3fae085861bd@amlogic.com>
In-Reply-To: <20260812-b4-s4-vdec-upstream-v7-0-3fae085861bd@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, Zhentao Guo <zhentao.guo@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786502492; l=809;
 i=zhentao.guo@amlogic.com; s=20251024; h=from:subject:message-id;
 bh=A5HDTanmoeQPb4xnQrPVjYVDpBjIBDOzhYRIxgeYOhA=;
 b=hD0byagTjmnuxpL9SmcGV9vdcglR3DpM2iwZmqHGkAmIl9O+FvRJbT3a1QPifvGN6uFynGjJj
 SbHx/VnAzSnCO8uluYvolVgi5Ohs1bkZjbVRc9qWSwJNzHMIIENT+6U
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

Enable the Amlogic V4L2 stateless video decoder driver as a module
in the arm64 defconfig to support stateless video decoder on Amlogic
SoCs. The driver is used by Amlogic S4 platform, such as S805X2
board.

Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 6ec8d3a69c98..7be4e5a284ba 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -919,6 +919,7 @@ CONFIG_V4L_PLATFORM_DRIVERS=y
 CONFIG_SDR_PLATFORM_DRIVERS=y
 CONFIG_V4L_MEM2MEM_DRIVERS=y
 CONFIG_VIDEO_AMPHION_VPU=m
+CONFIG_VIDEO_AMLOGIC_VDEC=m
 CONFIG_VIDEO_CADENCE_CSI2RX=m
 CONFIG_VIDEO_WAVE_VPU=m
 CONFIG_VIDEO_E5010_JPEG_ENC=m

-- 
2.42.0



