Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6D48C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Feb 2025 12:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C92cg9pDirScfRELIv/SYftxNY7no1Ol/6QVuJ3MiRc=; b=M6zVzMTA95GAmakH5jUcR9ngfC
	pJ5Buzt/TD9aWaNLNbc5+TDO0WaIjefT/49bAvzIJYZzIeXghkLpdQ8g2GeHAxVXRfdGiObfYsCNj
	kJHJk5pEfXYh9KqZ0nsoxzDtuYVflRPH9OmTAuTj3aFkMKYwl9FPPykaMhO6fqB7k67nNVDeC+IbI
	/+tDejciCo/BAYYAVTFhorEi1qjvF1GGy5+5wDdKnHPou8o0Q8s/mYYeh59T3KLx4akgDunVYOMNr
	eQ0nNPYw8OKPGSa0HUAZpBc4C/o1G0Aiv1IaOTwMM4CkFyUYF3jxNx9s5Z6R9nlrsPUT2llpNQsAe
	cnH21HAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmBAN-0000000B6X3-1CCp;
	Sun, 23 Feb 2025 12:33:03 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmB0K-0000000B4sH-23IX;
	Sun, 23 Feb 2025 12:22:41 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-38f325ddbc2so2634615f8f.1;
        Sun, 23 Feb 2025 04:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740313359; x=1740918159; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C92cg9pDirScfRELIv/SYftxNY7no1Ol/6QVuJ3MiRc=;
        b=UcQpk3RhuPZmaoErkj28frBL9UQH3VeWMp0aTLGuXldO/X7WL0dbhwXTfskIMRJXwg
         SOsQH4sepRjmmCnI369GIkcYtYD1WefGdtVacvts7bO3GlkqoAfBKWdSQsM+YRiPx9TG
         Wqq4Renm5VRcMU4lpkGf/g4iSbc1RyD1+y0uMZ7Tg2r0TdtE8tQf8e+2afiAUsxG7VLo
         4H3FSnjryKXBWatiDmLcz81tyc8Fa/5SHcRI0TycoEr8Z3SziPSxrPIGaNngkuWWaMSP
         6sYBXLQujEGGoexhA2gDcH28bSRrvbW23iCJNNgJYcYDVU0yMUy4Cqlu+XWk5W4CxmXi
         3zNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740313359; x=1740918159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C92cg9pDirScfRELIv/SYftxNY7no1Ol/6QVuJ3MiRc=;
        b=MAbQ6Y3w32oaCqtiIyrz0tvl21gQfCopRqf5dT7TG/2FWmN9sVQTLNEwPASdFYI06k
         s44GcpGsrBfdmIt8JPHBxDWtWS/nQSVImpT0kSS+wIkljc5LIpgG+dLei3EdCy1rZegt
         OA2b+vwA8NBDvwK2sNZg9FRAqV9pp4hcqN6W6S72TIMRF08I+WhVq5+8x90BTkrII0vA
         2RtlPcbG5bg3AtNjvZ/DWm1cD5yfnT4TTffG7oDcrHyRdj5NcUKAXCkgn7TyTW6Bi9td
         QV7OU+4mgWRWu5+EAzAbZF0Usm7mz0c7cJL8QbXqSxGo+vTun7Rf2mwOJAOBnIjXis84
         dwnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMkQiJffTCCX3+iihg32cs0Piu2WFMVJ5Qh9+LDIy2KqU17D500HeL0woparD39vEfRMngN6I6UzhxrjOTT3GE@lists.infradead.org, AJvYcCV9DpJiW887XQKmtwcyOFQfgFhbFUbr8n/VQzFHu1reeIe9quelYfKhF80yWYMeTbE3EDNzDPpHM5XA@lists.infradead.org
X-Gm-Message-State: AOJu0YzgG9i04x760vWiuuFv87IiXQDQUCXAMYVXCfmflCFbq8Q7l5Sn
	TB/YoADr9fDbsF4GxL6POjUaDiq0rWjlL0dgHn4IUSWCsJy3W63pE7K8hg==
X-Gm-Gg: ASbGnct7AT2NVrl2nFT1V228/KfQEMUl3KSHmClDQnZjwfJ9NFQy5XcCyLCEwcPwKlI
	3lDW2+1B2Pgx23YlI2yR/4slWUKBhomWxuAsxqxswH1tfGNh0Ls8Mm0kjz4hTtzpQmtKmb0jrJA
	fmm7FHUUh05iRPAg7BD6YaNOH7k7g2MqF899MxuRn9+hTCDEFQsrXmANe28tubA6dhmsHURRhSe
	DokBQPJ+Y8QEjqBCrQCt3bvSc6Uy0/1xBB5jqXdMzoe5t2jGXoHz6538F865Drc4SbqydIdx1yS
	SJ5VcQ5eJymCe8SQnZev2nrQyoQiak5VMmSovvdpna1tNLH9e9qKB8eVHWMwadkW++EglR+Xkg5
	f9w==
X-Google-Smtp-Source: AGHT+IHD/1fKxNbRJHEqjlek+14p9mn6PKTF//azfEyhIr2/+Ub8gP0MUCWd/hcqjMmdh1I7H/WIww==
X-Received: by 2002:a5d:5850:0:b0:38f:2030:7da9 with SMTP id ffacd0b85a97d-38f707b0b87mr8586440f8f.28.1740313358741;
        Sun, 23 Feb 2025 04:22:38 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259f8602sm29611608f8f.94.2025.02.23.04.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 04:22:38 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Abel Vesa <abel.vesa@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/8] phy: phy-snps-eusb2: make reset control optional
Date: Sun, 23 Feb 2025 14:22:25 +0200
Message-ID: <20250223122227.725233-7-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250223122227.725233-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250223122227.725233-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_042240_524735_A3DA02FE 
X-CRM114-Status: GOOD (  10.47  )
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

Some SoCs don't provide explicit reset lines, so make them optional.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 drivers/phy/phy-snps-eusb2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
index dcc69c00a..7a242fe32 100644
--- a/drivers/phy/phy-snps-eusb2.c
+++ b/drivers/phy/phy-snps-eusb2.c
@@ -420,7 +420,7 @@ static int snps_eusb2_hsphy_probe(struct platform_device *pdev)
 	if (IS_ERR(phy->base))
 		return PTR_ERR(phy->base);
 
-	phy->phy_reset = devm_reset_control_get_exclusive(dev, NULL);
+	phy->phy_reset = devm_reset_control_get_optional_exclusive(dev, NULL);
 	if (IS_ERR(phy->phy_reset))
 		return PTR_ERR(phy->phy_reset);
 
-- 
2.43.0


