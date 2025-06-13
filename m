Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E9F0C7114A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 05:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tcgFdGvrxzEgL0jd0jS7Kyu6UO50T4AXfHFozAP4vvw=; b=awnGqee4ORjSaOSSwlqBjyCH8e
	xnuQ0W+UK3KYLi2goYGNCCGpUEbCUaSLIVOrVRJRJ2qnfQ8+TgoC1NT7k6eNBllPtJuePQCboNO03
	eOX7YAjUGCO3jz0eqMPWvaYf5HbANZOnsd6vLwKLfeAPvJ1GQItTy8q3V+67oIWr+WLe7CCa+spRK
	qNx9ZGPJTcfmDK/eT89y1gLm9exLs78WPQb5CrBBJt2jtkRe2VkQq+GE9brW23bvpwzpMrG6LtcWf
	e+8kiiV4HLwtsTA8YVNrpWpaGCabmRd9K6yKTr3SvRVG2wwTmt5jV/zZeaDUlr7nRoECswJsMOTag
	JBYvTcpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPx38-0000000FO93-3vP8;
	Fri, 13 Jun 2025 05:33:58 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPwrn-0000000FMtW-15Hm;
	Fri, 13 Jun 2025 05:22:16 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-234bfe37cccso22370365ad.0;
        Thu, 12 Jun 2025 22:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749792134; x=1750396934; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tcgFdGvrxzEgL0jd0jS7Kyu6UO50T4AXfHFozAP4vvw=;
        b=WeUb87Bz9QjhoD5dlG8PVSIPX/QlqR6+FtYTKvu5VWeZNKryev3F3BaW6fOZvKmWb6
         a8TqS6xw7QbanxHhLe9kJckPuUukqngc7GjqgteSeiTVEFdunpvm7EwTIgf6h0Q2rJzf
         HtzzcxYF+Kkl8unTqej1c85SECZT/JweLJRzqJh7vuYAX/ZDplnMVh5O1Z7FfsZEj6t+
         VE7fI+/AvqNWhZTpIMpXy1793xlXuQojDNqwLDG6sVY15GyL+XqQPh+3kxyktMPBWpK/
         GeMWSDM1hHnNgIjS/CJanTKPe0Y5UbieRBri+sQQekzRA9C/WC0e1uP9lasqfBDnHqg8
         zTEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749792134; x=1750396934;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tcgFdGvrxzEgL0jd0jS7Kyu6UO50T4AXfHFozAP4vvw=;
        b=cwIQEgB0gbJ5OvV9b7jI66tlbub2+lyiCTXan3pIrQxWIi4BkNaxKp7xU1S7ATKWuw
         3S0pqm2/wuG9ruxtcLhZSpKM6/Kqpq178SjwJLke0lzkcjRx0IisbIepoEXmdvSZwqwA
         uxKu22lTbv0VEnQGonuy3sbKuDlJ0vhGvFrn0wpxz6d7arQSP3wgpdyG62XhCHKnNti2
         1JgnKQ14w6spTAgU+b4Ctc3KPgWLDbDfmqOoCc3KqrStDLFKm+OuUpFgWYLBY69RLpdb
         uzuKTwULo5TCrWNjKgJormr8jElRQjK6vpOodI1O4EyHxx0FSHh3o47sf1P5KyfbbGwA
         xFdg==
X-Forwarded-Encrypted: i=1; AJvYcCUKYYjNZ3EeyiCtc8r+yv4n/oPXVT4Biw1foxC6pnHC9OGkYLTJOB9B6o8NtVp8tbG8CEso/XMQWc4JZazY6a2l@lists.infradead.org, AJvYcCWhjWipFtf3N6luqTofnurt5nvs2leF0rpp3pJxctCUjecFmlx/BLHRsijOhpkxWTayHXh210ktgQQW@lists.infradead.org
X-Gm-Message-State: AOJu0YxDXRW00dK8XdS8qMKudxZSy/duliYC803oNCW1nIgg6lxRunTR
	mfrMpiOtAYlr+1tJkauaAlQEsFMFMYKSququfSTNrcN3D+NWaRQRLXTCBvHztDCR
X-Gm-Gg: ASbGncuU4/IRwFR/Xgj0XMAOaGSMyeSFP4JVjS1ljUVHb6ffrRuzkXgTMHSdojDC6G2
	ZP1fVYoV2ZxYZkLr+vydHq4bZSg/Ws20sbLxZ8aufhsDn1/L7+gDqekW4Kwml8BRuLBuY8bJEtT
	o6tT04MRwTG0fe85f6k9NQ4vWrOiEN5Xm7ukpQWUhhg6pQUMJWdjDM0vklkA0iQDMfVN1wdquL2
	XSi5vGIAkx/oakzbgjbSAtAc52AgBy0kqwO0VZuoEU9Z6mXgO4IWKgmKpn/dTJlhep7DTx1YYKS
	HD60flK2jImkjS1Od4aWGvdZrD7T6C/c0XZkrjJehaDIha8h76MjlTnxFTPf
X-Google-Smtp-Source: AGHT+IEWyjq4xMg580lo8WQVDNAohT6B3E79VxSn35cTbl6axZCqyzY7pffkdHQBHNLWxSl9Z8GleQ==
X-Received: by 2002:a17:903:2ac4:b0:235:91a:4d with SMTP id d9443c01a7336-2365d8c24f4mr24732935ad.23.1749792134271;
        Thu, 12 Jun 2025 22:22:14 -0700 (PDT)
Received: from geday ([2804:7f2:800b:7667::dead:c001])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365dea905fsm6220995ad.166.2025.06.12.22.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 22:22:13 -0700 (PDT)
Date: Fri, 13 Jun 2025 02:22:08 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH v3 4/5] phy: rockchip-pcie: Enable all four lanes
Message-ID: <490ca50c2e002df02f8eff5e2266a4a992ce5cec.1749791474.git.geraldogabriel@gmail.com>
References: <cover.1749791474.git.geraldogabriel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1749791474.git.geraldogabriel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_222215_297611_C1C657D3 
X-CRM114-Status: GOOD (  11.19  )
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

Current code enables only Lane 0 because pwr_cnt will be incremented
on first call to the function. Use for-loop to enable all 4 lanes
through GRF.

Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
---
 drivers/phy/rockchip/phy-rockchip-pcie.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-pcie.c b/drivers/phy/rockchip/phy-rockchip-pcie.c
index bd44af36c67a..48bcc7d2b33b 100644
--- a/drivers/phy/rockchip/phy-rockchip-pcie.c
+++ b/drivers/phy/rockchip/phy-rockchip-pcie.c
@@ -176,11 +176,13 @@ static int rockchip_pcie_phy_power_on(struct phy *phy)
 				   PHY_CFG_ADDR_MASK,
 				   PHY_CFG_ADDR_SHIFT));
 
-	regmap_write(rk_phy->reg_base,
-		     rk_phy->phy_data->pcie_laneoff,
-		     HIWORD_UPDATE(!PHY_LANE_IDLE_OFF,
-				   PHY_LANE_IDLE_MASK,
-				   PHY_LANE_IDLE_A_SHIFT + inst->index));
+	for (int i=0; i < PHY_MAX_LANE_NUM; i++) {
+		regmap_write(rk_phy->reg_base,
+			     rk_phy->phy_data->pcie_laneoff,
+			     HIWORD_UPDATE(!PHY_LANE_IDLE_OFF,
+					   PHY_LANE_IDLE_MASK,
+					   PHY_LANE_IDLE_A_SHIFT + i));
+	}
 
 	/*
 	 * No documented timeout value for phy operation below,
-- 
2.49.0


