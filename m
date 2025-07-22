Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C63BC83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 13:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LR08by9XdStyKPayjZ1DkTPP+M90uxnZLUPskVBaYN4=; b=ST5mreu4E9MmBHrTuNEItboN+L
	khLY8BPgU+oz8A7eVCHXPhnWTKiKYDUiq58jA/nhkxKDP2oS6DdlK9OfHhcRYDEyNMUaR8oJxXvqo
	agYKfSLhUMc5e/cWn6W7LwNZNlLIZDYZCnqhXjOX5qDbzEbaQ53gXB1qvyq2KMO8NDQhb2WejCc9F
	hZOB2ar6y9Xf4HRYJNgVk18RWawl5zbkrYngCtGUhOVrlSFGLGBnOE6GMnFRnVxxCqdlrD+vB82bu
	WinYbdf1frZAEBLzLMhTw4gDvA4VajPPeff3wfE75uspm7vxIE7js1uokTUNsFNA2XbHaQ/9qgSk2
	TDITBKkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueDIG-00000002aJk-1Bb7;
	Tue, 22 Jul 2025 13:44:32 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueCH9-00000002SLH-11EZ;
	Tue, 22 Jul 2025 12:39:20 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3a6d1369d4eso3237367f8f.2;
        Tue, 22 Jul 2025 05:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753187957; x=1753792757; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LR08by9XdStyKPayjZ1DkTPP+M90uxnZLUPskVBaYN4=;
        b=IVdwfnf6DbZ6dIqaxOG8hCYr/zTRS5zKDj2X9586L0FBpkzv/f8T+okaiROtuBLlBe
         fhAFZZRW9K2tmoZMllP3e6PXEVXsLJkUo+AMGaiLcmfwkUGrPQkb71NCZwpAKcxC9hzi
         pN4E7ukwxIzG+vkG3iTxIOPP0FWKD11Ed6MVxmSaKt24YubkfqRcFykq3Ubt7PktQgKj
         nH846LexPN8uZ1ZMXfSzbjCLG1qzHUCQyE0ywH43zJK1+QtBc+7dhRx2TQYugdFpLj+9
         ZcFDabkPf5XmQBtta5IGTewRW4jleHqhK34BC8ZMzN+dbHL8mZMexUOVwCgZgG7GsbEp
         HJmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753187957; x=1753792757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LR08by9XdStyKPayjZ1DkTPP+M90uxnZLUPskVBaYN4=;
        b=qMyygL2Q86LZxbr/SP7jswRpUT3iI9+ykgw2fjRGsKZZXzBjum/tdk9QAb9bP6V2QV
         jAaSC8Y3DeGzil0hWA6WKToGzc6+1ncMad/sJxgiOF6bAz2+q4olBPJTYSRA9bcVbEyt
         KdwCqEDIHcmyk5kwwIACrxJ/VifsJKv069rdVLSKQWGQFAp2szhw3m7549C5EUba+HQY
         T3UGD2wDzA2gtHplMBRZiP75mV82iPUr6SUdjoD1lONVMWPKhSai+HU/sdf/SsPzGuw4
         PZpvT5OdXW9xr1DDZ6zMtck6gdjFalpu9KicV1d7cCR39ugnKJc3AWs0ktNIcetWeXvK
         Pulw==
X-Forwarded-Encrypted: i=1; AJvYcCXaHgw26xo79qNlR1L1V16Y2MJ3JuAjou+vZ0akmyglCrOJRX+EsX6dnGpNPb+SdAAXuOpaKUAxhIj84KFbAOPX@lists.infradead.org
X-Gm-Message-State: AOJu0YygeDYGfthvlJtclBpd/t5qyPDVx7EJWukUDuANHzphgrLaqXIV
	lxuMM2hSb7p3e4+Ochdy5K31JVoV0EM5X2IwBKDqhYXMtaLv8cdFUiQFlyxl3MLK3rF7kQ==
