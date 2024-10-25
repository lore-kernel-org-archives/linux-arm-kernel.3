Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D0D2D149F3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 21:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xaOYDKDFzL3plG01sUZwTV6ucQ677i5/nFx9cmqwF3U=; b=3B3qLl0ffOlufG94vgbZneHp+6
	XccqfRJmM+bBoM+L52f07OZDaYr98qjs6uhjxdZ1PppEN5p3stmWI7uZjIwhFN2hp1HTpD2tL/tqj
	qY0Y6lbBJcCy9SRNdvyciaIQ3c+Rq8QVnlneiMV/QAUsrp7uTsPNrLmBZgkkOC77wViyLYIT15Hb3
	EaZ1Lz3zJ18XOJaKVm98CZ9RYzuEcqWdybftiL/xue+f28HPPxSnbNy5j5omWOOSyops3nrBRduoN
	fLb+37XIcg9hAe7I79lLeOR6lDskBJwYWpKYurzwGueWSvMgSeuofLFDWuEY5elcbucVO3vFjG24h
	je2j7PpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4RfY-00000005HWR-394D;
	Fri, 25 Oct 2024 21:16:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4QGu-000000052G2-1Wda;
	Fri, 25 Oct 2024 19:46:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=xaOYDKDFzL3plG01sUZwTV6ucQ677i5/nFx9cmqwF3U=; b=InzesxfQIk0kiC27/GIy6RJvhn
	5ZWBBWDAu3HFxPnnJgA0Jbbg3zK6DEP5KJCM4ON3lj7zfDnA8dkEgAp2K2aVEs4POsgVTCnzoeNkF
	fnnjEZO7vvlFuNavkpLtSow22qA2/JMotY+z6JsvXCWMMB7FR0ksnDl1CpNMpAcyic98Bjocu2eF4
	bnA9CyOGkBObjC7rV9tMVZ/57O1s0ml9aemiG10U90XOWoui8Cz7frHqBi5I7rYpFKHJ1pPaH2vHv
	4ium6qN8xfloVLZat8n+455gtsRpn9KgBi3qj7NRuO2VlWw6wZerRID1GxpODnxp7xVVWOPtmwdm2
	ExFrBKkg==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4QGH-000000093VW-2CKT;
	Fri, 25 Oct 2024 19:46:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1729885574;
	bh=IHDKkPuL6bGyn5e67txu92IjSUnnKlLm5rnqXrHDXfA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UvWdNBT8E+GAvnMABd12C2gfjEy/go+AclK2eXCzTWQodocmtcvFeSHDBB7BtvLYn
	 beJF7K7beKxA/8UIldFBb2Fyd3xtK2p2jDm97aF4rmFpj1yjV/cECCVNpDcUipjwCR
	 bZtRbOPxPyS8ajt+WL4xSH/Jy1vmDYQtxB3Q3NwW3Wdvj5j15DqZ8SlnlrJsyjyBJH
	 g7c2gZIsmkj1Gd+alM3oY5/ApuW/3xFSCqPxXmVqeNqGegcwteqgI6hfbSMvxaS/GX
	 AwneRLNuHMKz3lSYYGdHSgNGaD+gn4TQewucuYm6jsNCBv3ExSHJRzi9KOfCGc8qXv
	 gKmVw+uA/mt4A==
