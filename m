Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3498FC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Jul 2025 19:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sk/Cvjmn3F+MvNcu5ECj0qva2OjAj6ueLb9Dbmgomqw=; b=FERzqilBCKbvWeYSG804Snt3M8
	ijjUdTYj+H4jm8Jlhq45oHx47BmHDrmsk3/GKAMaRwwU2HYlr1yZ3LPbIuSxqFL+bKTO7I4rwrtEY
	T8Cm8SzZUS24DZPRKVMJEFLP5kHzYh2PYEV13UcScV47oFP5q7Fb8nmZdqGXxwwvpQgqlPtr+wxlJ
	eaV+SmztE7Kf9pghRXn8YbOiC98mx80TPcrthnwhJRfgChpppRKEqOTC3tGvgal8jpVIhxBxsfxtd
	YK85t1n2khNFavi+JKcYKw8nWAykri3p0AEblSmbSzloCDCVK5rsSInMwpocFfbgMGxnJlVR3M2wm
	VgwmGWgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udZz0-0000000FfrM-2iZD;
	Sun, 20 Jul 2025 19:46:02 +0000
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udZry-0000000FfIG-3ma3
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Jul 2025 19:38:48 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-61594007beeso1242069eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Jul 2025 12:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753040326; x=1753645126; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Sk/Cvjmn3F+MvNcu5ECj0qva2OjAj6ueLb9Dbmgomqw=;
        b=LEcH5iXPaaqkdYBL3JeARnyk1s4ljwOqdoKYdd66qW59+C6LK5o38GzGhERZMiaTT0
         yHGaqEVLa/tL+9s/1PJoiftyHC3yPfw+pfWXm7Q5svu0t7d837+LfwLBpKl/90UH6tMO
         JDyA7TRG4jMeuOD6WH4+IjwN9g6c07/iUkElYNEHA+Vl7NPAqZT61qofZfdcZOxKy3Ri
         Re9Nt4K+M8LGlrd9b2ntrvzjpk1GRoPWc8zUsN9cfkIaitaTrhkQA7W57AnsKzuOdGiD
         euR/iAsI+rgSfTygpDFlRUTTAzipQSSJAzK2i85J+DySfOKN4l/UHldDWFNJQVLcAtOj
         VzRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753040326; x=1753645126;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sk/Cvjmn3F+MvNcu5ECj0qva2OjAj6ueLb9Dbmgomqw=;
        b=Nxl05LH9B9iwHI7A3c/ASyWbQJNBbcYFDsUGIT4ugdPcOTbZlilSehTxG3HD3RJYpV
         itlKb143K/wkyAxldMSrBi+EAODhJnfM8eNW36cHI1IqKVVN+0aHOWNes111qpS/gS0s
         9Q9on3h4gDWeSsC2vkPS9rIaA9ljVLQ5ptphdI5DSDIvfZ4Ig2QQev0OInF15e/XEjWB
         JMHii24sGewbQ24h/wd7f6T6jXiCdV4h5My14/lbtcoyLWYLXxpMDkK12+yacqQ9dJ/E
         lxFdt7YGIDvpSDN5do0e1Zr782jiUu80ubyIr5cO79AXCP5FQD34pnHEL5wFPQwvUf9x
         PkMA==
X-Forwarded-Encrypted: i=1; AJvYcCUsSIxY5pWyisN0B8S1K+acec79Q4neHe17LqyarzcotvZTqjJBV8SUkf5N8dO8yQGVDboBhll9knU1r4z55pbZ@lists.infradead.org
X-Gm-Message-State: AOJu0YxJMqZ0WhH3pgyAeZhG5vvYOHj2Ae0zk9B3Ru6SQS8K8EPU4iQW
	om8zT4Z53utljGNEd8rKK3Y5Einrl+yLUhEE1L2Ncbd+vugt7ENupK3J1osQWnnYz2c=
