Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A70606A324
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 08:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pHMEgPcn;
	dkim=pass (2048-bit key, unprotected) header.d=gahingwoo.com header.i=@gahingwoo.com header.a=rsa-sha256 header.s=fm1 header.b=F1OyosDr;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=qTFJaxHy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=hehxHz+XcJJW1FfdyU2uS9OwIFl/78x/QxuIZj8So2w=; b=pHMEgPcn09lWQA
	tQ8qD6mwEV2LuAX8QZBljc9FWiwM+GTI4Tfui+Rt/AiLNdrNwlsh3Qv7GSTgqB/H4nSMdK25XT6gK
	kb/yjKhbzlt5MawbD1gip9u7o/XYuCXDy3V9Hpq9QdU2kGe2FYYEEGsQdA2ikZElwgkQsd+RK7W3E
	xQ4PbtysnCq40R1CUTIYkZyw9oqREWn3llVsrxe3GXg6XwEw9YGpEb83DLb0dFsvFGN0HcUsbHKWe
	1qNZxWQ9f5dOKmptTYo0inK+I2lUc5D2cDi6Ve2B7NrOZYt0w7Op4Jixo8JhhN/Sa7vqze3zjE9kJ
	ZdP48lyVyqpDrshzqDbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNQso-0000000E0NU-3miV;
	Sun, 01 Nov 2026 08:25:43 +0000
Received: from fhigh-a5-smtp.messagingengine.com ([103.168.172.156])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNQsk-0000000E0Ig-2vcq
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Nov 2026 08:25:41 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id D73FB1400316
	for <linux-arm-kernel@lists.infradead.org>; Sun,  1 Nov 2026 03:25:37 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Sun, 01 Nov 2026 03:25:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1793521537; x=
	1793607937; bh=hehxHz+XcJJW1FfdyU2uS9OwIFl/78x/QxuIZj8So2w=; b=F
	1OyosDrqNCkSP2mO/T96AAcCe/M94LZvmx0/bUH+gJ2UfjxYG8kB2TFHdde3LpEx
	EIyKA/0dEhHHpon2dU7nr1Dp9+KcHS2LwTkrd7Yauy28PXQkjI1v+kgW+0rLoacP
	XRFks2/GElmgI6n7Z59y2tQX8yygjXUZTdJ7rV8WqEhvdGsGVSi4X5GjDXMUjVTz
	0bwUExMRrBSdxwrpuiCBuxA7ODrM2Og77LTU+MXf3ZInBm8mWOaNTS0SZgcYMTWY
	VQ3QuL/HIaX1H3u15OsvB/X9LFXildzSwAMTPd8s1N4WEwn2Isz5ipjLpHbigZhD
	WpEblTPbQftNI8oiS42OQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1793521537; x=1793607937; bh=h
	ehxHz+XcJJW1FfdyU2uS9OwIFl/78x/QxuIZj8So2w=; b=qTFJaxHy++nTNAxsG
	A0nIBUSdk2ymDVbuQltMsu76UTLhEhPioIW+9ZbtQFv1zfkZpDrMMfjSjuZ418TV
	8rhUTLfkLL57SXA9krgEJQu34nEd4dL6SRBWqY5DTMXYhrb7xaHUPS86WY/E3Vgh
	iFY5kkB2sm+xL4p70lG78DQlO1evGRuFM8iKff+tVvQ7OMPtGnwdqXX2qqyUPXiB
	B0v3TAcGZCkkzOOWsnC4p1S6I76iE3U4xgCxcBiX0P1vrqIEIzuY8JSusHejjANz
	WRSqQsMizGZUbSc9VJs1Z4lTT8XxxM2F8gOXBfOIqNiLHL3x0tSdL1liQp7Zwc9y
	wM4SQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=gahingwoo.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793521537; d=gahingwoo.com;
	mf=PGdhaGluZ0BnYWhpbmd3b28uY29tPg==;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm1:rsa-sha256:UNFjSO/19HYLyVoJtc5J7ln+JlwHHEhA6TmCLoVPYbk14Ws
	V4AfskpUhAyvJAGvUjASAJ4HWrAZWmMkGhIIyFc3VkQfEpw7yKyOpDm6X2S4lCDW
	AqfrFEZHzwGsQITZllJNk6wuh2DlxKgrQ3c1hPMu/c79rGWifRCbQIL9lZcuebsw
	7dIJeYtJVtcTR/jQ/kmr2gwJgCEtmVOZ1MRgTra0CtuTw2VxsEl3pyw/wh1RUsid
	RdAJUx3pC84IHLKiULCD6HzG6nPKcgaLV6BNasq/s6zE4VQTJoSlYNLfNsapKuGL
	ghmHYAb+81oKuXh/mr+9J/nrv3o7oVNpY8b8/Kw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:1T9sEsn4stlUbzvAo1DFzO6Y7bqkN0G4xf3cjg8UAQo=:IqkVwNLAKeppQo2g2DvGaDvnWrMWjd1zZ8rdYrfeZr0=;
X-ME-Sender: <xms:gffmahYGOE_EauUhvicO8XtzULw7C5fQNLqTYVpU4rVBgrh5NEEXOQ>
    <xme:gffmaqv_k13JP6UAXJCKr562AbN11_ZJ0tnXaZgKADVd2yoMwpXngp9j-opPebzAw
    _0vXrDBLnSbvwG1GorKpV-22-NXR7CCCzFnfkuQtpfRt3xqR2C6O1ER>
