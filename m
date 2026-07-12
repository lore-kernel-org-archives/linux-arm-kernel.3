Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7643C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 21:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U67P9sBZlm1TqULX82yliNZyk22cqhSD+9K5qcqcVzs=; b=X0OVCORJrev358ISRcSXJF7D7t
	tw9B1+ARVHAILnDrR3gh+RH0WbLbDxoCgf/eaWzq6rXQ+vY9eiEAeT+jC/TmX0j4W75hWV8f3AGga
	NjfAtGTABlEQZKdtftqIogY/sZ0pmOz0aMnhEtkY27/EBWG6+du8Vj1r/QdmmTe/34M1vo0FIWDo0
	lP59Gb9NIGCG/WNCDySk6tYZdNOEHFcTAoBmu0NV4OMDViKYpj/y0Heo48+WG6iTM/aWxIyEh2jkq
	sD1M6ZRVhffVND2TlA6KHBBJxAVXfJsEldxiVVcOD7GM+yOL0kc525Q488ZorNNflRnXoGsYGXnHG
	NAMf6PHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj1aT-00000007lTz-2CLA;
	Sun, 12 Jul 2026 21:19:45 +0000
Received: from out13-174.antispamcloud.com ([185.201.17.174])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj1aQ-00000007lQ2-1T2V
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 21:19:43 +0000
Received: from s1041.use1.mysecurecloudhost.com ([192.250.231.249])
	by mx195.antispamcloud.com with esmtps  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <dan@reactivated.net>)
	id 1wj1aB-00GoYA-RE; Sun, 12 Jul 2026 23:19:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=reactivated.net; s=default; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=U67P9sBZlm1TqULX82yliNZyk22cqhSD+9K5qcqcVzs=; b=aoKcojZRMHjYSWcWF3g2pBV4ck
	iCRmjNOyAHKLrIfHDC2QkNH8Upd09B+PPuv+rzwrIDWzBpVRJ/1SjfgDArkqnHi7atxH1PeWGqI32
	RB89Oj8XnXCTuch36L7GPKIAeSg4N/G6wuN+fO8ePf+DKnTiwDDxviPBb+ZS4l2Xl1N2TV/DiGHyi
	lf6XcVuFWAJgDy5WgKN4mpfq2PhcD8Lto/C9/zdyk3lsVtZbjLMcf7Hw1e/l2CsILGK8bQFVwE7vI
	F5zCpg1L1haJuA+oWpCCQwqps8L9D6FSF0n+9fXz9UCvGRuic2MkYPYR6vO5bOl6Rv6J0W4U+ai4x
	LSGBIjkw==;
Received: from [188.251.249.2] (port=43526 helo=[192.168.1.123])
	by s1041.use1.mysecurecloudhost.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <dan@reactivated.net>)
	id 1wj1a9-0000000D6jk-0Cl5;
	Sun, 12 Jul 2026 21:19:25 +0000
From: Daniel Drake <dan@reactivated.net>
Date: Sun, 12 Jul 2026 22:18:56 +0100
Subject: [PATCH 6/6] arm64: dts: broadcom: bcm2712: Add GPU IOMMU and IOMMU
 cache nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260712-bcm2712-iommu-submit-v1-6-80e10cdde2ea@reactivated.net>
References: <20260712-bcm2712-iommu-submit-v1-0-80e10cdde2ea@reactivated.net>
In-Reply-To: <20260712-bcm2712-iommu-submit-v1-0-80e10cdde2ea@reactivated.net>
To: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Daniel Drake <dan@reactivated.net>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, nick.hollinghurst@raspberrypi.com, 
 Jason Gunthorpe <jgg@ziepe.ca>
