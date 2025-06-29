Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCB29C83026
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Jun 2025 13:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3qT9O4ctgmI4E+K04BSgVRvvO5rn1N9tEpioEcUF5MA=; b=P/2krwfKGUXP1Y4dgrC5ab4E01
	9h1nuL4RGjJqUr6HThwcsxmxLVDbJuPEhQSJNlIkcaASRtiNNwDtAPUlfeR76KIlrfX5LSM4PqUPd
	7drAA6FeNn20N/N2zdMYwdDU2C/cURCDQAB+Rr1ixUoFzzkI0BUm0s5Zj75z0iEPz1fB32WayncXI
	NKHFOidEooOhWPl2WjuiigXlYGzilBzdolXfcL7af4sLGEsToPs2VLOHT9gwz00TJiiUCHJdZkY8P
	I7KygdqQOVpJDwJzN8At0yLxqsR1fbxI6FzawrlbyPyezJ8/H2yEnyss6VaQu4KFEtAnTgCYUDkQQ
	8ceZylVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVrka-00000000GYm-3OTD;
	Sun, 29 Jun 2025 13:07:16 +0000
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVrRm-00000000EuH-2bMO;
	Sun, 29 Jun 2025 12:47:51 +0000
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-6fd0a3cd326so17345506d6.1;
        Sun, 29 Jun 2025 05:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751201267; x=1751806067; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3qT9O4ctgmI4E+K04BSgVRvvO5rn1N9tEpioEcUF5MA=;
        b=i//dlq/Hk/Qvkmfii3lQMS+WL30VDjn4glC+CeeBt/rTbHx2yqWypewXazJ+m6OMtB
         yi8d7cm75994G3f6Xz4ozFAvpemlFHeAa4omtzpb2Lx2+TWSgoFMiBCM3b7m7up0SijN
         E2gNR1rm4xemyRE8baDoaH2z2HEzV7XNf0c84jufnruDe69NjGrXbAXP5B6IRsJNYlKM
         x+W9MnujNjz+cMGQK6G9HE6aZxBnJX0xZwI+plwJao78sHbQZddqv/xu7oKQVGBhYROp
         67/CU6ZUM3VqcAD/6oQ8A32y3YhLDN20NFrHO+FVOfomYMSYP2uWa9kWfb7HHZ6WqWpO
         a/+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751201267; x=1751806067;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3qT9O4ctgmI4E+K04BSgVRvvO5rn1N9tEpioEcUF5MA=;
        b=WllGjY3KVIa9SJOInLoOrhS5sfIfXy3KyZ+FvW5XPwN1I+P2X7d4S1iSUbo3EZclXg
         EYUD09djuBOGejPFP0Llca3Deq4tnyk8wL7/A6u2XHQ99IZE7dXzd8CP2lSqFUtuPmFb
         8i9o/uHkZyyxfs6T5StyNufg5FgzCLSJVNOx/VhFIuepsR+/IysKJFaCwKzPoYK4gbAW
         nXUB7sTbB2/Ho+gEVV856Cqnlxmqti8EzUMeCbS+26N0eCAulEYsqobunzvTuVindkUv
         6gNOdvdah4qwADEjjDsiLUQJVal7BS7E1KMa63H0QrKl+CqbLn/oYkh/V6eDebWqyObG
         LMew==
X-Forwarded-Encrypted: i=1; AJvYcCUx9YAGOgB9DQ/Za71vBTbVRacrt6utJ9/V+YDpYUcNAb+1ITvO9rgK2qVZDo0wdpXjR5lj76sp4VfS@lists.infradead.org, AJvYcCXzsA3j9vLo/MgV39f2+Y0SeEXT+kcHHZoxWpL6hq3DAxPhz0o7czGLQcNzCbnG2Oq9A3BRCyO1CDjkWJxuRzaq@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0cZkJdyjmFLcCNL2cviMFTZJTtIfMAOW98J8xL+XUPgYo+/0C
	swkUxvWxJhMLeQqtSg28novwvRhyldemMw5lT3/FClPclfOPDLT63WrE4lSAuzddoReeFCN6
X-Gm-Gg: ASbGncvOnkdKQHZ1vWJvkFKP4nCLOTEQJgUrMjv2IfUyhFArl2gYa5Itwz+1rTArF53
	tnMOZL7kATYCrYgYoe+dYZT+L97H1pMKvvv8mvaVGg6YtWCL26XJOIe2Y8UXLdm/57GWFECn+Hk
	YSuG0OFTI0wur2DpbYIhHV9JJ2i8AI/rk+lKj9SLmXCJCPQQMZnkmrptVeEzv+AGiKYE4SJkZMy
	f7a9qTv1PMSeGvGkfMUR98kkvnsa9Hwi6+X8SScx6pS6QX1IRc6x0HlDBY/pCtfafK9KBgnL8KR
	A1Mt764AxwdiaOVfJswoYPpFZbBatC9ggLtbrcCbgbZB+htmWWSPMiuVpIaT
X-Google-Smtp-Source: AGHT+IFcnXAwt3wLBy9B+NJBG4yLeL8rwe64avI9teL+o/I8vjzQhNTT6+gyyIUOBrLOsm/ff7s0DQ==
X-Received: by 2002:a05:6214:428d:b0:6fa:cd55:3823 with SMTP id 6a1803df08f44-7000214f607mr153311086d6.26.1751201264933;
        Sun, 29 Jun 2025 05:47:44 -0700 (PDT)
Received: from geday ([2804:7f2:800b:24f4::dead:c001])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d44323bba2sm430549085a.109.2025.06.29.05.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 05:47:44 -0700 (PDT)
Date: Sun, 29 Jun 2025 09:47:38 -0300
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
Subject: [PATCH v7 0/4] PCI: rockchip: Improve driver quality
Message-ID: <cover.1751200382.git.geraldogabriel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250629_054750_677697_DA76B7C4 
X-CRM114-Status: UNSURE (   9.34  )
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


