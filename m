Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97EC2C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 16:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vyQR7nMIaqJhvjojyZVdCfat6irNE82iu33KzL+Vh5k=; b=nkeBLMrBBBm2y5Db4zPwjNVH46
	RstFPk8qy43mSgjHo3Pyq9LDWVh4uoJ2BnUFIsZCv4+s5zsiYyJTLsJLTmUILQTJ3DyD6A++ckmYN
	SCSF/emrihVK8dz8BuxifRlkbZNDQjxOpuq2iW+qFR6GO+L3Jvoj4vpv3dqLiV5dBB9AZjcJL1ZLQ
	YvDb8JI5XAPp8FNtY4HAXsXC4p0YAa/U0VIZ4HClTDuE5VistM7PokPCWc1sdrRtWQ7PZFAwLdRT+
	GFFb584V0NG02enjVXEnLcs9WggWs6PCHJ+7Csz6laTSmi6Nyv/JU5CcpraR0GHv4gQfZ9uhumtpl
	rGN+lyGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZY45-00000009Mxs-2JWN;
	Wed, 09 Jul 2025 16:54:37 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZVx5-000000090f6-0DXE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 14:39:16 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-454b1d0a115so20174065e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Jul 2025 07:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752071954; x=1752676754; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vyQR7nMIaqJhvjojyZVdCfat6irNE82iu33KzL+Vh5k=;
        b=LbvslkiyqLvh0A2c6pigkrOGN8bqWQ9rUGBKrXiJFUMHwgQLVDKDu264vhIhMkqWGS
         A2zcXZnN9TxJG6bIlonDZGxbrh7PJPnBd+8amhRy35EU6l3b+AyYtYKC+31y8yDqbkeA
         tcxtNYqgjuBOm7uTH3GYyFRUhaYqDoRpqCdOKsKW9VPC6uCZpNAzp0evCZzDoCeSJkMK
         ohzYu0qooh/GdcHbwPec8jkRKaWS+rJMuOOVQ4GoAC2Lb/9A9cKjXZrrAILjfuF6odGg
         tyzrB9BKlqN4SrmG4f2xjB3mZWrigvK4/CwrExKbKwugWJ/FYAOvs21uhgWGMiUj2wsb
         Y3nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752071954; x=1752676754;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vyQR7nMIaqJhvjojyZVdCfat6irNE82iu33KzL+Vh5k=;
        b=r4SkRaoKSIckdwNP/ZxeYLj/K4eB9PjwkGEeZwX0wgDu9t8bp8Ae3MC0oVUxpNJ7DT
         a5JQToRF5G/MiepVJvK/LGrIN/KSSQLpGtkMEwL2lSdlmxNm2kHkMvwNV5bXEf7U4ivb
         Ihm6nMCFbV2Fci+hoVWXeiLCu0AV7i5ra5u2mMAo12dyO1Zlwl/ZovUH0n4G1vuOT3Yo
         8dUhmlTn76YYOVn8LhFU/rlXlKGj4AVg9px1fkXKPToH+9bTvdYBkS83tOWe81Q+v1g3
         k+Z2urdY0kE8TENg1BvAih0IUtA3lQQhg6gCAVcTqTEB8NkhmHjLW1OKbodRoa2I5F/N
         qFNw==
X-Forwarded-Encrypted: i=1; AJvYcCX9y6JxcjI6DqMZOulQNHeWp35Kouffsj5lk5yvKoOYedM0qyh8JCrmAFq/JsUagDsu5GGgTfIZE/GicjCuK/fL@lists.infradead.org
X-Gm-Message-State: AOJu0YxC4rCVjwlOow1pSGJfd5OIVl1VIoZPLkbUN2G1ODjz6gqwqy3p
	B78YD1ERfiENti9NN14ysnvnT7ul19O6jf3KMtVX0cE3I4WSe+xtGEqNfwNPBNP0I38=
X-Gm-Gg: ASbGncv3xmw3xDBXdUcajPGo5YWM+7FIqIQNg6/H4LOrbVb1i2gNMsyOE8W03WJP/Gb
	KvpCI3qam7ReEXpUW5DMVCzTNqJ3e+DL1YN/LUJ8OIUR821Z2Uh5SVQq1nxXarF5o6r+7cyTlmU
	MSxBnZFNfjQXAW4bNF9aXLJmxlRRZbPzalp0yYd2e+AkjwwnevuEKNpksjPCJHPQMpFYi0RNAEZ
	goXMjt7Uk11IonFQmD5Vmelu/tdmc3RqIsRjHh7f4UErWMrtaQVgpru+CgkA9vbKuUk5IE8lkV6
	ZVp1TwfClWJdLVcA5nd35N6cFU5cFcsKDu21HQlfF+gmTAv+siFsb7U=
X-Google-Smtp-Source: AGHT+IGsHwl5+rMjFVilVGS4uZ9wBps6vIXNpmci7apkTHJjRa6NtZeF0fWAhzC6zphVIGoh9yt5ag==
X-Received: by 2002:a05:600c:601:b0:43d:abd:ad1c with SMTP id 5b1f17b1804b1-454d558720fmr19496665e9.6.1752071953726;
        Wed, 09 Jul 2025 07:39:13 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:b04e:cfc4:3bd9:6180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5dfbf56c9sm4480687f8f.79.2025.07.09.07.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 07:39:13 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 09 Jul 2025 16:39:04 +0200
