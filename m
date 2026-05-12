Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F33ACD484C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 03:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UJl/6Y6d4E6puh3y3cEykQ83pumRgeb1nEF73Wn9I74=; b=rQr40MGPOHTQjlwYgHdGeZNLCv
	lmfrXmXMMZtPUPkpvwqdtcxo7NucohbglnyvkUG08Jo7VZBxut1+a7gfUjRRCkeS8qVO2hkFj2TwN
	pPC7ZB+WwOyWW7nkSkhzgY1Wgg8vLUbgS1xayk5zflv0CLnDQs1aYzDovYQ6v7SoyzuxJG/pK4gRQ
	rEvCo7jOiyL540WpSjt7Q4bqojVNO/6X9nWK727B7s+qvZfkwYKmDOq0WRadeY8iMvzxdcz6VaAXS
	bwUxkbJaHfNLREmj+ofgzWtuhMGYc1PbPFi4r/JgQNmGQ2UySPpxveP9fxLIw0rZnQEDhxYeXYdzZ
	utf7I1Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMdt6-0000000FNBJ-0Nqj;
	Tue, 12 May 2026 03:34:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMdt2-0000000FN8h-1j0V;
	Tue, 12 May 2026 03:34:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=UJl/6Y6d4E6puh3y3cEykQ83pumRgeb1nEF73Wn9I74=; b=pBqUqULPzd86VazQvZrhBm+exF
	hStvotL977dr0QbNvV0+/eDcxpeSJtLxrtnWe44EF0uyF4h/8IdQJ/vrFq1iQk+TWqKIsd6lxt/v2
	og6YgJuNToHHLDabXK/EsgNDx9iqV9Jqx5rbpzdLsaaXQ8QTMjkiCGsCKWIYTwNDI5zUgxlOqHo9Z
	ozlcdz78QRlK5wtCEvfRDH+QCvUUpLrcxiDOGPgawfiMQiSQd7LtjWRFw5HEbgKgkUa9XkKBOsw1S
	TdNfL/TaVjSBTOdef+wmN7nJTDdHl/bdqkc9GFZ6Oal5c2t9kYM3c13oEb7FIGyWDLfTZlJOl23tN
	Pq9lNBbw==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMdsw-0000000DYbD-2BOO;
	Tue, 12 May 2026 03:34:23 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 64C3XIeR43571932, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1778556798; bh=UJl/6Y6d4E6puh3y3cEykQ83pumRgeb1nEF73Wn9I74=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=YCKBm32CPGop+DynySQ5CrtQTVwrpjxzjpPWAZ/hkBe1/hVH6Sh9pZh8cMwPkrsJN
	 u/STXO9gnMlc0Yb1pnN3qOvsebF6+9yJdLSxDt3033ULLKhXId20NdZG1A08Pc5zYf
	 lrchTqSasIbl5wmx/4sVGwJJy51tWFelV05ZVueRPMHM+k3JJXq9alU4RAin2m8O0G
	 4kBd7QqfNZDwUV25d0uvm+YnvNkQcFARS6uXhmtd6d9eyD37Ur5KhvBfKymbzOyhE6
	 EbcFn5gUa0alCbmrAJkADc8IDYAx7+yQFUqSZbMAkV7VZUyzP18+kd7Wp2/l8QPjko
	 wIe/n/1NtRNmg==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.27/5.94) with ESMTPS id 64C3XIeR43571932
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 12 May 2026 11:33:18 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 12 May 2026 11:33:19 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 12 May 2026 11:33:18 +0800
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
Subject: [PATCH v3 2/7] gpio: regmap: add gpio_regmap_get_gpiochip() accessor
Date: Tue, 12 May 2026 11:33:12 +0800
Message-ID: <20260512033317.1602537-3-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260512033317.1602537-1-eleanor.lin@realtek.com>
References: <20260512033317.1602537-1-eleanor.lin@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_043420_060764_67DB20B4 
X-CRM114-Status: UNSURE (   9.80  )
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

Expose an accessor function to retrieve the gpio_chip pointer from
a gpio_regmap instance.

This is needed by drivers that use gpio_regmap but also manage their
own irq_chip, where gpiochip_enable_irq()/gpiochip_disable_irq() must
be called with the gpio_chip pointer.

Add gpio_regmap_get_gpiochip() to allow drivers with complex custom IRQ
implementations.

Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
 drivers/gpio/gpio-regmap.c  | 6 ++++++
 include/linux/gpio/regmap.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
index 9ae4a41a2427..deb9eebb58de 100644
--- a/drivers/gpio/gpio-regmap.c
+++ b/drivers/gpio/gpio-regmap.c
@@ -230,6 +230,12 @@ void *gpio_regmap_get_drvdata(struct gpio_regmap *gpio)
 }
 EXPORT_SYMBOL_GPL(gpio_regmap_get_drvdata);
 
+struct gpio_chip *gpio_regmap_get_gpiochip(struct gpio_regmap *gpio)
+{
+	return &gpio->gpio_chip;
+}
+EXPORT_SYMBOL_GPL(gpio_regmap_get_gpiochip);
+
 /**
  * gpio_regmap_register() - Register a generic regmap GPIO controller
  * @config: configuration for gpio_regmap
diff --git a/include/linux/gpio/regmap.h b/include/linux/gpio/regmap.h
index 12d154732ca9..e4a95f805a81 100644
--- a/include/linux/gpio/regmap.h
+++ b/include/linux/gpio/regmap.h
@@ -113,5 +113,6 @@ void gpio_regmap_unregister(struct gpio_regmap *gpio);
 struct gpio_regmap *devm_gpio_regmap_register(struct device *dev,
 					      const struct gpio_regmap_config *config);
 void *gpio_regmap_get_drvdata(struct gpio_regmap *gpio);
+struct gpio_chip *gpio_regmap_get_gpiochip(struct gpio_regmap *gpio);
 
 #endif /* _LINUX_GPIO_REGMAP_H */
-- 
2.34.1


