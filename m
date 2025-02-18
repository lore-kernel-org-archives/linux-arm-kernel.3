Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03CA8C021A9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 03:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qcI8nIfaXpTXXB2w65+9gPwAA9jaOdswF4r0vXF6+pw=; b=AZ30NcNkiVrJpco0ihnjpFyA3u
	QBey7tKV0fIeVOfRtvCiduBw8cHYnj8vd6Z9blsv8/kkAR/2GSkk1H4q9/bnhdP+7+P03//oI0o0/
	Dwc+9pBDVkkoVdVKetZ53SZYX0AfJg6qamGhszZQBkop9myB2rCF+luSKUnJAz5cw+Zv3YjbUVMY9
	Der7yBaH3qybiRpUCfZBd2OSnedp5W9RnOWjgBo+5Hfra3BdfpyNjvGkBxRmmD19lROAcG3PzTd7y
	yHhhNtqBptuLMldb/jlQjBpGKRvURX0ND/yMSqYV2g9n56S7lvqsHQighaf4mAFcUB2DK3fh4DEnt
	VmYPKJJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkEA3-00000006bhe-1uvo;
	Tue, 18 Feb 2025 03:20:39 +0000
Received: from out30-119.freemail.mail.aliyun.com ([115.124.30.119])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkE7Q-00000006bQ2-2ET9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 03:17:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1739848673; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=qcI8nIfaXpTXXB2w65+9gPwAA9jaOdswF4r0vXF6+pw=;
	b=i9CuaCzAaGuRlCrWPH4LveMk8s0UM+UGmr7862kUD++8mUSHih0G+Fz4aaTZF0ovxvTn69n8vm+OAJqbetIHwLCs5/WjBdvtctWabzan2Qlqsj6t1WSed+fmPSmXObFPY4rghlbQNOF9s91F1iKX3qFflxTwenZQKhhyVF8tZzE=
Received: from 03382176d5c3.tbsite.net(mailfrom:guoheyi@linux.alibaba.com fp:SMTPD_---0WPk8Nyz_1739848648 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 18 Feb 2025 11:17:49 +0800
From: Heyi Guo <guoheyi@linux.alibaba.com>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Cc: Heyi Guo <guoheyi@linux.alibaba.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH 2/2] ARM: dts: aspeed: aspeed-g6.dtsi: enable IRQ for watchdogs
Date: Tue, 18 Feb 2025 11:16:59 +0800
Message-ID: <20250218031709.103823-2-guoheyi@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250218031709.103823-1-guoheyi@linux.alibaba.com>
References: <20250218031709.103823-1-guoheyi@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_191756_744072_5CDC7E90 
X-CRM114-Status: UNSURE (   6.96  )
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

To finally enable watchdog pretimeout function.

Signed-off-by: Heyi Guo <guoheyi@linux.alibaba.com>

Cc: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Joel Stanley <joel@jms.id.au>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>
---
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
index 8ed715bd53aa..ef7ced285c44 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
@@ -538,23 +538,27 @@ uart5: serial@1e784000 {
 			wdt1: watchdog@1e785000 {
 				compatible = "aspeed,ast2600-wdt";
 				reg = <0x1e785000 0x40>;
+				interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
 			};
 
 			wdt2: watchdog@1e785040 {
 				compatible = "aspeed,ast2600-wdt";
 				reg = <0x1e785040 0x40>;
+				interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
 				status = "disabled";
 			};
 
 			wdt3: watchdog@1e785080 {
 				compatible = "aspeed,ast2600-wdt";
 				reg = <0x1e785080 0x40>;
+				interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
 				status = "disabled";
 			};
 
 			wdt4: watchdog@1e7850c0 {
 				compatible = "aspeed,ast2600-wdt";
 				reg = <0x1e7850C0 0x40>;
+				interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
 				status = "disabled";
 			};
 
-- 
2.43.0


