Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73868C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 15:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2wX4W0I+7Z0KtrMiti+/n9dziiQ8RSkVplIT9xlgIJQ=; b=L22BROqZCLbU8LSDQuh2u1829y
	yrv/03bbCqX/yNm8HrNbTrS7CcMJEw2JucBo8AWMkzXw1Hq7sp1xryHofhnfUDzIz1vSlNPOCMPVj
	/R+TmeBeGUceJd8ZQgfXbSXNrF59h0xUNq9Rvrziph7v2jWAnZBQNL/IRonVc89ye98SJ7lj1M+aP
	T1wLRWOPpYpCpdpQZkIgYCztjrLoz8wbLdNhwulz0c7bZ4tAIODhs4DLTJ/7AZ1jEnecD6E8SANNo
	5cVV7EdIHQBsfDcAr4XiQaq2mRQTs107oGBp08qgiHcOHoVFgPERFPvYHJZZN5Pdau7Hiwhs2Xg1C
	U2WeB09w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU5sk-00000006BD1-0KKV;
	Tue, 24 Jun 2025 15:48:22 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU45X-00000005nBp-3cF6;
	Tue, 24 Jun 2025 13:53:28 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-553b82f3767so4801184e87.3;
        Tue, 24 Jun 2025 06:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750773206; x=1751378006; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2wX4W0I+7Z0KtrMiti+/n9dziiQ8RSkVplIT9xlgIJQ=;
        b=PEJbwvaSNdF4w551gt0uxrzpb4ArZmWNJZQzJhMx1cwf0uw+jMdHWVm/qLkqnis+98
         cTdqOl6P/gra+hhNCBSaWPkvHcCi6zKeg7pkaC31EGO1iMSQAd5tMMMBZEeeNp3jM+y6
         Xemig7bXlcJiC2+6yGOxF8KVu6JKrZabgwCs2+kwL78IAlE1toqof9CiwOdsN+WzYzGI
         h2EsTf5+m5ib2igdViYXqoW5iV+Pa9npdOdvCqsUA3n0EXEak+8U991g4ubin29IyUly
         HHRM7L+rKBBmQx0M7yQG7ABzdjPuJynpuD9ABJiw/W6ve7NgzEcv1xHr5sZDlO3ETrDx
         qDbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750773206; x=1751378006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2wX4W0I+7Z0KtrMiti+/n9dziiQ8RSkVplIT9xlgIJQ=;
        b=GcB3B1LTeWPp+jQPEb8DUKvEPjmT0JbZrekLDaLBG7L4d2t0TFJ86YUrjR8vgXOSPL
         wEwT/SNedlAcTSfQHQ9bX2WzuvlykWzVLg4aN3V1ObWC5xDC7jowIjJWZis9tqZPX/Og
         /y4PuDAtEpju/dexRr3yU6LysNnmJCaG0X8mz7bgWkmKXSAoNGQI7+uxFpjOc4IN5nBX
         20tGH4RmMXsh0L53QIhNnq5bRZ4iBIpuT17QNKfdR8y5IQbJCP6PxcQN5FhT37vGVQ5Q
         JvwtUlfeG6rvQFewdRe2HtfSmKeFXFX8Cj805GwNsb6t1Z4Ji7tp5hnLUteMyvQeYFxl
         3P+Q==
X-Forwarded-Encrypted: i=1; AJvYcCU5d6KKoZP4CfWc5zya6Si7TbeHTp4q/XypUI9pXwG1KIwyfrxuk+LiiJKtxi1Qr4APBwgI35zmgqlQZFva@lists.infradead.org, AJvYcCWL0qRu+vK/ex33WnDRPFaWOMNlVugo0K91JTlKesoln8sCibamtBjjoWMQXgNboefFvAtP1gPZIRXbQjDJTi9a3w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxtt91n6lPUXVDwHWYrAtnVkc6Vib3/V2LEi4kqsK8RQ6P5LxbQ
	ofMKWxOFqcm6JP5KPNZKiZKAy6+Tk7eO26CsIgwFRx+k4/l5WTYYPyq7
