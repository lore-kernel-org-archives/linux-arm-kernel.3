Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1730FCD37BE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 03:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oZBr9pwH4UXc5QEjRFphG+sAgmDAvI5SstkFwh3TAWA=; b=VSm9D8Pj7eCbSD7wxVzHYm5Iy/
	MKs+iweHeIMpXGdMjraNjPtrCSrXhHY8LQlCCqUGOWLyfreMgbuBla+mCbSzB9SZl9JOX4021Imof
	FuazvLwBUDAY58qOVLkaL/AuWBMusCO0WmoPr007xgiOyRZN825fgCIOeG6aJGKDvw1iGDbzB1R7Q
	kZtOEgyiC7L/OG5wJCvO45KIajLHz3rbRuY2pKGFKbrId+uVd+LEfIx3r1qvT7nZhM9lcwfbm1YTx
	+sdXqZk7in4Fb+5vLWqOBPXK1Yz7AVrIG2UVSF6PIjtR4VxQTsWC8AARoUrgesp8KEkQtmhbpeB55
	nAVH4aMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMdt6-0000000FNBc-16Ld;
	Tue, 12 May 2026 03:34:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMdt2-0000000FN8i-1yMF;
	Tue, 12 May 2026 03:34:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=oZBr9pwH4UXc5QEjRFphG+sAgmDAvI5SstkFwh3TAWA=; b=ctYuGMZKjYqAPpcpLp/y9MANBt
	6ZSV2OjFQciWhpkdv3LEwMVucJOGtoqjgLnj+m0oqZe7FXLLMh7Y6j+453lW236YFxeREO1/L1jc+
	g/8RFXFruvbFse9hnEJRGUJTMWbBpPrd4gnn8m9vGQZcVMHZtlC1oRE4rA210y/bxEDOH/FuYghrW
	8SB1g/pt9k227zJb5XrWLIGLQ3vNsnOlP8x2WUvMfwbdTZQupCTf0EDkHE6r/0OULbjjqxNFqEpo3
	v7YyZ28KxwcM09eHpIijl9ZMKGMVhiWt0rHrpYz+UYXLGoqDn07zAYXlb7NpdNv+9glTuPujXdfN5
	5tOCRrkg==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMdsw-0000000DYbC-2BpR;
	Tue, 12 May 2026 03:34:23 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 64C3XJJb83571936, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1778556799; bh=oZBr9pwH4UXc5QEjRFphG+sAgmDAvI5SstkFwh3TAWA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=Dm5NRpYyetZZsz5cBE+5AZv1AnkBs4Lqme8c9gx3Bd8UKMBVA1NCbdg5AkE0g5QUo
	 1RRchNc7CLTuD5PehZmeChRJRrS21rRV7AyGtnKVtcxq/mcOL1SyWuQfOsFFqrLLBc
	 NtACys14NHVhXiR0CqFveOmS4zr4ot9gbXmfz8be8Hn8Bxi9ixJMQtrLcbrQmgtJ6G
	 GTejugRSl2QhhtkDKWuAtJ2GlDKnWymgJGdKumqfIdr9MD3MRoEOWiY9Dn4JOLUdG4
	 NE4AFR09MPZZdPLMnUU1bCi7MlbzJW2IjNkczKY0vv6Cb8v3KhjRLTdWA3QtEuEAeW
	 JsJtxt0gpe/+g==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.27/5.94) with ESMTPS id 64C3XJJb83571936
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 12 May 2026 11:33:19 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 12 May 2026 11:33:19 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 12 May 2026 11:33:19 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS05.realtek.com.tw
 (10.21.1.55) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 12 May 2026 11:33:18 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <linusw@kernel.org>, <brgl@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <afaerber@suse.com>,
        <wbg@kernel.org>, <mathieu.dubois-briand@bootlin.com>,
        <mwalle@kernel.org>, <lars@metafoo.de>, <Michael.Hennerich@analog.com>,
        <jic23@kernel.org>, <nuno.sa@analog.com>, <andy@kernel.org>,
        <dlechner@baylibre.com>, <tychang@realtek.com>
CC: <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-realtek-soc@lists.infradead.org>, <linux-iio@vger.kernel.org>,
        <cy.huang@realtek.com>, <stanley_chang@realtek.com>,
        <eleanor.lin@realtek.com>, <james.tai@realtek.com>
Subject: [PATCH v3 4/7] gpio: regmap: Add set_config callback
Date: Tue, 12 May 2026 11:33:14 +0800
Message-ID: <20260512033317.1602537-5-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260512033317.1602537-1-eleanor.lin@realtek.com>
References: <20260512033317.1602537-1-eleanor.lin@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_043420_062206_C58F24C9 
X-CRM114-Status: GOOD (  11.84  )
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

Add a new set_config callback to struct gpio_regmap_config to allow drivers
to implement hardware-specific configuration such as debounce settings,
or other platform-specific GPIO properties.

Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
 drivers/gpio/gpio-regmap.c  | 2 ++
 include/linux/gpio/regmap.h | 7 +++++++
 2 files changed, 9 insertions(+)

diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
index c76eef20e412..490a35fe8768 100644
--- a/drivers/gpio/gpio-regmap.c
+++ b/drivers/gpio/gpio-regmap.c
@@ -371,6 +371,8 @@ struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config
 	if (!gpio->reg_mask_xlate)
 		gpio->reg_mask_xlate = gpio_regmap_simple_xlate;
 
+	chip->set_config = config->set_config;
+
 	ret = gpiochip_add_data(chip, gpio);
 	if (ret < 0)
 		goto err_free_bitmap;
diff --git a/include/linux/gpio/regmap.h b/include/linux/gpio/regmap.h
index 519fc81add8a..0660fd9be928 100644
--- a/include/linux/gpio/regmap.h
+++ b/include/linux/gpio/regmap.h
@@ -89,6 +89,9 @@ enum gpio_regmap_operation {
  *			domain will be set accordingly.
  * @regmap_irq_line:	(Optional) The IRQ the device uses to signal interrupts.
  * @regmap_irq_flags:	(Optional) The IRQF_ flags to use for the interrupt.
+ * @set_config:		(Optional) Callback for setting GPIO configuration such
+ *			as debounce, drive strength, or other hardware specific
+ *			settings.
  *
  * The ->reg_mask_xlate translates a given base address and GPIO offset to
  * register and mask pair. The base address is one of the given register
@@ -142,6 +145,10 @@ struct gpio_regmap_config {
 			       unsigned long *valid_mask,
 			       unsigned int ngpios);
 
+	int (*set_config)(struct gpio_chip *gc,
+			  unsigned int offset,
+			  unsigned long config);
+
 	void *drvdata;
 };
 
-- 
2.34.1


