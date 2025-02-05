Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 283EEC02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 14:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZEOAzVx6WPB9stA5mr4n7x/fL+LclH0gvOV71KsByXY=; b=2CgPf/m7tLzUyJbXA66BcOrK+E
	X/nINwis6wIw8dpS6Hp5fqsJJHOMBxDuxJJc2ZzLFzx5zSV+Clx2KBv+M0qKC+McgzxLdC7kQIMmf
	A+Mio2pai6IdpSleX1dmCmQ3LwpMD+N+hleRyAHPNVxfS5YewrOR6e+232SoN27y0AiX3/eAwLK4M
	7OZMV8eQclSMZb8IC7X2ah1/pxQbpt+v1FhhtOj5M6L8Jxg1N/KozDgqqQ2WV4VdyKMxmfidu0orE
	JSa1WLy4Bu3STUtjLgOnWHAGxI7qVQwuQER+Iw3Ic3CB05RntaXTIDHjI4idAtP1zj65TQ+fJK9wK
	szRq1FpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfgCH-00000003VZW-2X41;
	Wed, 05 Feb 2025 14:16:09 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfetU-00000003HsB-1KOR;
	Wed, 05 Feb 2025 12:52:41 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-aaf900cc7fbso1383304966b.3;
        Wed, 05 Feb 2025 04:52:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738759959; x=1739364759; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZEOAzVx6WPB9stA5mr4n7x/fL+LclH0gvOV71KsByXY=;
        b=Rx0oBpT+u0IEmjz3GNnYxkuk+3QIeSwVU7JC8BmUxMFF8kyD10GPrvg/dwCW7fkxuz
         +zjlrM3AcwmOVPRPA2UaUQudGVNJis7x/mjOAF+1N/vJ5kOd6LVOZh/Sadt10Em8hraq
         JgpADOzT12oMDMXdHVvTewSoFAIOkj2RRMM43f6rjjyCarI0/UqELw/mh4NYJQGlwWTX
         cP9sIJEOZAib0Q7KZrOPB+loCdj48DDx+Uwt/JkQFWHdq44J8nRXJQoCoLFTYqzhEVlt
         0O1geMQWinbtOUvfHk3eIjqi1oTikbyuFsP77ETI6P4kC2TybwLkzy9l2hyPxyLAlsBV
         WdVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738759959; x=1739364759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZEOAzVx6WPB9stA5mr4n7x/fL+LclH0gvOV71KsByXY=;
        b=IikbQPnpD8Y7NOoQJdC+YbZbgydH7VFAYwW4uHvaMfaMykEDq4NQ+jJlb07wEmU+Mq
         JxZkvVh0QhPNT67rQj+KQceFNUf8xv8pKCMxZW/967dmcWu/X7D/Hi/39EUo0XnvRH0c
         pAm6XrSf1/PCRdbocIYsqAd5+knwSz3Eey9pB1SnbECw7lvhXG0ypA4G1Lj4v2xZWF+m
         AUffl1vM9LaMNXt5QJSH5CjM02mEgKRLh1kexJq8oN4jpqUzjwfAKUs4OqQaus6GmNLp
         5zYQO8zfUqiktGkOAP/6qhHMt/uykv3bcZPvLRuF/3T/YOWBTcfRzU5e3vhFTz6r20hw
         96mw==
X-Forwarded-Encrypted: i=1; AJvYcCVRZsjQoV0A1y7iiIunezkWrlgWM5BaJp+bgsM8MfKXiohj+/2JBysnDZWM4o8ih+kKmo+ustUEPmooci2BCbBh@lists.infradead.org, AJvYcCWJUHRuftwbYnpSNyem0uz+GVCIcSbLHn1GeR1WyWxew+7ni00WPchfkaO/eaxVJefy4Qv++4DyqBM83no=@lists.infradead.org, AJvYcCXEVJ5xkZE6HdKOTQ1Q95Ar8T2RZoMZqpmsSSV1fLEMFHifANbJNW3DjkkTJiHYDnGngdno2FuQknh5@lists.infradead.org
X-Gm-Message-State: AOJu0Yzy5MFb4PxuWHdRQXvswcac3pa7YDfZG9efGul6cm4IMMtUvH9W
	iLiASDLmV9Dk/IpIEUp2ToGuBjFjYE+HYN/61Aty1k0Ut37TAWDc
