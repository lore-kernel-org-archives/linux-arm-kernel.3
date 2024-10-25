Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2281D149EB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 20:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a/dp60hBeGDxqbrgc11djchryi537nAURD/0Na12alQ=; b=ZXHfyPOU7jzso3NLZGAILIvtDi
	gWi9ehjr9tPPzqcmRAjbFrw3iGJSFn+RtNWpV0uQrMX6Lpzkm7ud+wv2uEW+9Nfyzwx5inMZawFOV
	n8Bj2z2O+MGdZlmjGgUd4/JxyT2YFeJ4KhZJXoMWggjoHbAfZKphIaWUlZq7Ne9rVmGQ8s65RyzjG
	5GfE0W5BWotxHYnMPd358Izn3c45HOrdsJAjYcOZ/x2+3pUB7f9VDWl2zASGoPUaRPVl8hINOx8ka
	9NzRYhwQ4pUX/NjaTwUpFuGcN79dc94Uuo+0pNm6nrjnP7Tq30DH150zC1USk03pF8RRWlZNFC7wW
	QDwmhAag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4QZs-000000054GZ-0Jcw;
	Fri, 25 Oct 2024 20:06:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4QGs-000000052ET-1nF8;
	Fri, 25 Oct 2024 19:46:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=a/dp60hBeGDxqbrgc11djchryi537nAURD/0Na12alQ=; b=XBbu3kO2H6wcTh+NYUCEGnpGHc
	K6LNqp8/iq5tcmordkg9e1i++TFPiwld6jvmh4dgvF+n82SGQU7uA4RhcyaHrE4hp71pT9QWsDdvR
	Qts3laYXp0EiHYcPVcqTh9YFgNXJ71WzNEuzFHj5ERGyH7ogeAW+f+/VMI9oWNnnOaQDkA//TLbjj
	TL3EHkRQa0FyGCiCgkCeV7MjHC4LvgqgGXo6934BayWxvj/vSwFwP+eudb05qFSGBRZHVkdHF5OL0
	nE8cjnjkcPZDXSd27tioW6/ooh11irGF135HlHLa777dM9XkovugPmzO1s0NHHzjiuk/9cyH0ILZ1
	KnLmHSJg==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4QGH-000000093VL-2Bao;
	Fri, 25 Oct 2024 19:46:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1729885570;
	bh=xueF8NL4biPM6Tjkyld4sBVF/E87RcWAqU59Qy6ahiw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JfRE3Bf5Gfu+OpGxQvbs1PSFqG70Pn28Sq2qOU7LQ4hw4W+nB67hd9iDvxcsSREL8
	 p1A7xZIQW0LnL0uAlmfFuyju47fyw5wCkybqvrQ0iysKmk0CNN/IeRPvsgskBfFpfb
	 cRQGmn6gx9uvcSH/pBtOzK0eVcgHQZikWjxJHsRD4O9G6cSR18lERuuHtsvdKEB1UM
	 uM+ELKf6iGPCJBfwkMCVILAsdRpXs271f0T1OL3D5U5/vJpffLXEoCfyUxbhT1VLTt
	 Y38wrzXU4n1z55CNULfAO3TrDzcM8kEj5S+zjESHfZhrVuLDf2sx0Hg4KTI6Y9mBIK
	 CtVOFr7/XZBLA==
Received: from [192.168.1.54] (pool-100-2-116-133.nycmny.fios.verizon.net [100.2.116.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BFB6817E3706;
	Fri, 25 Oct 2024 21:46:08 +0200 (CEST)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Fri, 25 Oct 2024 15:45:36 -0400
Subject: [PATCH RFC v2 1/5] pinctrl: mediatek: paris: Expose more
 configurations to GPIO set_config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241025-kselftest-gpio-set-get-config-v2-1-040d748840bb@collabora.com>
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
X-CRM114-CacheID: sfid-20241025_204626_486607_11A4E077 
X-CRM114-Status: GOOD (  14.38  )
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
pinctrl_paris driver only supports configuring a single parameter on
specific pins (the input debounce of the EINT controller, on pins that
support it), even though many other configurations are already
implemented and available through the pinctrl API for configuration of
pins by the Devicetree and other drivers.

Expose all configurations currently implemented through the GPIO API so
they can also be set from userspace, which is particularly useful to
allow testing them from userspace.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 drivers/pinctrl/mediatek/pinctrl-paris.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index 87e958d827bf939aa6006794287698be4936f25e..c9455de266a447ab7f5446c1511bef0ef9c9128e 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -255,10 +255,9 @@ static int mtk_pinconf_get(struct pinctrl_dev *pctldev,
 	return err;
 }
 
-static int mtk_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
-			   enum pin_config_param param, u32 arg)
+static int mtk_paris_pin_config_set(struct mtk_pinctrl *hw, unsigned int pin,
+				    enum pin_config_param param, u32 arg)
 {
-	struct mtk_pinctrl *hw = pinctrl_dev_get_drvdata(pctldev);
 	const struct mtk_pin_desc *desc;
 	int err = -ENOTSUPP;
 	u32 reg;
@@ -795,9 +794,9 @@ static int mtk_pconf_group_set(struct pinctrl_dev *pctldev, unsigned group,
 	int i, ret;
 
 	for (i = 0; i < num_configs; i++) {
-		ret = mtk_pinconf_set(pctldev, grp->pin,
-				      pinconf_to_config_param(configs[i]),
-				      pinconf_to_config_argument(configs[i]));
+		ret = mtk_paris_pin_config_set(hw, grp->pin,
+					       pinconf_to_config_param(configs[i]),
+					       pinconf_to_config_argument(configs[i]));
 		if (ret < 0)
 			return ret;
 
@@ -937,18 +936,19 @@ static int mtk_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
 {
 	struct mtk_pinctrl *hw = gpiochip_get_data(chip);
 	const struct mtk_pin_desc *desc;
-	u32 debounce;
+	enum pin_config_param param = pinconf_to_config_param(config);
+	u32 arg = pinconf_to_config_argument(config);
 
 	desc = (const struct mtk_pin_desc *)&hw->soc->pins[offset];
 
-	if (!hw->eint ||
-	    pinconf_to_config_param(config) != PIN_CONFIG_INPUT_DEBOUNCE ||
-	    desc->eint.eint_n == EINT_NA)
-		return -ENOTSUPP;
+	if (param == PIN_CONFIG_INPUT_DEBOUNCE) {
+		if (!hw->eint || desc->eint.eint_n == EINT_NA)
+			return -ENOTSUPP;
 
-	debounce = pinconf_to_config_argument(config);
+		return mtk_eint_set_debounce(hw->eint, desc->eint.eint_n, arg);
+	}
 
-	return mtk_eint_set_debounce(hw->eint, desc->eint.eint_n, debounce);
+	return mtk_paris_pin_config_set(hw, offset, param, arg);
 }
 
 static int mtk_build_gpiochip(struct mtk_pinctrl *hw)

-- 
2.47.0


