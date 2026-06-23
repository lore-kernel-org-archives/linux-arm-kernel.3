Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C262CDB466
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 00:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YAd7uMTY8hvLxJ9BJRfunQhuoZTcdrDy4NJ6JeY4BLg=; b=B6wCoqAgNTLWEcXAhFf/zdWvz4
	pMMV29MwcOSEo9wAC2Il/BZIHicWBPwhQkCjnvgkHZGcW/Oi7LNNEI2QMQbI2x6H1eXLaj3JP9S4q
	w9WfdzSG/veigje/FbKNl25PgiFvwwTiHeDO+zkMyb7OWmfO7FInvxUq55ptJKN6RiLvLCqVdRa/s
	p4zPA22Q0OXXTJAqGOvluX5qQ4IQg/yVWHy+sixdxysEG+Esvsbu4WgcQfJ7xW5juBmdAZhQBqeVh
	vCymmrS+TYpJidGk4bCvOdqV+Qr1ERiSZavNx0lVkwR8lGnA6G4pZx86inLimi+zPBlStoD1toTL7
	L44BwYNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbpQn-00000005VOp-2wth;
	Tue, 23 Jun 2026 00:56:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbpQm-00000005VNK-2FUS;
	Tue, 23 Jun 2026 00:56:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BE824445D3;
	Tue, 23 Jun 2026 00:55:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6D66AC2BCF6;
	Tue, 23 Jun 2026 00:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782176159;
	bh=jsqvH759yuuhvhDxAQ6gfBb7WpPEVTvTwxN6m/znzWc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=krGm2H3mKSLOiRJwutVYMayFaax5O30niEPEOrUVAWnfjEyuEriS8aUj4B1cZwZPp
	 ZNsP53++12AtIjoWixc5XrK304bCq4i/INxt7yXIdW8FI20guIVAsF5RrclptNwmwq
	 xaxUrxQ3mfBBJqiXs1+L7eXDJ4vlI0NQDLtVhQRtMcRm9YsYa8hewGRqyzosivsnUe
	 xriuAORUPdD5CYZ7Si5BiNYIDs336j7aqHlOGfmIqq25pOHP+qx3B/dqTx2gAaAW9U
	 m33G2wMfaXq+CuNfhEc18W4oBXfx1+R+DKX+Es2i+WaphTRxCM+OULi80EV/KglMa9
	 RX0f8vKK9Zlow==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D63FCDB471;
	Tue, 23 Jun 2026 00:55:59 +0000 (UTC)
From: Esteban Urrutia via B4 Relay <devnull+esteuwu.proton.me@kernel.org>
Date: Mon, 22 Jun 2026 20:54:25 -0400
Subject: [PATCH 4/8] arm64: dts: qcom: sm8450: Add missing PCM_OUT port
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260622-sm8450-qol-v1-4-37e2ee8df9da@proton.me>
References: <20260622-sm8450-qol-v1-0-37e2ee8df9da@proton.me>
In-Reply-To: <20260622-sm8450-qol-v1-0-37e2ee8df9da@proton.me>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, "Joerg Roedel (AMD)" <joro@8bytes.org>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, Esteban Urrutia <esteuwu@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782176157; l=2081;
 i=esteuwu@proton.me; s=20260622; h=from:subject:message-id;
 bh=OrJOz9UX4k6KmMtNljEzpauAqT9chi789O6PWbCCR9A=;
 b=8ZrQA/bfSoXVwph2etq7CCG/xh90OvmKglxlcOKnQ6xMzR5oOwV8/Zv7t2tqO7ibSosAfie/H
 mDD4TCZCCX5BDvldcFOyPud4ZsuuTi2J5BmEn4KNL1vGLDynVxzZTaK
X-Developer-Key: i=esteuwu@proton.me; a=ed25519;
 pk=wToFt4mOAWkzbqb15Ye1hrhevI13vK9BcMUFiQ/me1M=
X-Endpoint-Received: by B4 Relay for esteuwu@proton.me/20260622 with
 auth_id=835
X-Original-From: Esteban Urrutia <esteuwu@proton.me>
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
Reply-To: esteuwu@proton.me
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Esteban Urrutia <esteuwu@proton.me>

An error in dmesg shows there is a mismatch between controller and DT
dout-ports.
Add PCM_OUT port to fix this.

Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 5e331a25e22a..8fc58a02e5c5 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -2914,20 +2914,20 @@ swr1: soundwire@3210000 {
 			clock-names = "iface";
 			label = "RX";
 			qcom,din-ports = <0>;
-			qcom,dout-ports = <5>;
+			qcom,dout-ports = <6>;
 
 			pinctrl-0 = <&rx_swr_active>;
 			pinctrl-names = "default";
 
-			qcom,ports-sinterval-low =	/bits/ 8 <0x03 0x1f 0x1f 0x07 0x00>;
-			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x0b 0x01 0x00>;
-			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x0b 0x00 0x00>;
-			qcom,ports-hstart =		/bits/ 8 <0xff 0x03 0xff 0xff 0xff>;
-			qcom,ports-hstop =		/bits/ 8 <0xff 0x06 0xff 0xff 0xff>;
-			qcom,ports-word-length =	/bits/ 8 <0x01 0x07 0x04 0xff 0xff>;
-			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0x00 0x01 0xff 0xff>;
-			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0x00>;
-			qcom,ports-lane-control =	/bits/ 8 <0x01 0x00 0x00 0x00 0x00>;
+			qcom,ports-sinterval =		/bits/ 16 <0x03 0x3f 0x1f 0x07 0x00 0x18f>;
+			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x0b 0x01 0x00 0x00>;
+			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x0b 0x00 0x00 0x00>;
+			qcom,ports-hstart =		/bits/ 8 <0xff 0x03 0xff 0xff 0xff 0x08>;
+			qcom,ports-hstop =		/bits/ 8 <0xff 0x06 0xff 0xff 0xff 0x08>;
+			qcom,ports-word-length =	/bits/ 8 <0x01 0x07 0x04 0xff 0xff 0x0f>;
+			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0x00 0x01 0xff 0xff 0x00>;
+			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0x00 0x00>;
+			qcom,ports-lane-control =	/bits/ 8 <0x01 0x00 0x00 0x00 0x00 0x00>;
 
 			#address-cells = <2>;
 			#size-cells = <0>;

-- 
2.54.0



