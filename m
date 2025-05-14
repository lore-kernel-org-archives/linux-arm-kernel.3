Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79060C3ABDA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 09:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9TYuMpa3lECo5TxM+RObwV30bGxY9a5ZOYB/MAe2Vms=; b=fIO/qN+5m34zXG780/wx152EIv
	id1vgWiVSsq9foGvad0MmnJ4MPo6ltMm+PANgLBPyIDiHmmbJqcfF6oOuz2vNZGH9wvw+dETfPlZV
	/jESGg0GkJN0Jy68flsuMxOWFR6svtO3MxfOdz7V+l8St5Z3nWFBkWPqd8e43jPkjDoVFvgqRlDuc
	G+39mMyuBHkzYFYH1apGDS7UxMhtkCyVHJefTgfTTI9mRYF9xWMMDD7YFecAhwWAWp/8EEw2CmB79
	0dod9cSKIgmCdIyCpxq7PP5I1zSb+vRBDr3oXeGiw7b146/xRT8Pxpn4auz59KItprrY/ewvR8X4Z
	CA0sVO3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF8HG-0000000EdlR-3tIR;
	Wed, 14 May 2025 09:19:50 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF7QY-0000000EUet-2mJb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 08:25:24 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-441d1ed82dbso69218075e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 May 2025 01:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1747211121; x=1747815921; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9TYuMpa3lECo5TxM+RObwV30bGxY9a5ZOYB/MAe2Vms=;
        b=ozUy/FcwcaTqq9/+Qsk5XK8WvUPKzWH1XpQ4pNWVHZwatYX7YIm7YmSkyQT2LncJ6p
         YV6w8+q/hXV34A9sEps73K9Vjtz5ACzXeu2H2B4SlZFFeVC/7lWmyb30Wvn6qZ4gk9r5
         VFO5OfKhxzTM8HfwjpMm5OPUi6Thj9pKVA6IY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747211121; x=1747815921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9TYuMpa3lECo5TxM+RObwV30bGxY9a5ZOYB/MAe2Vms=;
        b=hElHCwOxeuO1pamq6pr+8MYqMZjjEOdA76XEtYHBkZIzZsvtqBBjT8jvDvyY7sIsHv
         /1cWvs3Ka9mlsh+PQCI34pP092JxGtOovUkEqXYSLKSB21KmAVDyBVrO7ae6MBWDuw03
         nSiM+IYbf+G5CTx9SCtLY4Q6iwvpU1y+ijehMeVuX790ZjASdrwd56itT/S494XdLN5r
         siql+T/S2nQ1gppiyeT9Y70Gwt9CZBlWTAlhXyEB1tgSzJ8U7FKNN8kJHMaL+gpeubug
         x2pDKzvqtokZ23GaiJUapi0mXbGy8Ol9Yu13y1L4TJsVIFUZ3g8fbgJ/zqGea3CbWiyL
         9ROw==
X-Forwarded-Encrypted: i=1; AJvYcCXZW6dt+Qj0/ozaVMu4a+XRu7fCxHjoBkei4ffLmfwXVnZngYeJQYberBadW7P5QGyft/HFYcnFrCYk1pM/9hCy@lists.infradead.org
X-Gm-Message-State: AOJu0YxfB3qw28R9oTjSIL4bXGOPiCtBNIZIArfivYvDLn5MkUxN4MTN
	HjRRfi0Pddmv5tW/XrTmXfjgRjMgOaI9//OOF2S08OqDQQ/9wb2UhFdT29pKaus=
X-Gm-Gg: ASbGncutyl+d7TEp3u/uV4KgbAVS0KsUFu72KdHWpGI1ROFrhGqgmmvl5oDCV/WXnZH
	tJwhp3/2PFbwbbse8nWnoHcJmsQUw+HgINWIrkfLIzY5H/QK5Or1knWXuu35SREU2gx2t28JPad
	muDjorFSMQ0/WltvJICz/V5YdIiEwX218ub6YdbYvkUQxhT2GpwYJ6I+ZyRBUydebYt8ZAolyQE
	8YWj8XlLhYwGjrBlGCqXgb5XbSFNCkkWO+Gw1CnubLC/Tq5YkZjvGtvm0CnnOpF79lPi+1hd41c
	xk7G8WEp5kPqiRIB/JlcP96utTNWFkg1tLL6AuTxZsoRqSeldQgQ9e/y+cx7GBvjs6AgbVX24Dn
	IyYTj2L0Qt7JeYjWAvaMGwJiCOH1OJp3ieWA6t23FLSHdJqzwP2JyJQ==
X-Google-Smtp-Source: AGHT+IElgZGelBk5zT2GgVn2jS8QC31s8cj0ziUv3wJ5MYE4/n7YxAgcmx5VnwG5fRUicYlfJQi+aA==
X-Received: by 2002:a05:600c:3c8e:b0:43d:fa59:af97 with SMTP id 5b1f17b1804b1-442f2179bd8mr15288665e9.32.1747211121301;
        Wed, 14 May 2025 01:25:21 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.client.m3-hotspots.de ([46.189.28.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442ebda7d2csm30987365e9.3.2025.05.14.01.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 01:25:20 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Simon Holesch <simon.holesch@bshg.com>,
	Karthikdatt Anantharamrao <karthikdatt.anantharamrao@in.bosch.com>,
	michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Wolfgang Birkner <wolfgang.birkner@bshg.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 7/9] arm64: dts: imx8mn-bsh-smm-s2-common: Set minimum value for VDD_3V3
Date: Wed, 14 May 2025 10:25:01 +0200
Message-ID: <20250514082507.1983849-8-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250514082507.1983849-1-dario.binacchi@amarulasolutions.com>
References: <20250514082507.1983849-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_012522_702104_19CBB136 
X-CRM114-Status: GOOD (  12.81  )
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

From: Wolfgang Birkner <wolfgang.birkner@bshg.com>

Buck4 is called Buck6 in the BD71847 datasheet. This buck supports
2.6...3.3V. Set the minimum allowed value.

Signed-off-by: Wolfgang Birkner <wolfgang.birkner@bshg.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
index 81fa0a8767e2..04112a83b1d3 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
@@ -144,7 +144,7 @@ buck3_reg: BUCK3 {
 			buck4_reg: BUCK4 {
 				/* PMIC_BUCK6 - VDD_3V3 */
 				regulator-name = "buck4";
-				regulator-min-microvolt = <3000000>;
+				regulator-min-microvolt = <2600000>;
 				regulator-max-microvolt = <3300000>;
 				regulator-boot-on;
 				regulator-always-on;
-- 
2.43.0


