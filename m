Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D53A7CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 18:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4/dZvvhdpeV5T70CXzzhIM2ftvucviNjA+HOyZU3hVU=; b=CVF/zq4/MUs20Def/ruiWg1K33
	Tjon2y3viWrOGgAXALcuL2H9y0X2pjaflQcmapJ1WZTb5z38q+qOZMKCQd0wG6kASLKNsyXJFVE1L
	jorT/BREwzFYfDoqs9GcJeYVyxXWkJYFWKvC6tbOz7RJxwb36VfG9aOt5qgvYmx6gQ0br8bLv17BQ
	b1Efdy/b0cfvwPj/nVkBslSy4kOJ5RmmQIPyHK2yFiOqOYXcuWTApI2b5gIWPwxyhKZHUtwASJBVt
	WvXTvl334W7BglKD3Bh2PURNkkgow4YL5G5ckxJ8FwBPuXLvUK2Ny7LknYMqbeVDyB39VHzBdRd7g
	kZHjrFrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umcU0-00000000J1B-0x7v;
	Thu, 14 Aug 2025 18:15:24 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umcRR-00000000Ivv-0OhT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 18:12:46 +0000
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-7e87061d120so123334785a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Aug 2025 11:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=libre.computer; s=google; t=1755195163; x=1755799963; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4/dZvvhdpeV5T70CXzzhIM2ftvucviNjA+HOyZU3hVU=;
        b=fKfrenSy4MRv2eaMAxeEaJLHwJHI/sUh3jGzmJPflSg7DoBpxSdubHasJj+f+hz825
         oc3go2zXQFYFsKgrDfXvgDJV7CbqR61cJSl8MWhdBBo6NgtycHp47e8V2vLAZsAJhG2Z
         HocF+qv+sW9Y+ZgdKB3T9x1i3rtBL4ZV5cAeFhwchWvXWd0dmI1OHmIoPZfFausyR69i
         2CyMtO797rNQ4yM45oe6amaWeZer3r+jA65ZpvgbapMIYXSuBavjIWqhp33hnU1JXeHh
         E47AbBBORDRqv+i1P15IZWEsPRU/Wku9EYFFHP3kJq5cr4GnFrd36LSVqACvVEQTi+aN
         hebg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755195163; x=1755799963;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4/dZvvhdpeV5T70CXzzhIM2ftvucviNjA+HOyZU3hVU=;
        b=f5nLElclmDteiOM/gQATzOFkTN0163PCEpF/obIsX3yE5+HTPkJynwjbvVpCalQhcT
         SSH9LdN5seCWBa2eSNc+sN4McaNTEBXp7a0rGSolyGAAmdsZdD9OXVIJNiW0aLIWFlQ7
         tlj1FITBnSxwtk0tbdMD6YpMdEtYzMr2FW/qpqzEDOO1fBWXVlE0+3cZ35Gfqrc4JOvf
         VgVoa02sysP1FVSsbsgYOlYZGw4F9dyEcZlX6NlyvkuUiWT3XCL77eiihQOAxsKSHZNW
         /T4w566KpiIq8ZUnEQp4dSPyx+PAZedIlDuPsF0MDzExnkLciKnONDQZ1basieTqKSFm
         CESw==
X-Forwarded-Encrypted: i=1; AJvYcCX4f4DWPgZNqSOO8yLXOpgkKsoLEJlae8iJ4r2eE3XV8lTPVeu5E3Pzw7Ic5tm+Ti2fAXIyv8APkn5VUX3efPRZ@lists.infradead.org
X-Gm-Message-State: AOJu0YzYwGkduEOcT8ZBVxSb+24JLJ85fo6lLCnw6f9wmljLdZlHvmDK
	esqS4bIKQjhc1QD91TXbTn2lI6I7tlJJW++b9tGGOC66DrmLUCq3A4WgPaBe9yD/eA==
