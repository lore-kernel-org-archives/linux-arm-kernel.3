Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF7B7C83029
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 18:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=j5oPe7NuWEBlVMssFfuoeeybtC7f7CEpTOJiXlRikAU=; b=ZDB///h19E3B/Zm/lrCv2aBHGv
	xFw05hAClX3V5ec8ga9UCFDu042+M5npyB0y5Jn3dLaJchKFvb0kJe+MAvyxPrp1Xgvx9c9UK/wZa
	84WkDLtcGEYGsc2uSv+rtBL2KxDVCnxJaXz34s85GEVzgOEt+WFdZLAj+ltz8H+3ryfhS+3ifFySD
	Dppfq//7uUaeaalmsdOVxxJ8lXgFHDe2kXdfTf9OM4yhzIIaeU5lK6tuv9i9l50IUrhnOI1/KU4C1
	xp69GQ0q5xayaR0zYr8UnH1TX4WdPT6IVxaTQzDcVVzSy9rHlSn2Hc2gdeqVbW+Znxk//tK6EqqEO
	fLQRBkQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWJJo-00000003Cef-23Lg;
	Mon, 30 Jun 2025 18:33:28 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWJ88-00000003BZI-1wGl;
	Mon, 30 Jun 2025 18:21:25 +0000
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-4a77ffcb795so48639911cf.0;
        Mon, 30 Jun 2025 11:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751307683; x=1751912483; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j5oPe7NuWEBlVMssFfuoeeybtC7f7CEpTOJiXlRikAU=;
        b=mIcWtAj1U4Y9LujxLZTI1V4CwrVVxkxWeB9Wxq6Xzzc1GoHukV7Yu/c5kRc12zcXsb
         UecSE9RwoS41clmdH9cA7t5Vg0EqJE6Mv5tA1pygqFfTdulQaAtSobM0eAyPh+syyk5P
         hJRyqNcC9RCyg/YQ6SatM3wTl/ZE9qZrawUnNja1srdDLIkcdfZxSyzVj1LkpfzckmZb
         BgatZFVt+iTz1A81lD/lngSz+wfP3B+vlS0kDraSl6Z0gIsEqmzfkB1XRD9BMykOtTMg
         fktWr8cHjEPOqShkwHrufmktypLixWFNMEDcQVR351+1dzBsrazd2GsqWJebNMBvXY7V
         JYew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751307683; x=1751912483;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j5oPe7NuWEBlVMssFfuoeeybtC7f7CEpTOJiXlRikAU=;
        b=mYVXyscb8y5jLs4esSQ1Dryn5SW4gy9uTkceQJjcO4BaEJr0qOTnaMH+TuY0dhrxXr
         w057Ksc9wF0hb0zdm6OmM4MlpVaJY/enLaPcKDoDl9cFiD8MNT6qrhySWbjYjQRGrvDs
         BQ/Cb34wZL0YN8HreLsRbmaOIegqLFqBiTvVyx4Gazk5FrQbkY2JLJWBl04Xm+9mz93r
         ccLG89QeZ9E5jEH0fa9SeFeGOtjiLwNkVlBkUMxD5ARgvWWt9xy23VwHQc4wlCIZgrab
         CUygYjCX/r/OeylLpzyOVyD97KdRPwEXm+ciNA92cnWTJW7Gc6UHO9neo8h4eWyYv9Rn
         gbSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVp5gK5+chr9GpBDr8nacBJUiTKm+/Ct/Xo79eTDwyEagryuBxpQjxvQX4QTBV/fYQRfcTQt39eklgZ@lists.infradead.org, AJvYcCXFTCie6Bq3IentLyFziyt4HHzKMOklRnAxLgbWW1GIPXJ5m+gfz+XdDlghMHlHxYheIOcZKZqVB2tyWvuQyZdv@lists.infradead.org
