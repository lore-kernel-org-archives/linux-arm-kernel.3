Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2DA60A2636
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 15:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BWwgY1mK;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=bZ/xJA5x
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=sdGs2n+FjnN9kQRvhMCKfS4IaxNbiNIQ2+gny9XTHQg=; b=BWwgY1mKUX28XH
	upWLma8tE7Wr1qezfuleMF3FIxrtwBWv3CxtlMHY5ZaxEHrsiT1HGxVttk+urEf9iOJgknizT7tR2
	C1GySX9gqgJK7fsnRUFlJ88LfWyLOgnninnLFaSO9vJNzvL9NmsiT2AhF9qphULIdn3oFieNFEW3C
	xQbJhlb8v0LRHJkhBhbFjb+QIj9C+5JoNILbwWR4PTzCzSz5lrn0+K2ow5Q6+ic9gUt0BwkvFNhVH
	pjPO83fGcFB4E0vkHw7BSQbtVxSsgJgd5CP/TE0XLTEPEi3SPl+rpU1zTeHml9UpY+RvS2gTK1E0y
	wBEdKo1F8Y+LSMGbf9Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMp0D-0000000C3RD-47ru;
	Fri, 30 Oct 2026 15:58:49 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMp05-0000000C3Kj-2Z6a
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 15:58:42 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-48e09aa5264so447663f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 08:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793375919; x=1793980719; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sdGs2n+FjnN9kQRvhMCKfS4IaxNbiNIQ2+gny9XTHQg=;
        b=bZ/xJA5xPTCJdIdxeQQl+9Gf/LMST9czwYydpJ/mvklqLOt2DyUCW/jOWuaO1loNYz
         gZMcZJRm3eDaUCMGVKEY1NTp2EN5ybiTQjRKm5t7ZEVeLdBLXr2D50aGWO3Wn1/WhmrJ
         ckvraZyEEDOJjYO8MYWX1yN6ih5BC2c+/lbTVsxY2gty1RUUyXuvZfGRikVgcXQopW2l
         4uvH9qkXMd4z/si/pGdG07vsA37Tx8ePLYLub2krKA1PTtP13Yc+fmw+aZ8TtNeqwOdA
         NbY+rb/GJGYAYeZsCCB4wZs2q1tQ+ZBGhbeX1XblHrUN958naOikzC+tPOc/OAlwUnaZ
         0cwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793375919; x=1793980719;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sdGs2n+FjnN9kQRvhMCKfS4IaxNbiNIQ2+gny9XTHQg=;
        b=OAFkjrekR4CSg4l2oNT8hOiBb5RZVyBYIEldzXb0EVMHYXjHXJ65NrPK/aFwgi48Ng
         7YTqvFuGNxiUQKFfodUZ9lDpVrHBWbFGMMWj7ttD7Ru/TepF+ysHvd3uBCTnbwjbxPDW
         S3on0iRevqL/KTD/Hb9iGIZWPrS0AMKaAxmA9mJcs3FqTrJjUkP1yL4xNJvloSe0F09/
         jgknLFaEJnjQEFXDolJM2Epov//NzqFoeUnu5TIh/vWicpskTEOeYmgwkGwf8OeLuQP1
         7GXGPYCIsaPf/2CxhwPu/MknscvM0uzzduwv2QgavAex0740ki+0rn1lcdat1Eo/1lVR
         Tieg==
X-Forwarded-Encrypted: i=1; AKwUvByr571V1FLJw8Ps/fmUJYt8oBRyFZQYHyShpptioa2DidLhaSegUmZEBi/O1P+y9ygmweEPYOuVvOFUqJbJ1vGO@lists.infradead.org
X-Gm-Message-State: AFq9FYLRYB7pWpy+051yCbBrjYufGmeEVrDHnRlrhOXGuz3sNPHK36FP
	EQ7uZuNJphgtlFMxbzbt+p/ESyw62tCuF6DaXx7gX0gf2Z4vSW3E7/7I3IV4WGJbtRk=
X-Gm-Gg: AYBFou1SSRkNenPlsy5yqT0tRcAjPw/W0cMYZRyJn9GRCEldAsFS/bpk4781raEuwKU
	PSt+v8Uxu11twE4zKtD/yD2yzgx22OzHq6Htld1rxvzvcVnbCWB4MdxVF9bAYZxEGbv6gxr2vAO
	XD2ME7eYsEYNb4t4PpZfSt3gHZAeir0+lpGBmH4SgCRUALZsIBBvEw2hTgCHDKinDHjmXP4tSp5
	QZDKrJ0OX+sqhcu1eo/PumWVY3ZJhrY71PDqZ3uHKu+z/wcviEHCoRxt8UEecZtk4VECq9R+iB5
	rSJSnw8AJK73O23UpzO/a3j/FDR8rcPfbWg3WTRYPdgHA6+nt9lYCdJCFxTN7bSCFEuTqYnIMYs
	aLoC2yUC+1HjRzj7mE32mQ8p8vTiysYQEI+yCbEAwfHjoryVdGU9NKaSnQW39rP54rQbpbt0s07
	IUnKHXkRCUFBYH1edkSljEYGW+AgtmOhtVLiXOLua9f6e7tXBbZdDZesxexoLC8AurgNkHhgt8r
	kNTiyEZvEFsgEKG9NXJXYwyq87ylrdP5raXHU14PqerDUW0Yl4fU9jRpFy/ky4Bxmif5NUCBClu
	Nqu5cRXy5au89kJV1aqEVrcvxSiSStWZvpCY0yB52Jn9pwAzRDY=