X-Gm-Gg: ASbGnctX2fj8mbp1k46vv8InRURD1TPna1PVfStWPKx6RASoVLtOI68eznr7+5vwex7
	MmxbikRmqerrRZQJV/BxIHjkYsmho/CaOQD0xXU0gIcs7InFhdUb29aJcXmCzUiT+z/GT1pJySl
	TNoWPfloZm4XBA/K+dEL0h+QL92S/ym+Ed2IDmQxfNKAxNJQ6jgEI0y+MIagHrQ4pQeQ/5PVsiw
	caG2I+nRBx6jonYXYBCkYQLMj3zT2HAu+vgnD1dvprmqtyHnFXAQdL9qV8KhujXNhIL7HF0XczE
	R4D6SbMApW3iW6XYCzy6Dd4jybh3ElpM6K5b22TEEGDy5UqsNiZZEEYTHsTZ2he0RHHN2NHZhzC
	MQWUwyky77I8JyNuKzM39Cw==
X-Google-Smtp-Source: AGHT+IHv3AJy6WvLlnGO2CccdtcgTjsbozHvajCI7dbyHtAdaolcMplcFhzuNXWcUN+G/rBrd/RjDA==
X-Received: by 2002:a05:6808:10d0:b0:406:2bb4:cd77 with SMTP id 5614622812f47-41d034f1585mr12534170b6e.5.1753040326039;
        Sun, 20 Jul 2025 12:38:46 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700::1fec])
        by smtp.gmail.com with UTF8SMTPSA id 5614622812f47-41fd498d8d4sm2027882b6e.24.2025.07.20.12.38.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 12:38:44 -0700 (PDT)
Date: Sun, 20 Jul 2025 14:38:42 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sudeep Holla <sudeep.holla@arm.com>,
	AKASHI Takahiro <takahiro.akashi@linaro.org>,
	Michal Simek <michal.simek@amd.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH RFC v2 2/7] firmware: arm_scmi: add is_gpio() function
Message-ID: <fbcf6cca-784e-47bb-9b61-3028f59a92ba@sabinyo.mountain>
References: <cover.1753039612.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1753039612.git.dan.carpenter@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_123846_940131_CE685A07 
X-CRM114-Status: GOOD (  17.62  )
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

Parse the GPIO response in scmi_pinctrl_attributes(), set the gpio
flag, and create an is_gpio() function pointer so that it can be queried.

In SCMI only functions and pins have a GPIO flag so that's why groups are
not handled here.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/firmware/arm_scmi/pinctrl.c | 34 +++++++++++++++++++++++++----
 include/linux/scmi_protocol.h       |  2 ++
 2 files changed, 32 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/arm_scmi/pinctrl.c b/drivers/firmware/arm_scmi/pinctrl.c
index d18c2d248f04..10c92007bc1b 100644
--- a/drivers/firmware/arm_scmi/pinctrl.c
+++ b/drivers/firmware/arm_scmi/pinctrl.c
@@ -28,6 +28,7 @@
 
 #define EXT_NAME_FLAG(x)	le32_get_bits((x), BIT(31))
 #define NUM_ELEMS(x)		le32_get_bits((x), GENMASK(15, 0))
+#define GPIO_FUNC(x)		le32_get_bits((x), BIT(17))
 
 #define REMAINING(x)		le32_get_bits((x), GENMASK(31, 16))
 #define RETURNED(x)		le32_get_bits((x), GENMASK(11, 0))
