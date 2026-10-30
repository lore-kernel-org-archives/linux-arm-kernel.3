Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE5CB606A323
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 15:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=V5+h8Bh+;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=YfJnGe81
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+6SsPHwJUHdg8UtSBRexcGvngpP8qAWNWX4nbxKwphY=; b=V5+h8Bh+t8IHfh
	Xf8lDVsEQ+smvsP3rv/K7dXRr10JtKeJNWvzj1IZihMpfEg6wztSU0wDGUtJPKmng0oRTUPcTwBK9
	LC4UynOpPUTVsXTToeM7jNKt/NEIA2XSmT8qVz4Iruy8reDJZksbaBktNM05CHkEQWXIN/WgPXgFu
	TcOT9RAmodwN9rKwG3/RsHBwPYvDXoU0F4xV7pUgtDkjiQQ7NLY+RnjNEdzDup9ZhO5ofThfOnPQj
	NYL3euulbhbiUT9MN/sWMFou7cEytNWZWR54GeAkA9b8Nc03XulBCgauOSdpNpr4vQ5atnsoTL6WC
	nu+D0d7oTpmbz6wA8R+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMp0E-0000000C3SI-1QNH;
	Fri, 30 Oct 2026 15:58:50 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMp07-0000000C3LL-1aDA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 15:58:44 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-48c45111bebso406951f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 08:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793375921; x=1793980721; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+6SsPHwJUHdg8UtSBRexcGvngpP8qAWNWX4nbxKwphY=;
        b=YfJnGe813XPGCEO0PhLbSKy+sRTf3fXXbrY/Hs4I5udKipU+AVW/k57IdR0i06pVGY
         r3mAM2ZBDxUFhdFBjCJtNjVzaHJ/idhmLw0Tnb1VPabPMH1Rwk2Uq3dbTIdcgBVLjKEu
         633mieBEGdPI8xLHLYxhTHjKyz4XBNomiMmtOf38uTJOws1SAQJP4kkbGkavV+qgFfrf
         7wzAlbxUY8v+sK7O7W0W94xrNpImY/qawaPT32Qp5VhOuwNQOg9DY12qkLl0IZVcemBy
         9DbQ140n7NsSPqKDqEmOHIFXlioedYzi31Nq6Ty+/hgI0bO28OPoyP9mbE8YxQvclMV6
         vTyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793375921; x=1793980721;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+6SsPHwJUHdg8UtSBRexcGvngpP8qAWNWX4nbxKwphY=;
        b=QA15YOR+JBLrIQ8LMLphH82ikADRtq9FaTN1ZGprUA/pPo+MsWMHrk14tHr+769oij
         8zPK72hItPul6E8f4UnqHoj4ypzJoyot2Hsl1XAa6VHqJdolKBufGZhKbZR1QQD/nWMC
         IO/psMzyS/nrMA/6/ZSiN40O+8KDmqiWlJwBP3fXvPcJHRTn/oo9YDglPvED+DRDI/Sl
         8HbJHI0W0kldotEOOqI5NjgU6GW0zMmExANMy3zVeIVGjavdKW0uYYol08GX2jsHGDSu
         9e/a2RseNiNpE9xNf5ZfLht2DOT8oFj6ZEq9kq2S95aPDrbg+cxl1ozFKvL/c61AgNZH
         zT+g==
X-Forwarded-Encrypted: i=1; AKwUvByCpDuGnl+I86jkpV/8c8sgpJAmSImKjgokaI18HmqP5qgSuipd/Fck0vHJn+mA+KeTU37fnsQj6gd+swtuJpw+@lists.infradead.org
X-Gm-Message-State: AFq9FYJewzzLbtEvYLfaPfL7Ll3ROeR0D3/lWBkWdd1tDtpSRPJuCFCv
	4+NXRPvK8LpZfIRsj9G9XqXHy1zy/diw4KxkxM5i6JIkUfRL+m+NffGUXdZzYtdZI+o=
