Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B85CC83029
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 18:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hXeS77/kGdjI+bypW2RtRvB0CsC580lSSASyDeC37uE=; b=MwLVcC8457xBplbYqBdKtcw4/R
	gI2eyYEaI/7AprBvxPlDcZYah4z84fT3u3AtyrVxwD/cvEL1EyTfpwkiTBfh2xDrCritiVtPc82k1
	RSNmvwCmJMjkbFkDQLOclo8VYJ+QbLXepuW1hyvc/eZLjZBfqH/fotQyzMi0Ie4Mdo8nbvKcH4yQP
	wJg3yvkk2I4aaxVdyV5njeJOZ56zsv9ajdzoekg/2qScSipOmrzz8PsyeuVXFcrG5zFo7Iplsobxk
	2ZRByqJVSk9jG8jPxPbhJywKAD4pEQe2K2bpFcpN/wgferb0+wcaSIfw454y8vv1PEGFRifOX6kDK
	Kc3adohQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWJQh-00000003Dcr-2jNm;
	Mon, 30 Jun 2025 18:40:35 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWJ8r-00000003Bl8-3ec7;
	Mon, 30 Jun 2025 18:22:10 +0000
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-7d0a0bcd3f3so508584585a.1;
        Mon, 30 Jun 2025 11:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751307729; x=1751912529; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hXeS77/kGdjI+bypW2RtRvB0CsC580lSSASyDeC37uE=;
        b=H0fCzokq7I2Tvo9F1Y24NqoTkhhQLMyaDwgpiBerls2/KhwW6z2AKLHasN3k6RskhS
         097TKsEdi17hmpBVwtO3yRS2QfRZvc06wKDW9HJW3BXiLK8mHK+LSVBUGAjp6HzipTEy
         6+wnazoqLmMNWJ+ylO0BTYEB80ksw+uiFQiqigDubLFYj9dDzak0hWOAjxUfo0allN4v
         N+aTefyRhYVRMA44ApCYOeqgHkY48+SDG0pGAzeUsoGPwrEaaAGXUQn3CKIjfAt0ilA3
         SL3FpOGempQxHxiLfiVIl8wexc1NPNZoNaxUsl20HNIgjXO9s2QplG5SXLOqRX3Admi8
         C7sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751307729; x=1751912529;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hXeS77/kGdjI+bypW2RtRvB0CsC580lSSASyDeC37uE=;
        b=Y929W3OFXguUtQgFjE2uwBcnqAX/guQB8pSzs/rpaExiQTBJoPqW5iW861r0ZMbBs1
         4LbnA91zsYk86QU+XpD6gPdheMvwMDZMOFFvsL7nFSZ9BzWh3rEfIt9EBimCRxVX9wtK
         EEd0/ePgcXHz91wJPQWkoN2xq+SKvB+KnKJaWiVCtnyCjqrXEj9G+yN/o44r0owLumHo
         +kg0lRrpjqS8huK5OifcpweD4wdgMD3EVpzE/Rc0TDyhCmCpV0sKSAzaEe7mGw8g8oTI
         nESydNAoixxxG2NsBR4DANk/HkXrmuLvd2jj4iRGGj1Noq+WJF7KSiimD9VR4wX8X3um
         q7VA==
X-Forwarded-Encrypted: i=1; AJvYcCUoMcgGraKgVGF9YnmzTs6deyR+djr0u8Yh8bFmdEnTikOYRDolZ668I7sQZHRnLMEoivc2BhVqkGMe@lists.infradead.org, AJvYcCUtIjgTzRCoF83Bq4yCNc+EQABQg4v0LAAlilgbMGb7P0v1/VcRwqiNSdsVsWX+JCG2j3zgQKEr8FpJwYmk/KnG@lists.infradead.org
X-Gm-Message-State: AOJu0YyScR85ToJwO/GVeRsLFhelSFWXC4u7xaezGnpF+hy8JLyUMF7O
	/VIFB0aSBB/sXqA0EQB8tqSqCCgHDUWx6Z10nRdu1o6aclAnYe5gQE7wmSRKzdh5
X-Gm-Gg: ASbGncu4i45VYbgTFqr+I/VyhBNS3FH+4lwTXa+ldj4X8XW2DN6NmrtEp6eOmh2+ga4
	2cFFmiYM2Gnf/mBSf0+8JD9OiyQrtY/dSrPlV09JSYqZzqTj8kj4FKBX4+PpTPGOOUq9ldLyvoN
	y9X5Uk3wkeB7TNsMelFj4FiI37QKgHQrRucu88287gB0AhStsLk88ZVenrK/KCGHDTF3z474hdk
	2tAphGcB2kZZi6cSBOlC0xU9R49LsPWPGmPR2+2365REeZxxvKEJwUqhxTKJ5pKJWPI6o4bhcJY
	wiW+2tCm9aIwyhwwo1SNqUNs8tmlxi/+QwTRITaChIt0Af6eUw==
X-Google-Smtp-Source: AGHT+IEnm8oFpdWAiHPxW8hDpcLXgQQ87NpyPWpQOIa8k1ocotGVAZeJxuGqw1MnkmYiEaJ1w2Cfrg==
X-Received: by 2002:a05:620a:290f:b0:7d4:4484:751d with SMTP id af79cd13be357-7d466de3918mr75448485a.18.1751307728715;
        Mon, 30 Jun 2025 11:22:08 -0700 (PDT)
Received: from geday ([2804:7f2:800b:4851::dead:c001])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d4431346absm642198185a.23.2025.06.30.11.22.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 11:22:08 -0700 (PDT)
Date: Mon, 30 Jun 2025 15:22:01 -0300
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
	Neil Armstrong <neil.armstrong@linaro.org>,
	Valmantas Paliksa <walmis@gmail.com>, linux-phy@lists.infradead.org,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 3/4] phy: rockchip-pcie: Enable all four lanes if required
Message-ID: <d3e7dc38bd287aa93a5d6bba87bf3c428ae92ca4.1751307390.git.geraldogabriel@gmail.com>
References: <cover.1751307390.git.geraldogabriel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1751307390.git.geraldogabriel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_112209_909755_F4C104B2 
X-CRM114-Status: GOOD (  10.88  )
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

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Robin Murphy <robin.murphy@arm.com>

Signed-off-by: Valmantas Paliksa <walmis@gmail.com>
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


