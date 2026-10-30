Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F61606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 16:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rpKvJTIZ;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=l3I1rbF3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=TbaN4D4zPrCE0j2WU/cjpZg5LgYUpD3eA+3kZLrtZK0=; b=rpKvJTIZQflEBv
	FHIST8PtpKca6EihoUEAAj0bJnTDUYhis+g/NPVIGV3P11AAtozWpJ0vxEiLYq7wdCR91oSf50ajE
	iwZGLgKQ5IHIptiG3RK4nWG3nWH5y67ViRt5tiu08nJFr7NQXjoiUm49lcuLcwuc/weSCSKmoa08B
	i4He0UflGw9tOR0vQipiHx40G8I9mJC1u8o7CiMUbh1OoEjxYzKQsnL5tIjEVGCtb8IXCUChXto9X
	4EHfQ9tR7eXvUi52NAZweLU24gHD1yO5gub2XTIOlFwi/TKTr5xiTqBlN+ExHzfzQoKmY3jlnRecC
	mzaBrKf7C2S/PPJlUUEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMp0D-0000000C3QS-2yFk;
	Fri, 30 Oct 2026 15:58:49 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMp04-0000000C3KH-3OeL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 15:58:42 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so8852925e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 08:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793375918; x=1793980718; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TbaN4D4zPrCE0j2WU/cjpZg5LgYUpD3eA+3kZLrtZK0=;
        b=l3I1rbF36jbcKOcWVuwCvCWL2gl8XAmXP3ntvfcdL8xTxWkzWMGr/jdPXrqTYVYr82
         OmolDcLGjO2vuhMiSsalBnM2AkIXGepB29f/VOgnrw/IBEPEFe/WXLlU420ST1HzNtjA
         kZf6a6VUJoeBJjvoShmLuJicwOsyX8VgTourjDb0ajWQYiTtRtkMJ/vc9aRwy7iOw834
         f0JwgSMcEjbpQW/Aa5vD/D8XAJqQfhz1jOyIy4ZUMIUzIUiH0UHP6mGPnwaH55GbDQa/
         hvqabQc+i8Md+rA23W/w5kNVnx+o7+nMz27unW1muJdHUqoE3Bd5ds71xpmPnpH9I4ld
         nrDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793375918; x=1793980718;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TbaN4D4zPrCE0j2WU/cjpZg5LgYUpD3eA+3kZLrtZK0=;
        b=rQbY4EtATfu7QjjFDsoqYJwG3z2L9nrfnf3WOg6i4rEK1sW5TQU0QwRJ46XOL9h8b4
         FB153qZNUe6uV2GSss8McuT3ECSAfs5QW/hroSuNjmm5TxZfQwoUcruADuXE4f8CDkMR
         wBlsSZKtdQIdiDoifan+As7hKpV7wekojWVJrE+yHf4D904VynTNbbQmRvKnEqLD5Z+S
         cDwtqn7qCi+nDvXrq8eF7SWz6K2OZx70fAk6aFlANwD/znYd1QXI+KYnJHtV7zXanOHR
         h2fk4pdUaW3gwiKfRgxd2lvRaymfJpAeG4rMroD+zvpYCg0liytfjOfUtZUrt7cTbWi6
         23Mg==
X-Forwarded-Encrypted: i=1; AKwUvBw16q6leW0aITtCm9PCjXpfGR84LXi7iO/b4M/DrUUMgxhMHPkhpSZwz5OOyIuMlDTm+vjkD9ppUQV8sNInrbjG@lists.infradead.org
X-Gm-Message-State: AFq9FYIJ/4bDYCapiDL9Et86pW4gzrxKUW7HsbZyk1maZj6YAGNXWW9V
	xHtkWihvN5qBgFB9dj7D5Ee7syP9OBkXpI2EIIZM75twh5U/4m9C2Qqu2QLBoZmOfNo=
