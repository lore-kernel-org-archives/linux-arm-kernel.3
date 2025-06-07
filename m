Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72B31C61CE7
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Jun 2025 11:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4zSu1izb4tWJDTxLhqSImmpcJMMSBIL+shCUHw2Xsjs=; b=PNGynqZ5WIQuW9/Cq7PSlnBYYj
	T3uOqr3Fl/oF35yDB+IecWvI5eDFG3QG/ZtkgJCWPxt1hWZ1cZm88XokBJ1Blyoa8c+9WWgMuynbS
	Fky9aD6Jjjch/d/J9LyTL9FVZ97+zwA0BS84ZDz3TI/wRJ9ESQLzkEg37csEVserqJxwyyPR38zAV
	492Tt7wvyYaBI35dvDA7zp4SKdLGdi6mfzH66z8g2dWtRCKJn55LJTB6kYFunVnYIpvBrfUsa56rk
	0gYHmKKKZKWsgbnY9w6KceiDeK9WN/bvQnEdtDRtFSl09HukGirXNP3Xyx2njMbmaTGnyo/3xwkPp
	H0YZbzGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNrSv-00000001aSp-1aNG;
	Sat, 07 Jun 2025 11:11:57 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNrJ2-00000001ZSo-0CoY;
	Sat, 07 Jun 2025 11:01:45 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-7399a2dc13fso3321586b3a.2;
        Sat, 07 Jun 2025 04:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749294103; x=1749898903; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4zSu1izb4tWJDTxLhqSImmpcJMMSBIL+shCUHw2Xsjs=;
        b=Yc7FUKDe4ke+pLdz+7xvC8XH1Lw1Ew5TyduyY/znWegmM70Yt0QPMA8/1H1yB9bgu/
         hOd+kyKx53UgUBPk/w9JZjX9KLhx3YDW+H4xX21vU28SRC58rIpyiHXWRMFUSIUz5EdX
         NL5rtWTRgTLmZBjEs3MntoGo1YUEv0P9RaltUb3mWJrg6QXQFQyDKUDFTR8rO9Pc2doG
         8HT731SbrHh1O6ck5Bej+RkJbsS/uREpKwjeewzAHxUIgDNnw3HsJdoP9aZCmqCgHxto
         +bUIII80mZbaHZ4Gxk6kLE4phC0I2qV2dyT6e2Bh0sIlijQageqMDiI9HZcBNALXeVwe
         vOpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749294103; x=1749898903;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4zSu1izb4tWJDTxLhqSImmpcJMMSBIL+shCUHw2Xsjs=;
        b=nJNxL8nG0rdQKR3GApAHvq74XOAA15eSswujCNwUPu2yHkV6NscapwxJcyTMEIamCN
         1oNLp3ElZQ4dDed7AGRfK2SPVbFsBxueOXEVDrT59NEtuev1Xm+uTnsmIa2OaFMN2UQT
         2iTLjLGNVpmqSDeZPbMRvOwVbszMwtkIQfohN8g4HmBC3OYPAvDVF9fhUaNOii1L8mUk
         8t/wPBrDydTkVKG8oxdY4o17FylSZhKceba/2RrtJsdWvsu4CWF+9DCayYg0OLMbTXUW
         gNWe76mhvlJpLU+rmqrC2SN05tjeaZRhGly98zvGflB9HKzuooNwOtZX3pg3xBZ0RLNg
         f90w==
X-Forwarded-Encrypted: i=1; AJvYcCUaEcq+62obuDzz3/KxrbfHgwW1876smJGLQRlc4yJpJxLLaia6WsIy2PANCnLezUY1KkstXtaO48ratP5fVfzN@lists.infradead.org, AJvYcCXQsw7rnoxoDqPMe89S6N6nmixvE++VZgyR2WPvT5VICSta31NO2rpdKwOtlS1WVK0oZB3IbWHxiiQd@lists.infradead.org
X-Gm-Message-State: AOJu0YzDiIcUKwDto4WEhQ3lM9wFoj40lA7zyz5wCrxuhCc0VvOABNHY
	TSLt6BO7tuCvbIJppgkGuJ6fwNh9bZg29vYh9Suc3gFhMOg8J1FAOosBVfrATQAn
X-Gm-Gg: ASbGncsxMWwNexA1QIYvkjjWqSuX2q2zKIpqNVCF9sztCmVS2JtDHKctowKL6DixiyF
	Jz8xwz8ZSIGCXwk3JVuNssOnh18Qi5BBGe9k/TjBAkaBTQPid8EHeOuOLws/oCBSaPqYMueyhg6
	KZ3beLEJYZVPgY0VjB9OBI1DsBrM/RL+/2Kj6knEHST1A6mBvft+mvzgdicFNg6VaTDTYgQZMh/
	SefP053B3y+wl3r7iV2JUGlLha3k24c4MYZ6AjzPLzMk5bfWARcd5CO4BTsm4iv2jf/KoJmV8t4
	AyNSji3rY6ncYffBYccreOlabAX9D9cgQpAdj9d3NHQKKOr57g==
X-Google-Smtp-Source: AGHT+IG92XPX/rE2LJZk4TUNKBW2ws8nFw7IMuK4bikAYNrgsCpmBPTBH5f+Tfm01lqMfPjIBc4FJg==
X-Received: by 2002:a05:6a00:4884:b0:748:3385:a4a with SMTP id d2e1a72fcca58-74833850decmr3053128b3a.23.1749294103248;
        Sat, 07 Jun 2025 04:01:43 -0700 (PDT)
Received: from geday ([2804:7f2:800b:2bc9::dead:c001])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0847aesm2611189b3a.105.2025.06.07.04.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 04:01:42 -0700 (PDT)
Date: Sat, 7 Jun 2025 08:01:37 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH 3/4] phy: rockchip-pcie: enable all four lanes
Message-ID: <aEQcEbfF05JwZVKs@geday>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250607_040144_086346_6114785D 
X-CRM114-Status: UNSURE (   9.80  )
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

Current code enables only Lane 0 because pwr_cnt will be incremented
on first access. Use for-loop to enable all 4 lanes through GRF
register.

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


