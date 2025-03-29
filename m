Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB468C36008
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Mar 2025 19:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5zCE82IEEUW3OgJQOexggjw77Krndyt+WM9SEFSCbzs=; b=kAhlqhmpEnlVPdMYXZ5NDshMcF
	K6jRa25nnXbyD/KAhrsXBmaseMzGBtJVor4zH96nh4NB3Xys9sks76usWHgUwNo61FX/TyHKWHFii
	WfkTZyvDnnV6hYvJDbDoiiGh9sCAx8mpCw+gL9nnDwJBmlDg/NJM9173no/qaD81cXH1TMQED7t0I
	NyYVechfmkDfhwFm1pJTYAcP5BuEpgo1C8RCdYRe0vO6Bj7kAfFHNi4VCBeFpsoQr2r863DmZ/FKf
	eUxw+oN6ErUXMdsDcCFITe4b3DBN/8n3UNf10Jjb5kQiqaFf7N1R38+SW8t2uPvazS7c0y5EeMpuZ
	Twb/wbaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tybjK-0000000FSDF-2Tqd;
	Sat, 29 Mar 2025 19:20:30 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tybWj-0000000FR8q-0ECm;
	Sat, 29 Mar 2025 19:07:30 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5e673822f76so5389410a12.2;
        Sat, 29 Mar 2025 12:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1743275247; x=1743880047; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5zCE82IEEUW3OgJQOexggjw77Krndyt+WM9SEFSCbzs=;
        b=LV+P9S8rX5q5/j5izDyK/09/b2NfudSPngUwqBRtbCR7lTR3rXhzTxe4j1Y3ZBeq8V
         tS9Fe01Z0sBzfBhJgkewyvWpkW3N9wBiAEApUgAipvQgI/E8NNbjRxpJmDGv6ebDYV3t
         jjwRwxO0V5lKlf6itHnYT8dyFUUxsnOGaJ0FNhBioVnZq0TCgfwvT+N3+LupVwu5opCM
         hxcOxz5FQr2st1vsu4SdJlleiHIXrB/EBGlTnyhcuz02se8rKwWAoT7KpvGOlzfmrOsE
         gwqmQXhL7JhyFL3Yvcjh6jSlyjzAMoQXgFonoJ+/tqUwk2EGT7BhjW7xFS8tMpuwSqWx
         nOGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743275247; x=1743880047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5zCE82IEEUW3OgJQOexggjw77Krndyt+WM9SEFSCbzs=;
        b=THwli4fzSwjWYQZ46DOvLmBJiNkHjVy0BVtupNNt6Pes7e+sVHcmba5VyqlKWtBc3E
         jF0qBajlhMplNHkraFUKq59Z17YS75nmfASnLFxVVzWux/qVhhfUsWLm324T2/3712Au
         gfY3C3NUKDBOGIWirHEft6hyhusMZvEaqSO1klb8Waqc7bE3zgVhbeIysbcFyGnR8FBT
         iB74CHzMWHc1wi1f2XEsTQrARF2fuyeK486hmTjGNbPHGF9rFmck55JD3n0YkeEWf4kp
         MNDo0yYhYUQfqPdKyhqr4ZG3XCI4kGPEHpD08h8nQdrWI7Wfvj8r5swgT84OxZQi18Va
         g9TA==
X-Forwarded-Encrypted: i=1; AJvYcCUd3OWtwZd5Z7CMf+cCY0uA27XvBJQh7vK8IJaS56fUZlAjM1Wn29XjdDvgLryEqkaArNPuDDuDwB1tXUI269Ms@lists.infradead.org, AJvYcCXo7yMNJBZXNJvp8+HXL1mlzVjZRvw+NfcpwCZQ7aOsC0ODIyuBNIF+Qbfqf1H+TpjfAYzo0OaURX7Y@lists.infradead.org
X-Gm-Message-State: AOJu0Yzq7iUKmP6l0vzhpb6CpR9OWvJ/Fq7UMtopbKE7HR2x5Nmx/H8d
	XO1A5pdR0PCdGX1SvfW5AVDPiyXUZRLC+m0ML5/5qCZcs6TjMtUup1lDuA==
X-Gm-Gg: ASbGncuGU/bCgHGJGEG0nEaqZ8YaA72B3QOvvnGHbUE8xVcFqzbYrJWPKCw973WDiY7
	AfyhPWZ746DEFV1LjvLHRa1wHFixfs2syibxC4CGVSng2MB4qdGBxIrbwqsNjd8sTCIjGdTxvfQ
	UO3+xtFenNN7Jhht8zsDPpB4u88iZfCjYbenh/8xuHCo5zFc10EhhqxxiSFMi3yIhztCPHsRSen
	R/cR0cg1BEkpo5l+6pOjGG9YidHf9t3MUGFqQPxFG6skKj7RXGd2RlENON4EFmR7ljtpyB4tVS9
	RQYI2Y6sZ897u6kH9zQkiJCck+oN8fAmNfXw+pv7CsnwrOaV8D85tSLhYqSoH9bSbelHQOIKnJ5
	Pj6nihgBXI3GGFqx08/YUfTpfF/4pw9gJK5nMK2zphnXqb4tLcDNQaEBhDZHVGHx+tKvmtg==
