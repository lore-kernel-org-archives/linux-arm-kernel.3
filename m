Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45EC2109316E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 04:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Bi+cpYb6Vg0VXFOuregCJb6MTqBCf/daXiAT548yjY0=; b=Up+6xzFqsZ9gljqXNhad0qzKqZ
	1uB56ck2UJlqBR2yFyDYCCnYS0SxtFeblI7Nlh6SwwiWT+McfI7dq99YWIshZZAl61gic3mWo5UVB
	STXoo9/a+GVz9DUvwZsRfJ0qcYQdlyTyUUJkDQIRnmFwhbe2jh7J0GSAjk/a/8xQQLMfYv+Lg/XTi
	2+x5hrrazaMOobRcGI1RJ9CSdi/77f9IMK4b1SI3Fz4e92hjlWSvmSZfaPupmdHB9cm9Eis4Cp3mk
	a+OuyU+LRR56ossPs8NuWz9cCHmlO10s2Gc5K7TCWeRwu5R7HsMZZ4WlRCek5FhDLjtSAre4InJF2
	ISlSKPhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3R6j-0000000C2pI-2HOs;
	Fri, 20 Mar 2026 04:05:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3R6h-0000000C2p0-2kZz
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 20 Mar 2026 04:05:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=Bi+cpYb6Vg0VXFOuregCJb6MTqBCf/daXiAT548yjY0=; b=oPwcZKgT3fXHmMXYS2Q6c9RHya
	XHOh6MpSyb5T8wyLWZVbzOlvlYWjTwAnVqZsT4yZVlAjvoSdtE/ssfIq7w895L7SN515UDBczrMmH
	0qlDSEtcOKuc0v7WHA5qpB5xJUzTOlyycbQHhTue2jkerlKmK87YLxS3W9VVCw8s9uUq2+Ftp6PnW
	hpPw24U0WmsprOyLPPwf5yIkLHIcQOMttSVLXON2uI9ToaSnJ9BjnhdPqIvoZr0Ch6sOlRsrmHiwh
	tNlWeNuihhnNJY2BTNakX6EJhyeom0M/5+TLgRkKFpPe0w1Ke0qLN+4AhadePFZqYkkEUzz+amoSf
	uJX9QPBA==;
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3R6e-0000000EtIt-0Q0Q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 04:05:06 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2aae4816912so1303045ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 21:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773979502; x=1774584302; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bi+cpYb6Vg0VXFOuregCJb6MTqBCf/daXiAT548yjY0=;
        b=TJWatcFWHYxzJhEzoToD7wuHCw/dNqmJRIaEjwq9aTr0MqlK0C5e3njlaW/fbgI4Gg
         BEtROwdgYSLV8Jxbn3Uf1WSOlmKOCxygbLX2tu39VHQbBKTZKLnH/Uzx0JGhZMijoDIu
         OztR3Hvi/athNDPlKg/Hn0wW9sxOQS5cqa/X/JEcYvbSnD/dquq32AkxsMz/KrS04iK3
         EAZ3aXlFQ6Ii5NAG64sYg29TLjZYg+KGQ226Om2QcaqGxvPnnkKGkqwd3YD6HRP3U1oq
         X1IiKwuOy6lsj+FHZDxfrs1hrk6ZO2Ni9ze4jX0mhoWkSzFCS6X1IFNlr2Zd9cM12Nfc
         CCEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773979502; x=1774584302;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bi+cpYb6Vg0VXFOuregCJb6MTqBCf/daXiAT548yjY0=;
        b=m4GX0afUx2lwk2HvnUtYowbsPkfgZCOa86ELWrs1vBXgSDwhux8r3f9WJmK+0YvK0D
         Ej2hFk5F2RY2WSYQtU8YvbqquRBZ+lFQf+34I+tO1IexoGCBVgs3tOdlqU9VWu2CkYgU
         YLLCF90sfFodsFLDZrgOqSlWBzRxAZ9wGgrkQDPJhnXlzeouz24qG4rpBVi6CDuYNcO1
         wBFe0afANHRd/EpQYmOS3ycylZ4pv92R1Fu/2FV2L8cSGz1101vJ0/hFmUuBrYLuJ/vk
         pvDZKlUL39ZLw9C8FQIwkD/S0OiSgXlV6K74WWujLGNWHwyA+imc+w7D7930Vn56p2aM
         SYBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLg4ZG7aNtRhrHXFnTAvlmb+chexBoIqUqrOOiYLqak/1ErqIMjjlgRJvlQvLofgMFvjWVrttZhSsLZZX1Tley@lists.infradead.org