X-Gm-Gg: AYBFou3xxiAlh8kINvUXsMPtSXc5eHyj2yDBHnr+4hUpSSfs21gKFGvrjfOqG8d0b0K
	1QrvuDABCs/+qmX4ExSwUWEQzO+6kb8EgxYrGdIvKPDD9F75k5MHkvoJKTC280PlNPjK+M1j+Zg
	Yef3U+I9xtvc/5aCTxPjZZpWgcEooDbYqSmmF0FDgWr50nsr9Pj3PRYRcnQKvl9JCkeyKxtbGhG
	q5Nriq6SrkAJgxJyAweCdmzxJvAtBJB8DJZ72O1CPyN2ySnJAC2rYhjTf1A/Grvq6aJLfruTJyx
	jgLRW1ZUshdqtobGfzrwL9ify73O5ru3gWKdLbV9eOMDEVldyRVeL3ZjOZkA6L4YA0I8CWdHPk5
	4BAsmwFB3My4/DAwrV9lIFSrZGbx0ekLNS3AQZsYEhY18b+nE2b8qFjuAFe0Z3+uhJpO0BHPX2J
	+74JkC1odzuAICab3XhBB3hO+c6jm0CCTOUaDfkHehW3DDAGg4rU8EY0sAI4VRnxWaT3h/OAQlL
	99uymeX4g6AErceVs+is+RYT95RZQlbKy0jd1x/asbxvPgZ9hePc801DPf8A7D8Pbk4kpOf3/dY
	g2dq6fARCgTsNrmP/Fxvw6HXU6Irj+wYDCJT6tY0XaYgWCxdY4U=
X-Received: by 2002:a05:6000:2211:b0:48e:62a9:1a65 with SMTP id ffacd0b85a97d-48e6e5161admr5584728f8f.49.1793375920865;
        Fri, 30 Oct 2026 08:58:40 -0700 (PDT)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b725b8sm3966174f8f.20.2026.10.30.08.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:58:40 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Fri, 30 Oct 2026 16:58:37 +0100
Subject: [PATCH 06/11] firmware: arm_scmi: report the pin-only and GPIO
 flags of functions
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261030-clegoffic-pinctrl-scmi-gpio-v1-6-52d92843ad97@baylibre.com>
References: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
In-Reply-To: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>, 
 Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_085843_445741_1C6E8DBD 