X-Google-Smtp-Source: AGHT+IEWt7Qj737jJHCaN2ZyByecAgGhDvAAdbgZl/B8p5LpJrELRizAUQQWktSqw+FFBr/8ZteT5g==
X-Received: by 2002:a05:6402:2689:b0:5dc:c531:e5c0 with SMTP id 4fb4d7f45d1cf-5edfde2067bmr3759805a12.27.1743275246879;
        Sat, 29 Mar 2025 12:07:26 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad73-6800-0000-0000-0000-0e63.310.pool.telefonica.de. [2a02:3100:ad73:6800::e63])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5edc16aac05sm3275271a12.3.2025.03.29.12.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Mar 2025 12:07:25 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	linux-phy@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kishon@kernel.org,
	vkoul@kernel.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v2 2/2] phy: amlogic: meson8b-usb2: Use the regmap_{clear,set}_bits helpers
Date: Sat, 29 Mar 2025 20:07:12 +0100
Message-ID: <20250329190712.858349-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250329190712.858349-1-martin.blumenstingl@googlemail.com>
References: <20250329190712.858349-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250329_120729_090712_EAD211E8 
X-CRM114-Status: GOOD (  12.04  )
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

These require less code, reduce the chance of typos and overall make the
intent clearer. No functional changes.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/phy/amlogic/phy-meson8b-usb2.c | 28 ++++++++++----------------
 1 file changed, 11 insertions(+), 17 deletions(-)

diff --git a/drivers/phy/amlogic/phy-meson8b-usb2.c b/drivers/phy/amlogic/phy-meson8b-usb2.c
index d9c761b7c15c..a553231a9f7c 100644
--- a/drivers/phy/amlogic/phy-meson8b-usb2.c
+++ b/drivers/phy/amlogic/phy-meson8b-usb2.c
@@ -165,8 +165,7 @@ static int phy_meson8b_usb2_power_on(struct phy *phy)
 		return ret;
 	}
 
-	regmap_update_bits(priv->regmap, REG_CONFIG, REG_CONFIG_CLK_32k_ALTSEL,
-			   REG_CONFIG_CLK_32k_ALTSEL);
+	regmap_set_bits(priv->regmap, REG_CONFIG, REG_CONFIG_CLK_32k_ALTSEL);
 
 	regmap_update_bits(priv->regmap, REG_CTRL, REG_CTRL_REF_CLK_SEL_MASK,
 			   FIELD_PREP(REG_CTRL_REF_CLK_SEL_MASK, 0x2));
@@ -175,23 +174,20 @@ static int phy_meson8b_usb2_power_on(struct phy *phy)
 			   FIELD_PREP(REG_CTRL_FSEL_MASK, 0x5));
 
 	/* reset the PHY */
-	regmap_update_bits(priv->regmap, REG_CTRL, REG_CTRL_POWER_ON_RESET,
-			   REG_CTRL_POWER_ON_RESET);
+	regmap_set_bits(priv->regmap, REG_CTRL, REG_CTRL_POWER_ON_RESET);
 	udelay(RESET_COMPLETE_TIME);
-	regmap_update_bits(priv->regmap, REG_CTRL, REG_CTRL_POWER_ON_RESET, 0);
+	regmap_clear_bits(priv->regmap, REG_CTRL, REG_CTRL_POWER_ON_RESET);
 	udelay(RESET_COMPLETE_TIME);
 
-	regmap_update_bits(priv->regmap, REG_CTRL, REG_CTRL_SOF_TOGGLE_OUT,
-			   REG_CTRL_SOF_TOGGLE_OUT);
+	regmap_set_bits(priv->regmap, REG_CTRL, REG_CTRL_SOF_TOGGLE_OUT);
 
 	if (priv->dr_mode == USB_DR_MODE_HOST) {
-		regmap_update_bits(priv->regmap, REG_DBG_UART,
-				   REG_DBG_UART_SET_IDDQ, 0);
+		regmap_clear_bits(priv->regmap, REG_DBG_UART,
+				  REG_DBG_UART_SET_IDDQ);
 
 		if (priv->match->host_enable_aca) {
-			regmap_update_bits(priv->regmap, REG_ADP_BC,
-					   REG_ADP_BC_ACA_ENABLE,
-					   REG_ADP_BC_ACA_ENABLE);
+			regmap_set_bits(priv->regmap, REG_ADP_BC,
+					REG_ADP_BC_ACA_ENABLE);
 
 			udelay(ACA_ENABLE_COMPLETE_TIME);
 
@@ -214,17 +210,15 @@ static int phy_meson8b_usb2_power_off(struct phy *phy)
 	struct phy_meson8b_usb2_priv *priv = phy_get_drvdata(phy);
 
 	if (priv->dr_mode == USB_DR_MODE_HOST)
-		regmap_update_bits(priv->regmap, REG_DBG_UART,
-				   REG_DBG_UART_SET_IDDQ,
-				   REG_DBG_UART_SET_IDDQ);
+		regmap_set_bits(priv->regmap, REG_DBG_UART,
+				REG_DBG_UART_SET_IDDQ);
 
 	clk_disable_unprepare(priv->clk_usb);
 	clk_disable_unprepare(priv->clk_usb_general);
 	reset_control_rearm(priv->reset);
 
 	/* power off the PHY by putting it into reset mode */
-	regmap_update_bits(priv->regmap, REG_CTRL, REG_CTRL_POWER_ON_RESET,
-			   REG_CTRL_POWER_ON_RESET);
+	regmap_set_bits(priv->regmap, REG_CTRL, REG_CTRL_POWER_ON_RESET);
 
 	return 0;
 }
-- 
2.49.0


