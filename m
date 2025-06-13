Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EDF4C71135
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 05:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=k8J3QiOw9YA5BRvHLHJu/HycsZALO2W/PjHSUFrfbe4=; b=47OiYqo9K7FO19Vw63A3NW7tNn
	ySH2C0+xfMjsLMh4LffdDAh/WChneEbYh61YZItv0ObWEz/bz4ily0UjZTAEIIrduAutmlRm3SFh8
	rvLPrdlFRDJscWi8Lgvpb1Ab/vl1hzaSJc7RmMabEm9i+hgrrCT3Q3j24d74/NJ1o4HN9ZuTDKv1C
	tWacfgW3ijn9kcIPDkHHGueZPDptlCS6qlmBNHTNnE2ncJ0xvU9vERl9QftnGAA4HdZfPQGlR431W
	tJ/qLDI+ThCsnd7alTYh2d4GsaK/32XPZWhSJPsSwfZ03ZFXSgxvJwvnl1vWkpqC0DpW6eDB0KPXP
	E2HXp+2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPwry-0000000FMvL-0J3R;
	Fri, 13 Jun 2025 05:22:26 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPwpg-0000000FMU3-1YmU;
	Fri, 13 Jun 2025 05:20:05 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-748582445cfso1131450b3a.2;
        Thu, 12 Jun 2025 22:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749792003; x=1750396803; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k8J3QiOw9YA5BRvHLHJu/HycsZALO2W/PjHSUFrfbe4=;
        b=YduwfcsjEmAj0MAtXyMoc7IBLZvTfqGbZBqo7xmKQPVpRctC5Zvs6d68Xq0nsjKdNv
         6lfAzTtwJvHL0Jwxo6pOt2f2vFeDJdFRplqJ16Oj06xiO2v8YFA30NEmfoFT2X0QPhAi
         Py8uUn+TsJFEys2tFOBw5r8YKbtK/oxTRCVp54H26xI5bVE5RvrFXBIquICcLWAI0Ot7
         qaGw3WixVqR3sEupkQAyOhL1hDMjsaUMcDA+i9v0u9c8noyt4IcGnN5+nCw3tAIN0pSl
         J1OpSnoPxe0w2W6sMfHBI8SL0ERbWQxClxgwo0V7h57eWYoxpN48z5utHhmK5HgZ1Rnk
         Ok0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749792003; x=1750396803;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k8J3QiOw9YA5BRvHLHJu/HycsZALO2W/PjHSUFrfbe4=;
        b=kai+0ipiXTNJPoIkvmCdCXyll+/dMIOpssyUUA5TVhGhXPWYCIZ70tD/yPajawsZm3
         jPJmaf3Xfni+V69R+B5oWjwNUVZiKwfXZmt7kalw7e0+HG5Jb004S0O205TK1Ti67Gp4
         n0p65YP77uXrwdpzMeGSRrFD3u/zdQiBX2NjIidxlIVMeZ7lyKOCwws06gAlpjB0laI2
         eYl0sviHsICokekBis+lLiRILNvj2VgGmQ7iGZSWmirXl+h9XvN15pcc9jpoufVrWTjD
         O65/p6l1XQHOlpOdKEAQYhe1nH3hZYMlSeSznzbylAV2LfSpU0gIO5F8j9Q+du2vCg2I
         c8NA==
X-Forwarded-Encrypted: i=1; AJvYcCUycfv72n+7A7FHoIubDambNOS3jJ7Gv4+rG6284zb4ziF7TIIu3pmcqhH2IRI8s5HVxEo7dlP07gAc@lists.infradead.org, AJvYcCWXZVqg7ek3dj3hVPWxqFFR+VulHN3fIJiEv5k/MA+SgPZn359W2+/e8zzb9Iy3VlmXfTmAbX/6QeH0Xupczhvs@lists.infradead.org
X-Gm-Message-State: AOJu0YzvRDargJcZWJRjIAAkkb9cEyy0tQRdEOXnVq7TJBY+eadEJ5sl
	uqsgjfWRCDdfIliK1keCgtKdTCDXDGQqyVqCH1rT+bwU4+HK9VTakksuO+WV+1WP
X-Gm-Gg: ASbGncvUoR2bXszp1iF8/b/YBw8Iqs+iLhM/yVFXKku7ygAaa26Jw6JoEomtHfRK2LW
	E/aLd0NFEEjcCysNq3dPv4EtlxcGouw0nJ/1BnZpcRnvlu6qdg00581eQtaiob2/QA85XRIPnxS
	UcQaM3R13M4OTuI2JzTBoBnJ3eKDugYyq1xKZlrpwsx4t9rbT72nPZvOrrnmQ1wQ71TM3cIjeck
	c44jwKP964smMC4/cCAxUqo4p8/KMdo78mBEUs6WtUEfqW/pXnmC5uBi3Mqc9stWwIkeElXlyAy
	7Hvzl2oyI52+3TT2SQOHSyqPfz47sWrNKR7OlHnxGEiDkdin8XNHVFAa0FrG
X-Google-Smtp-Source: AGHT+IHcBqV07orbqmglXVR0EDk2W9hXsnO11JVIlP10U4fClURVXyuO/Hy1R8naKjKmYWjFRCjmfQ==
X-Received: by 2002:a05:6a00:2342:b0:742:4545:2d2b with SMTP id d2e1a72fcca58-7488f6ec975mr2504576b3a.3.1749792003042;
        Thu, 12 Jun 2025 22:20:03 -0700 (PDT)
Received: from geday ([2804:7f2:800b:7667::dead:c001])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7488ffec9e8sm735318b3a.11.2025.06.12.22.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 22:20:02 -0700 (PDT)
Date: Fri, 13 Jun 2025 02:19:52 -0300
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
Subject: [RFC PATCH v3 0/5] Quality Improvements for Rockchip-IP PCIe
Message-ID: <cover.1749791474.git.geraldogabriel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_222004_415272_E2000FDD 
X-CRM114-Status: UNSURE (   7.32  )
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
V2 -> V3: correctly clean-up with standard PCIe defines as per Bjorn's
suggestion
V1 -> V2: use standard PCIe defines as suggested by Bjorn

Geraldo Nascimento (5):
  PCI: rockchip-host: Use standard PCIe defines
  PCI: rockchip: Drop unused custom registers and bitfields
  PCI: rockchip-host: Set Target Link Speed before retraining
  phy: rockchip-pcie: Enable all four lanes
  phy: rockchip-pcie: Adjust read mask and write

 drivers/pci/controller/pcie-rockchip-host.c | 48 +++++++++++----------
 drivers/pci/controller/pcie-rockchip.h      | 11 +----
 drivers/phy/rockchip/phy-rockchip-pcie.c    | 16 ++++---
 3 files changed, 36 insertions(+), 39 deletions(-)

-- 
2.49.0


