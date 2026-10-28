Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9778606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 13:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tl8Ut1aE;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=W9v+i5U+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Qzov9cMie3JOWsLr9fHYVP0N8sIiaMOwtNhxNRILXQI=; b=tl8Ut1aEnV6Rz9
	DrvP+p+qM41p0E7smXuJABF9x3HWWUn3wkedc60X7s1aXsIKkSg5/KmWPMTkMUR3XFpI4knouDXmr
	aQpDXVPWLHE646qk/s/FW6spaM1tMY5OsbbROLj1rAm7RDBqppspONs94QT1t8F5XPGJGHsQ+LBsL
	riek2moUn/WcHlQ6LhEUeMUpMgtVDE/kSjBsl0UacouW6u1ch7ZPjPjd0C9v4PdsTXbxlI9/qK3/Q
	BJi0Z+J/Dl99N1G0pvezVbqjfY3w4E4s4s66Ul6AXt4QVvKMLgp39tDj+rep+zj4sIeE1l6+03Ddi
	7lPZV/GJkuXrIt986aWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM4Bg-0000000796E-2X2g;
	Wed, 28 Oct 2026 13:59:32 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM4Ba-0000000791O-49QL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 13:59:28 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso6849885e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 06:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793195965; x=1793800765; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qzov9cMie3JOWsLr9fHYVP0N8sIiaMOwtNhxNRILXQI=;
        b=W9v+i5U+Py9Qbl4cEPoenKNbkEKJFGb0Lqv9Zf3CrpBEnL1dqFtQJlA2wT9U6+2eYx
         Zy8Irg2+u9f83ATk1AM2j5PBeLzighKqQitZPx4s8aJv46O1GpMM5a2pJ329OXzOHZJy
         5f6svf3KPt3fORuVib9KIFm3MbFniNKbMHdSs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793195965; x=1793800765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qzov9cMie3JOWsLr9fHYVP0N8sIiaMOwtNhxNRILXQI=;
        b=oRhNClJ/4/boKarggHD8MVhiFi+BVwQzlwmYwArllL72S/CnR3ntZd6xQcwr99Al4K
         /5CpI+Ulq+qr+dwRgnkatZqLQjQTVta8n8LzinUlZjLODnajhXxh6n5Iz3i8+sr4G4xw
         GwW7lJxrj3jY7LVuS2KsHs4qoUDIfUUX8vFTAnpd4n43g39rQHR2qNByoY7XSyyfVJAp
         Vv2gOfu0wUbN7SD9j+gf7a+mc9DQpPtXg9pKhcBURB8F0T78wb38XxtRJZOU6+UgdftQ
         vxRtwkeibhhBwzcUuOUb1wLx4BP0qddOL83CRl3Et/SM9Jk316P6fyUdtAWFckbGj/Pj
         JxtQ==
X-Forwarded-Encrypted: i=1; AKwUvByZczHWG7p+ZQV2OUZ/Zk7PIoqLAwNVJ/pz7agj74J/i7fjj2wtAnE1sfKPsh6o0mDL2HDpOvGfMGkHIO1oR2aG@lists.infradead.org
X-Gm-Message-State: AFq9FYIS4tBpM7ajmEqNhLWzkO1dsiIC5WGzWar443d0ufavR2JF1toK
	Mh+JeajaKUm3jxcoOrnGuGkJJfAgNCDnxrolRK4+SYHTLi3nHkmm1lgQ+FPpL+hWjQA=
X-Gm-Gg: AYBFou3JKvS8ZZylRzNu5WrDv79fT9BcZI5hX2MST96sTpF1xtkW3gG2p0nclluAudC
	IziKUkkLqqgab1Y/wfkJ6GPjqn5wmVGWuOvFGOlwhIQDpcuHpwsK7eKZSQjPn75rsVp+YVwQFdz
	z9TWpXgxUvSh3rvPENxPJJDtr6dJKBYYUCCVRZwi+kZSOx6ZKp+/zUpIp8ViLX7PifEWv7L5Uej
	HR6r7/TT5daKCC3cs+Q+rAgKTYxqpNKqDyDCLCbmM4cCHtUj5p+BqvMhV0/HrXIR07t0mf87Ign
	45vbRP/KiBWlSzHYMpDv2LG5cXdMJHEhfigYuSGxNMD1J+ft1NkKrB0foNaqkObld6GKMV2i0cm
	7bvUNp/o3xCNmQP74kdxeNEbR1WXsxHO2vJhL+QOupFIQZoVZm0TWhVUDi+gA5xAdTo+2J4cRL3
	rHow1eEPmaaNRTxZoRlyJNKiK35CZsqvUE54Jy2v9RG552Hv9wZKDUey5AxqjI0SK6klw+LS6Cq
	qS42G/sUzdeRt8D3YahWdJNt1eWy43Red6R+hwwcKs+G1CjlA8DQtUXlwm/rYUrlwmofb4ZRpAD
	wJ3KHoyNJ1boqvchZFZYy9KGg6mhZ4aGxGGxnpsFDs1+3DI8evZRYQEdpPXKL0At98wLlYimc4L
	0l04BUnh5rgM6DrRo+K82N7QHygcjPRYLpurYVAEF2joEG0j4
