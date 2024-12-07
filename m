Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65036E77173
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Dec 2024 01:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RH3o/9bbeFcVlZkIN5EOi+1jWB15nl+IjEgrvkeWavI=; b=nr8HZBL7ln8qz53a6rhOOlIh3+
	+NAKf33JLDhwg8UCPODIVfDwiDNjDiLbNUbLkKJ7ZOqfsA3SeTAG929ddWIKyXufrN+tIfOFrLyHW
	r/T+sH6pd4EWfjpL5Ffz1TeP3h6zla5OlcDxfR+eKHgmZWbpwqHpdaCLBnlIdUKOVB1uKv6D5jtO7
	JmKDkV6C8zxiTP7+pDVchNQZBLMkRFo4HsbUHAUbIGwVGLRj/YDRAUYHg0NpejcIGC7E6MTvjpoEW
	92opOVovD9d2gSKowiNuSO96KM3bXb7fBDH2xtWHs2UapowZ8qiMWxRezbpDUXUNDDoUc6+/uFnTJ
	acbNgaTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJjeg-000000039Zg-3VNi;
	Sat, 07 Dec 2024 01:30:46 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJjdd-000000039Tc-3Svd
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Dec 2024 01:29:43 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-4668d7d40f2so22725651cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Dec 2024 17:29:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733534980; x=1734139780; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RH3o/9bbeFcVlZkIN5EOi+1jWB15nl+IjEgrvkeWavI=;
        b=NJ9TYmmRC4H0fygaulYkzQOlRmAvtd0/vCxOvBw6bX+NZPGtKC7ZF9398oeYLE9o15
         c38/0zLc4hM5CCZ5SSgctEAPs5GmZCo1ekMznR1951xyGUL/G+V2kGrcC1SVfMuRE5OI
         9b9bPPXq7WXDc7Ro9+bjwKjfJpPoygMnEFhsds6WNe7yEjagoE6lHtq1Lo+fOW5hu4dn
         0acnAK8K7lLhLNPK9bk59eOThymyf9dlc0peumIGyCb1qgJ/kSbEr7fPOXUuAXT/kwga
         88xMxuVO0/WZHBDDJXQQCIQ0sgMl5ldegPuPznCZz8EDl8nELWRWaYubdiB4sXwY2OWY
         TDdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733534980; x=1734139780;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RH3o/9bbeFcVlZkIN5EOi+1jWB15nl+IjEgrvkeWavI=;
        b=fMgDuRiHlPt/WiDNxM7QH13p2LGxYi3t+b3yapIxOUHUUx27lKHnq6MRGHCRvQheRX
         BAgoHtMQ/7I0GO81Eb4Zf62osI0Lr9Ri3EV3coI/JL0d53ZOhlQxxgCiF5bPykwOK6jP
         XXFApkYFdTGIjkcM1dssYtoS1ab5NZHlm2MPruDIFgEb6NCobycIRwHDlbGF3MfNsP9K
         GK/uL+ihgosfmJ2t7Myf2wtbDb/RUEr5qD+sEnuHIy0USVAtl0JdvMdCJSrH1vQtnlvy
         9fsfwkBPqCkrmiOLxkIqsJvCWU7Rx6w4gjpGBJTlUrsSCq6kxhlQg4MwTuKUuYrMg4ww
         l8ng==
X-Forwarded-Encrypted: i=1; AJvYcCUgbU8utsk9E3krKuK34J9E3X6sJeyfLPqbTWKSfJsBTTotga491xVLtfvzS9JlAXYQ0He4sOYwKtN3Up7D6AaM@lists.infradead.org
X-Gm-Message-State: AOJu0YwHmz9FSDCEpFyWSfBb22Q0G5ocgLfpWD2WmIsm+WCFSxHQqFDI
	HUzp8YSHSJsL5eDsZ7HFByGTgCYXgsDWQv2H+FuQWIlBDpLYfmXG
X-Gm-Gg: ASbGncvtfiX5W3MpTLtJY1vDfCZjFkffXZjbbO1Ids3ghhlAw0PuGSqUT8Dqvmyf+Ip
	B4VUxasYedM/idLXCEKjZkGlEt+enVOvIF4fSKHdXRydgYFvMXYsHB4MXOdNl/OhQTW/AUTw/z1
	jo+BGJzgQ5T0wM8Jw0mhBlgIsfg6X9Ts1xopBokhSQOPkWl3SIWFp2eeqnbSz+widPQgjY4YdBb
	fRqVs0fyDqdl9GFLUix8jTTOr3ywYBUcxwv0kgyzD+Xsl99rSm2rCS3kcL/0w==
X-Google-Smtp-Source: AGHT+IHryNFp2D/1XDHNwPuVlv5N6khcikGDnn64EfjaaFrKAlmCc89G8uNfZpWRrcmN/09WPQHi+w==
X-Received: by 2002:a05:622a:22a9:b0:466:ac03:a714 with SMTP id d75a77b69052e-46734db8b01mr93986971cf.36.1733534980510;
        Fri, 06 Dec 2024 17:29:40 -0800 (PST)
Received: from localhost.localdomain ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-467296cb98csm27101141cf.30.2024.12.06.17.29.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 17:29:39 -0800 (PST)
From: Mingwei Zheng <zmw12306@gmail.com>
To: broonie@kernel.org,
	michal.simek@amd.com,
	linus.walleij@linaro.org
Cc: linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mingwei Zheng <zmw12306@gmail.com>,
	Jiasheng Jiang <jiashengjiangcool@gmail.com>
Subject: [PATCH] spi: zynq-qspi: Add check for clk_enable()
Date: Fri,  6 Dec 2024 20:32:58 -0500
Message-Id: <20241207013258.3615645-1-zmw12306@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_172941_900672_89E1703D 
X-CRM114-Status: GOOD (  11.97  )
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

Add check for the return value of clk_enable() to catch the potential
error.

Fixes: c618a90dcaf3 ("spi: zynq-qspi: Drop GPIO header")
Signed-off-by: Mingwei Zheng <zmw12306@gmail.com>
Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
---
 drivers/spi/spi-zynq-qspi.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-zynq-qspi.c b/drivers/spi/spi-zynq-qspi.c
index dee9c339a35e..ae8a955bb6f1 100644
--- a/drivers/spi/spi-zynq-qspi.c
+++ b/drivers/spi/spi-zynq-qspi.c
@@ -379,12 +379,18 @@ static int zynq_qspi_setup_op(struct spi_device *spi)
 {
 	struct spi_controller *ctlr = spi->controller;
 	struct zynq_qspi *qspi = spi_controller_get_devdata(ctlr);
+	int ret;
 
 	if (ctlr->busy)
 		return -EBUSY;
 
-	clk_enable(qspi->refclk);
-	clk_enable(qspi->pclk);
+	ret = clk_enable(qspi->refclk);
+	if (ret)
+		return ret;
+
+	ret = clk_enable(qspi->pclk);
+	if (ret)
+		return ret;
 	zynq_qspi_write(qspi, ZYNQ_QSPI_ENABLE_OFFSET,
 			ZYNQ_QSPI_ENABLE_ENABLE_MASK);
 
-- 
2.34.1


