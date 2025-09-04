Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EE55CA1015
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 06:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R51FL+FEjza6kviNeTzo1OTiMEBuQRcbHF0rg5NWkts=; b=m5l6sUZ1ut9AnhjEcw8yRA3rkF
	tCmgg7nY/rPZ/P/DxyET5ERrfO3Oyg4v5wygc0TkmcGnzadtarTfP7tn2Eadl+T0SWDCYTbeeN6c7
	8K58SYZjEO/GupHJLjk+9jZt5SyM0UuHxJAXEqZcRY6H1Ae09oCaH3zFwAP8DypOd6RsL4dF48VNS
	EiZwaTtHQ+k0LuqiCK/d+aEFGnN+lzeYKOjQuoeXWDFWIbWz295AVj0Qf5Xo0T1/VLGkn+tqlC+pr
	RwQhuZt6SQzfxifwsWdWVdcM4mFGFZxpgoLW2ftWDitOkkav/byt5XMjAyn0SWvnEQdzKVmyeRkV5
	IZoDQxZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu3H5-00000009T6t-1p4C;
	Thu, 04 Sep 2025 06:16:47 +0000
Received: from out-170.mta1.migadu.com ([2001:41d0:203:375::aa])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu3BU-00000009RB6-3BSM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 06:11:02 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grimler.se; s=key1;
	t=1756966258;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R51FL+FEjza6kviNeTzo1OTiMEBuQRcbHF0rg5NWkts=;
	b=ODaKcErZY8U2cqBwsLDIk/cJELBiBMwT++4RDEBZV6XOJIZiXGWCnLE/xtB4SpzvL2xSic
	lb7pPCV5VynncYjMEyxmXj3thooLnQqw/DnqUIsMpTcZBOwT3JejQTgCdsbvbMW6igImri
	f+INeYq0OPqnSyAO4fMSc0YvReX8hc0=
From: Henrik Grimler <henrik@grimler.se>
Date: Thu, 04 Sep 2025 08:10:10 +0200
Subject: [PATCH 1/2] ARM: dts: samsung: exynos5250: describe sromc bank
 memory map
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250904-smdk5250-sromc-v1-1-b360c6ab01c6@grimler.se>
References: <20250904-smdk5250-sromc-v1-0-b360c6ab01c6@grimler.se>
In-Reply-To: <20250904-smdk5250-sromc-v1-0-b360c6ab01c6@grimler.se>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Henrik Grimler <henrik@grimler.se>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1127; i=henrik@grimler.se;
 h=from:subject:message-id; bh=ir2qmCvH74cacCIrvhFK4guQLrEvJc9S7CzK+TAuWVM=;
 b=owEBbQGS/pANAwAKAbAHbkkLcWFrAcsmYgBouS1oPU0CfmJH0qrTFDm6qZbLUGFDT+iW+wg+g
 ZPamgW8O6iJATMEAAEKAB0WIQQsfymul4kfZBmp4s2wB25JC3FhawUCaLktaAAKCRCwB25JC3Fh
 a7+MB/97jIwRSIXU7ih35JuLJnurra1zl/xSt/DcDLWhSry6KIiTzRlQtJFWkJ43D8I196D9/uB
 mHO0fwpdQoiwUJsEY2RDTItoWmlbPg1GY/JVEISKc53ec67Iq4EUIY7eXZZBhUAo1J3MZhlTzV1
 JDkne6JcVhJRyqNDlX010Y35ydrHLNpxHpIwKODaRyiFQAe5yFjnQNsRXjzehOVM8rf5Fxrg9ZE
 EqG6mzuyTcRp0xkBKKNXNOrd5OdPF2yVLL0A0wHuF6+rD8ffkl/Jh283Mflcac7ALXmrVmNtRl7
 LwaJgZ9MyZPGDLZwo3thJuYPUErNz/c16ZQxlU+TDm1Uf9pP
X-Developer-Key: i=henrik@grimler.se; a=openpgp;
 fpr=2C7F29AE97891F6419A9E2CDB0076E490B71616B
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_231100_953902_B4EB26F3 
X-CRM114-Status: UNSURE (   8.96  )
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

According to public user manual for Exynos 5250 [1], the SROM
controller has 4 banks, at same addresses as for example Exynos
5410. Describe the bank memory map of the SoC.

[1] https://web.archive.org/web/20130921194458/http://www.samsung.com/global/business/semiconductor/file/product/Exynos_5_Dual_User_Manaul_Public_REV100-0.pdf

Signed-off-by: Henrik Grimler <henrik@grimler.se>
---
 arch/arm/boot/dts/samsung/exynos5250.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/samsung/exynos5250.dtsi b/arch/arm/boot/dts/samsung/exynos5250.dtsi
index b9e7c493881804647534b1d7395f6eb62a07fb92..741cc693f5d8f6b33772d7819c965c590571f305 100644
--- a/arch/arm/boot/dts/samsung/exynos5250.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos5250.dtsi
@@ -1214,6 +1214,15 @@ &serial_3 {
 	dma-names = "rx", "tx";
 };
 
+&sromc {
+	#address-cells = <2>;
+	#size-cells = <1>;
+	ranges = <0 0 0x04000000 0x20000
+		  1 0 0x05000000 0x20000
+		  2 0 0x06000000 0x20000
+		  3 0 0x07000000 0x20000>;
+};
+
 &sss {
 	clocks = <&clock CLK_SSS>;
 	clock-names = "secss";

-- 
2.51.0