@@ -107,6 +108,7 @@ struct scmi_group_info {
 struct scmi_function_info {
 	char name[SCMI_MAX_STR_SIZE];
 	bool present;
+	bool gpio;
 	u32 *groups;
 	u32 nr_groups;
 };
@@ -114,6 +116,7 @@ struct scmi_function_info {
 struct scmi_pin_info {
 	char name[SCMI_MAX_STR_SIZE];
 	bool present;
+	bool gpio;
 };
 
 struct scmi_pinctrl_info {
@@ -189,7 +192,7 @@ static int scmi_pinctrl_validate_id(const struct scmi_protocol_handle *ph,
 
 static int scmi_pinctrl_attributes(const struct scmi_protocol_handle *ph,
 				   enum scmi_pinctrl_selector_type type,
-				   u32 selector, char *name,
+				   u32 selector, char *name, bool *gpio,
 				   u32 *n_elems)
 {
 	int ret;
@@ -217,6 +220,8 @@ static int scmi_pinctrl_attributes(const struct scmi_protocol_handle *ph,
 
 	ret = ph->xops->do_xfer(ph, t);
 	if (!ret) {
+		if (gpio)
+			*gpio = GPIO_FUNC(rx->attributes);
 		if (n_elems)
 			*n_elems = NUM_ELEMS(rx->attributes);
 
@@ -610,7 +615,7 @@ static int scmi_pinctrl_get_group_info(const struct scmi_protocol_handle *ph,
 		return 0;
 
 	ret = scmi_pinctrl_attributes(ph, GROUP_TYPE, selector, group->name,
-				      &group->nr_pins);
+				      NULL, &group->nr_pins);
 	if (ret)
 		return ret;
 
@@ -689,7 +694,7 @@ static int scmi_pinctrl_get_function_info(const struct scmi_protocol_handle *ph,
 		return 0;
 
 	ret = scmi_pinctrl_attributes(ph, FUNCTION_TYPE, selector, func->name,
-				      &func->nr_groups);
+				      &func->gpio, &func->nr_groups);
 	if (ret)
 		return ret;
 
@@ -772,7 +777,8 @@ static int scmi_pinctrl_get_pin_info(const struct scmi_protocol_handle *ph,
 	if (pin->present)
 		return 0;
 
-	ret = scmi_pinctrl_attributes(ph, PIN_TYPE, selector, pin->name, NULL);
+	ret = scmi_pinctrl_attributes(ph, PIN_TYPE, selector, pin->name,
+				      &pin->gpio, NULL);
 	if (ret)
 		return ret;
 
@@ -815,9 +821,29 @@ static int scmi_pinctrl_name_get(const struct scmi_protocol_handle *ph,
 	}
 }
 
+static int scmi_pinctrl_is_gpio(const struct scmi_protocol_handle *ph,
+				u32 selector,
+				enum scmi_pinctrl_selector_type type)
+{
+	struct scmi_pinctrl_info *pi = ph->get_priv(ph);
+	int ret;
+
+	ret = scmi_pinctrl_get_pin_info(ph, selector);
+	if (ret)
+		return ret;
+
+	if (type == PIN_TYPE)
+		return pi->pins[selector].gpio;
+	if (type == FUNCTION_TYPE)
+		return pi->functions[selector].gpio;
+
+	return -EINVAL;
+}
+
 static const struct scmi_pinctrl_proto_ops pinctrl_proto_ops = {
 	.count_get = scmi_pinctrl_count_get,
 	.name_get = scmi_pinctrl_name_get,
+	.is_gpio = scmi_pinctrl_is_gpio,
 	.group_pins_get = scmi_pinctrl_group_pins_get,
 	.function_groups_get = scmi_pinctrl_function_groups_get,
 	.mux_set = scmi_pinctrl_mux_set,
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 688466a0e816..b4ad32067fc4 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -792,6 +792,8 @@ struct scmi_pinctrl_proto_ops {
 	int (*name_get)(const struct scmi_protocol_handle *ph, u32 selector,
 			enum scmi_pinctrl_selector_type type,
 			const char **name);
+	int (*is_gpio)(const struct scmi_protocol_handle *ph, u32 selector,
+		       enum scmi_pinctrl_selector_type type);
 	int (*group_pins_get)(const struct scmi_protocol_handle *ph,
 			      u32 selector, const unsigned int **pins,
 			      unsigned int *nr_pins);
-- 
2.47.2