Received: from [192.168.1.54] (pool-100-2-116-133.nycmny.fios.verizon.net [100.2.116.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A5C9D17E3750;
	Fri, 25 Oct 2024 21:46:12 +0200 (CEST)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Fri, 25 Oct 2024 15:45:38 -0400
Subject: [PATCH RFC v2 3/5] pinctrl: mediatek: common: Expose more
 configurations to GPIO set_config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-kselftest-gpio-set-get-config-v2-3-040d748840bb@collabora.com>
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
X-CRM114-CacheID: sfid-20241025_204627_830838_D7835A1A 
X-CRM114-Status: GOOD (  17.29  )
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
pinctrl-mtk-common driver only supports configuring a single parameter
on specific pins (the input debounce of the EINT controller, on pins
that support it), even though many other configurations are already
implemented and available through the pinctrl API for configuration of
pins by the Devicetree and other drivers.

Expose all configurations currently implemented through the GPIO API so
they can also be set from userspace, which is particularly useful to
allow testing them from userspace.
---
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 48 ++++++++++++++++-----------
 1 file changed, 28 insertions(+), 20 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
index 91edb539925a49b4302866b9ac36f580cc189fb5..7f9764b474c4e7d0d4c3d6e542bdb7df0264daec 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
@@ -62,13 +62,12 @@ static unsigned int mtk_get_port(struct mtk_pinctrl *pctl, unsigned long pin)
 			<< pctl->devdata->port_shf;
 }
 
-static int mtk_pmx_gpio_set_direction(struct pinctrl_dev *pctldev,
-			struct pinctrl_gpio_range *range, unsigned offset,
-			bool input)
+static int mtk_common_pin_set_direction(struct mtk_pinctrl *pctl,
+					unsigned int offset,
+					bool input)
 {
 	unsigned int reg_addr;
 	unsigned int bit;
-	struct mtk_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
 
 	reg_addr = mtk_get_port(pctl, offset) + pctl->devdata->dir_offset;
 	bit = BIT(offset & pctl->devdata->mode_mask);
@@ -86,6 +85,15 @@ static int mtk_pmx_gpio_set_direction(struct pinctrl_dev *pctldev,
 	return 0;
 }
 
+static int mtk_pmx_gpio_set_direction(struct pinctrl_dev *pctldev,
+			struct pinctrl_gpio_range *range, unsigned int offset,
+			bool input)
+{
+	struct mtk_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
+
+	return mtk_common_pin_set_direction(pctl, offset, input);
+}
+
 static void mtk_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 {
 	unsigned int reg_addr;
@@ -363,12 +371,11 @@ static int mtk_pconf_set_pull_select(struct mtk_pinctrl *pctl,
 	return 0;
 }
 
-static int mtk_pconf_parse_conf(struct pinctrl_dev *pctldev,
+static int mtk_pconf_parse_conf(struct mtk_pinctrl *pctl,
 		unsigned int pin, enum pin_config_param param,
-		enum pin_config_param arg)
+		u32 arg)
 {
 	int ret = 0;
-	struct mtk_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
 
 	switch (param) {
 	case PIN_CONFIG_BIAS_DISABLE:
@@ -381,15 +388,15 @@ static int mtk_pconf_parse_conf(struct pinctrl_dev *pctldev,
 		ret = mtk_pconf_set_pull_select(pctl, pin, true, false, arg);
 		break;
 	case PIN_CONFIG_INPUT_ENABLE:
-		mtk_pmx_gpio_set_direction(pctldev, NULL, pin, true);
+		mtk_common_pin_set_direction(pctl, pin, true);
 		ret = mtk_pconf_set_ies_smt(pctl, pin, arg, param);
 		break;
 	case PIN_CONFIG_OUTPUT:
 		mtk_gpio_set(pctl->chip, pin, arg);
-		ret = mtk_pmx_gpio_set_direction(pctldev, NULL, pin, false);
+		ret = mtk_common_pin_set_direction(pctl, pin, false);
 		break;
 	case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
-		mtk_pmx_gpio_set_direction(pctldev, NULL, pin, true);
+		mtk_common_pin_set_direction(pctl, pin, true);
 		ret = mtk_pconf_set_ies_smt(pctl, pin, arg, param);
 		break;
 	case PIN_CONFIG_DRIVE_STRENGTH:
@@ -421,7 +428,7 @@ static int mtk_pconf_group_set(struct pinctrl_dev *pctldev, unsigned group,
 	int i, ret;
 
 	for (i = 0; i < num_configs; i++) {
-		ret = mtk_pconf_parse_conf(pctldev, g->pin,
+		ret = mtk_pconf_parse_conf(pctl, g->pin,
 			pinconf_to_config_param(configs[i]),
 			pinconf_to_config_argument(configs[i]));
 		if (ret < 0)
@@ -870,19 +877,20 @@ static int mtk_gpio_set_config(struct gpio_chip *chip, unsigned offset,
 	struct mtk_pinctrl *pctl = gpiochip_get_data(chip);
 	const struct mtk_desc_pin *pin;
 	unsigned long eint_n;
-	u32 debounce;
+	enum pin_config_param param = pinconf_to_config_param(config);
+	u32 arg = pinconf_to_config_argument(config);
 
-	if (pinconf_to_config_param(config) != PIN_CONFIG_INPUT_DEBOUNCE)
-		return -ENOTSUPP;
+	if (param == PIN_CONFIG_INPUT_DEBOUNCE) {
+		pin = pctl->devdata->pins + offset;
+		if (pin->eint.eintnum == NO_EINT_SUPPORT)
+			return -EINVAL;
 
-	pin = pctl->devdata->pins + offset;
-	if (pin->eint.eintnum == NO_EINT_SUPPORT)
-		return -EINVAL;
+		eint_n = pin->eint.eintnum;
 
-	debounce = pinconf_to_config_argument(config);
-	eint_n = pin->eint.eintnum;
+		return mtk_eint_set_debounce(pctl->eint, eint_n, arg);
+	}
 
-	return mtk_eint_set_debounce(pctl->eint, eint_n, debounce);
+	return mtk_pconf_parse_conf(pctl, offset, param, arg);
 }
 
 static const struct gpio_chip mtk_gpio_chip = {

-- 
2.47.0


