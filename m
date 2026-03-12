Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89D11105A58A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 11:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tzX8YDmQgMk4YmUKgMYExLBoR9xk6S3Rj7doaXnGfoE=; b=HpruP18Ly3Ke9Tsf8H4lia/Grh
	GJdP9bjuKegUMh/qYCnmoKEhj7RslLqmY6o66RcFu3tIoNPbSPsdJ8YFPIqbaGb1K/OLzQZQs1PrW
	gblfdHd8AtAPiH47vO4OHL0ssk6gj7KAmlgGvCLRTF2DMocmRkESNp5jeO+mB4cz64MMcWZGCrrUo
	hN9t+/HfVw3tSds74Bg4T3kLQixzW4916w/cRWrzkUb5W8lwwXVmDAo1qAEhHs8n+EtRCaEuq4pd9
	27sxeC3NBEFu6RZ9CUPYaX4wdbSXIhyXwzR21Krnmf+j7+UNmublw9gXUO8ZOiMZf0hUe7bHtJWQF
	d3y5wl4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0eIH-0000000Dx9S-32E0;
	Thu, 12 Mar 2026 11:33:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0eIF-0000000Dx6l-2vKu;
	Thu, 12 Mar 2026 11:33:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=tzX8YDmQgMk4YmUKgMYExLBoR9xk6S3Rj7doaXnGfoE=; b=JCKz3MlkLZ/NGSfaOhkFcZchfA
	X0NukjlpJmzVTJ1dsQtOS/81YkXp6FEo25kGfdthmR1uC6ENrMU6nURbyS99lj+70B8eQM6ax6d36
	hYCiSBWhHKg884kJyM0b/246IyTpeqMmGqZ/1nys7vkyaWPs1kcXze9Oi756iFOQRO2j8ZuT65ssA
	Q3L/4XDoeOIDQqWwchBw2XDzB2y4AGN/Q7f4lq5jDYKFP3ShXFfVtGFQCCzQO8gf5pJcPngM0sjeX
	7aM32GjQf3VY8PHK24eDctKTW5wy5TJyGZ3xajr03lcPC/KQzDWM5b4iM6nZAyahwAYS0j4E1ICrm
	hWNjIP9Q==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0eI9-000000011UJ-3LuR;
	Thu, 12 Mar 2026 11:33:30 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 62CBUgb362456781, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1773315042; bh=tzX8YDmQgMk4YmUKgMYExLBoR9xk6S3Rj7doaXnGfoE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=an022eCtPSMYcJMXVsoorB8AEH99gKhkPpLZHXNKrKjB3O9O34lXMiCfkVLcrFjoe
	 PGrOI+dzgHiYcR+KexU3t/zJV/0kyb30hvnRsdTBTcD8QL2iD7hUEWxlnzAPh0Af8M
	 7tkJ6ArN+VfGNojRdYZF0Dh/sXbKfIQxVQaOLEMg2Rf4UiKUTCGlTdcWWQDnjOKiB0
	 ktF245Y+Z9JNb+VGRK6LVHwN+u3BQ68w6vFJ5/OHvd2xJ1jNxMGV+p4acGFOt86D53
	 H7gw+40DyJguH6UrH/In7tc4ROsID9qr7tQURxpkuRhxienzvswG9y9cygUz/hBgb8
	 YbP6yZwCq3+2Q==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 62CBUgb362456781
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Mar 2026 19:30:42 +0800
Received: from RTKEXHMBS01.realtek.com.tw (172.21.6.40) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 12 Mar 2026 19:30:42 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS01.realtek.com.tw (172.21.6.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 12 Mar 2026 19:30:42 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 12 Mar 2026 19:30:42 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <linusw@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <afaerber@suse.com>
CC: <bartosz.golaszewski@oss.qualcomm.com>, <james.tai@realtek.com>,
        <cy.huang@realtek.com>, <stanley_chang@realtek.com>,
        <eleanor.lin@realtek.com>, <tychang@realtek.com>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-realtek-soc@lists.infradead.org>
Subject: [PATCH v3 3/3] arm64: dts: realtek: Add pinctrl support for RTD1625
Date: Thu, 12 Mar 2026 19:30:40 +0800
Message-ID: <20260312113040.68189-8-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260312113040.68189-1-eleanor.lin@realtek.com>
References: <20260312113040.68189-1-eleanor.lin@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_113326_912845_6942FFE1 
X-CRM114-Status: UNSURE (   9.86  )
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
Changes in v3:
- None
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


