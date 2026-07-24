Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB3A6C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 07:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2nhEUKowGNyX3JCeYwtinwzPwAW46umr9GawEATel4A=; b=4qVh7EJXE+7dSFEJPIzJuz+Ppj
	wxlbOGYd/4fQyh3kdrrXuADI4zEbENFVPFPIkS6etJKcj8nxoqU90eFrZQbTJRIi1LdtQq3TuzRPG
	dOHExbSv6puzWqzQE3LmlXnLJN2P2xJ7PKN3wGFiQBYKzo23fZEjzerfXa5aGfoLDEM42ry8t2BYU
	h2Cw6a9hO2gVuGZR/7/I16B0BqBTZ62GbWzMy6XnTc3U+AwVqOasu33f1stMPlE7KIUlkcsB6X0AX
	3I1uvUXkNuLwPozxU5dz9viuSAVPR9tygcrPspp+O7ZAOpYjoaN1TWCCJ7i50MCSOgDuu0xXt8YKF
	NXfWx8wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn9yU-0000000FeZn-2r5O;
	Fri, 24 Jul 2026 07:05:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn9y3-0000000FeJQ-1h6k;
	Fri, 24 Jul 2026 07:05:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6485F45093;
	Fri, 24 Jul 2026 07:05:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 428C9C32782;
	Fri, 24 Jul 2026 07:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784876709;
	bh=ZduAyIlR/IFIiwJG3a0BTdrTnNLX76FAnBte6j1pQOM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=VIV4jt05TE2yuG+LCs16byuiwWyMIMg7ki/CTM5NranCgLyo7AgAA+VK/Wo8eGdgn
	 7URhxfrHSb8HMGL1/xv7/HAab61hDEwLNVSg1Gz6Eej2WUySz0i7uisRF0mkyD5fjB
	 1RdstWLzLa8WFBNlECc+C2Vi5nCwOErnp3vikbyweyd2CNQWeiO7YZ1pMSbbFzpW4X
	 uGQ4A/ennoDqtPOTBdiRPuYPahtgBaqrUk4GeJ/zXfUcOmB/sd5IZdBsTAGyIuj5l9
	 Dr+okLZyPH3uqCX5/Xw7XwER4HN5/cajl9wOhiv7vlhCrBfjfk6oQehMwieUj+EouS
	 LUS/txvFjnPdQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C9AAC531F9;
	Fri, 24 Jul 2026 07:05:09 +0000 (UTC)
From: Zhentao Guo via B4 Relay <devnull+zhentao.guo.amlogic.com@kernel.org>
Date: Fri, 24 Jul 2026 15:04:56 +0800
Subject: [PATCH v6 6/6] arm64: defconfig: Enable CONFIG_VIDEO_AMLOGIC_VDEC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-b4-s4-vdec-upstream-v6-6-6072a7ee7428@amlogic.com>
References: <20260724-b4-s4-vdec-upstream-v6-0-6072a7ee7428@amlogic.com>
In-Reply-To: <20260724-b4-s4-vdec-upstream-v6-0-6072a7ee7428@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784876706; l=768;
 i=zhentao.guo@amlogic.com; s=20251024; h=from:subject:message-id;
 bh=s56xUn1T/sDmdBk4tsVqVJGNOKSjSa1IT2ROng65XrA=;
 b=lb4nQAFx6tNkB7KG9S1omoruM2Xct6Jryv0j85PT210Nmj7bpqzUs6MHgCyqLhE7vWPircOkq
 ZMHJvDUdkrkCjiSspUnaAB/d8RzsyB/zhC9rNie5uu2Ug9BYG6V/xKi
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
in the arm64 defconfig. This driver is needed for stateless video
decoding support on Amlogic SoCs.

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



