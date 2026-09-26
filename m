Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9176CC98338
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 13:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f6/UYUa2gHXX5gMEUVh64RU02W5wyi2O7lK5Qpo26pw=; b=XLo3nZLfLg79mD2UzHg26APuPq
	kHusd0utKk9Cl/q1NGe1YB4+htSbe2f8JKnFPda/H0sysLdM0m7mcQZasGQRK/ilACd5rHlGIvQQj
	A4awgxewkfpf4gaSmHPyXMxjvC9x3HoRDCyoJtNTM8c1ehkeQzDAzmBtTEOYAPrCoMwOENHEdqCVn
	WlgwFyxYIymNblr7jzJScwA/GPwpDy631odtD9dZnhRz/lNWZ8DIsy3dQckT4DYfLEolFRU1LOoQ5
	arWmyZJiP9R/vB5ZVPqdi9jt6sHaXkWFHcLiWBpvfVF7cQ7cL9CMIQrWSRp68Uj2oSmkWQEzn+WAf
	QksL6j1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xASHW-0000000FRCl-1aSI;
	Sat, 26 Sep 2026 13:17:34 +0000
Received: from mr-2001b-snip6-11.eps.apple.com ([2a01:b747:3000:200::15] helo=outbound.mr.icloud.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xASGr-0000000FQgs-1QsI
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Sep 2026 13:16:55 +0000
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-60-percent-2 (Postfix) with ESMTPS id 1FC4D18051A2;
	Sat, 26 Sep 2026 13:16:52 +0000 (UTC)
X-ICL-RepId: 01a0dddc-861a-7e79-8d33-5d2dedfa2902
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQFMHV8EUxxCDFYAXRcOVk1KF1UYREVRMFAbXwJCDxwTVhUTC1NWWxNVF0YJGQhdHRkKUFAGXRIYXBRcUFgeRhJWDV0JGQZAXlAbXwJCDxwTVhUTHUMZDysISgRDB0UCXgslEwlTVlsTVRdGCRkIXR0ZFVoJClcAQAtOA1QFXR8RTxweGwVGA0cUHVAIVQ4EEQpOB1VSK1sTVRdGCRkIXR0HWEcURw4PGVoUXBhT
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1790428612; x=1793020612; bh=f6/UYUa2gHXX5gMEUVh64RU02W5wyi2O7lK5Qpo26pw=; h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme; b=sRWcGsNcAnxZqoVLmqe143hubh29BnvrP62hzDDYdNYg0qqu+fvVWy04pP8FP5m1uf0aW8kIbyzh/ktNnjz57bfBVJW9H+uoIH/7y7e58JxgWWwSjyMyUcZNOKl6REAezv/3yZbHEttxVk5OdkU3hJ/78z8Sq6h9LxN6NT43gFuGEjt5ihgLVNlZ0xwOOsci3pAbmY6BrdYw0o+VuAr4u6AL7spH6S4RQu7Dkb3HIGDGr5av6To/e0j8m1BP+rhIL+Rn8lSXOkpIM8R2qguzO0Un+6G5J+ylhjBhfRr+OYyii7kQj1iAeAISX0avnTgiqn8gpYPAdVSiym+KC4R4Zw==
Received: from [127.0.0.1] (unknown [17.156.200.36])
	by p00-icloudmta-asmtp-us-west-2a-60-percent-2 (Postfix) with ESMTPSA id 53F2D1805194;
	Sat, 26 Sep 2026 13:16:49 +0000 (UTC)
From: Sofus Forstreuter <sofus.c@icloud.com>
Date: Sat, 26 Sep 2026 15:14:56 +0200
Subject: [PATCH v2 17/17] arm64: dts: apple: t6031: add avd nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-avd-v2-17-ecebe6a3648e@icloud.com>
References: <20260926-avd-v2-0-ecebe6a3648e@icloud.com>
In-Reply-To: <20260926-avd-v2-0-ecebe6a3648e@icloud.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sofus Forstreuter <sofus.c@icloud.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: s4xF_yIV6082GzJKgn4jni4TfQOCCGWo
X-Proofpoint-ORIG-GUID: s4xF_yIV6082GzJKgn4jni4TfQOCCGWo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI2MDA1MiBTYWx0ZWRfX0YKirIQYVvfk
 jDKtrtxaDdbTzhwTAKQCtMX+uWhFKTCGqKDvJzqrSFG1LfkTvNUHY0SImcHsUpJLWR3G+fdIv4M
 +4jFYzyO9K7Ier8aFehBjyYz7OM1LQQfLlUzSfGw+OKtyGtCZG6rXDsEsQ9R3T/eoFlo8YXC2lM
 7VLb7+YADL/CtvHG5GwwzrVTrLgtncqzW9g4o3jrI5EjgnRbSKDquvvP76BBHhdTOs5gEXkBINu
 FL6p1eBl84YH9kyyucXPLhDMXJm4crMFIOK9dMjQgLPQFKUzablgq/VGOyT5J8zyTQ0NCYshOB/
 3RwUmJedNGC6T7sw89zx4LiExND956ceEYV2GjaPUM7vgSRj9DvO/hHMMKEs6w=
X-Authority-Info-Out: v=2.4 cv=cOrtc1eN c=1 sm=1 tr=0 ts=6ab7c5c4
 cx=c_apl:c_pps:t_out a=9mRn2PO/+PIrVdEbaIuMPg==:117
 a=9mRn2PO/+PIrVdEbaIuMPg==:17 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=x7bEGLp0ZPQA:10 a=kLM9Tyy99jAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=v3ZZPjhaAAAA:8 a=H9SxB0RbRSejM8bdbGsA:9 a=QEXdDO2ut3YA:10
X-JNJ: AAAAAAABCXDx5zcLPbU+0N4MmAu4+7riD+TlY9Utubh6Bpw2cSqN14kV3SP2NGanSvDLaBvFzWcvA2w6jeHbNNhJs/SshZKOdcNrObJqRF93A38cf4NemsrKdBXKYXcghf717OUJ4Dar6WOac4YteKSaXciBrWv5H5xbT2BJEVwu/RpTXwfHUiJW7+b0iHHa514gfmL93lAXBdLoJOtKF0LrO3lmulzFzn2ReZFNvSw/sVbqwUiCtrXIHAb2dXJBVfHjxQTNzlHl7qHTbBC6sg2FFAGVvpRPGMsRDqzrUgtwPuXCwoZcMPLqnDOufVPS580mXLB2e/QAoSFz/EyP2sTCjPDMB49u73iWKX5RWYPDrjGd6OIv4++twGSqsIxk036EHdT1Ptg/THZod7Sz0Jag/CtAbsWb8YTa6ABf2GrV/L4UVkIABYBj5Cusq6jQmf5XuNmYmEafkW4esjAmSPH+OP/ONSTtNQVgQXQzEbK/LzL29QD/yQef5D1Aaee4wcoCy+4E5Sy0ZgRCtB1ZUH+lrVHN1idyGNstD2Xz1Qdhm6/sKG5bmst8YepO8fG68rOajiC13SebO9RNC6r74R2hg1qRsV1Foi4/X5pOPpqKwd1eVzsdiy45D5uYtB3E26q7eBZm3YkmaThNztoIsMBkSYMLOWw/8XDo/z+q0+8G3ADzllJULE6GI+OepMwTZv/fVZn9bFnv6Yef22DJkshfKULUi772gLw7HpbEbWEjCjOoOP7j9AJuszt9ze+zRe8pcCiTrZBDd5vE46TvQBznpKc1hfvJYPxPeEaCzNu68agxtrTKLYv/VERttxrADZ3Y1mUOwInvqwp6z/gv1Bu19QRuiOKhZDul2cxzuhUCGCMLc/U2Nu7650wbaf4qRQumPtcB6f8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260926_061653_461671_C3AEB52B 
X-CRM114-Status: UNSURE (   7.34  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Signed-off-by: Sofus Forstreuter <sofus.c@icloud.com>
---
 arch/arm64/boot/dts/apple/t6031-dieX.dtsi | 32 +++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t6031-dieX.dtsi b/arch/arm64/boot/dts/apple/t6031-dieX.dtsi
index 2e9d3d2e6dea..3b21a7aae409 100644
--- a/arch/arm64/boot/dts/apple/t6031-dieX.dtsi
+++ b/arch/arm64/boot/dts/apple/t6031-dieX.dtsi
@@ -73,6 +73,38 @@ DIE_NODE(pinctrl_aop): pinctrl@2a8824000 {
 				<AIC_IRQ DIE_NO 601 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
+	DIE_NODE(avd_dart): iommu@2cd010000 {
+		compatible = "apple,t6031-dart", "apple,t8110-dart";
+		reg = <0x2 0xcd010000 0x0 0x4000>;
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ DIE_NO 1192 IRQ_TYPE_LEVEL_HIGH>;
+		#iommu-cells = <1>;
+		power-domains = <&DIE_NODE(ps_avd_sys)>;
+	};
+
+	video-codec@2cd070000 {
+		compatible = "apple,t6031-avd", "apple,t8122-avd";
+		reg = <0x2 0xcd070000 0x0 0x4000>,
+		      <0x2 0xcd080000 0x0 0x10000>,
+		      <0x2 0xcd090000 0x0 0x14000>,
+		      <0x2 0xcd0a4000 0x0 0x4000>,
+		      <0x2 0xcd100000 0x0 0x10000>;
+		reg-names = "piodma", "code", "sram", "mbox", "ctrl";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ DIE_NO 1185 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ DIE_NO 1186 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ DIE_NO 1187 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ DIE_NO 1188 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ DIE_NO 1189 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ DIE_NO 1190 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ DIE_NO 1191 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "mbox0", "mbox1", "mbox2", "mbox3",
+				  "flag0", "flag1", "piodma";
+		iommus = <&DIE_NODE(avd_dart) 0>, <&DIE_NODE(avd_dart) 1>;
+		power-domains = <&DIE_NODE(ps_avd_sys)>;
+		resets = <&DIE_NODE(ps_avd_sys)>;
+	};
+
 	DIE_NODE(pinctrl_ap): pinctrl@2b3000000 {
 		compatible = "apple,t6031-pinctrl", "apple,t8103-pinctrl";
 		reg = <0x2 0xb3000000 0x0 0x4000>;

-- 
2.55.0