X-Gm-Message-State: AOJu0YyjKnASrxq5Sm7SH/gJVj0KMJA6l191u5SLwbztPVBA8C1DDbKH
	l4h4rkhe707Mie2v2jktr9kkton3CZshn67Ry4hlhYZ/7vNOVjdVNUR8YlwE6Wl9
X-Gm-Gg: ASbGnct+h5MP7IsR5SKBfp+ovOaNWwgj8K/FvDqhg7LaIQ1WadS8IWRbWl9WoV213is
	5irIIao8NGVH3CvMswJxsOtwb/hqKBPEngqbuc6VT3hjlF7Tomj10tKlplKmtpHus7locK6s/X1
	TRmsPaF9Ux8C4aqU7xY839CrZcsNMQsg6uW8w2JDViX5hWPitcKr1e2M/mtONeI2CbmdefkpK4c
	9ivTTf55aqJPfWEzf21VL+we4RwWCYKAqHisIL9suDYrmeQy3mdYPGIvtluCqZit33ZUATfho/Q
	plPkg+bs6t8ERg8VeC5qv+gPr4M69PnOJZpBSn9XgrRFn45nkw==
X-Google-Smtp-Source: AGHT+IFsXJjoVwUXm0fcOFhLVNqsYO/moCefhcFNV46+xG5upfucPDlS2Uf2IOjWztKAdTp7b2Jfhg==
X-Received: by 2002:a05:622a:1355:b0:4a4:4af2:5cff with SMTP id d75a77b69052e-4a7fc9d4f7amr238186611cf.3.1751307682697;
        Mon, 30 Jun 2025 11:21:22 -0700 (PDT)
Received: from geday ([2804:7f2:800b:4851::dead:c001])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a7fc5cd906sm62801131cf.79.2025.06.30.11.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 11:21:22 -0700 (PDT)
Date: Mon, 30 Jun 2025 15:21:06 -0300
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
Subject: [PATCH v8 0/4] PCI: rockchip: Improve driver quality
Message-ID: <cover.1751307390.git.geraldogabriel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_112124_500891_1B291651 
X-CRM114-Status: UNSURE (   9.88  )
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
some quality improvements began to take form and after feedback from
community they reached more polished state.

This will ensure maximum chance of retraining to 5.0GT/s, on all four
lanes and fix async strobe TEST_WRITE disablement. On top of this,
standard PCIe defines are now used to reference registers from offset
at Capabilities Register.

Unfortunately, it seems Rockchip-IP PCIe is unable to handle 16-bit
register writes and there's risk of corrupting state of RW1C registers,
an issue raised by Bjorn Helgaas. There's little I could do to fix that,
so on this issue the situation remains the same.

---
V7 -> V8: add Valmantas Paliksa Signed-off-by to third patch
V6 -> V7: drop RFC tag as per Heiko Stuebner's reminder, update cover
letter
V5 -> V6: reflow to 75 cols, use 5.0GTs instead of Gen2 nomenclature,
clarify strobe write adjustment and remove PHY_CFG_RD_MASK
V4 -> V5: fix build failure, reflow commit messages and also convert
registers for EP operation, all suggested by Ilpo
V3 -> V4: fix setting-up of TLS in Link Control and Status Register 2,
also adjust commit titles
V2 -> V3: correctly clean-up with standard PCIe defines as per Bjorn's
suggestion
V1 -> V2: use standard PCIe defines as suggested by Bjorn

Geraldo Nascimento (4):
  PCI: rockchip: Use standard PCIe defines
  PCI: rockchip: Set Target Link Speed before retraining
  phy: rockchip-pcie: Enable all four lanes if required
  phy: rockchip-pcie: Properly disable TEST_WRITE strobe signal

 drivers/pci/controller/pcie-rockchip-ep.c   |  4 +-
 drivers/pci/controller/pcie-rockchip-host.c | 48 +++++++++++----------
 drivers/pci/controller/pcie-rockchip.h      | 12 +-----
 drivers/phy/rockchip/phy-rockchip-pcie.c    | 15 +++----
 4 files changed, 36 insertions(+), 43 deletions(-)

-- 
2.49.0


