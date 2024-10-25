Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C081CD149EE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 20:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B62dRs4rmHHqh7GA2KSwK4wkGiK9CfddcCRoULiOGAw=; b=cHE/DJGnw54ls1hYZXIR9mQSJS
	EKWQhBM3UDCISAnFd4Mj2ZUEWvVvTIxyISnoxk8F6peP2uFtKPNZntqXvzORij/7Wd+1uJ2xuK5Il
	M0jeXa/PDR6/NIiwQauWaJSKcFPbudCD0NvmThwv6gNpAb52TIm4RekwWEc9rWsh5SmkdW21r4rZK
	j5QlX4HsGru22TDf+Mbc+HnTk5JpDXf2dGpxJ07qfI8C4foJLPP4PS65n3uGAbKjRKS+Q3eR4xZKt
	3BThEFtd+5aRPljh2rrJIWwNU1ExVatkYV/ZemViTg3SKPIUKJ6erX4+z/kH1FnHveiXrG+DCmN51
	ZGDSGRsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Qha-0000000555p-24jp;
	Fri, 25 Oct 2024 20:14:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4QHH-000000052Ko-2m3I;
	Fri, 25 Oct 2024 19:47:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=B62dRs4rmHHqh7GA2KSwK4wkGiK9CfddcCRoULiOGAw=; b=Oj0fK3bMEF/AU8EyQ1ZrG4Kpeu
	/M0K7mMWsxAjb+FWXdwf7Bwd2VnVahs6S5x36KfGmrKj1ksm27n2ZtRbXvOT15wHOx6C8Qi8IQXHB
	oGGN3l5V9snBobCszKdZEEiLjgiISTusnh8baK1K73xgyA7X2Yle2ELvVnEqDFtRhHU2dACJ48oAs
	0cpu/5cKbysfOuuPdSG1gEaceKsgwO4zQ4X52S9KZXycFNizI/XW+kYZv9unGqCS+ZtMvyCxn11HI
	HbY+mKP/cBt+TbTjjeDRrSNAT7qw7fp/QRwI7EhYH3z6z5JCkzkpd6G3ouMPGaqcF5szsDM1RPy6W
	5wkByi9w==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4QGH-000000093VN-2Bjm;
	Fri, 25 Oct 2024 19:47:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1729885572;
	bh=BZGfBFrKIINPs6yptzv0R7eWZsixtmBhUqvIulVpKls=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=eapTpgFUxbd9k0Inn2l/vN2uk/MCxVaLR6/GJHm9jOJaxnBcrj106zTy3wtIdIQ8l
	 qHvSwUdt8OiPrHodJ+xAKc7leYQiDMdkkuGnrZv2WJKMRacv9PrHn4w2wjiE/i76i1
	 G3sS+LjWkxYOxQpJoU9Qeb7H4MXvK8MADAeZ31fokX26fERTersesRiNWNjACC5yaE
	 0x5DVz2S1bf6sRCKNIE+vneHG+lm6GUOhow6EsQ84Ev0ZRpzwlLJta6YLRSVFW/Yo1
	 +Z7rqBWLMNBv8dDuzI74MgDiYvV1h4zFefYZTPyAn8JGMnnrX/+oZu2Z7M96oZnYCu
	 2BCdKH2/2+KDg==
