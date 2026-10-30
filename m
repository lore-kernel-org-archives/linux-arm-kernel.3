Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208FF606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 15:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=G0h4mC6w;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=XL2jQkK5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=j7BatgHj5ITP9IvPD8k1iBj2N7wXMOFQgCoh9MUEa7E=; b=G0h4mC6wQv2wzP
	0Anrsj5WB1d5fPTuaO5KQXRRIMCPWHkWTS5+6SaI6vDcxv+Nw8z5zNIwZXQqGoRhT+VC0WMBAk34Y
	2OYXiI8IBQ4ke1A0JiFB6GfKgeCoGiXj6QKStOaxrp+EursFU5yzwEWorrcpC/Yp+LJC31RgNhjOY
	kvamjBU1XAHUMEXEie/Q7rlfKhO4NNbUJyl5JNX2DymF2KoXLrRo+5qhwgM8d5JgR2baEQSnD5385
	CxU9iZIe+udIk6EOABqSWD9C0NF8k8BV4ne5nDIn5mAgkdNc8dcvhlXzUXhSRdNxWdc8RyYRaNauG
	4DQwSWVgnha6fM9Oqlug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMp0F-0000000C3WH-2Xr9;
	Fri, 30 Oct 2026 15:58:51 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMp0B-0000000C3O3-1cSq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 15:58:48 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so7112755e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 08:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793375925; x=1793980725; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j7BatgHj5ITP9IvPD8k1iBj2N7wXMOFQgCoh9MUEa7E=;
        b=XL2jQkK5SjMqbxyQOEZWGGvudMnfPoIdUbDWUUxNCv2IpgcoCAOHL1nvSQBSPZXEns
         Tb2NMWGBOBaTlm955kBAkoD3Zu9cmIECzedVMer9yiosFIBHQKx4ne5hv4VSEMdLZA0i
         31Pz0w47YpAgXObVVCRgOAL5hGMmQpkE80NuJyEFDnW/5FZIv1xTcsxTvg7TZ6midX0b
         oVUhJYAaJpbncWY3duvW2qHtHfkvJlnoqJ/PbehV+PSqTkMtKP5ARhMcO09kzjJnjj0x
         1GK6OXRPXbN8P2/daALoglE4LxMB92vfdhT/9X4v4eHxmxo1ZroH/PhyN2M688iHabsp
         oD8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793375925; x=1793980725;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j7BatgHj5ITP9IvPD8k1iBj2N7wXMOFQgCoh9MUEa7E=;
        b=KH96esIngmSbEcZZ5oJ7+NGcN9vjTNS51mTIoYZoocCk4HCWznljM8AA9gVGyIxz3/
         D/wT1tTpcSueDV0WnREG3WwOP6LIQSwMpQdMHnpPKmjTtWqxYUMH7WymAv73eQje+YIo
         iucP4pslb90dRGqFJxaPr/k1iHs9yw8hofoRisoascrdYyh2jGuah5Q8DjpmJYESB6Gb
         zXbYl9MX0mQHs3xe9LmBvCXrFG8FIpuIqBB4+szI7W1t+5dDKYpEkwOmaBTc23yMJAyv
         ItvNrRK46PhcSf/z/sUZn4QwwfM+5IEuikeWRD7mgAl9+84v3fPP6ivqc8kys6/HCXjI
         xkQg==
X-Forwarded-Encrypted: i=1; AKwUvBz8HKoMpm7iq4yPxH3fb+AG827BdKxZUvas70hI3Brpnc0ZiN3jqXJ/e932zAFWlEC1G5KlvQLaTXql0D242NkV@lists.infradead.org
X-Gm-Message-State: AFq9FYIu+I8CssF2ltcXzko5eusHFusgSnTA/LWia6fNwXwR/1cmw6O3
	tL17p23OkMnHYqOSFM+cAUO0VU/J9AQuBJsCAh7DmXNFtSGjwyAUYG6VhKM6/uvKw9I=
X-Gm-Gg: AYBFou2rl3JnqPwN8v3H0pzvXMiT9OIpgzhNyhayU23AUOXDlSKvSANIQAb8VrAYw06
	M6M0aWPRSTgdQpprKsSLdEzeQkNVCZOm+TN3hyWHQFmDcYhGVO3FCVTWxTe32wu3G7/87jaf2I9
	Aa5g6rAHj/1CS7fOBd8ykdzLm8CvQlecfgW5bGioOm3L7cUOtHIwXFrIATbHnQDvExgSMickuB1
	XkltFcz0OP1rZslLxGlKpJNtGvvYzhcWhzuNzA9vCnm8lDKMI4aox0RKNv9MeRxJn8jLCOLkL73
	nLl53PekWW3HVLPmVqMhRRKNdFQLPsxobnaznfrLDNr6OX+nvF8h2ZOqd9BbKaSqmzZzT6xhVnQ
	m6YYGafShBRqhDULUfSoZn82H5ic8c3xMsUhP8QDdieT1DYCdUx4jJlTxW02PHJEYrbMvhCLzpc
	TymTadgKQCTwdqeBfx6SDPLLxFD1Ze2PeQztjtihnRTje+Cd/KkkFLRUV0gLuINzrX/hdaZj7sh
	QlU+OzXW9wHY/AJZhUqq6BtN32pCCaERZlAsLrp9A+Ha6KFfNIxz0oMFvFf1yKL7R3ePpYylCCF
	FsljDM0iWXW0eQr3MJ2bKbQ8RwXBMxC8PJueSrbrMMpRMuVwWxYD
