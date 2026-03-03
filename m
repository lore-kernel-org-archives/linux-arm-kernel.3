Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D329FEDEBE6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 18:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zwh2kADgvZw65MCFoX1HtfudMZcZ5wfa9E3f2CLwDlw=; b=r4LMOGIlrj2I1STescvRf4TMH0
	xiBmUCyBfy2O+6jd2IJTFP7CuzhtHhWSTVun2mniXTQVmluEw9qgiw+Eo/Q5ic5ShAYsCSnG4tflm
	scTGkT6dbhsRQrVBeb8kaiMcsK9PQEkgmftP7FcOIs+XgGSwasXrY87sr291Z6mezQHpM4mQci8Ns
	/tdepMZM3xz9CazXDpe+U2iSRdy8JPVA2zVb6TZ7Ar88MI93cyrODy82qZRi6ZPFdEy3+JVb5i8eu
	/g/LggGNjmn3MSQB0dRLIkX/tENQZBFQvdtr1o6BnZwDesIQ9jVblCGMJB82fMY2uJvGGxSvo3EPd
	65tP961g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxUtX-0000000FjQG-3EiH;
	Tue, 03 Mar 2026 18:54:59 +0000
Received: from mx4.wp.pl ([212.77.101.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxUtW-0000000FjPD-03es
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 18:54:59 +0000
Received: (wp-smtpd smtp.wp.pl 46139 invoked from network); 3 Mar 2026 19:54:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1772564095; bh=zwh2kADgvZw65MCFoX1HtfudMZcZ5wfa9E3f2CLwDlw=;
          h=From:To:Cc:Subject;
          b=daMJGcVPw90CcQ/NtdndGOIiXDQQSp29B3g2jgQuGq4+gLKGJS6z+JKAuEicI/Yuf
           zZl1EYiCUeVuvLSfk8FCwapvNdslHaxpqCCMeYAngPIMLm0UuBYIIvzevKl4yQsarf
           ltHUismVs9QYyC6mBzs+Yb6w2MKHFjs5k6lLZqpYOcYhmQCgjW6rghMDeSYtZ0h9GH
           zy4nWiJLdAysZoFhBicSpoXFyEBGOZuscsU2P6w+EMfY/WPUNXuKiFzhmvFCVPKjfM
           DQNtSn//dBqzyWt/meBBjGmaw7mIHxRZ/KKYJN2XWVi4UnWfVH6qqC0+pRLBxm1dvB
           Bpqpyzl46Q8NQ==
Received: from 83.24.116.171.ipv4.supernova.orange.pl (HELO laptop-olek.lan) (olek2@wp.pl@[83.24.116.171])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with TLS_AES_256_GCM_SHA384 encrypted SMTP
          for <herbert@gondor.apana.org.au>; 3 Mar 2026 19:54:55 +0100
From: Aleksander Jan Bajkowski <olek2@wp.pl>
To: herbert@gondor.apana.org.au,
	davem@davemloft.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	atenart@kernel.org,
	linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Aleksander Jan Bajkowski <olek2@wp.pl>
Subject: [PATCH v3 2/2] arm64: dts: mediatek: add crypto offload support on MT7981
Date: Tue,  3 Mar 2026 19:53:50 +0100
Message-ID: <20260303185451.70794-2-olek2@wp.pl>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260303185451.70794-1-olek2@wp.pl>
References: <20260303185451.70794-1-olek2@wp.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-WP-DKIM-Status: good (id: wp.pl)                                                      
X-WP-MailID: b80b92edaf8e041f5f39b6bc99eed231
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000009 [gLPh]                               
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_105458_211895_27E2EF50 
X-CRM114-Status: UNSURE (   8.21  )
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

The MT7981 as well as the MT7986 have a built-in EIP-97 crypto accelerator.
This commit adds the missing entry in the dts.

Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt7981b.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
index 4084f4dfa3e5..94c7bf0050fc 100644
--- a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
@@ -150,6 +150,21 @@ sgmiisys1: syscon@10070000 {
 			#clock-cells = <1>;
 		};
 
+		crypto@10320000 {
+			compatible = "mediatek,mt7981-crypto",
+				"inside-secure,safexcel-eip97ies";
+			reg = <0 0x10320000 0 0x40000>;
+			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "ring0", "ring1", "ring2", "ring3";
+			clocks = <&topckgen CLK_TOP_EIP97B>;
+			clock-names = "core";
+			assigned-clocks = <&topckgen CLK_TOP_EIP97B_SEL>;
+			assigned-clock-parents = <&topckgen CLK_TOP_CB_NET1_D5>;
+		};
+
 		uart0: serial@11002000 {
 			compatible = "mediatek,mt7981-uart", "mediatek,mt6577-uart";
 			reg = <0 0x11002000 0 0x100>;
-- 
2.47.3


