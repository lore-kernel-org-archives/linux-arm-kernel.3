Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D313606A329
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 05:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eabcvN6A;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cfbUa9Xo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DHnr/C+2XGKPbuOm0r6urkRDLfs2Qaxw1MeyVVAVbfg=; b=eabcvN6Ayqq4Zm
	Z9URNMPtZ5TmrScdKhKTDyxjWN1410jYvGIS09I9xV2TK/8JHUm9bSgWJcVp08UcHHKWQSl/BUKwj
	XYe6J8utZnI27O5S/0PLAlOarfgYttxTH+1TLi108cKhayPzcMmGP0OTGrlX1YwNKor+dsAl9JHe+
	2eYXiQqPxesmtvZobFupZI/rKyrmMDTaceUTq2c7vb560WQk9Iy2L5krhJ0VeVcLtxckDHeTfiQOU
	/JOwLNdt1l1qmhCYW3qrDK1/CbmfqERHsY8e7ABdGx0EzvDZgjhFMwhzZPCZwsrUwLzCrYusuN88x
	4/KMElgGhxiUNtem7Bag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJlKh-0000000DNj3-0YkG;
	Thu, 22 Oct 2026 05:27:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJlKe-0000000DNgZ-3Du4;
	Thu, 22 Oct 2026 05:27:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E2BA660018;
	Thu, 22 Oct 2026 05:27:15 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792646835;
	b=yJ8b92t2dfVcwJyVZYfscArjakB7TKDQR8Oms7Jc/XrqTWGT2q+phN3gi9Ww3QfQxy2Q
	 UHRy57BEwVfagTD9ZWkyOZS+MFuupfzY2ogzTCRbQaF3nQE+SU1e2QSfhdsXmXh1oRdLf
	 mLMZ11Sst1v9MDsX3WxlQ6x/JV38fWUNQQdsdgl2ltTqhE4AQiLQg3k/VkYftbha4Cyq9
	 mw9UDjOAJb/ObQ2LH2S5gfbjqbErh+FrZKVsmIOelLM5Q95eU9PnwQQd9ZLnv1OH+Fb+R
	 sJpIO45FvF2wuJdAOj8WF8N86kXuQZXSHFoGPH2WqqL63ZG0uHAphEiCJcn8w5RdUgA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792646835;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=DHnr/C+2XGKPbuOm0r6urkRDLfs2Qaxw1MeyVVAVbfg=;
	b=AE3SIy/PF6QMkpzAKcmLFqWUvm3jxFbnmah3NP2kODcQawcXEv7dkU5sQMOWOhniEGLe
	 qSb7QixUQv4HzN9rVIc82ILfVyp76td11/uwVxP20vbSJENA6AAVg5ZlpzJexR5YTHwpJ
	 4A5/XrcyJO5lfZ6jytqg3rL1SAkKoZikCxw2G3dap/Tp7dJ+IXH47ksFFMBGdWiGUVysx
	 GkEqyAn7WVQFrZ9cbVhAPsGevNBeTMP7QmlV/i3N0Atx+35zFOa5SP0y8MNmkqGv5/BIz
	 6y+maqg1/Gl5Uy03Kna3bFFlcDyJthOniM+ZlikCz2Csr+LCJUKZxN3bhaAobQ3zxGw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0EA221F000C7;
	Thu, 22 Oct 2026 05:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792646835;
	bh=DHnr/C+2XGKPbuOm0r6urkRDLfs2Qaxw1MeyVVAVbfg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=cfbUa9XofeTo+VwlJ4XB8bpSIPwvL2leJd9F0/uZnVoiviXcXfEQ2cicpRDFEG1Uu
	 0FhCBrj+YGH4rgfhys69Klv4MqczNCqCNF6Gtjg+0OKf+363NlYwV35d0i+2iS8AkB
	 aGrIPjJO1CXSSSAHybETqkd+P54jC9459FPPsHB4AWnb2dE3PqIW34+8U/xBKNyGiP
	 PahyvNYNIFFnT3DMQleOS9udszwgjAq8XRm8nXr5IFHFiHwFvJXZsmmMSoT+31Guvy
	 KIb7o1yv8HdX2MSCs+gSELK1MS2amQr8wYzEiqQ7imM1LiPu05ycUzSMXGP1TTFPwb
	 BM1mRIFzs4iOw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 68E49434F5;
	Thu, 22 Oct 2026 05:27:13 +0000 (UTC)
From: Zhentao Guo via B4 Relay <devnull+zhentao.guo.amlogic.com@kernel.org>
Date: Thu, 22 Oct 2026 13:27:04 +0800
Subject: [PATCH v12 6/6] arm64: defconfig: Enable CONFIG_VIDEO_AMLOGIC_VDEC
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261022-b4-s4-vdec-upstream-v12-6-616240978792@amlogic.com>
References: <20261022-b4-s4-vdec-upstream-v12-0-616240978792@amlogic.com>
In-Reply-To: <20261022-b4-s4-vdec-upstream-v12-0-616240978792@amlogic.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, Zhentao Guo <zhentao.guo@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792646831; l=804;
 i=zhentao.guo@amlogic.com; s=20251024; h=from:subject:message-id;
 bh=jy4Yg5jIEfBQ0Of5AkFH35FisWSScmDdCtmBHrd0ZtU=;
 b=81ZMAudXKWP8qrspL3pkVJzXzHWRZJkWPiFWlDTaliyXy0KBjUetjzb3Kyyv1xyyO4v60UgD4
 IJX1+TL+9nmCw9snE3/d4O1myRk+lVEfZK+z/x6xWY6n+Xqa3CTy1V8
X-Developer-Key: i=zhentao.guo@amlogic.com; a=ed25519;
 pk=5yfDKrjreXwcAoEUsdtWafy6YN500upXp/CgtnXjLVU=
X-Endpoint-Received: by B4 Relay for zhentao.guo@amlogic.com/20251024 with
 auth_id=555
X-Original-From: Zhentao Guo <zhentao.guo@amlogic.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: zhentao.guo@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
index 7b4985b29b21..f00c8a418a46 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -929,6 +929,7 @@ CONFIG_USB_VIDEO_CLASS=m
 CONFIG_V4L_PLATFORM_DRIVERS=y
 CONFIG_SDR_PLATFORM_DRIVERS=y
 CONFIG_V4L_MEM2MEM_DRIVERS=y
+CONFIG_VIDEO_AMLOGIC_VDEC=m
 CONFIG_VIDEO_AMPHION_VPU=m
 CONFIG_VIDEO_CADENCE_CSI2RX=m
 CONFIG_VIDEO_WAVE_VPU=m

-- 
2.42.0



