Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 893DCC71148
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 18:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=f9JTiirLp7dFXp65A+6dp+48wUewOH1a1vp6gPpeVWM=; b=hDMLemRd3y+VO+Pp8L890iiKss
	AJv3bKBasjmnlSodx+gCjdozjfZxPSm8UoYNH97iHw0M08hETihWqtyBRzAimaDgU2F/2fOppLHq7
	NPQuTT1aV9CRArDF0+zmF+Jm5Clxq/aAe2WNM3e/GG4okF/Zz4LC6fveaYFzKs1bTd2aP+vzzFIW2
	s3HBcwzqq/7kCyMbbrYoDkOCvWCoLTxs5zlF1TOHv0bmzzCouxbpU1VxZzXDhcdEyKWj4xZVvyUo3
	jpniEbDMUvvm7+qsbh9sXnyRFAnBHXILUTzNIakXew/uq7xlNEq1wexxOonGy4ADgGJwNTmBnMFDx
	fukMzQTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ8wp-0000000HF4P-1rA2;
	Fri, 13 Jun 2025 18:16:15 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ5hk-0000000Gl07-0SQ6;
	Fri, 13 Jun 2025 14:48:29 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-b2d46760950so2320951a12.3;
        Fri, 13 Jun 2025 07:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749826107; x=1750430907; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f9JTiirLp7dFXp65A+6dp+48wUewOH1a1vp6gPpeVWM=;
        b=BcafQSCJ6Vmp19SJYZi3Xw3NWujoKes1SawmIMs3guDTS0DnAHgn6oimQbXSM2vxEX
         pHGcHIkZrla4Vu+6teviAASmuI5WtTU+U4QASr1T5GxxUAPS4uJ4w1Y0hubz4idSK6q8
         LCAeNhoM6UGtPGEZstHqEKaGe635b+BwhV1Yd3IOAMdvbB2hDxHrOXn0ZKlyk/dqLc62
         JzblRlD10OcVQywt/C7pfIPTLl6o4GP85nW1CFWPMfNAAxcCvU3wHOI8fBxI1sJjloFb
         5NF1duxOa4s0xvYPdIM4gty6+OrqSKWCo80Eur3OR1gRmMgSie5JL/0RSFTsaQzlRf2m
         eZSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749826107; x=1750430907;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f9JTiirLp7dFXp65A+6dp+48wUewOH1a1vp6gPpeVWM=;
        b=keT/+Txp7+ItNTc2lKA2QVcvCOXRCZoZ21IPtDys7NgbsLUUBOziBchp14t1K7ZHen
         GAnc4lgX17XNbVCLo28paXDpek7YmzchHK+gQ3EuaF5p3emgYeSQb8dXJL7vSYl7FuOV
         7SPsQUn6rbzr+cERCtFO9UgOs3X1rUVPnGDmINAXXQi/cqM+JaPMUVcSVdNbMI/F/MPA
         XydpKpx3Lyg1CFIQP/XT/toSKHfrR0kUybIMNQcfULZ8VsoWaiWxNQwxU0Uuy0vmRIg4
         JF91nuFGwxewVeVyZpJxkCqd9MfHLO804HsPNB1tVj9lFRwYEL/CHVRUV5z3i8i15XKC
         gTxQ==
X-Forwarded-Encrypted: i=1; AJvYcCX59gX+cCsCCdOwE15vb3Yz5tR+2N+kUnI/00vhZhq+ukq/JNVY4g9aB+SkDb0D2So5j0NHebDOLDBC@lists.infradead.org, AJvYcCXx0G/j+WyQvwXi9jfy6+avTd1L/j7qXF6DBtBUMZ+kxqO8VGJEem6c6PWaVJ6tsRBWVR8v+nqhElriaQyywGae@lists.infradead.org
X-Gm-Message-State: AOJu0YzIlYIoiK1LPp5v3mBr9gxezzIN2u9TCsHPQ2bq7m5Y9BzzI/I0
	9NiMCbQCCiM3TUGkjTCzZvZxDjlPd3wCwalSDwHeDKg/cfum42zVHooysvw5IHhz
X-Gm-Gg: ASbGncsnOBo29lgXih8bNPErxpV6Tm3Q9LMGuDFsSGxacHYK8kTh0dxiBeMszkorEOD
	nKvTCUk/UVFdizhRoPAQGE7zlM81h1yC0YYPOzD5ZdHOtfLxhfHt6NgDhIUf742TWVCCP4hKymj
	bhbtw3fiSn1nS0zWaXiaxWNfXJeg/x6y6hjyGogUQ0e45KEZvYtgnhiGUcL7Jdj2g8h/NcgQZpb
	GKeMvajGt4TE027cK4SoUbfzjOTpamWuKDiSdJ8xUtKI+aRbzgcxG5hu5jOHWs3napeT0hMpM1C
	4YeNoezEb+RBrY8c/i6W2JjZd4nYVCBXkj0lFY+mNgjBervKkg==
X-Google-Smtp-Source: AGHT+IHcd33U1pPTm2OZvPaNgt6ez8a+j54CjSPCSVvtmMq9GaYDflpq+hrFnm/a0JpIR7GcANSQcQ==
X-Received: by 2002:a05:6a20:728e:b0:1f5:64fd:68ea with SMTP id adf61e73a8af0-21facb4a140mr4610926637.4.1749826107267;
        Fri, 13 Jun 2025 07:48:27 -0700 (PDT)
Received: from geday ([2804:7f2:800b:838f::dead:c001])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2fe164406esm1803644a12.27.2025.06.13.07.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 07:48:26 -0700 (PDT)
Date: Fri, 13 Jun 2025 11:48:21 -0300
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
Subject: [RFC PATCH v4 0/4] PCI: rockchip: Improve quality of driver
Message-ID: <cover.1749825317.git.geraldogabriel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_074828_164958_D44D453D 
X-CRM114-Status: UNSURE (   7.35  )
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
V3 -> V4: fix TLS setting-up in Link Control and Status Register 2 and
adjust commit titles
V2 -> V3: correctly clean-up with standard PCIe defines as per Bjorn's
suggestion
V1 -> V2: use standard PCIe defines as suggested by Bjorn

Geraldo Nascimento (4):
  PCI: rockchip: Drop unused custom registers and bitfields
  PCI: rockchip: Set Target Link Speed before retraining
  phy: rockchip-pcie: Enable all four lanes
  phy: rockchip-pcie: Adjust read mask and write

 drivers/pci/controller/pcie-rockchip-host.c |  4 ++++
 drivers/pci/controller/pcie-rockchip.h      | 11 +----------
 drivers/phy/rockchip/phy-rockchip-pcie.c    | 16 +++++++++-------
 3 files changed, 14 insertions(+), 17 deletions(-)

-- 
2.49.0


