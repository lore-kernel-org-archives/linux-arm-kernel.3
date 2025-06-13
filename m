Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63F70C71136
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 16:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5jwmmYn5mR6/LEUkoHGVPsLNEcwThgX3SiiTAZydAvs=; b=yFdP9Pr8wgtWKpr9p27WCKCRu/
	fxWPPSD7NNe03niMuKlXhv6XUNd7U8p0pA9juAwEDVeAaPJ0izepUrZ7PhaGknGv3BekNeU5L2fBx
	/hwGd7k30TXhQY6esjyF8jPv+bD5WLpN0R95eLIjALoXh4tgItymq+t26DPv1Baci63vBKqiDY0JB
	lF8jchA9s/FJvbWntGVlsTIns4t2yFE0SlM3nw4l5AqJg9KDP+SMP0Le8OlzGkEl48iFnSf+YPyAl
	ATSicWUtE6TbJ+RWH90khUYbXqpe1eucEdmMlOJaHSyQRgRn66fpHQsqgOfCt4x0WHEOuh4HJqhA0
	bc81Vdpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ6yj-0000000H0pD-0sVd;
	Fri, 13 Jun 2025 16:10:05 +0000
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ5lE-0000000Gm4V-00vo;
	Fri, 13 Jun 2025 14:52:05 +0000
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-60ef6bf2336so1648692eaf.0;
        Fri, 13 Jun 2025 07:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749826323; x=1750431123; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5jwmmYn5mR6/LEUkoHGVPsLNEcwThgX3SiiTAZydAvs=;
        b=Kf9Er9uIjrtgYXzN3UPYF2uw02pztaMZmjn8hN7E7uKfDeOPFxCYoDrLkv9u/s609k
         rXQMI0Ur7FYxsOFx19pb1hs8SXMTTDwiISP+jO7V2gcSujJBSpk0AYsVZmf519ayJQPj
         fYoLaug+UgcFANPxxzxUXdJDGffilEG1/UGhaN6JksJGy9oNCNzBH+LdnRQ9tzBjxJYH
         CISccK7YAmJ08dQq9AsDk8yOViso9nRzjpbX6Snr8E7/Ft3kpDwuAIp3hrW0+nuQTkrA
         yUWsSvaeLHCa7s79sWZbfEHmydprvQ22nn8BmPfsJud5FaKG1lA2oZ/wVgaaeduLIW9M
         LX8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749826323; x=1750431123;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5jwmmYn5mR6/LEUkoHGVPsLNEcwThgX3SiiTAZydAvs=;
        b=Fe0OYkCevrp6SdvtMZOf3T+wbLL6oPD27++CkbtREga/cEQ4a3H0Hwi5bT3fdWJAJO
         gJfn17F+nuyy19NKHubm0xENVbqaxOZhLqvzpZezylV1Js4rVTaIgLa2bswfeJBp0xn6
         x+KoYLeSEm7e27rT/Wizizly9JfVDWMb1PQ9s0hIz6QQPbn3LeQPmkyCPKCj9MZrYEp7
         WxrkuLMMk72TZYtHeOKExBt/Il2mQfYHvPZx2+dKuuQbBcyxVPY4QnMwEC2M3+9kPIo7
         ZP4bNQguerFC+ahWoS0oSevmG2tnKr97Mm2JRvyAOZ38IjuHUktTs0tHbg4+avwyAynq
         S0rg==
X-Forwarded-Encrypted: i=1; AJvYcCV7IARxoOkvBRbHT0IXSR8+5gUzEmrMEh0Rzza0DzdmwOLNNRbcr2xiY7U9QcD/iBNbi47dA3Vn90P0@lists.infradead.org, AJvYcCXe/jDuvwH8TJMVlE9oZpXAIJ1n1ROaOSAUv9oNafdnZ+7pIMiUvY/Z/8T5NDlm8TwPllUOdajLlYYTbEENzbCP@lists.infradead.org
X-Gm-Message-State: AOJu0YwA4PFN+dI5TZ8uBj8Fm5XvgCpRrf/mL1S2pZePozu0sihdVbvp
	O/MUst6ZuPJcxoIHGmkYM8a2AXp9vH2mfW/2Ol616VTKwWCIh+tNOiPgmt51ZwP/
X-Gm-Gg: ASbGncvzsmaOWNvvyP6u8rbzl2qu6Q9OlwuKbelEhfDdJVTm6QnIGHsOAjZ2xazEVNV
	JbVBJv+a7/x1saiBNWURGf1SjL2a5smdytaspmvOrIYV9o+4wrz4nRro/C4EzoXlRE/T7/GXmwj
	hUpk43ly3zST+lWp076S7h7O78uQiWqW1PahpwzoeT3CH7/nHyaWOBzQTMsFaBQ45FTiI6UQYEJ
	1LRaR26CqOsJ+FhcaerpneJL+CsTaYPIyW1BWjjLjtyXSBgb7/Bvoc4ZmVI7zX9El/Bh1YkM65+
	jMrIM57J9thJ4bGE6sFIt+TDFgS4ZPtXyQ0850TzaOLy23AMYQ==
X-Google-Smtp-Source: AGHT+IGiKHmM9XBYxdjrLGBWI4Cw7gLU1AY8vPDUar8VoUJyUwWHPMwWLh675rm2NoddelERdbgXzw==
X-Received: by 2002:a05:6a00:398e:b0:747:ee09:1fd2 with SMTP id d2e1a72fcca58-7488f79d9dbmr5017356b3a.12.1749826311724;
        Fri, 13 Jun 2025 07:51:51 -0700 (PDT)
Received: from geday ([2804:7f2:800b:838f::dead:c001])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900b0d07sm1667046b3a.114.2025.06.13.07.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 07:51:51 -0700 (PDT)
Date: Fri, 13 Jun 2025 11:51:45 -0300
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
Subject: [RFC PATCH v4 3/5] PCI: rockchip: Set Target Link Speed before
 retraining
Message-ID: <affaa12fedbb6e34696242d1f2f2dc5634b72005.1749826250.git.geraldogabriel@gmail.com>
References: <cover.1749826250.git.geraldogabriel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1749826250.git.geraldogabriel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_075204_049719_FB411FAC 
X-CRM114-Status: GOOD (  10.04  )
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
index 65653218b9ab..7a0b6ebb7c27 100644
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