X-Gm-Message-State: AOJu0Yys7W3nrcMcrnrcw3dU/s+Tbui9fxCr2ZLCWK0x2XUdiASUn4Db
	jbaJtVKPM9rlZQkb/mYU6lrS/zYdhwimluQWwLEfTsw4MRXm4GVHadMqQEVY/mIF
X-Gm-Gg: ATEYQzws/hF/EGhqa6NRfHUa5TpAK0bIS9VWBLYOoOFwFln8Y0fLnmeYhEnrMw9D8f/
	Fgyol00VDq651EpQmAy3Ww/su09x7LuwVpamcAYPn2pCbql3EzxhSoGCwovtTzqqXH17hrmxllD
	TxUZpG2axxRojSKHKFtCQOWRp3Vzo7uOeZ5d+8jqEcCoDxUrGPIzVVoP33sIFaVqchyC6m/zcKy
	utdOmnt+7wLk5G98WE8ZckpZOZh9YVahsKbkNaTsTbF0e9HcvngVDBLvK3ggy3aOZofXlCvAiWb
	2iMFYOLwLg3kRXz4VEDa2LuM89PlWg4vRcz8Gyx6U0lzMfsiEPF7+dIk1MwRRp3ZLsBU4CopXuo
	vyVoe2i0rB1AZAImoDysOmiPpMyntFF3jEJuUKks1c3ur4biydGEmamzHozO2uGdg9SOo2fiPNd
	1BUxTaQzFQg3JaYcVlzJibeQ7AmemWEE75zj6DwhExFjo8J6+dK1F6Buw=
X-Received: by 2002:a17:902:e74b:b0:2b0:7531:b61e with SMTP id d9443c01a7336-2b0827c2095mr13747205ad.41.1773979501693;
        Thu, 19 Mar 2026 21:05:01 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083516ae1sm7212905ad.13.2026.03.19.21.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 21:05:01 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-stm32@st-md-mailman.stormreply.com
Cc: Thomas Gleixner <tglx@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-kernel@vger.kernel.org (open list:IRQCHIP DRIVERS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/STM32 ARCHITECTURE)
Subject: [PATCH] irqchip/stm32-exti: Use kzalloc_flex
Date: Thu, 19 Mar 2026 21:04:43 -0700
Message-ID: <20260320040443.46038-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_040504_334660_1EFCC56F 
X-CRM114-Status: GOOD (  12.70  )
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

Simplifies allocations by using a flexible array member in these structs.
No need for a second kfree.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/irqchip/irq-stm32-exti.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/irqchip/irq-stm32-exti.c b/drivers/irqchip/irq-stm32-exti.c
index 5fdf335acb46..144120cadfa0 100644
--- a/drivers/irqchip/irq-stm32-exti.c
+++ b/drivers/irqchip/irq-stm32-exti.c
@@ -45,8 +45,8 @@ struct stm32_exti_chip_data {
 struct stm32_exti_host_data {
 	void __iomem *base;
 	struct device *dev;
-	struct stm32_exti_chip_data *chips_data;
 	const struct stm32_exti_drv_data *drv_data;
+	struct stm32_exti_chip_data chips_data[];
 };
 
 static const struct stm32_exti_bank stm32f4xx_exti_b1 = {
@@ -269,26 +269,20 @@ stm32_exti_host_data *stm32_exti_host_init(const struct stm32_exti_drv_data *dd,
 {
 	struct stm32_exti_host_data *host_data;
 
-	host_data = kzalloc_obj(*host_data);
+	host_data = kzalloc_flex(*host_data, chips_data, dd->bank_nr);
 	if (!host_data)
 		return NULL;
 
 	host_data->drv_data = dd;
-	host_data->chips_data = kzalloc_objs(struct stm32_exti_chip_data,
-					     dd->bank_nr);
-	if (!host_data->chips_data)
-		goto free_host_data;
 
 	host_data->base = of_iomap(node, 0);
 	if (!host_data->base) {
 		pr_err("%pOF: Unable to map registers\n", node);
-		goto free_chips_data;
+		goto free_host_data;
 	}
 
 	return host_data;
 
-free_chips_data:
-	kfree(host_data->chips_data);
 free_host_data:
 	kfree(host_data);
 
@@ -389,7 +383,6 @@ static int __init stm32_exti_init(const struct stm32_exti_drv_data *drv_data,
 	irq_domain_remove(domain);
 out_unmap:
 	iounmap(host_data->base);
-	kfree(host_data->chips_data);
 	kfree(host_data);
 	return ret;
 }
-- 
2.53.0


