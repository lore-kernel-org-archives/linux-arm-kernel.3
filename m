Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D401C7115D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Jun 2025 01:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yie4J6/XsAs1Q8lv5qOjqiXHg7FYWZHizYmDgi4UuNs=; b=HynTUCs8KefkETyfjuym0FKWcp
	AeFNBvIxwCQPAxMIMRiO+lbiVG+KaMdSSFt0PsWe1Od44MxrA8FtuJRTYQ0QkjlJXTlS4fCKYuynX
	YVIkoV0/iffe3x5RolxYkj5LhJnqcpS/5gipNGiw/TC0gpsk1aP5HdzQUMi/W74FzCX5G8Z7pl84b
	gG0ucxpEVoWZSh5Iqwgx7ABF+NF6RiQOvRU6OQIBu51j1Fe1xAvgnSVEOcwE1MszhBBkH3QVKLCCC
	Oov79/I+PSH0mksnxXObfYfRYnLSp2rfI/+EOhmIL74BF8g45+OF+cRXyV0uAtUy7lWzMyfk7/CmC
	ERHrkXGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSnTs-0000000Gwq9-3DvV;
	Sat, 21 Jun 2025 01:57:20 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSnLg-0000000Gw2P-0n2x;
	Sat, 21 Jun 2025 01:48:53 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2353a2bc210so21735725ad.2;
        Fri, 20 Jun 2025 18:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750470531; x=1751075331; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yie4J6/XsAs1Q8lv5qOjqiXHg7FYWZHizYmDgi4UuNs=;
        b=Sa/Px293UMki9VlkC4XlrIC+AZMrKE7xk4eN3ak15fWYR98J2iWhOluXEOZTeC3NAb
         I2fh0q4Pi/YAx0STyPEU5Wha74FeZoZau/fuQ65+JL73wS+fl1cdHM+tysmR4uy+SiPw
         m7MU1e/rh3gyJiy5Bf9IPtYGJ8AgVxnubrE7RmADqiKlY7wrSFl7Z7nEnxZY1Ru3UzP/
         Ka4p752gONZhzoyU1AYndCmKeOTXwH1ncOUNNe/hCxcgEb1HRq1AHvBW2o9fajOu/YU3
         LR4wORXdoviVhbWTlcet+DoDD0Vy5+xeoq/BmOx14lcYj/bvpjI1YA2Jqn3SrRcXhKpx
         EbHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750470531; x=1751075331;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yie4J6/XsAs1Q8lv5qOjqiXHg7FYWZHizYmDgi4UuNs=;
        b=GbOuzOLB0ILCBl9ZLAz1Cvg056nht7uZDj8cbHPWrEx8TzXmkdpqT7MtAZ2ISs0BFS
         xubI47KfVZYODUTvVKs8zYSN9LYW95mUSWEgEfzt2+iIADraaIzzLOr+tHcabeM2imKQ
         zBPKdxP/Jmgm7FdznipBQhDOHcj6GS9EE1Au1wjS0s+HwKHuZTqu2VL6UD5cS5rE5MpZ
         zW6V214BI2CAwotl78ngb+ouAryompklVnJRBRl6lulA4yzeuETMmVgriluQcZmPnTez
         6mSIT1Af8juBPVRfsgOvIw4SNBb6vkngm0pmMql+RhYqeGiBIO7YF4qsrDeK8FNlclBE
         WlSA==
X-Forwarded-Encrypted: i=1; AJvYcCWz9f+whHZslmKXcu9nIjD3yziRELVxegG3JRsJqzk/tcFj1TqhX5QcJR+ZVJoRqVSiOh4i4iZ4fTEr25fBfCHG@lists.infradead.org, AJvYcCXNJS3rZ2ayzvy+A3CvmfA/ioYKkYa1o986HTYV2rbEnCycu4n/gIB0LeUncrjWhwZd90FyWyZKuCG5@lists.infradead.org
X-Gm-Message-State: AOJu0YzOhxbkAUSnStk6N+UaTblHcX0gXqzdO0pwlAPrSCRMvt3YnqFP
	Vi7DKJb+pGq5NbRjKkMK/03SaJuDKwycJCWzqGb0DRAaTpyx7uDzvHItFWj7Vx42
