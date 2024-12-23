Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A20BE77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 02:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0xSJsjcj6qOEXUjJ0CVtQMVpNqANaTh2TojnrhfBJYw=; b=P60HbHSKSUFQRxUnFe4ehRj0s1
	sUzev1gAfzDZH+PGZ78NO4xfDnZcT6ewNX5QAzjndQ2Z81wy+UIAuvmUHKLVRHADqFum6/wsUfiBk
	zk1jio8W97SnxDKNVApJnZ+LGPJPu0E0TlFCQCYM39p7NwaZt1rk2VSjGLfM2+fgJhV7nAfwORb62
	Pb4zIZgtUda7SW/aJcWuGXztZFdeu2HZ6Is3NB/AwG8ge9zSJ6YCoQq/2SGShTulUwVSKFr87hjc1
	sTMtnGy1PPD7AdLCD6XehzfvS1LxNXKjzbznh1JXbzDYPMhNwmp+fexARPaa5KdGWmV/dsYiVnkhQ
	3K3kz2sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPXoG-000000097Q5-10TV;
	Mon, 23 Dec 2024 02:04:40 +0000
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPXn3-000000097M9-2khL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Dec 2024 02:03:26 +0000
Received: by mail-io1-xd31.google.com with SMTP id ca18e2360f4ac-844eac51429so304929339f.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Dec 2024 18:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734919404; x=1735524204; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0xSJsjcj6qOEXUjJ0CVtQMVpNqANaTh2TojnrhfBJYw=;
        b=aeoCV2lrGSZFLGjbow4/ijGg6IPZSCWpb3yPtp9ABAG7TcDQmBCcg3U4/guZHTAZpU
         YW0NcUKDVNYPEK6Xa+iQcCOOsSBNYAODx1i2zaidZdPzI6HF0ehqmh0emCsUqAc73fV9
         9/yANK/cS67NdjRmUwXRNQIuD8ldYxHbVkrQImhvL1frm5aoKTcGgw8elofZRWvdzFJl
         reBot/AP1aH4PpCSeiHqrljO2g+2ySfNNulDAvuCEpOIGnF+LXfatCp2qAWVi09tHS2X
         BPeGcVDRxpyV706gUQleS3kNxCJYCFSfQQvP2xQYmHpwlygEHt+XH4t8aNSdGpvoAwpI
         j7VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734919404; x=1735524204;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0xSJsjcj6qOEXUjJ0CVtQMVpNqANaTh2TojnrhfBJYw=;
        b=II6UAYgBaBFb/S/uArh21A+o5DaxzmnxvKTvYosJWQtROt1lDF0cRw3ftVYyYXKa2y
         o6ob6G7N+M4siXEUTXIzSLyVZTgm97Ah/TOcARWTrHuN75m34TWMpP4sYTTo1t9IdY9P
         tiReaPnjOYFa4YIbHns9exIKTuAVcFFlO00XrnY2CuCVe4di3A6ymifbo1e6PqrbLgfu
         RFoI0Qtadg1D+y5JQeliIKA1n9yOG4ocgqcaa8fVok5No6OGaPfiTchHc4rPoYVLcQjX
         /8XqMLd1sqtoyUNedf8x8jGHUV0LdDQHo9TRgv/c50aCklOrux2gNWPuNKKjrvkqpCdc
         PXfw==
X-Forwarded-Encrypted: i=1; AJvYcCWZJQOzCSkDpEdBJAxZaYRyfrD3XDP1ICzGk1HQp6nprisUkwjE04MrqNbrhS9O/fCI6Q475Zsmwk35arcWLXWD@lists.infradead.org
X-Gm-Message-State: AOJu0YzbTfJbf9KIrT51Yv26+NCZTry2bUnhQjHqkuLLs5n5VskXgN1j
	XUvi2hJPwk5sREUr6U4PsE7xNaR1ik7A+a7+C5ty2T9pOmukuluD
X-Gm-Gg: ASbGnctXFc0CMe8NxlipwNp0D5B34F2L1ZSfYcptDD5XqS+is+tQ3cWmwLKaxhsajAk
	IMqwM0JUInlrFRMqXF5tUteQ1V47ECMBb7P+ky5f75PzIWmrdjm8r4n+QGsd4n0Bfo6+fRwGx2t
	epVJ2WuqonS7z3tlp2vtF0b55v7+gmp+oYn7xWmf75PWzMSpdvngBI8OHcer8JEPRmFiSwlpt0P
	5eUZ7m72l9G/Mvh6+vdsduMHBOVT0FfQWkrWMBZ/5T74yqRAEzTJUNUSetJAQ62HyDD
