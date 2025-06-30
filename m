Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 607A0C83030
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 22:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nOqcQ9E+8drflPFHAs4vSUWLT7BoxqpED98LP9u+w/s=; b=UrmN1ZrpuTpFjKIJ5k0q/toZTu
	TvB6dYJ7RC3/jKovMmDiKa/H5cIkEHUuZ6YOZ1TnMrAy84fwM2FdN+pmeViO4kzdy4TVuwQrQK4ml
	fGVpA4xW8xkY4KrrAJfxsKQcOq2iGAj6dVF9Sz4D0vxQfoBy3WpcwvF4uAhnfKZl1mTBnOaxWjzDM
	4uxcCcQHKgvQM4uDPYgYDvKLX49IdlAQaRO5/A84LBb7z6TzFS74jZvo3TDNrlrBJqaqvwczEchlG
	CET3f3ZAqlyvsY/YYlJOKY7wXdnEzW/uo++Kgesdf1l1KuBxqlJEtUU2MXxXcETOK/gdTKlTkew5g
	l0bPKiWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWMYL-00000003YFG-1CSa;
	Mon, 30 Jun 2025 22:00:41 +0000
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWMRP-00000003X0z-2hWL;
	Mon, 30 Jun 2025 21:53:32 +0000
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-6fabe9446a0so47061816d6.2;
        Mon, 30 Jun 2025 14:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751320410; x=1751925210; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nOqcQ9E+8drflPFHAs4vSUWLT7BoxqpED98LP9u+w/s=;
        b=AXLFRSrZVCfAvYEi8w1WoYh8w8fGJ4gdtsPVU24cEO66daSV9eQkF6/7ZwtJeyjwIt
         BCp1hSn3La5kTmfXWOvV2lsArUFkUsew+9qbHtXTUaRxWk3CylL4fCuOtdqp04iGyUqI
         FxgD9u5q3EcJnRUIBjFT8+12HgnpUlNz+FTNBKg3eE+X531uzQ1rG6EhyR5edZ5eCxpc
         r2VvewTTjQhaZF4+GAYLAH1ePfqZV9R7LbnYJLX5opIkvzOVCkTrDyS3ODpuVWEvE/Yi
         6MzWNVz0FFXn3YSt37euyV4i34NN9gu+WOjUvbuNOzgMkeK8ijY6n+dnz0MbLLlfqdzY
         4HDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751320410; x=1751925210;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nOqcQ9E+8drflPFHAs4vSUWLT7BoxqpED98LP9u+w/s=;
        b=TIE7LdXnXl73ueYEuua2UWf6PziuwKKMYrXIeZl3RJHD8wQziz6LDsrl6dZTuXKp9z
         4dtO8Ki3pN1/ZrQ+Rqu/GdU0lLOlc1s0GLcAnUBFikJnCB1B0UBqbCZhvCPF/g7kxSpg
         +U/b6J4WiR0/FIX3YhnIVB11TZrybUctfs6S6SD2Ja8SNz/IDSdkl3CVlCkD6ZXeRmKk
         pJWUZme9U2Aw0S7wmveskMoDFLry0A5VwuRvj5KGptop7bHzCr9vHJqhxKibvA+uzPny
         AZy6ajQUlya+/lMwBS6RSEw6Axn4DM8d1jKDHaSTUPxXeYgkW5AOgCI3TPe1HKyBY+83
         YaWA==
X-Forwarded-Encrypted: i=1; AJvYcCUgSVEGUDJ5yyX2tShW25p/JS3SBGKrBvCLteQKT/c9Ua8tUMvIOF2WXeeE4o6CbTMRGwnGpd08dvn3x0eN2hv0@lists.infradead.org, AJvYcCVM5bljvnNim/FAZKahPWNXaK8P73leS8pRA1ZeRj9zP58xNPPOj5tdqtelRG43+xY2e7LhU58XQuPo@lists.infradead.org
X-Gm-Message-State: AOJu0YxRbsJ6WGsupFy1rbZUg7eOIP5n3/5/FeE2/ZerQNjB8045FVkW
	XjWV6FJSb/OLAH8TvGodJp84c9/gL+hrUrpg1lxluheWRQgHr4HKKzm99lTKLIue
X-Gm-Gg: ASbGncs3MTVwjjptqz+Va8BjKawB4jvAFZ0MW+QFIFcYVyEnpBuwnWw33tSt2Bscab2
	/ewsGPv5+Wpfl/axXSjx26kxNbAPDWg9kDBDtu4EcEC73hb4pwb/FJxaqddxsi0UhNJNzh+IRQH
	GPOIuadAn1eY87j7HSg9gmbKmtXIo/48dc6zUKc/QHPGIDGSBLyj4sddhDv/Q5nwUZ5ABfQZpXq
	9Wna5/2FC2Pe6oBZC69L4oj9f8hM88g61KbpHP8ZxaIUaJzAM4w2fx1ycV+XVdNegGgxsOdWmHd
	zY9SEb03SeFxCq9VvOHb4q7vThb/vRjSDKLH2F8lNOueVwVAr76JfTYWcA9Q
X-Google-Smtp-Source: AGHT+IGpu1rUc2wPFEaXEFiIZuBQa75ZWCWrqwnzIwLkgnPr75eA1zu83NjRcG7DPZSdyWYMNBDIag==
X-Received: by 2002:ad4:5b83:0:b0:6fd:cfe:eb95 with SMTP id 6a1803df08f44-70001a48ff4mr237172516d6.17.1751320410561;
        Mon, 30 Jun 2025 14:53:30 -0700 (PDT)
Received: from geday ([2804:7f2:800b:4851::dead:c001])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd77307918sm74425236d6.101.2025.06.30.14.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 14:53:30 -0700 (PDT)
Date: Mon, 30 Jun 2025 18:53:19 -0300
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
Subject: [PATCH v9 0/4] PCI: rockchip: Improve driver quality
Message-ID: <cover.1751320056.git.geraldogabriel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_145331_681835_935F3737 
X-CRM114-Status: GOOD (  10.00  )
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
V8 -> V9: modify third patch to better reflect authorship by Valmantas
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

Geraldo Nascimento (3):
  PCI: rockchip: Use standard PCIe defines
  PCI: rockchip: Set Target Link Speed before retraining
  phy: rockchip-pcie: Properly disable TEST_WRITE strobe signal

Valmantas Paliksa (1):
  phy: rockchip-pcie: Enable all four lanes if required

 drivers/pci/controller/pcie-rockchip-ep.c   |  4 +-
 drivers/pci/controller/pcie-rockchip-host.c | 48 +++++++++++----------
 drivers/pci/controller/pcie-rockchip.h      | 12 +-----
 drivers/phy/rockchip/phy-rockchip-pcie.c    | 15 +++----
 4 files changed, 36 insertions(+), 43 deletions(-)

-- 
2.49.0


