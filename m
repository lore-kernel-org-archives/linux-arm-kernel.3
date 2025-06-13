Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53FA7C71135
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 05:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jifCCUYB+xoFd1mhgCPlAVXrt+Ids6RCsiMOlk39VdI=; b=Irz0+LzyqUtA/g7a8b5Dh6+X/x
	ZQYJB/YvTONV5r72mzhEowOtjGQS+/1JuJAUmFXsRrRFoufbN+BzJLoL6WnGtVZqt+ZV96E7ZgY+o
	TdjsWQTf0PBkLzmiuaFxAdlmy4UavBPgIgZdQ5KfnnRimtWfIdBHZKPy4ImG5+N99UPR0AfhlAwGA
	lP9H6vQQwT9m3SKoxRF6Xze+JiPZN8tVx3t3qV0HQ+UcnsIH3NWy9F6A7bJMLWW/QXFDrp9tvvvKQ
	IRQ1tAmk3/V40BIwLbbB3Dph1kknceQ7CNyh+L/keucMHQk0eugkVUv7zv+oSugftjwA7ZZdp80lQ
	zkHAV4IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPx0u-0000000FNsh-2DjB;
	Fri, 13 Jun 2025 05:31:40 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPwrY-0000000FMqn-0uDp;
	Fri, 13 Jun 2025 05:22:01 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-234fcadde3eso22019175ad.0;
        Thu, 12 Jun 2025 22:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749792119; x=1750396919; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jifCCUYB+xoFd1mhgCPlAVXrt+Ids6RCsiMOlk39VdI=;
        b=GOHaKVIoaupQMIAH/WYSdMgSwHnyRpXlA0R3lU2gtqDskjUhJJa9kRaA6MMSheiEt0
         wo7tKULis3Kr9+C4XGRc9j3CO7pExW2xX6KCMDIaODFDcW2yK0WdHA9V7YE2QDRDw0U9
         6PGfKjapv0Fzjmp7iQaNHy4ODYhGWlc+3N7mNwThTzdKQIIT/owmq15QzqzQRaBltYdQ
         fqxtLpLX0OZrpyVCqxpGm3Z3IwX5jZXIbAl1cTercBuRXlbHvMqP9DjRvXXaGStdiVzm
         n669bUcu8eIKj5k34mvO1rwRRPXpoWlSRoxLA2uV3auHsKyu5KJYeB71TGylUivrjLw7
         kfSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749792119; x=1750396919;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jifCCUYB+xoFd1mhgCPlAVXrt+Ids6RCsiMOlk39VdI=;
        b=Mmp2mXPd2oel+4h+0g3Ed32hNtMt6Rn60lOHIyzvr+3tompJ2yGNfYBD4OPkCuWJHN
         lGxXs7Ab6g0HxbiQ9EiQLHGAnq8cIt60/2rxnP4AmlO2iVRflRuiTyD7e/vZpndPVyZe
         dm1FCVptNdyZosVF6hit1dFcb+35Cjqm4dNryAsboEsoLCIxZ5UPJ4xKIG6BFCZrIPZq
         4I4ILLMfP1QwcOhFQQbxIIVloKSF8DuzGGLoKLXkEx6BCbiY/9DrwekyepEhppWVm46j
         y3M8BFHn/wZSd6KIc0tu2/ernsyGo96S5meEHQ8LdIbvWYLqwmH7fP3PAc9J8SXg8dme
         RwZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvGzmEgM9ww6J2HR7N1EgWIx23cRgpFfI0ySR7Y1XtLmUSrMKnlrxDUct98y9nP5s0gz68BlG0DQdJ@lists.infradead.org, AJvYcCWcfCGjPukdgXfjphV9B4VRW4b3ZCkygs79ECQWe77cSvJTGMgXSKySWvhzdDvUc8NYU7I3MzNj2UErORdvU7pP@lists.infradead.org
X-Gm-Message-State: AOJu0YySQwQRJ/MWFtT8lJgKTE1VW5GQQfC/FtgnsSMki4gjun3/BFjG
	D9RWN8ZEpdov6uzUMZk2HuaW4XjQ0vXIiLh0qw1V7zageSRzcOnP4BQUmWq25ume
X-Gm-Gg: ASbGncuMmLfmjrrqpaXMS1OJPr1Fm0jYEeDMDWV4uIWdaeRDSqH2/RlJw5KO9255OWf
	LulhtlAITY15IeMiCTkzu4Noe/Dw2pXMLunXQUMgV7HXNolZFvw/o+YGTnrLl8SL4T3QDWmwXgv
	RkTRi1l0UMHaRXKud1PZ+IAgQqDdldzb1SNJJeZLj+8Z+IDDcJjT9JLrACiG51vArSjIltwg8kt
	nLtIkHAooxloLvHMUqIOHopaVNBwHRc+DwhD5JkDSL4cAnVhH2wG5DNkN9sADytVM30dMqrn//m
	X9YhnsBmtQdhqFklxnmzEl+dTL6ka0nt/QmR6t2GKcA/9IJPrQ==
X-Google-Smtp-Source: AGHT+IHrnaZGWEeRSyMjWDgSp4aRGI9qMBO/Gbg6WE+lbmNGxeLn+NjsdsLBxmiprq5lNvsVXHE1qA==
X-Received: by 2002:a17:902:f611:b0:235:ef56:7800 with SMTP id d9443c01a7336-2365db04d46mr22958265ad.30.1749792119296;
        Thu, 12 Jun 2025 22:21:59 -0700 (PDT)
Received: from geday ([2804:7f2:800b:7667::dead:c001])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365de78181sm6257875ad.122.2025.06.12.22.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 22:21:58 -0700 (PDT)
Date: Fri, 13 Jun 2025 02:21:53 -0300
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
Subject: [RFC PATCH v3 3/5] PCI: rockchip-host: Set Target Link Speed before
 retraining
Message-ID: <ad9dc26689ae2c9e811d093ba18c9e579b6747ea.1749791474.git.geraldogabriel@gmail.com>
References: <cover.1749791474.git.geraldogabriel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1749791474.git.geraldogabriel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_222200_252000_DA039E08 
X-CRM114-Status: GOOD (  10.02  )
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

Current code may fail Gen2 retraining if Target Link Speed
is set to 2.5 GT/s in Link Control and Status Register 2.
Set it to 5.0 GT/s accordingly.

Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
---
 drivers/pci/controller/pcie-rockchip-host.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pci/controller/pcie-rockchip-host.c b/drivers/pci/controller/pcie-rockchip-host.c
index 65653218b9ab..68634ae8caaf 100644
--- a/drivers/pci/controller/pcie-rockchip-host.c
+++ b/drivers/pci/controller/pcie-rockchip-host.c
@@ -341,6 +341,10 @@ static int rockchip_pcie_host_init_port(struct rockchip_pcie *rockchip)
 		 * Enable retrain for gen2. This should be configured only after
 		 * gen1 finished.
 		 */
+		status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL2);
+		status |= FIELD_PREP(PCI_EXP_LNKCTL2_TLS, PCI_EXP_LNKCTL2_TLS_5_0GT);
+		rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL2);
+
 		status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL);
 		status |= PCI_EXP_LNKCTL_RL;
 		rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL);
-- 
2.49.0