X-Mailer: b4 0.14.3
X-Get-Message-Sender-Via: s1041.use1.mysecurecloudhost.com: authenticated_id: dan@reactivated.net
X-Authenticated-Sender: s1041.use1.mysecurecloudhost.com: dan@reactivated.net
X-Originating-IP: 192.250.231.249
X-Spampanel-Domain: s1041.use1.mysecurecloudhost.com
X-Spampanel-Username: 192.250.231.249
Authentication-Results: antispamcloud.com; auth=pass smtp.auth=192.250.231.249@s1041.use1.mysecurecloudhost.com
X-Spampanel-Outgoing-Class: ham
X-Spampanel-Outgoing-Evidence: SB/global_tokens (0.00641948596857)
X-Recommended-Action: accept
X-Filter-ID: 9kzQTOBWQUFZTohSKvQbgI7ZDo5ubYELi59AwcWUnuWWEV0H0VbEBODIAEhSA0udvbRtahqg13i7
 QMqll20EHiu2SmbhJN1U9FKs8X3+Nt06bFpPrNOlRAlE9AVLwR4uGVjKNnzF3nQoDoQtBifM84JL
 M0i5ZAms0EHrvcCaVIOrsK9eXVzfCzGPGPoMTsaCGnT3EFAinyrilm9zau/FuzkQt9Nb4Ml7QXdk
 EetczWCulNo0fvnzmZPW3MC2/ZtQeB7itP8hgjDRserKv4bhb3RyZlCL9i3kc+ehInPHgYZWBb39
 uS1TjWG2Inx+Ts2QrtVmombMJ4e2pn5C0yBMHZ0fE47nEjvubMSTLAkKCKefuLbx+lGq0svfyhth
 j0R6Iny++hg9dJLqN5zmWqF/oHgMZXS6X/fIHYslsKU0yPHM4JpSMI47HiFQBsGlm5AygJMVWPun
 1fB37VxVhASG8u+8DUiUO0BRfqxBojlKdxvQMvgrc1wie1AEvvcTmPTyXHf33UIZCAvni7mq+8YD
 f/ci2htloVR93L1bEU+C8xTxJtcVJProrT987X1VDPOqsTEJQ3xb4EkisAQaGZWETxKpCwD+gvjq
 +Q7Wu6n87Y4MiQvIq8yaIH0NAY0jdAFlJGgHOL37bgI/Ye2LcH+K95UvkJc1KT8DOaInKwXx0sdH
 KvLDzn+sBlvbv5VnduIaPR3/go1dqCkoGvLjLeADawo9dvH5wp0vjpaZ/24Ettv0enVxkZCWZZos
 zd8URU/+6gTEGu/XK6Vc8KHdrhOgCII0Dp+U5wepL0lELB73ipSCX8p9JtlqF62roO5JiUZgqswn
 FU+jNZMmXc3nfiJ1alJRK6f8TBthmwt0M3h5WX2oEmyuRHoHPkE1+Gh9C7bskVWClPVvbW5lVyQa
 nRxw5iVtN5vpnmvYZxjapDr5MMFO+3DFFwGQuwP4V68B1nbUsN3BaZE/M3vqEARlo6jh54IQgFgl
 8tJcBEI2oXRkv4Iq0TbZY5Mm+5NMqdAvsw5HrZmlTUVqJrMrRLBBPtFloQeYUOp7A73HI6oJg7w/
 Vocp0WgjUq2yqBKYrhCRRStKrAx+Bg3qYIuMjbgPkQEaCetx7/KNryWPVf2yZ8u9fIwWpUkRCVjr
 Nj2/S44UBGxi1cOBGfNGA0CkKkDTg1FNU79hrLNHG9rNMgmamto3lONnlRzBE3R5i4uebX/RTSir
 gQBo28VIgg+9sqTaGzvsONXl1Kc2a+wlKs+ogYIxcMmuAU5uo7azNF03eV6f4TPl2dZQgUDiy7ci
 lnWekKC8VmKaHtj/paE3bCmsCJBpqx690UKzG0uTc7QOvVpVcWtqyseL5vwFpocRzFu6jUSO++En
 3CbgQ6oseMzSFVJnnE7wBTL1+6vDOMemz/4I88NDD/MfU27nhrax/VmrMyT0HqhWaY+lwFo/KdWd
 3HxTsq690UKzG0uTc7QOvVpVcWtqAHg7h2md1+NSEL2kBRKSQw==
X-Report-Abuse-To: spam@quarantine16.antispamcloud.com
X-Complaints-To: abuse@master.antispamcloud.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_141942_397842_F6E90E45 
X-CRM114-Status: UNSURE (   8.52  )
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

Define the IOMMU and IOMMUC nodes for the Broadcom BCM2712 SoC found in
the Raspberry Pi 5. Enable use of the IOMMU for the graphics/display
block.

Signed-off-by: Daniel Drake <dan@reactivated.net>
---
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
index 761c59d90ffc..ed3178db8acb 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
@@ -626,6 +626,20 @@ pcie2: pcie@1000120000 {
 			status = "disabled";
 		};
 
+		iommu4: iommu@5200 {
+			/* IOMMU for VC4 (HVS & MPL/TXP), Unicam, PISP-FE, MiniBVN */
+			compatible = "brcm,bcm2712-iommu";
+			reg = <0x10 0x5200 0x0 0x80>;
+			#iommu-cells = <0>;
+			brcm,iommu-cache = <&iommuc>;
+			brcm,iova-window = /bits/ 64 <0xa00000000 0x100000000>;
+		};
+
+		iommuc: iommuc@5b00 {
+			compatible = "brcm,bcm2712-iommuc";
+			reg = <0x10 0x5b00 0x0 0x80>;
+		};
+
 		mip0: msi-controller@1000130000 {
 			compatible = "brcm,bcm2712-mip";
 			reg = <0x10 0x00130000 0x00 0xc0>,
@@ -667,6 +681,7 @@ v3d: gpu@1002000000 {
 
 	vc4: gpu {
 		compatible = "brcm,bcm2712-vc6";
+		iommus = <&iommu4>;
 	};
 
 	timer {

-- 
2.55.0


