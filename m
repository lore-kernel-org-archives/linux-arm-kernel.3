Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0529DF0180E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 07:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UX38X/TMKiyHQPxwjnR2AzsYEQMHir2CvQcMkoM7b+4=; b=qlrYYUB+EorZ63wYhb2dkH+bTQ
	5Lz7vL4ioF8XKfiT+ZreW0z9aXL1z7C5aYkUR0hT5h0OK0nupcH0IUNN2MYEyvZM4pWhXeCIXLqbF
	qFGrKddaJWB1WviQ6jx4GXd21mq6Z5jZQnMpaA1j0qK0jxkBmxfNkkm90V1TOUTC25m+Ixri7DllY
	qYAtGlaoATo0XfEpI2RRCKWF3GJY8ZXtLcy9Zi4SgxdU0Awz6BR9giJ5u5Py9SUNBC6DSKvPS4O4w
	ymazQxfWiFiww6ElCH05vxs6V36KwEg4LjCDKLspMylLrp8ilf67EMU6KebIuBGxA0FCK7Y0yjKyd
	DJTLyWew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyQ1w-00000003BfL-3OZs;
	Fri, 06 Mar 2026 07:55:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyQ1s-00000003Bae-1lFs;
	Fri, 06 Mar 2026 07:55:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=UX38X/TMKiyHQPxwjnR2AzsYEQMHir2CvQcMkoM7b+4=; b=mTkyNQb0i5dSV4l3LffXk5XEvP
	zz3U28S7rfLoAa5FyPOJI4tozZYH40DQkhsoAYyUjk4ul+6Iv7SIq/NmntxWdt37inPMnt59jifzw
	C3rPcyTk7bv+PRreOSNMvRr5iwZGoFnZhebKSdk8CeXJTZY0+ZytJjDo78GUYo+3f+LSZsOU7Q6Ch
	G2k9ScV8kPLBiK5DIjx5XUSNMRFHnTpJ7l5PJmjwwjWgdb+EvJ2xKtxdSEhaCuKkIkmcXC6hgaj0k
	kBe9Wj1jkRaD4UIH2J7VrIl+OqilU8p+t+CVSu7AxJR8EOKEx/HqCCu2POD7bZ6Otwiw8QW5egV1t
	Lz5DLTDg==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyQ1m-00000008ELO-2qOR;
	Fri, 06 Mar 2026 07:55:22 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6267qp3gB2977175, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1772783571; bh=UX38X/TMKiyHQPxwjnR2AzsYEQMHir2CvQcMkoM7b+4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=VOqvE78sgvIDcl7zxLGSTJIX48Sfbmv9hLVRu8krchdks9SdiFnwvZU7kin0pHQgp
	 A1gzQYgoDw7QZSl4aiIGBOhzi5GAquC+09ePfLGbxGeT1FNvpQhGHkQn+C5uVHnsLj
	 DtXV1kOFkkmx605opuxDTHlKRjcAda456htFfWsglH7RLP2EV19fwOD9zuln4YFiRa
	 v3ovq7lSIkPtMUD/V/qSezVaOcfU0XNIrSBe9aruBZ9c25mFLNWWE8xPYegdSVnkEA
	 nN/mjCKCQC7cw771soOwhHPkBzobAyDKqIHvInhldvRRGdTq9tV5ebejeKF21mM6EX
	 owXrfpS84NTaw==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 6267qp3gB2977175
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 6 Mar 2026 15:52:51 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 6 Mar 2026 15:52:50 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 6 Mar 2026 15:52:50 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <linusw@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <bartosz.golaszewski@oss.qualcomm.com>,
        <afaerber@suse.com>
CC: <james.tai@realtek.com>, <cy.huang@realtek.com>,
        <stanley_chang@realtek.com>, <eleanor.lin@realtek.com>,
        <tychang@realtek.com>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-realtek-soc@lists.infradead.org>
Subject: [PATCH v2 14/14] arm64: dts: realtek: Add pinctrl support for RTD1625
Date: Fri, 6 Mar 2026 15:52:44 +0800
Message-ID: <20260306075244.1170399-15-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260306075244.1170399-1-eleanor.lin@realtek.com>
References: <20260306075244.1170399-1-eleanor.lin@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_075519_353917_695344E5 
X-CRM114-Status: UNSURE (   7.97  )
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

From: Tzuyi Chang <tychang@realtek.com>

Add the pinctrl nodes for the Realtek RTD1625 SoC.

Signed-off-by: Tzuyi Chang <tychang@realtek.com>
Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
 arch/arm64/boot/dts/realtek/kent.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/realtek/kent.dtsi b/arch/arm64/boot/dts/realtek/kent.dtsi
index ae006ce24420..8d4293cd4c03 100644
--- a/arch/arm64/boot/dts/realtek/kent.dtsi
+++ b/arch/arm64/boot/dts/realtek/kent.dtsi
@@ -150,6 +150,26 @@ uart0: serial@7800 {
 				reg-shift = <2>;
 				status = "disabled";
 			};
+
+			iso_pinctrl: pinctrl@4e000 {
+				compatible = "realtek,rtd1625-iso-pinctrl";
+				reg = <0x4e000 0x1a4>;
+			};
+
+			main2_pinctrl: pinctrl@4f200 {
+				compatible = "realtek,rtd1625-main2-pinctrl";
+				reg = <0x4f200 0x50>;
+			};
+
+			isom_pinctrl: pinctrl@146200 {
+				compatible = "realtek,rtd1625-isom-pinctrl";
+				reg = <0x146200 0x34>;
+			};
+
+			ve4_pinctrl: pinctrl@14e000 {
+				compatible = "realtek,rtd1625-ve4-pinctrl";
+				reg = <0x14e000 0x84>;
+			};
 		};
 
 		gic: interrupt-controller@ff100000 {
-- 
2.34.1