X-Gm-Gg: ASbGncvhBfdsCi+C9vLXVREglGp/w6P0dOwvqCuvxtx5N0lLMbxUsrlK2+aXIyoKRZ2
	NSrhsPXZJp/GoZ/9y6QOiyn+729mdIR5ihev6gpnBSD4ANv96cgKl2NXH3nn/DGZmFFvkWvmVKn
	LYevgBmwE7gzVGEwJ8jwLsqlRXpbQkInfvo5o9bX2LxMhx8pOQxbS7ZQ6Sy1y+C9ves1yKQu4xR
	jmPXGW6dQDc+QJTry5GeHHo662885fhoOVOe4z2qPBcNhCS0PxRLhR7NmrY9ICkTPZDJ9kJIS2o
	5ERY9F0Apqsr13mnZs4JX4lIs+RRkGjTyTAj1iisIKz0o2sl/bEdjcz0nywYwJVpmKCWG87fmut
	SGjI4Fnciwk5JwhckRCZZlyhPoAI=
X-Google-Smtp-Source: AGHT+IHZet1Jvv8jg99HpAw6hDsF8fx3/AYC1SN8lGZ35gs0uFt1zck15oaDyeVmE3ge8wvu7oeH4w==
X-Received: by 2002:a05:620a:4055:b0:7e8:2989:1149 with SMTP id af79cd13be357-7e8705b5fa2mr627043385a.49.1755195163315;
        Thu, 14 Aug 2025 11:12:43 -0700 (PDT)
Received: from localhost ([172.56.29.94])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-70af5c43392sm16269836d6.84.2025.08.14.11.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 11:12:42 -0700 (PDT)
From: Da Xue <da@libre.computer>
To: Linus Walleij <linus.walleij@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Da Xue <da@libre.computer>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: meson-g12a: add GPIOC_7 pcie_clkreqn pinmux
Date: Thu, 14 Aug 2025 14:12:36 -0400
Message-ID: <20250814181236.1956731-1-da@libre.computer>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_111245_211627_EBED9761 
X-CRM114-Status: GOOD (  10.16  )
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

Amlogic G12 exposes PCIe clock request signal on GPIOC_7 pinmux func 1

Add the relevant pinmux and pin groups

Signed-off-by: Da Xue <da@libre.computer>
---
 drivers/pinctrl/meson/pinctrl-meson-g12a.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/pinctrl/meson/pinctrl-meson-g12a.c b/drivers/pinctrl/meson/pinctrl-meson-g12a.c
index 8b9130c6e170..117e72b4ffcb 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-g12a.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-g12a.c
@@ -442,6 +442,8 @@ static const unsigned int tdm_c_dout1_z_pins[]		= { GPIOZ_3 };
 static const unsigned int tdm_c_dout2_z_pins[]		= { GPIOZ_4 };
 static const unsigned int tdm_c_dout3_z_pins[]		= { GPIOZ_5 };
 
+static const unsigned int pcie_clkreqn_pins[]		= { GPIOC_7 };
+
 static const struct meson_pmx_group meson_g12a_periphs_groups[] = {
 	GPIO_GROUP(GPIOZ_0),
 	GPIO_GROUP(GPIOZ_1),
@@ -721,6 +723,7 @@ static const struct meson_pmx_group meson_g12a_periphs_groups[] = {
 	GROUP(pdm_din2_c,		4),
 	GROUP(pdm_din3_c,		4),
 	GROUP(pdm_dclk_c,		4),
+	GROUP(pcie_clkreqn,		1),
 
 	/* bank GPIOH */
 	GROUP(spi1_mosi,		3),
@@ -1183,6 +1186,10 @@ static const char * const tdm_c_groups[] = {
 	"tdm_c_dout2_z", "tdm_c_dout3_z",
 };
 
+static const char * const pcie_clkreqn_groups[] = {
+	"pcie_clkreqn"
+};
+
 static const char * const gpio_aobus_groups[] = {
 	"GPIOAO_0", "GPIOAO_1", "GPIOAO_2", "GPIOAO_3", "GPIOAO_4",
 	"GPIOAO_5", "GPIOAO_6", "GPIOAO_7", "GPIOAO_8", "GPIOAO_9",
@@ -1309,6 +1316,7 @@ static const struct meson_pmx_func meson_g12a_periphs_functions[] = {
 	FUNCTION(tdm_a),
 	FUNCTION(tdm_b),
 	FUNCTION(tdm_c),
+	FUNCTION(pcie_clkreqn),
 };
 
 static const struct meson_pmx_func meson_g12a_aobus_functions[] = {
-- 
2.47.2