X-Gm-Gg: ASbGncteSrzbnjnmRfARYDL0bUILEjQKsXB4eidfxLYiTDf86QfN85hZ+w4r+1onYi8
	z2wg+GaH1UGpXJVpsVzfAN7GrBujS4f2PyQ2sQdbY6KxJFgqL3UHR79k1h8Gri3ONrRWd1c4JN9
	C425RIHBu8/GvivDUZZZw6S/OU0C+XUGicHyHbyv0G76vOM1iKz5aB/YEpxjafVmnVmj3Wz7l6r
	XM4vhKjx+TYmuWAqvjdsuUWHmmGUJKwVBzJxXkok4eYppddGYYHCI8zU/IRNQkTL7KhnRarPx/z
	kAvOiTGOt+K8YkS9ryqOGDpwqx2FbE0hM7qINi7ZMCTEQN+UHg==
X-Google-Smtp-Source: AGHT+IE6jUjT6swykmz/FymvMeohJed+3m7NKFOTEFnfs7/VIrYSlH3zczi5Z7eYucTtW8YKTwW8BQ==
X-Received: by 2002:a17:903:2302:b0:235:7c6:ebbf with SMTP id d9443c01a7336-237d9967be8mr83535185ad.35.1750470531451;
        Fri, 20 Jun 2025 18:48:51 -0700 (PDT)
Received: from geday ([2804:7f2:800b:d1c8::dead:c001])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3158a24c3f0sm5236869a91.22.2025.06.20.18.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 18:48:51 -0700 (PDT)
Date: Fri, 20 Jun 2025 22:48:45 -0300
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
Subject: [RFC PATCH v6 3/4] phy: rockchip-pcie: Enable all four lanes if
 required
Message-ID: <b203b067e369411b029039f96cfeae300874b4c7.1750470187.git.geraldogabriel@gmail.com>
References: <cover.1750470187.git.geraldogabriel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1750470187.git.geraldogabriel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_184852_225774_8987BDD8 
X-CRM114-Status: GOOD (  10.53  )
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

Current code enables only Lane 0 because pwr_cnt will be incremented on
first call to the function. Let's reorder the enablement code to enable
all 4 lanes through GRF.

Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
---
 drivers/phy/rockchip/phy-rockchip-pcie.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-pcie.c b/drivers/phy/rockchip/phy-rockchip-pcie.c
index bd44af36c67a..f22ffb41cdc2 100644
--- a/drivers/phy/rockchip/phy-rockchip-pcie.c
+++ b/drivers/phy/rockchip/phy-rockchip-pcie.c
@@ -160,6 +160,12 @@ static int rockchip_pcie_phy_power_on(struct phy *phy)
 
 	guard(mutex)(&rk_phy->pcie_mutex);
 
+	regmap_write(rk_phy->reg_base,
+		     rk_phy->phy_data->pcie_laneoff,
+		     HIWORD_UPDATE(!PHY_LANE_IDLE_OFF,
+				   PHY_LANE_IDLE_MASK,
+				   PHY_LANE_IDLE_A_SHIFT + inst->index));
+
 	if (rk_phy->pwr_cnt++) {
 		return 0;
 	}
@@ -176,12 +182,6 @@ static int rockchip_pcie_phy_power_on(struct phy *phy)
 				   PHY_CFG_ADDR_MASK,
 				   PHY_CFG_ADDR_SHIFT));
 
-	regmap_write(rk_phy->reg_base,
-		     rk_phy->phy_data->pcie_laneoff,
-		     HIWORD_UPDATE(!PHY_LANE_IDLE_OFF,
-				   PHY_LANE_IDLE_MASK,
-				   PHY_LANE_IDLE_A_SHIFT + inst->index));
-
 	/*
 	 * No documented timeout value for phy operation below,
 	 * so we make it large enough here. And we use loop-break
-- 
2.49.0