Received: from [192.168.1.54] (pool-100-2-116-133.nycmny.fios.verizon.net [100.2.116.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 990F417E374E;
	Fri, 25 Oct 2024 21:46:10 +0200 (CEST)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Fri, 25 Oct 2024 15:45:37 -0400
Subject: [PATCH RFC v2 2/5] pinctrl: mediatek: moore: Expose more
 configurations to GPIO set_config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241025-kselftest-gpio-set-get-config-v2-2-040d748840bb@collabora.com>
References: <20241025-kselftest-gpio-set-get-config-v2-0-040d748840bb@collabora.com>
In-Reply-To: <20241025-kselftest-gpio-set-get-config-v2-0-040d748840bb@collabora.com>
To: Sean Wang <sean.wang@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bamvor Jian Zhang <bamv2005@gmail.com>, Shuah Khan <shuah@kernel.org>
Cc: kernel@collabora.com, linux-mediatek@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 kernelci@lists.linux.dev, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_204713_707276_BD9425DC 
X-CRM114-Status: GOOD (  17.39  )
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

Currently the set_config callback in the gpio_chip registered by the
pinctrl_moore driver only supports configuring a single parameter on
specific pins (the input debounce of the EINT controller, on pins that
support it), even though many other configurations are already
implemented and available through the pinctrl API for configuration of
pins by the Devicetree and other drivers.

Expose all configurations currently implemented through the GPIO API so
they can also be set from userspace, which is particularly useful to
allow testing them from userspace.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 drivers/pinctrl/mediatek/pinctrl-moore.c | 283 ++++++++++++++++---------------
 1 file changed, 144 insertions(+), 139 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-moore.c b/drivers/pinctrl/mediatek/pinctrl-moore.c
index aad4891223d3e060431a990bfabb6bd2cbb82087..de3494e9f228cef7f2eadf6a6ea2b3b708f1fb25 100644
--- a/drivers/pinctrl/mediatek/pinctrl-moore.c
+++ b/drivers/pinctrl/mediatek/pinctrl-moore.c
@@ -246,156 +246,160 @@ static int mtk_pinconf_get(struct pinctrl_dev *pctldev,
 	return 0;
 }
 
-static int mtk_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
-			   unsigned long *configs, unsigned int num_configs)
+static int mtk_moore_pin_config_set(struct mtk_pinctrl *hw, unsigned int pin,
+				    enum pin_config_param param, u32 arg)
 {
-	struct mtk_pinctrl *hw = pinctrl_dev_get_drvdata(pctldev);
 	const struct mtk_pin_desc *desc;
-	u32 reg, param, arg;
-	int cfg, err = 0;
+	u32 reg;
+	int err = 0;
 
 	desc = (const struct mtk_pin_desc *)&hw->soc->pins[pin];
 	if (!desc->name)
 		return -ENOTSUPP;
 
-	for (cfg = 0; cfg < num_configs; cfg++) {
-		param = pinconf_to_config_param(configs[cfg]);
-		arg = pinconf_to_config_argument(configs[cfg]);
-
-		switch (param) {
-		case PIN_CONFIG_BIAS_DISABLE:
-			if (hw->soc->bias_set_combo) {
-				err = hw->soc->bias_set_combo(hw, desc, 0, MTK_DISABLE);
-				if (err)
-					return err;
-			} else if (hw->soc->bias_disable_set) {
-				err = hw->soc->bias_disable_set(hw, desc);
-				if (err)
-					return err;
-			} else {
-				return -ENOTSUPP;
-			}
-			break;
-		case PIN_CONFIG_BIAS_PULL_UP:
-			if (hw->soc->bias_set_combo) {
-				err = hw->soc->bias_set_combo(hw, desc, 1, arg);
-				if (err)
-					return err;
-			} else if (hw->soc->bias_set) {
-				err = hw->soc->bias_set(hw, desc, 1);
-				if (err)
-					return err;
-			} else {
-				return -ENOTSUPP;
-			}
-			break;
-		case PIN_CONFIG_BIAS_PULL_DOWN:
-			if (hw->soc->bias_set_combo) {
-				err = hw->soc->bias_set_combo(hw, desc, 0, arg);
-				if (err)
-					return err;
-			} else if (hw->soc->bias_set) {
-				err = hw->soc->bias_set(hw, desc, 0);
-				if (err)
-					return err;
-			} else {
-				return -ENOTSUPP;
-			}
-			break;
-		case PIN_CONFIG_OUTPUT_ENABLE:
-			err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_SMT,
-					       MTK_DISABLE);
-			if (err)
-				goto err;
-
-			err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DIR,
-					       MTK_OUTPUT);
+	switch ((u32)param) {
+	case PIN_CONFIG_BIAS_DISABLE:
+		if (hw->soc->bias_set_combo) {
+			err = hw->soc->bias_set_combo(hw, desc, 0, MTK_DISABLE);
 			if (err)
-				goto err;
-			break;
-		case PIN_CONFIG_INPUT_ENABLE:
-
-			if (hw->soc->ies_present) {
-				mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_IES,
-						 MTK_ENABLE);
-			}
-
-			err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DIR,
-					       MTK_INPUT);
+				return err;
+		} else if (hw->soc->bias_disable_set) {
+			err = hw->soc->bias_disable_set(hw, desc);
 			if (err)
-				goto err;
-			break;
-		case PIN_CONFIG_SLEW_RATE:
-			err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_SR,
-					       arg);
+				return err;
+		} else {
+			return -ENOTSUPP;
+		}
+		break;
+	case PIN_CONFIG_BIAS_PULL_UP:
+		if (hw->soc->bias_set_combo) {
+			err = hw->soc->bias_set_combo(hw, desc, 1, arg);
 			if (err)
-				goto err;
-
-			break;
-		case PIN_CONFIG_OUTPUT:
-			err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DIR,
-					       MTK_OUTPUT);
+				return err;
+		} else if (hw->soc->bias_set) {
+			err = hw->soc->bias_set(hw, desc, 1);
 			if (err)
-				goto err;
-
-			err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DO,
-					       arg);
+				return err;
+		} else {
+			return -ENOTSUPP;
+		}
+		break;
+	case PIN_CONFIG_BIAS_PULL_DOWN:
+		if (hw->soc->bias_set_combo) {
+			err = hw->soc->bias_set_combo(hw, desc, 0, arg);
 			if (err)
-				goto err;
-			break;
-		case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
-			/* arg = 1: Input mode & SMT enable ;
-			 * arg = 0: Output mode & SMT disable
-			 */
-			arg = arg ? 2 : 1;
-			err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DIR,
-					       arg & 1);
+				return err;
+		} else if (hw->soc->bias_set) {
+			err = hw->soc->bias_set(hw, desc, 0);
 			if (err)
-				goto err;
+				return err;
+		} else {
+			return -ENOTSUPP;
+		}
+		break;
+	case PIN_CONFIG_OUTPUT_ENABLE:
+		err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_SMT, MTK_DISABLE);
+		if (err)
+			return err;
+
+		err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DIR, MTK_OUTPUT);
+		if (err)
+			return err;
+		break;
+	case PIN_CONFIG_INPUT_ENABLE:
+
+		if (hw->soc->ies_present) {
+			mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_IES, MTK_ENABLE);
+		}
+
+		err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DIR, MTK_INPUT);
+		if (err)
+			return err;
+		break;
+	case PIN_CONFIG_SLEW_RATE:
+		err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_SR, arg);
+		if (err)
+			return err;
+
+		break;
+	case PIN_CONFIG_OUTPUT:
+		err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DIR, MTK_OUTPUT);
+		if (err)
+			return err;
+
+		err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DO, arg);
+		if (err)
+			return err;
+		break;
+	case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
+		/* arg = 1: Input mode & SMT enable ;
+		 * arg = 0: Output mode & SMT disable
+		 */
+		arg = arg ? 2 : 1;
+		err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DIR, arg & 1);
+		if (err)
+			return err;
 
