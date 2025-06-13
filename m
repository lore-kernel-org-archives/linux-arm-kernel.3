Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6528CC71155
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 19:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Kn1ckhgHo64BPoEpHx9buqHUv1Oyd0BS8vEud6lPxjA=; b=VigjYI3bw1qLjzhi3BiQb15p9g
	MRYQ0a/LEYe7ebCbjcyGD/+/CJ3cfn+5FhELEAJzlKXfG24jnuqRjRaJxdc69pkbmd+WTGuHFNB+6
	OxWBVIDiYUJu+JEAzg+zW71qF0ynjsI+0QWlLG/0Vsl4AtZ3D2uikhwc+PkJamwIzwloEwhFnnvmG
	MpXJgBUA3gFtJTfBzuk9auDfg9+ovfvDYqj7yw6IaP0QPGgzGAwPw9uYJ0mPoAnfBicpNT9fHjgks
	1elmOJh9saKcNPW+HdNCmghu8mdIrMfBICo4xVbuYd6KHheYCmQYAJZiAiXWN5yf+zTi15ywvT6xH
	TkLE/6KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ9hB-0000000HNaX-0RZJ;
	Fri, 13 Jun 2025 19:04:09 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ7oD-0000000H8E3-44eb;
	Fri, 13 Jun 2025 17:03:19 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-b1396171fb1so1636902a12.2;
        Fri, 13 Jun 2025 10:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749834197; x=1750438997; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kn1ckhgHo64BPoEpHx9buqHUv1Oyd0BS8vEud6lPxjA=;
        b=EdmMDOver9YJQGhuprcD57X/povU4kW6fjZcGXl36zN+OZY39pWx9YJWrKQDBwf3xP
         VHSXEucdnvUw3+TpadMy2qQiW2+ImyD34PV5Ww+E+IO5stzN2VvN8d8NlAoR4eNDOzYC
         NjFPsctW9lN4Kdimx1UtOBv1T+9TyfEp86I1oGH0KEeIVxNgI+4ecizBDR9q4zWdgDWj
         3ykobu1OOsfQ3S8k/GMGWZbsdjKX2lyYOhVkwXcTnECCpp1P3fFir5oUNeFOg/JuU474
         5KktXUcwD6EB+hIZdAlKS4JGJMJSD6cIsdnU3D0GnqxORRWBUwbtjEi4bHU8yPHGsZUV
         70WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749834197; x=1750438997;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kn1ckhgHo64BPoEpHx9buqHUv1Oyd0BS8vEud6lPxjA=;
        b=mqHYkhp5Eh179YwiCyMV3XTN30mkGD6MgoIEyLoKu0+E7eikzNhIPIOXHLnaMIKTcF
         lA9juc0bahHAds4qMuwY7aW2Yy4o9bl22oS8DMRlqbTorT7Wp+bsI8GVy3Fw6pQFn1iC
         PBJveAFLf50BZeGM8F8MjBEWs5i7xg9MEvzMbSrdQxSAMixaQpMQ4zZoVWPrJg5JxtHO
         A3y9i13V7SbTlkU1tapSNfm857vXMzlxMzEiOgjsVBowIQRM1vVD0FnDfQVyPehZLYMK
         9e3bsz3sRhIQ9PlBCKdwFPzCzI6Wx3LKS7WfCBNYKNY20Ex9UR1IMiGjWoRwnUjfSdAK
         j62g==
X-Forwarded-Encrypted: i=1; AJvYcCUuQ0IIfogiKuAW/HDayiNTiMegrhEHz+2foOnTkRaYPOQ9uEyBN8vcJLKn5NlWrryTk9P7U8xYwZJi@lists.infradead.org, AJvYcCW+C9CHAP2bV6/vQv4C/cZJB/J1LAsS8Lm6sJrVOrj/wJGrpWXbQ8Qm6/i90t96miAIeyFXTg5WNXaItuJPhEua@lists.infradead.org
X-Gm-Message-State: AOJu0YwEukOheQq6fA0ycPZNhvrQore4lnaCw58YAjwnCO6Zy8EzuUHe
	QSoMp7i5rl1JEH2Hu5f6pYSFxAlA3o+bBni+YEaWtKrlh6IclyPDj6x7Sm8DXibd
X-Gm-Gg: ASbGncsNbHUAo17GMeg6LknSyPYfGN6sq4jzzZFD14rm5m3eblymd8V2Dp5PngaCeP+
	/3IiZTGpDHAg8Lp65dvAOliWa2RpvV85Nfzhn60iv9lSBwUbO10Y/VihJSjix5FkX7v55ywAjDo
	ROZwZPXTEuWK4rfu+n8sQ/Q/5NMikjh4NLhXGCYDBCr5E6H+kc9KkqfdJjImiSG51NJlnIKzjDC
	+E8KOe3UOQbrXJUia7VP5vwOQinzAwyEOejDWhMdbhUq2BqpQYgfaFH4/jkYnWSdq2rGFgXxNTb
	LpW5fSdfxjGf+6w2G4v+jsB4XMXVU2CY3QfzkJqmE+u81eaO+A==
X-Google-Smtp-Source: AGHT+IE0ysRgafNmvzcIEeHIwfE133KfLqRER/QsYHGgAAkVNDFrgTlsHHQwGU1Al9+VxkGy+d6OGA==
X-Received: by 2002:a17:90a:d2c8:b0:312:959:dc3e with SMTP id 98e67ed59e1d1-313f1ca0fe1mr613630a91.10.1749834196976;
        Fri, 13 Jun 2025 10:03:16 -0700 (PDT)
Received: from geday ([2804:7f2:800b:8497::dead:c001])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365dea8ccbsm16758555ad.167.2025.06.13.10.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 10:03:16 -0700 (PDT)
Date: Fri, 13 Jun 2025 14:03:06 -0300
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
Subject: [RFC PATCH v5 0/4] PCI: rockchip: Improve driver quality
Message-ID: <cover.1749833986.git.geraldogabriel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_100318_009715_A4DA0FF3 
X-CRM114-Status: UNSURE (   8.32  )
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
  phy: rockchip-pcie: Enable all four lanes
  phy: rockchip-pcie: Adjust read mask and write

 drivers/pci/controller/pcie-rockchip-ep.c   |  4 +-
 drivers/pci/controller/pcie-rockchip-host.c | 49 ++++++++++++---------
 drivers/pci/controller/pcie-rockchip.h      | 12 +----
 drivers/phy/rockchip/phy-rockchip-pcie.c    | 16 ++++---
 4 files changed, 39 insertions(+), 42 deletions(-)

-- 
2.49.0