X-Received: by 2002:a05:600c:8b28:b0:4a5:75d2:c104 with SMTP id 5b1f17b1804b1-4a96720304cmr53194255e9.22.1793195964806;
        Wed, 28 Oct 2026 06:59:24 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.42.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a94f05f168sm37077165e9.4.2026.10.28.06.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 06:59:24 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Marek Vasut <marex@nabladev.com>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
	michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Yannick Fertre <yannick.fertre@foss.st.com>,
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [RFC PATCH 3/4] soc: st: stm32mp2-syscfg: register the STM32MP25 clock device
Date: Wed, 28 Oct 2026 14:59:07 +0100
Message-ID: <20261028135915.2665857-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028135915.2665857-1-dario.binacchi@amarulasolutions.com>
References: <20261028135915.2665857-1-dario.binacchi@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_065927_060750_801D5130 
X-CRM114-Status: GOOD (  18.37  )
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

The STM32MP25 SYSCFG provides the LTDC pixel clock mux, whose driver is
an auxiliary driver since the SYSCFG node is bound to this driver.

Create the auxiliary device for the clock driver on STM32MP25.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 drivers/soc/st/Kconfig           |  1 +
 drivers/soc/st/stm32mp2-syscfg.c | 28 ++++++++++++++++++++++++++--
 2 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/st/Kconfig b/drivers/soc/st/Kconfig
index 2a9d6a77be45..62bbe8c63238 100644
--- a/drivers/soc/st/Kconfig
+++ b/drivers/soc/st/Kconfig
@@ -5,6 +5,7 @@ config SOC_STM32MP2
 	tristate "STM32MP2 SoC family support"
 	depends on ARCH_STM32 || COMPILE_TEST
 	default ARCH_STM32 && ARM64
+	select AUXILIARY_BUS
 	select SOC_BUS
 	help
 	  If you say yes here, you get support for the ST STM32MP2 family
diff --git a/drivers/soc/st/stm32mp2-syscfg.c b/drivers/soc/st/stm32mp2-syscfg.c
index 770321a4a6f7..300a949744c5 100644
--- a/drivers/soc/st/stm32mp2-syscfg.c
+++ b/drivers/soc/st/stm32mp2-syscfg.c
@@ -3,18 +3,42 @@
  * Copyright 2026 Marek Vasut
  */
 
+#include <linux/auxiliary_bus.h>
 #include <linux/module.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
+
+struct stm32mp2_syscfg_data {
+	bool has_clk;
+};
 
 static int stm32mp2_syscfg_probe(struct platform_device *pdev)
 {
-	return devm_of_platform_populate(&pdev->dev);
+	const struct stm32mp2_syscfg_data *data;
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	ret = devm_of_platform_populate(dev);
+	if (ret)
+		return ret;
+
+	data = device_get_match_data(dev);
+	if (data && data->has_clk &&
+	    !devm_auxiliary_device_create(dev, "clk", NULL))
+		return dev_err_probe(dev, -ENODEV,
+				     "failed to register the clock device\n");
+
+	return 0;
 }
 
+static const struct stm32mp2_syscfg_data stm32mp25_syscfg_data = {
+	.has_clk = true,
+};
+
 static const struct of_device_id stm32mp2_syscfg_ids[] = {
 	{ .compatible = "st,stm32mp23-syscfg" },
-	{ .compatible = "st,stm32mp25-syscfg" },
+	{ .compatible = "st,stm32mp25-syscfg", .data = &stm32mp25_syscfg_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, stm32mp2_syscfg_ids);
-- 
2.43.0