X-Received: by 2002:a05:6000:250a:b0:48a:f073:336b with SMTP id ffacd0b85a97d-48e6e2fcd88mr6043986f8f.23.1793375919216;
        Fri, 30 Oct 2026 08:58:39 -0700 (PDT)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b789ecsm3862691f8f.29.2026.10.30.08.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:58:38 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Fri, 30 Oct 2026 16:58:35 +0100
Subject: [PATCH 04/11] pinctrl: scmi: report an off setting as not set
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261030-clegoffic-pinctrl-scmi-gpio-v1-4-52d92843ad97@baylibre.com>
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
X-CRM114-CacheID: sfid-20261030_085841_666341_555C9F2E 
X-CRM114-Status: GOOD (  11.99  )
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

A get of a setting that is on or off, the flags and the pulls, returned
0 as a value, so every one of them showed as set on every pin. Return
-EINVAL when the platform answers 0, which is how pinconf reports a
setting that is not active.

Fixes: eb524cb651b7 ("pinctrl: Implementation of the generic scmi-pinctrl driver")
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 48 ++++++++++++++++++++++++++++++++++++------
 1 file changed, 41 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index f74ef0952ba9..355ad26cb215 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -153,13 +153,41 @@ static int pinctrl_scmi_map_pinconf_type(enum pin_config_param param,
 	return 0;
 }
 
-static u32 pinctrl_scmi_map_pinconf_arg_get(enum pin_config_param param,
-					    u32 value)
+static bool pinctrl_scmi_pinconf_inactive_flag(enum pin_config_param param,
+					       u32 value)
 {
-	if (param == PIN_CONFIG_DRIVE_STRENGTH)
-		return value / MILLI;
+	if (value)
+		return false;
 
-	return value;
+	switch (param) {
+	case PIN_CONFIG_BIAS_BUS_HOLD:
+	case PIN_CONFIG_BIAS_DISABLE:
+	case PIN_CONFIG_BIAS_HIGH_IMPEDANCE:
+	case PIN_CONFIG_BIAS_PULL_DOWN:
+	case PIN_CONFIG_BIAS_PULL_PIN_DEFAULT:
+	case PIN_CONFIG_BIAS_PULL_UP:
+	case PIN_CONFIG_DRIVE_OPEN_DRAIN:
+	case PIN_CONFIG_DRIVE_OPEN_SOURCE:
+	case PIN_CONFIG_DRIVE_PUSH_PULL:
+	case PIN_CONFIG_INPUT_ENABLE:
+	case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
+	case PIN_CONFIG_OUTPUT_ENABLE:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static int pinctrl_scmi_map_pinconf_arg_get(enum pin_config_param param,
+					    u32 *value)
+{
+	if (pinctrl_scmi_pinconf_inactive_flag(param, *value))
+		return -EINVAL;
+
+	if (param == PIN_CONFIG_DRIVE_STRENGTH)
+		*value /= MILLI;
+
+	return 0;
 }
 
 static int pinctrl_scmi_map_pinconf_type_get(enum pin_config_param param,
@@ -232,7 +260,10 @@ static int pinctrl_scmi_pinconf_get(struct pinctrl_dev *pctldev,
 	if (ret)
 		return ret;
 
-	config_value = pinctrl_scmi_map_pinconf_arg_get(config_type, config_value);
+	ret = pinctrl_scmi_map_pinconf_arg_get(config_type, &config_value);
+	if (ret)
+		return ret;
+
 	*config = pinconf_to_config_packed(config_type, config_value);
 
 	return 0;
@@ -390,7 +421,10 @@ static int pinctrl_scmi_pinconf_group_get(struct pinctrl_dev *pctldev,
 	if (ret)
 		return ret;
 
-	config_value = pinctrl_scmi_map_pinconf_arg_get(config_type, config_value);
+	ret = pinctrl_scmi_map_pinconf_arg_get(config_type, &config_value);
+	if (ret)
+		return ret;
+
 	*config = pinconf_to_config_packed(config_type, config_value);
 
 	return 0;

-- 
2.56.0