X-Received: by 2002:a05:600d:a:b0:4ac:aae6:6400 with SMTP id 5b1f17b1804b1-4acaae665a6mr33076135e9.13.1793375924966;
        Fri, 30 Oct 2026 08:58:44 -0700 (PDT)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa80f04785sm146942255e9.4.2026.10.30.08.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:58:44 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Fri, 30 Oct 2026 16:58:42 +0100
Subject: [PATCH 11/11] pinctrl: scmi: select the GPIO function on GPIO
 requests
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261030-clegoffic-pinctrl-scmi-gpio-v1-11-52d92843ad97@baylibre.com>
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
X-CRM114-CacheID: sfid-20261030_085847_446007_FA4FAA6D 
X-CRM114-Status: GOOD (  14.73  )
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

On a GPIO request, select the GPIO function of the pin, on the pin for a
pin-only function or on its single-pin group. Without a GPIO function the
mux is left as it is.

Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 64 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index 6f44e8c0fee6..ba649304638e 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -74,6 +74,69 @@ static int pinctrl_scmi_free(struct pinctrl_dev *pctldev, unsigned int offset)
 	return pinctrl_ops->pin_free(pmx->ph, offset);
 }
 
+static int pinctrl_scmi_gpio_mux_set(struct scmi_pinctrl *pmx, unsigned int pin)
+{
+	const unsigned int *elems, *pins;
+	unsigned int nr_elems, nr_pins, i;
+	bool pin_only, gpio;
+	int nr_functions, func, ret;
+
+	nr_functions = pinctrl_ops->count_get(pmx->ph, FUNCTION_TYPE);
+	for (func = 0; func < nr_functions; func++) {
+		ret = pinctrl_ops->function_flags_get(pmx->ph, func, &pin_only,
+						      &gpio);
+		if (ret)
+			return ret;
+
+		if (!gpio)
+			continue;
+
+		ret = pinctrl_ops->function_groups_get(pmx->ph, func, &nr_elems,
+						       &elems);
+		if (ret)
+			return ret;
+
+		for (i = 0; i < nr_elems; i++) {
+			if (pin_only) {
+				if (elems[i] != pin)
+					continue;
+
+				return pinctrl_ops->pin_mux_set(pmx->ph, func,
+								pin);
+			}
+
+			ret = pinctrl_ops->group_pins_get(pmx->ph, elems[i],
+							  &pins, &nr_pins);
+			if (ret)
+				return ret;
+
+			if (nr_pins == 1 && pins[0] == pin)
+				return pinctrl_ops->mux_set(pmx->ph, func,
+							    elems[i]);
+		}
+	}
+
+	return 0;
+}
+
+static int pinctrl_scmi_gpio_request_enable(struct pinctrl_dev *pctldev,
+					    struct pinctrl_gpio_range *range,
+					    unsigned int offset)
+{
+	struct scmi_pinctrl *pmx = pinctrl_dev_get_drvdata(pctldev);
+	int ret;
+
+	ret = pinctrl_ops->pin_request(pmx->ph, offset);
+	if (ret)
+		return ret;
+
+	ret = pinctrl_scmi_gpio_mux_set(pmx, offset);
+	if (ret)
+		pinctrl_ops->pin_free(pmx->ph, offset);
+
+	return ret;
+}
+
 static const struct pinmux_ops pinctrl_scmi_pinmux_ops = {
 	.request = pinctrl_scmi_request,
 	.free = pinctrl_scmi_free,
@@ -82,6 +145,7 @@ static const struct pinmux_ops pinctrl_scmi_pinmux_ops = {
 	.get_function_groups = pinmux_generic_get_function_groups,
 	.function_is_gpio = pinmux_generic_function_is_gpio,
 	.set_mux = pinctrl_scmi_func_set_mux,
+	.gpio_request_enable = pinctrl_scmi_gpio_request_enable,
 };
 
 static int pinctrl_scmi_map_pinconf_type(enum pin_config_param param,

-- 
2.56.0


