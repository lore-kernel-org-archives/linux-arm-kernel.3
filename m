Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A3AC606A332
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 15:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1PaRLJbc;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=V1p42VG9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=G0RjRTX/jH5mtYZPXYcgJHL1PDTWZ4mnU4uted4PjiE=; b=1PaRLJbchytRFT
	f3Sj0RNe2oFKcYi2Ntbkbuz9FTJRERvrYIaysrGhNIrN5nFOVnMaihOcbERgMSrFAdIetPPSb/yNh
	YysosdueCdOdhGiZ7I80doPxhpKaCZw5IumnpFrHs+dKroenR7I4feuYTLaTsf/T42l62QQ9pBDrB
	BkWS9s9umxCCNOjqrSDehMYhRzka/1OoHlvCaGWv0PEgSr13OAd+d30TuR7bbFDANUNtkV6rH4jcj
	dMgAwgXNoq3AWK6BL2V8WYQ3DEDoZx/hzhv7WSFuDZKoL5yCIskpEoXHSx2yQvqVnBs+KNoiNXGS7
	ta7AB4sy+9wsNMdVDvIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMp0D-0000000C3Q8-2VX6;
	Fri, 30 Oct 2026 15:58:49 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMp03-0000000C3KE-0TcY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 15:58:41 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-49d05d51553so5370865e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 08:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793375917; x=1793980717; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G0RjRTX/jH5mtYZPXYcgJHL1PDTWZ4mnU4uted4PjiE=;
        b=V1p42VG9UHLOD4Tr0ff2BDiqxgmfY92zjmPbfocMQv0OET3iXzBRbA78yc6DuRHCSw
         896GKY3qu/ndA5FSTFc4UKcvV1MdDfzVq1YNrsNmhmhWVueBZU1H9Z4XbhVyGqAYCbXm
         TjihSyuSc6HpFXKG3B6f1PPINScC5/Ef9CueJGlq4GL1Fa2LUQCe5NIJ+OzVG8agOfPe
         P8WSpkeuHnEI2v820LaJ3Cu4iZJw0tKe66f+3R8L9/QVgqIySKXBfDbRGcS/AFcUco7S
         aFPdwDZYvGbRjs2xZ3pDDOwwwfVe25UpdsgxNh0MllVl1JdLPD4D/LvgUpQpxqLFzadp
         9vnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793375917; x=1793980717;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G0RjRTX/jH5mtYZPXYcgJHL1PDTWZ4mnU4uted4PjiE=;
        b=ud34CWEd3xKqHQzwcEgX8zPDr0hhIdLrQaA/929gjoVy6DEUjX8r+/16MHLuFGoBv7
         cV//VBDTBQkrHsd46capfjcpXi9ygyB5JI2Ho9H2fwwyjP8gV/7yvL9cpaFOPQwo1I/k
         EamSivgz90hUJ0nSrJpW218oilvLMlgxa2RSlpcXZGaIT801tRGhA2lycbdbsPElgyCH
         ILuK7jjDCeKQ7Ed7wWwtA5OCFIKR+el+1TbzOofXvgDwt18q6UUaleKe63fk/6xhWoLy
         8laxpoxYc7SoA+xvnG0mgkzpKdDlDPgcM82FRBJaTZ1fo5mjoCxWZKu+xa6BcvsZOx3w
         trXA==
X-Forwarded-Encrypted: i=1; AKwUvBzBENp21g6KXptuilhDF0Scov8wGBojt+NVJUgplkBICPxpXYJZUKEcaOwLAiwVsxl8QlzRc0Y7NV8rpNQwGicd@lists.infradead.org
X-Gm-Message-State: AFq9FYLiJz0wM/uWBscUfKkJbtQUe5HaPGjNbrQ7UCHqdyC0rKlQw8nu
	MzcpQ1HwQyhht4tgRPDQnlREHXhLNdDm1CvcWcAx+/XH7ZZJiLESLz0uWtRFi6WVtmM=
X-Gm-Gg: AYBFou02WJomT7uaIhXxrc2aigDqgcPKvNXZf5oSHajFkyneNa+dlNbbsIhKp/hKx64
	j/Ysz+ZHScvON16O/Tp41WkVcZV5NuWouflv7maXHudzBEF9YG3n9TxbMl7byFYVeAUjL55Q70W
	XLuZt7TCvPYusKWUyhUqeHF0Er4rKaG7MST/xzcTPj7t6Wj6H2Ay5r9a0Sc6p9uyViC0ulQddi2
	yZ7WB0/7VjDKIol8q9NYqxsPq+VUC52yktoev7OALXYkLESX27lh5JfkL/TgiJlsBGnk+E6Cngy
	Mme0X0xKG38DP5rgfMI1mGVHmeJkhT2GOdeVahBb4F8oYpv1Wu8h5nR1YsFak8tq8Q015v95Uok
	YD17v9rYSrVP+RpUIhKUOyoN63acYDmpNnLPnOhFLX9awD5cVSHtY3Y51OnU3WpV63xtOnqHidD
	7AOimoiM6qKpOQoTYXsz3ohuT8JOS3EJtxVikB10rHk0+K6eQsKb0Ypj34NQQjyCU/ECzKxBza8
	Cf55M0knRJn16ULvrNNueUj4+cG/6vwKgv2VEzMRYJM948SNCVXrESks/9gq7bww47AZpxJVwSL
	iY3RrqqkVkuxKGQssUnBHzQpHxBBT53qhO3lcfQTkqux2oaR8g4=