X-Gm-Gg: ASbGncvEHIDORQd/A6w1o5MtnOi7WG8pCkWTsG9MlA2vBerH0wdApYUiUs6au3vhDmd
	9+BQRve58Cd14UHdlTV3LD5H1BdiAwvABC2LXqvdRDZNqQePN5PnJja15crC0lhiEiQtClrizXA
	V4zYhSfJuC3/OJynTrxw797JwfqTvSAWgwctHq+ilR1W1jUCxXZlnPNbwU5gSosFMFnm7/cRiOF
	zo49fHO7dwDn9w1u4x8qSFrGdB9FhaYrXv90b/A8Pxxd+/SOhUdviawcb9D8J10pdBu0PpyaKCY
	M+gYxN81/GH7OVSCuc/EK7JvEBKFbeJ+CBcRbPLHOr8s586Ixkq8JtImE56OKASWfqEQi5JqtPc
	UR9rILRnhHoDlDNEHMET7OZjZkE1LaD91iQIhdg==
X-Google-Smtp-Source: AGHT+IFUOXIG8Fr2xTOPb12sdzkJ76EHYYR79u7QBoj6jkdmmEk1+A2/y4FejEdhhllhm9l7BrFuNA==
X-Received: by 2002:a05:6000:1882:b0:3a4:edf5:b942 with SMTP id ffacd0b85a97d-3b60ddc647bmr21356244f8f.57.1753187957328;
        Tue, 22 Jul 2025 05:39:17 -0700 (PDT)
Received: from tearch ([46.104.48.188])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca48c40sm13525197f8f.58.2025.07.22.05.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 05:39:11 -0700 (PDT)
From: muhammed.efecetin.67@gmail.com
X-Google-Original-From: muhammed.efecetin67@gmail.com
To: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	heiko@sntech.de,
	neil.armstrong@linaro.org,
	lee@kernel.org,
	rafael@kernel.org,
	efectn@protonmail.com,
	daniel.lezcano@linaro.org
Subject: [PATCH v2 2/5] mfd: khadas-mcu: drop unused nvmem code
Date: Tue, 22 Jul 2025 15:38:12 +0300
Message-ID: <73c18d4d5673f3aeced46bf36ee405fffcd6e2bd.1753179491.git.efectn@protonmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1753179491.git.efectn@protonmail.com>
References: <cover.1753179491.git.efectn@protonmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_053919_282290_98F37D65 
X-CRM114-Status: GOOD (  11.07  )
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

From: Muhammed Efe Cetin <efectn@protonmail.com>

Drop "khadas-mcu-user-mem" code since it is not used anywhere.

Signed-off-by: Muhammed Efe Cetin <efectn@protonmail.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/mfd/khadas-mcu.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/mfd/khadas-mcu.c b/drivers/mfd/khadas-mcu.c
index ba981a788..ca4bd6cf5 100644
--- a/drivers/mfd/khadas-mcu.c
+++ b/drivers/mfd/khadas-mcu.c
@@ -80,10 +80,6 @@ static struct mfd_cell khadas_mcu_fan_cells[] = {
 	{ .name = "khadas-mcu-fan-ctrl", },
 };
 
-static struct mfd_cell khadas_mcu_cells[] = {
-	{ .name = "khadas-mcu-user-mem", },
-};
-
 static int khadas_mcu_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
@@ -105,13 +101,6 @@ static int khadas_mcu_probe(struct i2c_client *client)
 		return ret;
 	}
 
-	ret = devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE,
-				   khadas_mcu_cells,
-				   ARRAY_SIZE(khadas_mcu_cells),
-				   NULL, 0, NULL);
-	if (ret)
-		return ret;
-
 	if (of_property_present(dev->of_node, "#cooling-cells"))
 		return devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE,
 					    khadas_mcu_fan_cells,
-- 
2.50.1