Subject: [PATCH v2 08/12] pinctrl: qcom: use generic pin function helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-pinctrl-gpio-pinfuncs-v2-8-b6135149c0d9@linaro.org>
References: <20250709-pinctrl-gpio-pinfuncs-v2-0-b6135149c0d9@linaro.org>
In-Reply-To: <20250709-pinctrl-gpio-pinfuncs-v2-0-b6135149c0d9@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Paul Cercueil <paul@crapouillou.net>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3084;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=X9Ki+5EzRPJP9Qn3Qvwbtr2ISnwV85fgPGCpNBHhMQ4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBobn8HFeMyI3D1Dqv2tlHQAY2Z38HnGvNZfdCo6
 FBcXb4w/zKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaG5/BwAKCRARpy6gFHHX
 cubfD/9US7MCY9XLoATZecFIFEpWPf0Uefyye79X1KjQbCS07kHwcGgfH29AFrNvz/x7bWA1zaQ
 j0tbicl/uEJT9H2rS9VI0wDfPs0Lp/jNv3kwL31mLZ5zrr3liqjA1SiWHdyvY3uJqL1WH75P2+T
 eGGET8T0GYpCbuS9ptjobR/lbIDAMAlpddosYHOTPxrv0jcwM8tQW0foOgj0biOm++Exqw04hE3
 lAxop7qj+e99fPMbaq2xxY+fPQDyhHDE+TLJk5rINgIzsoit0/fH2nQDW0ODRcdF34NLaGnJPjx
 KGwSupH2Mt4yw1yZnXBiAJOLOYMiuwwH1zIgy7393NLrdGEKE77UsiGEIe790H0qOryEeXPl5KV
 icLIoiQ5+fWHCwiLeEzdNycAmwN7WUCCKiQbt7rGm+XkhdzVYeFtM178q7tjRXqUTy/XeLHF86V
 gB5mDG0RP0tAc+2vIAsYPaZcNvMlbTtNx8Gs80NVJfnyFLZZUgkqEUXzMNCNnKDGUNxm7ThNvKr
 4CFo6uZG38y7BgdfFnuKMzQCjCQzXuaw7yT2vUolD6aZXlRTeZGwKmgp/AL8++3l7FXG0egh13Z
 TEZkDQdE/c0CUDcQgNfWaYCm2/c3uj45Zh/w+8K1Oimrzad/wNJH4iwwtyZ5/bek9McTHfuZW2U
 zL6jyCz1pu8lcNg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_073915_095968_4437E637 
X-CRM114-Status: GOOD (  15.32  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Use the existing infrastructure for storing and looking up pin functions
in pinctrl core. Remove hand-crafted callbacks.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 43 ++++++++++++--------------------------
 1 file changed, 13 insertions(+), 30 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index f713c80d7f3eda06de027cd539e8decd4412876a..965f0cceac56697bc4cdb851c8201db7508c042e 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -31,6 +31,7 @@
 #include "../core.h"
 #include "../pinconf.h"
 #include "../pinctrl-utils.h"
+#include "../pinmux.h"
 
 #include "pinctrl-msm.h"
 
@@ -150,33 +151,6 @@ static int msm_pinmux_request(struct pinctrl_dev *pctldev, unsigned offset)
 	return gpiochip_line_is_valid(chip, offset) ? 0 : -EINVAL;
 }
 
-static int msm_get_functions_count(struct pinctrl_dev *pctldev)
-{
-	struct msm_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
-
-	return pctrl->soc->nfunctions;
-}
-
-static const char *msm_get_function_name(struct pinctrl_dev *pctldev,
-					 unsigned function)
-{
-	struct msm_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
-
-	return pctrl->soc->functions[function].name;
-}
-
-static int msm_get_function_groups(struct pinctrl_dev *pctldev,
-				   unsigned function,
-				   const char * const **groups,
-				   unsigned * const num_groups)
-{
-	struct msm_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
-
-	*groups = pctrl->soc->functions[function].groups;
-	*num_groups = pctrl->soc->functions[function].ngroups;
-	return 0;
-}
-
 static int msm_pinmux_set_mux(struct pinctrl_dev *pctldev,
 			      unsigned function,
 			      unsigned group)
@@ -288,9 +262,9 @@ static int msm_pinmux_request_gpio(struct pinctrl_dev *pctldev,
 
 static const struct pinmux_ops msm_pinmux_ops = {
 	.request		= msm_pinmux_request,
-	.get_functions_count	= msm_get_functions_count,
-	.get_function_name	= msm_get_function_name,
-	.get_function_groups	= msm_get_function_groups,
+	.get_functions_count	= pinmux_generic_get_function_count,
+	.get_function_name	= pinmux_generic_get_function_name,
+	.get_function_groups	= pinmux_generic_get_function_groups,
 	.gpio_request_enable	= msm_pinmux_request_gpio,
 	.set_mux		= msm_pinmux_set_mux,
 };
@@ -1552,6 +1526,7 @@ EXPORT_SYMBOL(msm_pinctrl_dev_pm_ops);
 int msm_pinctrl_probe(struct platform_device *pdev,
 		      const struct msm_pinctrl_soc_data *soc_data)
 {
+	const struct pinfunction *func;
 	struct msm_pinctrl *pctrl;
 	struct resource *res;
 	int ret;
@@ -1606,6 +1581,14 @@ int msm_pinctrl_probe(struct platform_device *pdev,
 		return PTR_ERR(pctrl->pctrl);
 	}
 
+	for (i = 0; i < soc_data->nfunctions; i++) {
+		func = &soc_data->functions[i];
+
+		ret = pinmux_generic_add_pinfunction(pctrl->pctrl, func, NULL);
+		if (ret < 0)
+			return ret;
+	}
+
 	ret = msm_gpio_init(pctrl);
 	if (ret)
 		return ret;

-- 
2.48.1