X-Received: by 2002:a05:600c:811a:b0:4a1:d10c:7170 with SMTP id 5b1f17b1804b1-4ac1889d884mr57318135e9.31.1793375916707;
        Fri, 30 Oct 2026 08:58:36 -0700 (PDT)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf5b286a0sm57000225e9.4.2026.10.30.08.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:58:36 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Fri, 30 Oct 2026 16:58:32 +0100
Subject: [PATCH 01/11] pinctrl: scmi: send the drive strength in
 microamperes
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261030-clegoffic-pinctrl-scmi-gpio-v1-1-52d92843ad97@baylibre.com>
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
X-CRM114-CacheID: sfid-20261030_085839_182622_769D49CF 
X-CRM114-Status: GOOD (  13.60  )
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

SCMI gives the drive strength in microamperes, but
PIN_CONFIG_DRIVE_STRENGTH is in milliamperes and was sent unchanged.
Convert it on set and on get. It is the only unit that differs: the
debounce is in microseconds and the pull resistances in ohms on both
sides, and every other value is a flag or implementation defined.

Fixes: eb524cb651b7 ("pinctrl: Implementation of the generic scmi-pinctrl driver")
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 29 +++++++++++++++++++++++------
 1 file changed, 23 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index c93d61dfa282..6bc94c68e89a 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -14,6 +14,7 @@
 #include <linux/scmi_protocol.h>
 #include <linux/slab.h>
 #include <linux/types.h>
+#include <linux/units.h>
 
 #include <linux/pinctrl/machine.h>
 #include <linux/pinctrl/pinconf.h>
@@ -155,6 +156,15 @@ static int pinctrl_scmi_map_pinconf_type(enum pin_config_param param,
 	return 0;
 }
 
+static u32 pinctrl_scmi_map_pinconf_arg_get(enum pin_config_param param,
+					    u32 value)
+{
+	if (param == PIN_CONFIG_DRIVE_STRENGTH)
+		return value / MILLI;
+
+	return value;
+}
+
 static int pinctrl_scmi_map_pinconf_type_get(enum pin_config_param param,
 					     enum scmi_pinctrl_conf_type *type)
 {
@@ -167,13 +177,17 @@ static int pinctrl_scmi_map_pinconf_type_get(enum pin_config_param param,
 }
 
 static int pinctrl_scmi_map_pinconf_type_set(enum pin_config_param param,
-					     enum scmi_pinctrl_conf_type *type)
+					     enum scmi_pinctrl_conf_type *type,
+					     u32 *arg)
 {
 	if (param == PIN_CONFIG_LEVEL) {
 		*type = SCMI_PIN_OUTPUT_VALUE;
 		return 0;
 	}
 
+	if (param == PIN_CONFIG_DRIVE_STRENGTH)
+		*arg *= MILLI;
+
 	return pinctrl_scmi_map_pinconf_type(param, type);
 }
 
@@ -203,6 +217,7 @@ static int pinctrl_scmi_pinconf_get(struct pinctrl_dev *pctldev,
 	if (ret)
 		return ret;
 
+	config_value = pinctrl_scmi_map_pinconf_arg_get(config_type, config_value);
 	*config = pinconf_to_config_packed(config_type, config_value);
 
 	return 0;
@@ -267,12 +282,13 @@ static int pinctrl_scmi_pinconf_set(struct pinctrl_dev *pctldev,
 		param = pinconf_to_config_param(configs[i]);
 		if (param == PIN_CONFIG_PERSIST_STATE)
 			continue;
-		ret = pinctrl_scmi_map_pinconf_type_set(param, &p_config_type[cnt]);
+		p_config_value[cnt] = pinconf_to_config_argument(configs[i]);
+		ret = pinctrl_scmi_map_pinconf_type_set(param, &p_config_type[cnt],
+							&p_config_value[cnt]);
 		if (ret) {
 			dev_err(pmx->dev, "Error map pinconf_type %d\n", ret);
 			goto free_config;
 		}
-		p_config_value[cnt] = pinconf_to_config_argument(configs[i]);
 		cnt++;
 	}
 
@@ -310,13 +326,13 @@ static int pinctrl_scmi_pinconf_group_set(struct pinctrl_dev *pctldev,
 
 	for (i = 0; i < num_configs; i++) {
 		param = pinconf_to_config_param(configs[i]);
-		ret = pinctrl_scmi_map_pinconf_type_set(param, &p_config_type[i]);
+		p_config_value[i] = pinconf_to_config_argument(configs[i]);
+		ret = pinctrl_scmi_map_pinconf_type_set(param, &p_config_type[i],
+							&p_config_value[i]);
 		if (ret) {
 			dev_err(pmx->dev, "Error map pinconf_type %d\n", ret);
 			goto free_config;
 		}
-
-		p_config_value[i] = pinconf_to_config_argument(configs[i]);
 	}
 
 	ret = pinctrl_ops->settings_conf(pmx->ph, group, GROUP_TYPE,
@@ -359,6 +375,7 @@ static int pinctrl_scmi_pinconf_group_get(struct pinctrl_dev *pctldev,
 	if (ret)
 		return ret;
 
+	config_value = pinctrl_scmi_map_pinconf_arg_get(config_type, config_value);
 	*config = pinconf_to_config_packed(config_type, config_value);
 
 	return 0;

-- 
2.56.0