X-Google-Smtp-Source: AGHT+IFXSVIikuC4zfcUFG8mWYTfJ/hx7F+IP5PDPNnajsE2n+NPTRarFFKK4WonDsGoyc/2WmmPRQ==
X-Received: by 2002:a05:6602:3f92:b0:843:ebf1:16df with SMTP id ca18e2360f4ac-8499e65898emr881040539f.10.1734919403923;
        Sun, 22 Dec 2024 18:03:23 -0800 (PST)
Received: from localhost.localdomain ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-8498d8eb2c8sm198806439f.47.2024.12.22.18.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 18:03:22 -0800 (PST)
From: Mingwei Zheng <zmw12306@gmail.com>
To: marex@denx.de
Cc: antonio.borneo@foss.st.com,
	linus.walleij@linaro.org,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	make24@iscas.ac.cn,
	peng.fan@nxp.com,
	fabien.dessenne@foss.st.com,
	linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mingwei Zheng <zmw12306@gmail.com>,
	Jiasheng Jiang <jiashengjiangcool@gmail.com>
Subject: [PATCH v6] pinctrl: stm32: Add check for clk_enable()
Date: Sun, 22 Dec 2024 21:06:29 -0500
Message-Id: <20241223020629.3471182-1-zmw12306@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_180325_727091_D8345831 
X-CRM114-Status: GOOD (  16.69  )
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

Convert the driver to clk_bulk*() API.
Add check for the return value of clk_bulk_enable() to catch
the potential error.

Fixes: 05d8af449d93 ("pinctrl: stm32: Keep pinctrl block clock enabled when LEVEL IRQ requested")
Signed-off-by: Mingwei Zheng <zmw12306@gmail.com>
Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
---
Changelog:
v5 -> v6:
1. Call devm_clk_bulk_get_all in stm32_pctl_probe().

v4 -> v5:
1. Move the clock handling from stm32_gpiolib_register_bank()
and moving it to its caller.
2. Call clk_bulk_prepare_enable() in stm32_pctl_probe() 
and clk_bulk_disable_unprepare() for error.

v3 -> v4:
1. Add initialization for pctl->clks.
2. Adjust alignment.

v2 -> v3:

1. Convert clk_disable_unprepare to clk_bulk_disable
and clk_bulk_unprepare.

v1 -> v2:

1. Move int ret declaration into if block.
---
 drivers/pinctrl/stm32/pinctrl-stm32.c | 64 ++++++++++-----------------
 1 file changed, 24 insertions(+), 40 deletions(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 5b7fa77c1184..3efe976adf84 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -86,7 +86,6 @@ struct stm32_pinctrl_group {
 
 struct stm32_gpio_bank {
 	void __iomem *base;
-	struct clk *clk;
 	struct reset_control *rstc;
 	spinlock_t lock;
 	struct gpio_chip gpio_chip;
@@ -108,6 +107,7 @@ struct stm32_pinctrl {
 	unsigned ngroups;
 	const char **grp_names;
 	struct stm32_gpio_bank *banks;
+	struct clk_bulk_data *clks;
 	unsigned nbanks;
 	const struct stm32_pinctrl_match_data *match_data;
 	struct irq_domain	*domain;
@@ -1308,12 +1308,6 @@ static int stm32_gpiolib_register_bank(struct stm32_pinctrl *pctl, struct fwnode
 	if (IS_ERR(bank->base))
 		return PTR_ERR(bank->base);
 
-	err = clk_prepare_enable(bank->clk);
-	if (err) {
-		dev_err(dev, "failed to prepare_enable clk (%d)\n", err);
-		return err;
-	}
-
 	bank->gpio_chip = stm32_gpio_template;
 
 	fwnode_property_read_string(fwnode, "st,bank-name", &bank->gpio_chip.label);
@@ -1360,26 +1354,21 @@ static int stm32_gpiolib_register_bank(struct stm32_pinctrl *pctl, struct fwnode
 							   bank->fwnode, &stm32_gpio_domain_ops,
 							   bank);
 
-		if (!bank->domain) {
-			err = -ENODEV;
-			goto err_clk;
-		}
+		if (!bank->domain)
+			return -ENODEV;
 	}
 
 	names = devm_kcalloc(dev, npins, sizeof(char *), GFP_KERNEL);
-	if (!names) {
-		err = -ENOMEM;
-		goto err_clk;
-	}
+	if (!names)
+		return -ENOMEM;
 
 	for (i = 0; i < npins; i++) {
 		stm32_pin = stm32_pctrl_get_desc_pin_from_gpio(pctl, bank, i);
 		if (stm32_pin && stm32_pin->pin.name) {
 			names[i] = devm_kasprintf(dev, GFP_KERNEL, "%s", stm32_pin->pin.name);
-			if (!names[i]) {
-				err = -ENOMEM;
-				goto err_clk;
-			}
+			if (!names[i])
+				return -ENOMEM;
+
 		} else {
 			names[i] = NULL;
 		}
@@ -1390,15 +1379,11 @@ static int stm32_gpiolib_register_bank(struct stm32_pinctrl *pctl, struct fwnode
 	err = gpiochip_add_data(&bank->gpio_chip, bank);
 	if (err) {
 		dev_err(dev, "Failed to add gpiochip(%d)!\n", bank_nr);
-		goto err_clk;
+		return err;
 	}
 
 	dev_info(dev, "%s bank added\n", bank->gpio_chip.label);
 	return 0;
-
-err_clk:
-	clk_disable_unprepare(bank->clk);
-	return err;
 }
 
 static struct irq_domain *stm32_pctrl_get_irq_domain(struct platform_device *pdev)
@@ -1621,6 +1606,10 @@ int stm32_pctl_probe(struct platform_device *pdev)
 	if (!pctl->banks)
 		return -ENOMEM;
 
+	ret = devm_clk_bulk_get_all(dev, &pctl->clks);
+	if (ret < 0)
+		return ret;
+
 	i = 0;
 	for_each_gpiochip_node(dev, child) {
 		struct stm32_gpio_bank *bank = &pctl->banks[i];
@@ -1631,13 +1620,6 @@ int stm32_pctl_probe(struct platform_device *pdev)
 			fwnode_handle_put(child);
 			return -EPROBE_DEFER;
 		}
-
-		bank->clk = of_clk_get_by_name(np, NULL);
-		if (IS_ERR(bank->clk)) {
-			fwnode_handle_put(child);
-			return dev_err_probe(dev, PTR_ERR(bank->clk),
-					     "failed to get clk\n");
-		}
 		i++;
 	}
 
@@ -1646,15 +1628,18 @@ int stm32_pctl_probe(struct platform_device *pdev)
 		if (ret) {
 			fwnode_handle_put(child);
 
-			for (i = 0; i < pctl->nbanks; i++)
-				clk_disable_unprepare(pctl->banks[i].clk);
-
 			return ret;
 		}
 
 		pctl->nbanks++;
 	}
 
+	ret = clk_bulk_prepare_enable(pctl->nbanks, pctl->clks);
+	if (ret) {
+		dev_err(dev, "failed to prepare_enable clk (%d)\n", ret);
+		return ret;
+	}
+
 	dev_info(dev, "Pinctrl STM32 initialized\n");
 
 	return 0;
@@ -1726,10 +1711,8 @@ static int __maybe_unused stm32_pinctrl_restore_gpio_regs(
 int __maybe_unused stm32_pinctrl_suspend(struct device *dev)
 {
 	struct stm32_pinctrl *pctl = dev_get_drvdata(dev);
-	int i;
 
-	for (i = 0; i < pctl->nbanks; i++)
-		clk_disable(pctl->banks[i].clk);
+	clk_bulk_disable(pctl->nbanks, pctl->clks);
 
 	return 0;
 }
@@ -1738,10 +1721,11 @@ int __maybe_unused stm32_pinctrl_resume(struct device *dev)
 {
 	struct stm32_pinctrl *pctl = dev_get_drvdata(dev);
 	struct stm32_pinctrl_group *g = pctl->groups;
-	int i;
+	int i, ret;
 
-	for (i = 0; i < pctl->nbanks; i++)
-		clk_enable(pctl->banks[i].clk);
+	ret = clk_bulk_enable(pctl->nbanks, pctl->clks);
+	if (ret)
+		return ret;
 
 	for (i = 0; i < pctl->ngroups; i++, g++)
 		stm32_pinctrl_restore_gpio_regs(pctl, g->pin);
-- 
2.34.1


