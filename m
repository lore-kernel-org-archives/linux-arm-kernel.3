Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB29AC7114A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 18:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tcgFdGvrxzEgL0jd0jS7Kyu6UO50T4AXfHFozAP4vvw=; b=TMB52hZZWz29oo6ysi8jZmUZIV
	AAgj27xXbkqM8Cyvx7D6+efrlqROiIdcVhWgVZfiqYdk5Y6H+MhJCrwADL+TvfgBjkaTRAO9VenMd
	NmoY+Y5a97UaYqv4Xmp19AD7XCjaxU4L6Cx2ed+31lhQFhmCGoKj7alnHK7Q0iBmLAbqDNrPEDmaE
	mCO2f9DNRer2yH483c999p62+M5HEQhPTPQyUAHwN5kbkn6onJ2RUIVEutwW9ZKDdQSvfk78krVgk
	f9fMUb6Mhb4x6i3twNrvfOXjC1RoaynlEqZ750CGfLFeuB+n44HYbbiCGpXrtySClNGvjnb/z5Z5B
	NvBcxu2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ92g-0000000HIyl-2wqo;
	Fri, 13 Jun 2025 18:22:18 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ7oz-0000000H8LY-3OKc;
	Fri, 13 Jun 2025 17:04:06 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-22c33677183so21257605ad.2;
        Fri, 13 Jun 2025 10:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749834245; x=1750439045; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tcgFdGvrxzEgL0jd0jS7Kyu6UO50T4AXfHFozAP4vvw=;
        b=dZT8BLaJPbEaRQ+NTygXul3Lxmlhu0nltAhZ1Yl6ioEzj+6YHZNQSzxVjLQ8Wsa31q
         sIBKz69no2m8i1a8j4kuV8CSkDw6hOcSsNl0Cdtwtf/xKZHwhz+r9OaMwnLeOhy7c8Ln
         afDFEsZwuitUZD+iWeWZxsqnS3lhfOnXnU+krmi7BwgkgUlLFfuUew5A+uCchdvAS6uw
         bKBkGEbO8PWrHMSteOSzub3AK/0kfZmSRvnHQ2u0+Nz1cobPnLzG+uz+c4nvfMu/jHLF
         qEhRfjY72d5ENYNfYXOdQ5zjS55TnHRq+f+pzvg0iinloKbElz0lyiD/n4G0HKGivEQb
         8caw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749834245; x=1750439045;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tcgFdGvrxzEgL0jd0jS7Kyu6UO50T4AXfHFozAP4vvw=;
        b=ZA5WGNYTuYuxMjVrN2kUFS38q3vs4Hts5C1eTZWyWT24WERMK0Mxm/8caHeljWaJ/5
         cIrRwS4d5AgsMhibe1MnCUKBv2yX3M6SscxBzW9rvd6ujpBIENX/yUbprEj8ozkrj5qG
         whhOYioztiGB3zkhM2scEVy/FfeU0ZcJS4l2qxm7mfVwv89ZKSUJbMnePKy8YuXTn1OL
         QPZ7pNG6V/4iM5c3MAGuodAk2Zm1h0xM3NbOxCzfdEPRP+52Y061+u3ejQEJ7e8vY6mk
         vIaUalFjzUbe0uEtFg3P8GKVygx8DhSNfw/ptQwUS0GeTOB42beNpapC9gSbVTfajx36
         1hsg==
X-Forwarded-Encrypted: i=1; AJvYcCVnvWd5rRBMhH8jd8BXVC3enpp9OdVS7HDUehu3PqA1X3XAr3A4ise7f5YnN0RCqBL21PNtQSww4Osg5NmRmN5v@lists.infradead.org, AJvYcCWr1L7KbWH4tsXMSX523imAPxWI5ZJicE1nAqFrma6jDGPeF4kHCH6gRmruwkC+QbUxxZcNL9WvF4qO@lists.infradead.org
X-Gm-Message-State: AOJu0YzhwcRz6KITVyRg78yyAbN4gNnZOmUHpMYiGduUPjeh4PDqeF3X
	e+//5tBCzG/mFxu1mmzZeTLal2i480HX34aSHpQkO8hZrdg2t8smseyM66bNM3Jl
X-Gm-Gg: ASbGnctd0+0TA0niLe4eytKYPqiMOF//ZMq9r8QFYL1PqhRaMODsVi5v03kief7oTXP
	9FLsZLAkGCud7om9XLNeg6GzSvkQK+IIF2jhYhf1c4zhjaNv33V97Ehr3jFQ1TOCWidUw9ZVRnz
	Gh4iXpzfsXkQVBrNIa6mHe+CVGWvl82WucMzzM2ZyCpbmmtywuV2EC/X9ssv64v2sQob4U1o52e
	odydHKPjoHGBFX5LGZVe/9Zu7LEA0scr51RV50v5f+DvqgEZD3kd0/OAPxYcU3LDTMqmUSznXvO
	BinaLzyHMhBloZMRh9jGEhdpuwN85D/mPJazmEzU78J3kyx9kw==
X-Google-Smtp-Source: AGHT+IEake4Oyk+3VD3p5nQZUX+vQxvPT/Si+3TYxp0PC+ZuZKAfc9NiCG381NhK0913uRvKjkWB7Q==
X-Received: by 2002:a17:902:f90f:b0:234:ed31:fcb4 with SMTP id d9443c01a7336-2366b17b65cmr3388205ad.41.1749834245130;
        Fri, 13 Jun 2025 10:04:05 -0700 (PDT)
Received: from geday ([2804:7f2:800b:8497::dead:c001])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365deb0484sm16748655ad.142.2025.06.13.10.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 10:04:04 -0700 (PDT)
Date: Fri, 13 Jun 2025 14:03:58 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rick wertenbroek <rick.wertenbroek@gmail.com>,
	linux-phy@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH v5 3/4] phy: rockchip-pcie: Enable all four lanes
Message-ID: <ce661babb3e2f08c8b28554ccb5508da503db7ba.1749833987.git.geraldogabriel@gmail.com>
References: <cover.1749833986.git.geraldogabriel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1749833986.git.geraldogabriel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_100405_841389_8535A092 
X-CRM114-Status: GOOD (  11.23  )
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


