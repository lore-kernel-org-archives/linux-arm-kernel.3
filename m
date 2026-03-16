Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A62DEF3029A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 03:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xcXakMyZjB9uC0+MhUHIE3osbDZlNY97IHps8eZkSnE=; b=ae4FCs4tzepwc2ZS7ICQ8OVnFU
	9r586WH8SDVp55p3lmX0gvZVoeIh/0PklDyTHL7c1QMM8Yw9PkE6kMXt/tCSsdq6hatnJ0yXwA1Fe
	+5YQvHmqasv/86Llm63QOwO9Eii3qq/ZCrOcESToRzpgig9RYKNzhVvDkpxi0zkliJAFAsTHl4ne3
	N8j+SVrVI20Ynn/v9J5q5mqfQuyOgbwVvu5xJZSxvucXGQwdfIjSHpli+cazZsWgrtZnOOe67wOfI
	vhr5oKQIYX3Drwx72j0/aXcDOgo632Ms/UTwYtSHPqRMLUsuhskn1c3BUoHllAgicprxpHgJ5KIru
	FkDsFKbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1yCX-00000003F3t-47un;
	Mon, 16 Mar 2026 03:01:06 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1yCS-00000003F1K-3E6S
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 03:01:01 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 16 Mar
 2026 11:00:47 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Mon, 16 Mar 2026 11:00:47 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Date: Mon, 16 Mar 2026 11:00:46 +0800
Subject: [PATCH v2 1/3] iio: adc: Add battery channel definition for ADC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260316-adc-v2-1-21475a217b09@aspeedtech.com>
References: <20260316-adc-v2-0-21475a217b09@aspeedtech.com>
In-Reply-To: <20260316-adc-v2-0-21475a217b09@aspeedtech.com>
To: Jonathan Cameron <jic23@kernel.org>, David Lechner
	<dlechner@baylibre.com>, =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Andy
 Shevchenko" <andy@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
	<andrew@codeconstruct.com.au>
CC: <linux-iio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<morris_mao@aspeedtech.com>, Billy Tsai <billy_tsai@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773630047; l=1666;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=GZwwwE7oVnurHeVr7/W1QtASLg5VwPGmo5eS0xkT1dQ=;
 b=IFn+eYF7YKhXYpsxr6TRY6l5rykGbuUz1/dNHl4P+K3JQJSNkaqETwX9Yq5iHieye0peTM/Ul
 5SxvX+48YPxBmSR+VLIzfEl3p4ZAH2bivMJAPZPshz6se9Z9JfuGhjy
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_200100_815168_CFAD624A 
X-CRM114-Status: UNSURE (   9.60  )
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

Defines a constant for the battery sensing channel, typically the last
channel of the ADC. Clarifies channel usage and improves code
readability.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 drivers/iio/adc/aspeed_adc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/aspeed_adc.c b/drivers/iio/adc/aspeed_adc.c
index 4be44c524b4d..af9a95d31d81 100644
--- a/drivers/iio/adc/aspeed_adc.c
+++ b/drivers/iio/adc/aspeed_adc.c
@@ -72,6 +72,8 @@
 #define ASPEED_ADC_BAT_SENSING_ENABLE		BIT(13)
 #define ASPEED_ADC_CTRL_CHANNEL			GENMASK(31, 16)
 #define ASPEED_ADC_CTRL_CHANNEL_ENABLE(ch)	FIELD_PREP(ASPEED_ADC_CTRL_CHANNEL, BIT(ch))
+/* Battery sensing is typically on the last channel */
+#define ASPEED_ADC_BATTERY_CHANNEL		7
 
 #define ASPEED_ADC_INIT_POLLING_TIME	500
 #define ASPEED_ADC_INIT_TIMEOUT		500000
@@ -285,7 +287,7 @@ static int aspeed_adc_read_raw(struct iio_dev *indio_dev,
 
 	switch (mask) {
 	case IIO_CHAN_INFO_RAW:
-		if (data->battery_sensing && chan->channel == 7) {
+		if (data->battery_sensing && chan->channel == ASPEED_ADC_BATTERY_CHANNEL) {
 			adc_engine_control_reg_val =
 				readl(data->base + ASPEED_REG_ENGINE_CONTROL);
 			writel(adc_engine_control_reg_val |
@@ -309,7 +311,7 @@ static int aspeed_adc_read_raw(struct iio_dev *indio_dev,
 		return IIO_VAL_INT;
 
 	case IIO_CHAN_INFO_OFFSET:
-		if (data->battery_sensing && chan->channel == 7)
+		if (data->battery_sensing && chan->channel == ASPEED_ADC_BATTERY_CHANNEL)
 			*val = (data->cv * data->battery_mode_gain.mult) /
 			       data->battery_mode_gain.div;
 		else

-- 
2.34.1