X-Gm-Gg: ASbGncs7pSwUkbgtmKY7DAb2KaTvrRcECHVImSz8ouwhWRQOiqPNgIPtf6IZDFOFxjZ
	5FCy9NMPtiBW8hwmG/8Kc8Ta/PmKnWQrDjPPw4tVX0UOkefrgv5DTWgSnriYYiOafJxcFJnNWLg
	peuYO/HtD+aip3gOYAjte20oB53f7z+RDofxIARVnsAGO4WdaL5nkDxNRbA72ahd2MEbczGayDE
	rwYphWPg39uNOS3r3KCgfAa+D1Oa2VcVVBII0M0vrKdYF5BTqYQ0pqqWN5sTPWwLfmDXOeFW5Js
	LPcZA+MS+3/VFzxeuXFsVmpTW9pQ6KOab5wyYc0eHa35sA==
X-Google-Smtp-Source: AGHT+IGXrMqsMiP0zkOFbpXcUy0rvilFMJQHNVAo7U33xcsXTT7GzHgk1vRH+nlowH9w2lytesYKDg==
X-Received: by 2002:a17:907:3fa1:b0:aaf:86a2:651f with SMTP id a640c23a62f3a-ab75e2fc295mr281783466b.38.1738759958692;
        Wed, 05 Feb 2025 04:52:38 -0800 (PST)
Received: from localhost.localdomain (185.174.17.62.zt.hu. [185.174.17.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc724055e5sm11559997a12.45.2025.02.05.04.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 04:52:38 -0800 (PST)
From: Andras Szemzo <szemzo.andras@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maxime Ripard <mripard@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 06/10] pmdomain: sunxi: add V853 ppu support
Date: Wed,  5 Feb 2025 13:52:21 +0100
Message-Id: <20250205125225.1152849-7-szemzo.andras@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250205125225.1152849-1-szemzo.andras@gmail.com>
References: <20250205125225.1152849-1-szemzo.andras@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_045240_369475_543648AF 
X-CRM114-Status: GOOD (  11.08  )
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

V853 has a similar ppu like Allwinner D1, add compatible and the available pd names.

Signed-off-by: Andras Szemzo <szemzo.andras@gmail.com>
---
 drivers/pmdomain/sunxi/sun20i-ppu.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/pmdomain/sunxi/sun20i-ppu.c b/drivers/pmdomain/sunxi/sun20i-ppu.c
index 8700f9dd5f75..9f002748d224 100644
--- a/drivers/pmdomain/sunxi/sun20i-ppu.c
+++ b/drivers/pmdomain/sunxi/sun20i-ppu.c
@@ -182,11 +182,26 @@ static const struct sun20i_ppu_desc sun20i_d1_ppu_desc = {
 	.num_domains	= ARRAY_SIZE(sun20i_d1_ppu_pd_names),
 };
 
+static const char *const sun8i_v853_ppu_pd_names[] = {
+	"RISCV",
+	"NPU",
+	"VE",
+};
+
+static const struct sun20i_ppu_desc sun8i_v853_ppu_desc = {
+	.names		= sun8i_v853_ppu_pd_names,
+	.num_domains	= ARRAY_SIZE(sun8i_v853_ppu_pd_names),
+};
+
 static const struct of_device_id sun20i_ppu_of_match[] = {
 	{
 		.compatible	= "allwinner,sun20i-d1-ppu",
 		.data		= &sun20i_d1_ppu_desc,
 	},
+	{
+		.compatible	= "allwinner,sun8i-v853-ppu",
+		.data		= &sun8i_v853_ppu_desc,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, sun20i_ppu_of_match);
-- 
2.39.5