-			err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_SMT,
-					       !!(arg & 2));
+		err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_SMT, !!(arg & 2));
+		if (err)
+			return err;
+		break;
+	case PIN_CONFIG_DRIVE_STRENGTH:
+		if (hw->soc->drive_set) {
+			err = hw->soc->drive_set(hw, desc, arg);
 			if (err)
-				goto err;
-			break;
-		case PIN_CONFIG_DRIVE_STRENGTH:
-			if (hw->soc->drive_set) {
-				err = hw->soc->drive_set(hw, desc, arg);
-				if (err)
-					return err;
-			} else {
-				err = -ENOTSUPP;
-			}
-			break;
-		case MTK_PIN_CONFIG_TDSEL:
-		case MTK_PIN_CONFIG_RDSEL:
-			reg = (param == MTK_PIN_CONFIG_TDSEL) ?
-			       PINCTRL_PIN_REG_TDSEL : PINCTRL_PIN_REG_RDSEL;
-
-			err = mtk_hw_set_value(hw, desc, reg, arg);
+				return err;
+		} else {
+			return -ENOTSUPP;
+		}
+		break;
+	case MTK_PIN_CONFIG_TDSEL:
+	case MTK_PIN_CONFIG_RDSEL:
+		reg = (param == MTK_PIN_CONFIG_TDSEL) ?
+		       PINCTRL_PIN_REG_TDSEL : PINCTRL_PIN_REG_RDSEL;
+
+		err = mtk_hw_set_value(hw, desc, reg, arg);
+		if (err)
+			return err;
+		break;
+	case MTK_PIN_CONFIG_PU_ADV:
+	case MTK_PIN_CONFIG_PD_ADV:
+		if (hw->soc->adv_pull_set) {
+			bool pullup;
+
+			pullup = param == MTK_PIN_CONFIG_PU_ADV;
+			err = hw->soc->adv_pull_set(hw, desc, pullup, arg);
 			if (err)
-				goto err;
-			break;
-		case MTK_PIN_CONFIG_PU_ADV:
-		case MTK_PIN_CONFIG_PD_ADV:
-			if (hw->soc->adv_pull_set) {
-				bool pullup;
-
-				pullup = param == MTK_PIN_CONFIG_PU_ADV;
-				err = hw->soc->adv_pull_set(hw, desc, pullup,
-							    arg);
-				if (err)
-					return err;
-			} else {
-				return -ENOTSUPP;
-			}
-			break;
-		default:
-			err = -ENOTSUPP;
+				return err;
+		} else {
+			return -ENOTSUPP;
 		}