X-Gm-Gg: ASbGncu2Td9MB1FXDxbhHMTejwMdhTh1dZVG+KTmv+u65TYayo6iYzERsP+znxzZSKG
	1c5cl3OxuJDCrAeTFgsjN+DYS4vvp5DU9u2oFkzxR1Sz9gHns12Sklq+wdAwr7ZMlWHq2dSJT4E
	VqLNaEV2rfMe0E2mJbFpJWSAqT48fNmu4Zz1+Lbb/PZdKf5k81DSqDxQaDLGGMVuNPr9QFcl2+9
	9QpWt5TwSq/f0kYDWoM17ocq9EYN4hOpLRwxpCtKbyTsiFP/QDAX3SzFWaacgSOM0FuuDRrlW3j
	pTs/p8GDSC/bu0kXXX2/pu4ER7T5NwqTjxwZfnTwV2Rx9stPniFJqTaamfcJxKMNXaOoyJ7UIuz
	VkVVfDsk/LKr9/6GCFlJdcdZFAtsdZsfUEp98i5qCuPlPKNZ4v5A3CS+hAYtgdw==
X-Google-Smtp-Source: AGHT+IEQJZnJ9VZ+SzWrpy1cDVFBdhya8UkwmDkT4ryLdnwY06/Wc9BOqbcHUd4bE5urYlG3ueC5CA==
X-Received: by 2002:a05:6512:3f27:b0:553:1f90:cca4 with SMTP id 2adb3069b0e04-553e3bb2933mr4766415e87.13.1750773205840;
        Tue, 24 Jun 2025 06:53:25 -0700 (PDT)
Received: from user-A520M-DS3H.sberdevices.ru (broadband-188-32-30-96.ip.moscow.rt.ru. [188.32.30.96])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-554e6dc186esm1282905e87.114.2025.06.24.06.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:53:25 -0700 (PDT)
From: Alexey Romanov <romanov.alexey2000@gmail.com>
To: neil.armstrong@linaro.org,
	clabbe@baylibre.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com
Cc: linux-crypto@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Alexey Romanov <romanov.alexey2000@gmail.com>
Subject: [PATCH v12 15/22] crypto: amlogic - Add support for A1-series
Date: Tue, 24 Jun 2025 16:52:07 +0300
Message-Id: <20250624135214.1355051-16-romanov.alexey2000@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250624135214.1355051-1-romanov.alexey2000@gmail.com>
References: <20250624135214.1355051-1-romanov.alexey2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_065327_901309_0935F7A8 
X-CRM114-Status: UNSURE (   9.51  )
X-CRM114-Notice: Please train this message.
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

This platform data also can be used for S4 as fallback.
Tested via tcrypt module and with custom tests.

Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
---
 drivers/crypto/amlogic/amlogic-gxl-core.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
index 9452f05d2f10..55a35697c0d7 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-core.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
@@ -298,6 +298,14 @@ static const struct meson_pdata meson_axg_pdata = {
 	.support_192bit_key = true,
 };
 
+static const struct meson_pdata meson_a1_pdata = {
+	.descs_reg = 0x0,
+	.status_reg = 0x8,
+	.setup_desc_cnt = 1,
+	.hasher_supported = true,
+	.support_192bit_key = false,
+};
+
 static const struct of_device_id meson_crypto_of_match_table[] = {
 	{
 		.compatible = "amlogic,gxl-crypto",
@@ -311,6 +319,14 @@ static const struct of_device_id meson_crypto_of_match_table[] = {
 		.compatible = "amlogic,axg-crypto",
 		.data = &meson_axg_pdata,
 	},
+	{
+		.compatible = "amlogic,a1-crypto",
+		.data = &meson_a1_pdata,
+	},
+	{
+		.compatible = "amlogic,s4-crypto",
+		.data = &meson_a1_pdata,
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(of, meson_crypto_of_match_table);
-- 
2.34.1


