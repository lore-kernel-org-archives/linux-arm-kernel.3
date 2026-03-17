Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BDACFD8741
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 11:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nFbpNASZWi2cJEExfA+TcYi9nN3Uvlocl95mLBKk+hA=; b=OLHK4XgF3l4Vrhp51hQ6ciHJlT
	/mZ42ZwVYZRMbxf9eRM7CxWwfhqLo9tqQ2faN1px7XXpndVKxAu6CRZxNFG74MGBx5cXi8y94Xr4Q
	T7UosT6tM8V1w5T9juVjfjF2TV1BIUVFKBJjnl0t2apGCqeEbWIxp+81LQpvjveEYBsafxLngErOF
	iQKE3nobbsfep97WQW/PPoEB157hi8Ui+Hh0pheA/lIqEQYkwICuTHOIgbIAnMJYn7EeDV5yU/LM/
	VkdaT8c24OaKEd7bHFToS2YQU0PU3gE2cr6pDhWsqfkfVEs0RzhUUgAbbkrYssHPkpMQUSanYuEwx
	75wCp1yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2T2a-00000006F86-0dT1;
	Tue, 17 Mar 2026 11:56:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2T2Z-00000006F7M-24o7;
	Tue, 17 Mar 2026 11:56:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=nFbpNASZWi2cJEExfA+TcYi9nN3Uvlocl95mLBKk+hA=; b=CS78iPaG7EwzkCVPJhDCn/y+2Y
	ROap1a6Z3pdE0pM+DwRJcCfxlav8g0g7SvJVOgQLAZjGQP+/f0Ca3ujrPbqtljnSwdvkeV9zTVHfs
	IXG4vbDDQ2TX1HTxyCL9UZOCDGiKCivSOX7NB3YDGm2tNAkh2SSRjHn6Uwk1IrRkr/GF7jCP0kIUd
	OJdFkkcjpGJdRG/ySjG3lKYGqJjDS+XTB1ADlomnvxyXEit4om1ut/uVvQFWRnYv69izAMkI5UdrD
	3Qw9tAvxma/x73ll+gONrqb+0FLXqu50UwYWXvtjjVFSdyQTjNpbddzn9DdQbCiMj+KOc4EaUim17
	JYjoPDbQ==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2T2V-00000008ta6-2qbP;
	Tue, 17 Mar 2026 11:56:50 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 62HBsCV913851634, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1773748452; bh=nFbpNASZWi2cJEExfA+TcYi9nN3Uvlocl95mLBKk+hA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=HrMDzYsJYjirLrGZ1DayAJCma4gPjzxQVANDArkza2PzicpxwdrEC0AaIIrsn9M88
	 EUvceY+w3XnH4eRAnlYUiMyymPro+jT9Tx+mFfH206hqE9ePUE3v0U67zDd1IIg9ks
	 j+Jz/r4PuHUD/3AXqA0g43AqBVWmF5GBghjym9k1kJl6F/P5DP7rPdH3vfW06CzYib
	 83kmB4OKChnb/rCgLYWCS5xjWE+gsJUFu2SVQSNNbBDXK1IaA9qngVuj0h7kzQJFEn
	 hLw+JXLNf+bgoiAOR2gLZ6H+VBZV+8iVCY64eaAzVGchKRYVRCsyATYuBeN/56CBT+
	 8kshSjnHj8ysg==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 62HBsCV913851634
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Mar 2026 19:54:12 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 17 Mar 2026 19:54:13 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS05.realtek.com.tw
 (10.21.1.55) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 17 Mar 2026 19:54:13 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <linusw@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <afaerber@suse.com>
CC: <bartosz.golaszewski@oss.qualcomm.com>, <james.tai@realtek.com>,
        <cy.huang@realtek.com>, <stanley_chang@realtek.com>,
        <eleanor.lin@realtek.com>, <tychang@realtek.com>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-realtek-soc@lists.infradead.org>
Subject: [PATCH v4 8/8] arm64: dts: realtek: Add pinctrl support for RTD1625
Date: Tue, 17 Mar 2026 19:54:10 +0800
Message-ID: <20260317115411.2154365-9-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260317115411.2154365-1-eleanor.lin@realtek.com>
References: <20260317115411.2154365-1-eleanor.lin@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_115648_045843_80DFA122 
X-CRM114-Status: UNSURE (   8.79  )
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

Add the pinctrl nodes for the Realtek RTD1625 SoC.

Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
Changes in v4:
- None.
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