+		break;
+	default:
+		return -ENOTSUPP;
+	}
+
+	return 0;
+}
+
+static int mtk_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
+			   unsigned long *configs, unsigned int num_configs)
+{
+	struct mtk_pinctrl *hw = pinctrl_dev_get_drvdata(pctldev);
+	enum pin_config_param param;
+	int cfg, err = 0;
+	u32 arg;
+
+	for (cfg = 0; cfg < num_configs; cfg++) {
+		param = pinconf_to_config_param(configs[cfg]);
+		arg = pinconf_to_config_argument(configs[cfg]);
+
+		err = mtk_moore_pin_config_set(hw, pin, param, arg);
+		if (err)
+			return err;
 	}
-err:
-	return err;
+
+	return 0;
 }
 
 static int mtk_pinconf_group_get(struct pinctrl_dev *pctldev,
@@ -539,20 +543,21 @@ static int mtk_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
 {
 	struct mtk_pinctrl *hw = gpiochip_get_data(chip);
 	const struct mtk_pin_desc *desc;
-	u32 debounce;
+	enum pin_config_param param = pinconf_to_config_param(config);
+	u32 arg = pinconf_to_config_argument(config);
 
 	desc = (const struct mtk_pin_desc *)&hw->soc->pins[offset];
 	if (!desc->name)
 		return -ENOTSUPP;
 
-	if (!hw->eint ||
-	    pinconf_to_config_param(config) != PIN_CONFIG_INPUT_DEBOUNCE ||
-	    desc->eint.eint_n == (u16)EINT_NA)
-		return -ENOTSUPP;
+	if (param == PIN_CONFIG_INPUT_DEBOUNCE) {
+		if (!hw->eint || desc->eint.eint_n == (u16)EINT_NA)
+			return -ENOTSUPP;
 
-	debounce = pinconf_to_config_argument(config);
+		return mtk_eint_set_debounce(hw->eint, desc->eint.eint_n, arg);
+	}
 
-	return mtk_eint_set_debounce(hw->eint, desc->eint.eint_n, debounce);
+	return mtk_moore_pin_config_set(hw, offset, param, arg);
 }
 
 static int mtk_build_gpiochip(struct mtk_pinctrl *hw)

-- 
2.47.0


