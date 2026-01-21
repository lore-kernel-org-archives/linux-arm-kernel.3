Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2433C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 10:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cvJgvKAXWub4ydD6lUBxx6ZL4AQxbOkKoVG6hcPufuQ=; b=1rBLFZ1fEvonPQILdwHPawJDAa
	2jKP+R/8WmubGR5BezY2BZBU/IC2h7BaxUIfWtbANYCgGyHe68bRYbILtni/N1PaNtUEZE4l9BEK0
	QTh3pyKm3M5MEUrAFNSTLv9mbGWmE0ZvhSrRNX/fkfBX6K1xwmUkdKpjsUVgYi0oIi1MeVhmyvT+8
	BNxqxRYW96r3MI9FHvnj1l4UXk8J0285mBp4Nmi2oajT5UHIvDuCH8Gq/+K1dM6TZ5OYKMLX1+LCP
	QJlgJIDp+HtzhRvYe0sE6WQ4QqIL2N467Pw1B03SMRJo2LEqljgFN0Sw5NRXO5ZcAsEeN4EQv555R
	JQxbTY8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viVUh-00000005HVo-3Ew5;
	Wed, 21 Jan 2026 10:31:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viVUe-00000005HUH-0EEi;
	Wed, 21 Jan 2026 10:31:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5E8E06011E;
	Wed, 21 Jan 2026 10:31:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E2F1FC16AAE;
	Wed, 21 Jan 2026 10:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768991478;
	bh=ktJjYiJZb1HIGWFRxHzP1S+rxzcyHIkrThbcKjDlUng=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=eivTrjmCt4PeQYw+N7FblAX/K+3zovf2BhYFTJ4DWHC4bY8x3msJ57a05Dw2OCW8q
	 2iPgCO8ikASaKdqcvzih+9Vie1TFC+e4NWVmdgtwXSzQujOYPkr/B2sYE2LsB7HO5U
	 JPKDSOeACSvSGuCCuPHC7OmK85ptXz1eDJlEMCiU62qtiyUKHe97nTyi1WT8KRozi8
	 00hEbiqm7JJlF4YbnH72XcBV5GP4DiZfvZwuTUEmLFaKAKm5oMivCQPuLHh1G4eRNM
	 whnP5uuPYZbi2KNFMatAiXe45YeFhjju/Jeyw6H7i/K6IIizs4evLgcRKl0u/06UWp
	 wW+7LUXI/vNnA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9A1DC44503;
	Wed, 21 Jan 2026 10:31:18 +0000 (UTC)
From: Zhentao Guo via B4 Relay <devnull+zhentao.guo.amlogic.com@kernel.org>
Date: Wed, 21 Jan 2026 18:30:42 +0800
Subject: [PATCH RFC v3 4/4] arm64: defconfig: Enable VDEC driver for
 Amlogic SoCs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-b4-s4-vdec-upstream-v3-4-4496aec3d79e@amlogic.com>
References: <20260121-b4-s4-vdec-upstream-v3-0-4496aec3d79e@amlogic.com>
In-Reply-To: <20260121-b4-s4-vdec-upstream-v3-0-4496aec3d79e@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768991475; l=650;
 i=zhentao.guo@amlogic.com; s=20251024; h=from:subject:message-id;
 bh=/Xlp3fNnkZZdZMhr2a18FNe8nGeN4JqqPDgMB8hAANM=;
 b=K+4paB1rPUspGyUu/1OETF9afMaVejfVTVDj8RBXrZzlVhhpdos/BnD7H6gTG9mQYVbeVAUou
 SEKbdncolWcDpRDiiYcIHHY8Fv2KzXuhTneysBb6jF+axM1ygDcCjBK
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
index c43dcadabec4..7c89837f683c 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -903,6 +903,7 @@ CONFIG_USB_VIDEO_CLASS=m
 CONFIG_V4L_PLATFORM_DRIVERS=y
 CONFIG_SDR_PLATFORM_DRIVERS=y
 CONFIG_V4L_MEM2MEM_DRIVERS=y
+CONFIG_VIDEO_AMLOGIC_VDEC=m
 CONFIG_VIDEO_AMPHION_VPU=m
 CONFIG_VIDEO_CADENCE_CSI2RX=m
 CONFIG_VIDEO_MEDIATEK_JPEG=m

-- 
2.42.0



