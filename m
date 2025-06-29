Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D539C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Jun 2025 13:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rtc4GJjYIzCc3h+Hv3COhOArvofrVT3IhU2L5CEaYbA=; b=ciU3WEveuITV3XhfTAN5b7j0io
	lxL9DrfgTDW6N0IpVxg0jhnhW5Bdh9LHLouB3QnoKYFjqFUPLW7NyiqZ9t6/w8l1EAOxlvk8iqKo1
	kWqkDE2UG4iHgCNVFF2dtttpVQ/mARc94iNar5+HrrAueupGL5LaHLEBniHLJ2D4ML23jNyzNrUrB
	t4vvyhg9JFd/5BuoqcocOfUfjsc5JpalD0ZOJzMs6Nj1AC1TOeTwViK6pTzQG+RRzwoS5sGMk2M+N
	ja7gWxN/diUxda5EzIyL+L5TBZDLzK3GcUKf1TT5GRKKX215rWkGGiPxA+ZLCWexBWIUNJvpQ2a7G
	EQ7VRqSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVrp9-00000000Gs9-3BGP;
	Sun, 29 Jun 2025 13:11:59 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVrSA-00000000Ez8-3ZcD;
	Sun, 29 Jun 2025 12:48:15 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-4a6f6d52af7so41092301cf.1;
        Sun, 29 Jun 2025 05:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751201294; x=1751806094; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rtc4GJjYIzCc3h+Hv3COhOArvofrVT3IhU2L5CEaYbA=;
        b=NIv/E6HF+xKAmICJVoRdr18UvdA41+E8xmQK7DAxIKdqcG8K1v/LJQOkst09IC6pAD
         t2jjdO68ITp9TF4eqKlBoeeLNO3u42s8wrHqbkMnJKjNEf5HImidacFj4K7r5id6RHNh
         V2XnINgjBO+S3VuirC1oxQIz8HkgQTG509LVp084s18TGhYauaKRQ6sTvHTKllXvodqj
         vTpZIJRxuiYPrA+4HNabaT6OvHIpgp4aVKdv+C3aU0Gi72daGD/SD/zLrLCqpNh3urqC
         DINGGdRDsUR7x+P7Uhdc8wC8xbJN27ou0K/iXN1GVqudAhjefdcOkZGdoiOC/9K5beq2
         OCMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751201294; x=1751806094;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rtc4GJjYIzCc3h+Hv3COhOArvofrVT3IhU2L5CEaYbA=;
        b=v0Rh+vOnpAVbVYH/9kpwvTHtuMhRBXnDoL263QeFmq4h/kteqhTksbjOh1nKijxd3E
         DysGqaVm5ibZwuN43EsirEvU3Rk3ESxl6dFvQ0uuN9UMQDrdsP+tneEKubnlHvjS+pX+
         jSoSgYO2HABOE0xwXy6B87GveKxvwXrbzHEw4vtUrkzhaMCe+uC4UbRjOTUaAL0F5puR
         mVaXD9lbClv/TSVHiMg/gLVS6krM6nSG6rdW0QSXct1a6/vm6SmptmjGC7d6AdlocGi9
         Dhmz+fVo37+vWhFAX6wyavc8ortAb5+p21ZDI7k3WlhIX/E9emrbNeP+i5Ir7e23aqDf
         Fv4A==
X-Forwarded-Encrypted: i=1; AJvYcCVushaxpD2ivEknnUCsH5nabbmkg8TVbT2qkCPAumkxKYhq4ebtdJmgPSeTTDsyuq4Ab9UAPT4zIAJo@lists.infradead.org, AJvYcCXlTQ127DzRBsPkKtKo0qA0cysBMJKNNRb34+sZtXi0/jT0zbrg/VQTva7EbjVgOgvk9Dk8QigXrYEysnaYsAH5@lists.infradead.org
X-Gm-Message-State: AOJu0YyEYnzfDo7IFTCZdUAgrWFDskBfKrHA4kXGtxl04h8RLI2D/3jl
	wfjlkYx2+wIIv0sInxbaaevKEDbYyeX+zTpXu5XVwjg0Ig+BbAvqLmoAftocHT9imdQZnnJx
X-Gm-Gg: ASbGnctTZls9/YeKpEYiecIWbkhWkImXdeidc9kXUmVnjeFiirUOHgtYiLpynNNo1TM
	V2CM/PFDfbuHoapsyvJ1fUMxg9oJS6G1jv24nlQFQUb3nvGOfDliU9M07IKxpkA01n+j8KmhBRW
	H9UxrsaJ8vaEtNCnPDghVLtFKP50DjpyUqye2EwPpHcLXzo526dThXhnGYiRDus5lMPAMj8qwil
	+MN1ucayW/ryp1smQRT6WN/Fed8krub3fOm0jqvCIFIQdDEJdFjuh11FqTboEDemJKKfRN71+Na
	9gv/nFoijMbIOGiMb3E1v//XEjviTbOG2xhAkRQSfJFzLar5NA==
X-Google-Smtp-Source: AGHT+IGiNquMhzJugS2btiY1s8UNBRt+TPGhGmmXE7yoAsxq4Al8mQ1vd1rQAy8wXSXKKwGcZx27oA==
X-Received: by 2002:a05:622a:244a:b0:4a1:356:5e7b with SMTP id d75a77b69052e-4a7fc9d55ccmr164616551cf.1.1751201293645;
        Sun, 29 Jun 2025 05:48:13 -0700 (PDT)
Received: from geday ([2804:7f2:800b:24f4::dead:c001])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a7fc1392a1sm43185851cf.27.2025.06.29.05.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 05:48:13 -0700 (PDT)
Date: Sun, 29 Jun 2025 09:48:07 -0300
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
Subject: [PATCH v7 2/4] PCI: rockchip: Set Target Link Speed before retraining
Message-ID: <0afa6bc47b7f50e2e81b0b47d51c66feb0fb565f.1751200382.git.geraldogabriel@gmail.com>
References: <cover.1751200382.git.geraldogabriel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1751200382.git.geraldogabriel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250629_054814_905243_7FD23891 
X-CRM114-Status: UNSURE (   9.52  )
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

Current code may fail 5.0GT/s retraining if Target Link Speed is set to
2.5 GT/s in Link Control and Status Register 2. Set it to 5.0 GT/s
accordingly.

Tested-by: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
---
 drivers/pci/controller/pcie-rockchip-host.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pci/controller/pcie-rockchip-host.c b/drivers/pci/controller/pcie-rockchip-host.c
index 65653218b9ab..25890f6c0e17 100644
--- a/drivers/pci/controller/pcie-rockchip-host.c
+++ b/drivers/pci/controller/pcie-rockchip-host.c
@@ -341,6 +341,10 @@ static int rockchip_pcie_host_init_port(struct rockchip_pcie *rockchip)
 		 * Enable retrain for gen2. This should be configured only after
 		 * gen1 finished.
 		 */
+		status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL2);
+		status &= ~PCI_EXP_LNKCTL2_TLS;
+		status |= PCI_EXP_LNKCTL2_TLS_5_0GT;
+		rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL2);	
 		status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL);
 		status |= PCI_EXP_LNKCTL_RL;
 		rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL);
-- 
2.49.0