X-CRM114-Status: GOOD (  17.38  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Keep the pin-only and GPIO flags that PINCTRL_ATTRIBUTES returns for a
function, and add a function_flags_get operation to read them.

Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/firmware/arm_scmi/pinctrl.c | 43 ++++++++++++++++++++++++++++++++-----
 include/linux/scmi_protocol.h       |  6 +++++-
 2 files changed, 43 insertions(+), 6 deletions(-)

diff --git a/drivers/firmware/arm_scmi/pinctrl.c b/drivers/firmware/arm_scmi/pinctrl.c
index 69645ce73d9d..ba602242754c 100644
--- a/drivers/firmware/arm_scmi/pinctrl.c
+++ b/drivers/firmware/arm_scmi/pinctrl.c
@@ -27,6 +27,8 @@
 #define GET_FUNCTIONS_NR(x)	le32_get_bits((x), GENMASK(15, 0))
 
 #define EXT_NAME_FLAG(x)	le32_get_bits((x), BIT(31))
+#define GPIO_FUNC(x)		le32_get_bits((x), BIT(17))
+#define PIN_ONLY_FUNC(x)	le32_get_bits((x), BIT(16))
 #define NUM_ELEMS(x)		le32_get_bits((x), GENMASK(15, 0))
 
 #define REMAINING(x)		le32_get_bits((x), GENMASK(31, 16))
@@ -107,6 +109,8 @@ struct scmi_group_info {
 struct scmi_function_info {
 	char name[SCMI_MAX_STR_SIZE];
 	bool present;
+	bool pin_only;
+	bool gpio;
 	u32 *groups;
 	u32 nr_groups;
 };
@@ -188,8 +192,8 @@ static int scmi_pinctrl_validate_id(const struct scmi_protocol_handle *ph,
 
 static int scmi_pinctrl_attributes(const struct scmi_protocol_handle *ph,
 				   enum scmi_pinctrl_selector_type type,
-				   u32 selector, char *name,
-				   u32 *n_elems)
+				   u32 selector, char *name, u32 *n_elems,
+				   bool *pin_only, bool *gpio)
 {
 	int ret;
 	struct scmi_xfer *t;
@@ -219,6 +223,12 @@ static int scmi_pinctrl_attributes(const struct scmi_protocol_handle *ph,
 		if (n_elems)
 			*n_elems = NUM_ELEMS(rx->attributes);
 
+		if (pin_only)
+			*pin_only = PIN_ONLY_FUNC(rx->attributes);
+
+		if (gpio)
+			*gpio = GPIO_FUNC(rx->attributes);
+
 		strscpy(name, rx->name, SCMI_SHORT_NAME_MAX_SIZE);
 
 		ext_name_flag = !!EXT_NAME_FLAG(rx->attributes);
@@ -623,7 +633,7 @@ static int scmi_pinctrl_get_group_info(const struct scmi_protocol_handle *ph,
 		return 0;
 
 	ret = scmi_pinctrl_attributes(ph, GROUP_TYPE, selector, group->name,
-				      &group->nr_pins);
+				      &group->nr_pins, NULL, NULL);
 	if (ret)
 		return ret;
 
@@ -702,7 +712,8 @@ static int scmi_pinctrl_get_function_info(const struct scmi_protocol_handle *ph,
 		return 0;
 
 	ret = scmi_pinctrl_attributes(ph, FUNCTION_TYPE, selector, func->name,
-				      &func->nr_groups);
+				      &func->nr_groups, &func->pin_only,
+				      &func->gpio);
 	if (ret)
 		return ret;
 
@@ -765,6 +776,26 @@ scmi_pinctrl_function_groups_get(const struct scmi_protocol_handle *ph,
 	return 0;
 }
 
+static int
+scmi_pinctrl_function_flags_get(const struct scmi_protocol_handle *ph,
+				u32 selector, bool *pin_only, bool *gpio)
+{
+	struct scmi_pinctrl_info *pi = ph->get_priv(ph);
+	int ret;
+
+	if (!pin_only || !gpio)
+		return -EINVAL;
+
+	ret = scmi_pinctrl_get_function_info(ph, selector);
+	if (ret)
+		return ret;
+
+	*pin_only = pi->functions[selector].pin_only;
+	*gpio = pi->functions[selector].gpio;
+
+	return 0;
+}
+
 static int scmi_pinctrl_mux_set(const struct scmi_protocol_handle *ph,
 				u32 selector, u32 group)
 {
@@ -785,7 +816,8 @@ static int scmi_pinctrl_get_pin_info(const struct scmi_protocol_handle *ph,
 	if (pin->present)
 		return 0;
 
-	ret = scmi_pinctrl_attributes(ph, PIN_TYPE, selector, pin->name, NULL);
+	ret = scmi_pinctrl_attributes(ph, PIN_TYPE, selector, pin->name, NULL,
+				      NULL, NULL);
 	if (ret)
 		return ret;
 
@@ -833,6 +865,7 @@ static const struct scmi_pinctrl_proto_ops pinctrl_proto_ops = {
 	.name_get = scmi_pinctrl_name_get,
 	.group_pins_get = scmi_pinctrl_group_pins_get,
 	.function_groups_get = scmi_pinctrl_function_groups_get,
+	.function_flags_get = scmi_pinctrl_function_flags_get,
 	.mux_set = scmi_pinctrl_mux_set,
 	.settings_get_one = scmi_pinctrl_settings_get_one,
 	.settings_get_all = scmi_pinctrl_settings_get_all,
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 3f7cc35eb861..072190e89064 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -785,7 +785,9 @@ enum scmi_pinctrl_conf_type {
  * @name_get: returns name by index of given type
  * @group_pins_get: returns the set of pins, assigned to the specified group
  * @function_groups_get: returns the set of groups, assigned to the specified
- *	function
+ *	function, or the set of pins for a pin-only function
+ * @function_flags_get: tells whether the specified function is pin-only and
+ *	whether it is a GPIO function
  * @mux_set: set muxing function for groups of pins
  * @settings_get_one: returns one configuration parameter for pin or group
  *	specified by config_type
@@ -806,6 +808,8 @@ struct scmi_pinctrl_proto_ops {
 	int (*function_groups_get)(const struct scmi_protocol_handle *ph,
 				   u32 selector, unsigned int *nr_groups,
 				   const unsigned int **groups);
+	int (*function_flags_get)(const struct scmi_protocol_handle *ph,
+				  u32 selector, bool *pin_only, bool *gpio);
 	int (*mux_set)(const struct scmi_protocol_handle *ph, u32 selector,
 		       u32 group);
 	int (*settings_get_one)(const struct scmi_protocol_handle *ph,

-- 
2.56.0


