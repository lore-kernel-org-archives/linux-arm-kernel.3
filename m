Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C193C677C4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 22:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VTlGqNZZG2nk5U6PtVHAFn03jhmY0zJz2faCvEujVB0=; b=Cfh46P9pPMDP8lbX8S0A8WWOr2
	OM6bvZJW38y/1jOGRtFr5LddFkjH04XQRYFO8ofqdF58XnQ9uwXBXQOJU319wElHoEa92/q832jik
	Olp/xkXhvJrWwTzOmbRIReA7i0g2mLPAjqd4XDVVE0eFarcXNyO2Oa6V5T5LM7lwwabLlhFHnBmq2
	etS9cUMu/ZAl9bJ407aXEKknSU9E0TUp95HybM2qgDb2TxN591Btzx7P3nMBOMGKtrYRCh9bZptgG
	NCgLuat2N6kY2J4wLx/wSt7xQuHzEExugWEQH8z7tYB2choGbVivvMYc/nkL91i6NJe0i33FkXZMK
	/dihqpKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP7nk-00000008J4a-3rAb;
	Tue, 10 Jun 2025 22:50:40 +0000
Received: from mail-ua1-x935.google.com ([2607:f8b0:4864:20::935])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP6Ni-0000000862D-3yxK;
	Tue, 10 Jun 2025 21:19:44 +0000
Received: by mail-ua1-x935.google.com with SMTP id a1e0cc1a2514c-87eca1c19e2so602183241.1;
        Tue, 10 Jun 2025 14:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749590382; x=1750195182; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VTlGqNZZG2nk5U6PtVHAFn03jhmY0zJz2faCvEujVB0=;
        b=IHvIP8ntueNvrSAdqTb23Yg096DzWDMndAMaJVb/XdquKTJWpcFwLKPA/Ij/70QNFS
         kmzxqcHs7C0T9QbwLs3txNAbbSzBqiO8LNzTi97LCIJK6hK+KX3JXQcpC5m8G5YQsIkX
         gZZ2Y/VkF3OJnuhFk2U5qPXsOorwu5QBpHrnK5A7rEc2QXFMRGaRjARYPiAW4lZpcfG5
         YeC7rbpmFDKHvdgRogZqbP0D/Fc3F1HTkWm4f2s1/MsBANjAu4CRf6OzVcL8KizQEqHf
         T8Xf40rAP0bO0k6Z4PZJ62FVknQms/bEkGP3X1gzb9G8PDJ1rqWIa39mv5vaT/2txWLs
         GzuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749590382; x=1750195182;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VTlGqNZZG2nk5U6PtVHAFn03jhmY0zJz2faCvEujVB0=;
        b=FfWYfMlsMbcuvyrKp71m43qpLI3PcJR3gqvIhrdc8/QgA5/9XYRJYKjb2vkQr4ZQzO
         PVo3fr4GpTq1yuH4IemPwsJjDAFCSMgngAm1OODhZ9EvN+wBzC+9+QoKavgWqXpAu2Y8
         5kmmr+tC+HP01iVQwtqV4Yjca78x+/PYwF6g8UPAKVipHwIRnuegI6vFiTClL5OgItPf
         6oSaTM2ESPW8raRKMI7ejANd1wagvJyrXZHsnf0B5MWva3tlBDPeOBYJOYLV5kItnsFn
         oUGqM0C63edfhm2RonAJ0e1hdaBHwFJjWobYwhfKUDZFFvVMOJnhjHMtl5T47OGxDsbc
         sSpA==
X-Forwarded-Encrypted: i=1; AJvYcCUb2gpmuPbwpvFrMS/MdWqw2l/tvojSyGrSG8iCPjRNyPr1jdqd04TDqimTUv8vT9ZfccvTpJ7HP2hKg4MNC9zT@lists.infradead.org, AJvYcCUgDEClPx4a6h1BTyvIyKekXoGJdAj6GdX1t+ODdHUZsLo7wjAuRJO7mAAU0rMIugbY0FOK5bhXB8Kq@lists.infradead.org
X-Gm-Message-State: AOJu0YzHXLxjQx5OzDLpWoDqYpamInMf+h+ajRlIsjYQ4TlZJZ+r24oX
	0j4E515Qi6rsOGWr0TEMfeIiRAKTolIITEHFT3FLIxhz0VgUVYbb9U+31WyN982Z2FYDyvq6
X-Gm-Gg: ASbGncvtd3MseWUQqRCSkfUZix7RM02D0rsVOjLZmXfY4ZX0twqIpo06iso9OS1ruO1
	CCDKPM0Ianh/GnCpCz1GboTMpyLnw9Zj9A3L//CGKctNKAMAtCKzRME+940chfqEGRXuumsMFx9
	+WOiY/ICk9a+A79jaZnwAJmQzl4qckJQdOzSMGZnJG9EsXsKgRGRgA2k6gfS6YTDreLETUEGSB2
	HBI5z+Tj4FsRo65u6kZTf3jcpPGYdaZE9f+D+qvGWZEvu4l/R7NQkmnfstnS/1MvOFxkfoZWcRm
	FjQ0/fMZY81YhtpnCtW1a/YjlRePenCkUO0JK8KqjnBeM8yAOg==
X-Google-Smtp-Source: AGHT+IEc8tayspwhyZzHQNxg9nAlirC8xTvZilA/RPHMja+AJaaRaWniixRITKIg88b7BD1jFLaxvA==
X-Received: by 2002:a05:6102:3e18:b0:4e5:8eb6:e8f5 with SMTP id ada2fe7eead31-4e7bba3689cmr949646137.3.1749590381691;
        Tue, 10 Jun 2025 14:19:41 -0700 (PDT)
Received: from geday ([2804:7f2:800b:5ce9::dead:c001])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87eeae7722bsm1880161241.12.2025.06.10.14.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 14:19:41 -0700 (PDT)
Date: Tue, 10 Jun 2025 18:19:35 -0300
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
Subject: [RFC PATCH v2 0/4] Quality Improvements for Rockchip-IP PCIe
Message-ID: <cover.1749588810.git.geraldogabriel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_141942_984005_99FC5B42 
X-CRM114-Status: UNSURE (   7.91  )
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

During a 30-day debugging-run fighting quirky PCIe devices on RK3399
some quality improvements began to take form and this is my attempt
at upstreaming it. It will ensure maximum chance of retraining to Gen2
5.0GT/s, on all four lanes and plus if anybody is debugging the PHY
they'll now get real values from TEST_I[3:0] for every TEST_ADDR[4:0]
without risk of locking up kernel like with present broken async
strobe TEST_WRITE.

---
V1 -> V2: use standard PCIe defines as suggested by Bjorn

Geraldo Nascimento (4):
  PCI: pcie-rockchip: add Link Control and Status Register 2
  PCI: rockchip-host: Set Target Link Speed before retraining
  phy: rockchip-pcie: enable all four lanes
  phy: rockchip-pcie: adjust read mask and write strobe disable

 drivers/pci/controller/pcie-rockchip-host.c |  4 ++++
 drivers/pci/controller/pcie-rockchip.h      | 10 ++++++----
 drivers/phy/rockchip/phy-rockchip-pcie.c    | 16 +++++++++-------
 3 files changed, 19 insertions(+), 11 deletions(-)

-- 
2.49.0