X-ME-Received: <xmr:gffmairbLuiQYok1wTYMyFe8pgPXFHCWlY6EGXjzUd2BcSCyUKnB9-6QJEPrPbJMlb4i98aB>
X-ME-Proxy-Cause: dmFkZTETy3iq6shVyHvrvogT1vA3sVBaKllPQ1wQ4LJMhjF44qU0s0XZ8eLq/k6yctnKst
    MQPxEHxz9rrNjy7Xu2B++/5ClKVy+wWlOe4prEQQ1cEZShiRkH2Az4aoIaQ7tW8kjSzcT/
    rzySxuLXzlyEr2rtEtR/nzCISg5bgzc2qBGIAEm8GSq2Oqw6ayxglCo+wJhexK748o/Vuq
    VCZ791nPG3/fm2XPz4N1DAOQHM301syJ+x8WNVw0p1WeHLUL/pESRogs2PT0nTCL+D/AVe
    uMFe6ZJmkMon01iwUgCmMMmKB+Akp8cbOLKrT/8zAMxMIr+tlt223iRbsj3VTWGUq6v9oT
    RmZ0SkkoTZMt0nznFQX0byctVKpH5l51DBkkRVzZLRpCfFPmAtfa8i2Yq/HdFiWlL+LRKs
    lbKUUZSzEoxM9QrNM32K0hKnS3US/TfSRW+RzArq/klP8U1SffEqabTRTa8ubvVd4o1qhW
    fdzi/G5kp6MEPddUinb+gyxFBefJoWkE85730X/MOeTYAOeWe8ZhxiT57dg7mLfuI3gG+t
    B4SZ6ed7sRz0xdMmpTkqJmr6JAI1VZ9cnT7OxFsB4NERbxVeCCI1vS/UH6i/RtYqq3g3Ct
    9aHNwOTRPqrNPyc759Bg6rGse3d4fWrdtm6+tA1uIqNUm7mgaeKYSuebFYPg
X-ME-Proxy: <xmx:gffmaskiwOSG4D7B8uVJkphbMrxf7kA-q2fIYWsl4Cxm8MjiOFEBAA>
    <xmx:gffmaqSC7AE6jxU7pdPlQS36gAIBIbAO_X_LUQUDEGHiyiVOTyg83g>
    <xmx:gffmatSnEibMpZl74QfEaGftsL8SHuSCWox3Bzs3oSXzl_AOYiPufw>
    <xmx:gffmaj4Dn5IIGnD9bk7Du0LTyYRMT4FmpnEaCbx-0xM6DChkH0h2Pw>
    <xmx:gffmaimeuUabua-_M1ls-3RDh_J9Ex5xFsLsFMi8RR78yxXgCL4Uh6YY>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 1 Nov 2026 03:25:29 -0500 (EST)
From: Jiaxing Hu <gahing@gahingwoo.com>
To: tomeu@tomeuvizoso.net,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	ulfh@kernel.org,
	p.zabel@pengutronix.de,
	ogabbay@kernel.org,
	zhangqing@rock-chips.com
Cc: royalnet026@gmail.com,
	abel.vesa@oss.qualcomm.com,
	sebastian.reichel@collabora.com,
	sidong.yang@furiosa.ai,
	u.kleine-koenig@baylibre.com,
	chaoyi.chen@rock-chips.com,
	diederik@cknow-tech.com,
	alchark@flipper.net,
	leonard@lausen.nl,
	jeff.hugo@oss.qualcomm.com,
	rfoss@kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jiaxing Hu <gahing@gahingwoo.com>
Subject: [PATCH v15 13/15] arm64: dts: rockchip: add NPU core domain clocks and resets to rk3576
Date: Sun,  1 Nov 2026 21:23:05 +1300
Message-ID: <20261101082307.151957-14-gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261101082307.151957-1-gahing@gahingwoo.com>
References: <20261101082307.151957-1-gahing@gahingwoo.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_012538_912198_29AF22C1 
X-CRM114-Status: UNSURE (   9.44  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Both NPU cores share the convolution buffer and the DSU, so give PD_NPU0
and PD_NPU1 the three clocks PD_NPUTOP already lists, and give each the BIU
reset the pmdomain driver cycles on power-on.

Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index 9d9e9d7868a0..ea9229b6e6f5 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -1085,14 +1085,22 @@ power-domain@RK3576_PD_NPUTOP {
 						power-domain@RK3576_PD_NPU0 {
 							reg = <RK3576_PD_NPU0>;
 							clocks = <&cru HCLK_RKNN_ROOT>,
-								 <&cru ACLK_RKNN0>;
+								 <&cru ACLK_RKNN0>,
+								 <&cru CLK_RKNN_DSU0>,
+								 <&cru ACLK_RKNN_CBUF>,
+								 <&cru HCLK_RKNN_CBUF>;
+							resets = <&cru SRST_A_RKNN0_BIU>;
 							pm_qos = <&qos_npu_m0>;
 							#power-domain-cells = <0>;
 						};
 						power-domain@RK3576_PD_NPU1 {
 							reg = <RK3576_PD_NPU1>;
 							clocks = <&cru HCLK_RKNN_ROOT>,
-								 <&cru ACLK_RKNN1>;
+								 <&cru ACLK_RKNN1>,
+								 <&cru CLK_RKNN_DSU0>,
+								 <&cru ACLK_RKNN_CBUF>,
+								 <&cru HCLK_RKNN_CBUF>;
+							resets = <&cru SRST_A_RKNN1_BIU>;
 							pm_qos = <&qos_npu_m1>;
 							#power-domain-cells = <0>;
 						};
-- 
2.43.0