X-Gm-Gg: AYBFou28aoMq/wIl/QE2n1I74UZgIaXOG9gIOlggb9e6FsBigkqHcrK9c/BJr/vG9Ea
	KE/k+69222X3IukujwY0zcOq5ieKAyeAYs2Z2w3W+xagHNZaiaAGD6jceDGX1jtb8CaGebjejdj
	/pobgYQirB85QWsJuDSOUeH3fVjKBHetYrwHBw4IL0XweTv6NhcY3bFZZDvO7py/2EwzIyMHBvf
	672A7MiUViJA47xGnfbr1yr5rgpWi2w2b8/pAgWMvIogjzA2307uzjqMVoq3NjteT5fFkMrhZug
	1jA7h6Iurpy/Zka01dByTQq+jIs73tL22uGuMhFJ/CVqXvhMVS8KYMgp5zPX0P6VPLFjaPtD9+5
	gDKxRh+01QnEEkwZemslMeIo9XfrpjSy0TQoom22z1j4bfUUnm4QJ981Iz46v90zW6xEYDBKP/6
	9fY8EATb0m2n+gWHXn7uDR2jsVF9UiIWaOP9NIu6Q1TZmdUopj8Hy1E+gS+T7mPjbUC78d4rokd
	5dydX2gf3YBHq8C10IV7315R37Uj8/jet9eSRa7Km9CJmzBbb3SWMtG4/5YumYc0VcOBkSFf/fj
	cQiebIz6K3j6878/i+Kpiq2TpZFFr+51Hg6vEsDMXWMxTh5dzhU=
X-Received: by 2002:a05:600c:818e:b0:49f:fd40:80fa with SMTP id 5b1f17b1804b1-4ac1932aa2amr62355485e9.34.1793375918383;
        Fri, 30 Oct 2026 08:58:38 -0700 (PDT)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ac08b72578sm27102895e9.2.2026.10.30.08.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:58:38 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Fri, 30 Oct 2026 16:58:34 +0100
Subject: [PATCH 03/11] pinctrl: scmi: send the settings without argument as
 enabled
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261030-clegoffic-pinctrl-scmi-gpio-v1-3-52d92843ad97@baylibre.com>
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
X-CRM114-CacheID: sfid-20261030_085840_888149_2A4261C6 
X-CRM114-Status: UNSURE (   9.58  )
X-CRM114-Notice: Please train this message.
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

bias-bus-hold, bias-disable, bias-high-impedance, drive-open-drain,
drive-open-source and drive-push-pull take no argument in Linux, so
they were sent with the value 0, which the protocol reads as disabled.
Send 1.

Fixes: eb524cb651b7 ("pinctrl: Implementation of the generic scmi-pinctrl driver")
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index 5de47e060e8c..f74ef0952ba9 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -173,6 +173,21 @@ static int pinctrl_scmi_map_pinconf_type_get(enum pin_config_param param,
 	return pinctrl_scmi_map_pinconf_type(param, type);
 }
 
+static bool pinctrl_scmi_pinconf_arg_ignored(enum pin_config_param param)
+{
+	switch (param) {
+	case PIN_CONFIG_BIAS_BUS_HOLD:
+	case PIN_CONFIG_BIAS_DISABLE:
+	case PIN_CONFIG_BIAS_HIGH_IMPEDANCE:
+	case PIN_CONFIG_DRIVE_OPEN_DRAIN:
+	case PIN_CONFIG_DRIVE_OPEN_SOURCE:
+	case PIN_CONFIG_DRIVE_PUSH_PULL:
+		return true;
+	default:
+		return false;
+	}
+}
+
 static int pinctrl_scmi_map_pinconf_type_set(enum pin_config_param param,
 					     enum scmi_pinctrl_conf_type *type,
 					     u32 *arg)
@@ -182,6 +197,9 @@ static int pinctrl_scmi_map_pinconf_type_set(enum pin_config_param param,
 		return 0;
 	}
 
+	if (pinctrl_scmi_pinconf_arg_ignored(param))
+		*arg = 1;
+
 	if (param == PIN_CONFIG_DRIVE_STRENGTH)
 		*arg *= MILLI;
 

-- 
2.56.0


