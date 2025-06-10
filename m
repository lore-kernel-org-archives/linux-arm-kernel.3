Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA82FC61DB2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 22:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EBMArELZ+b7OqxMIf1SSzcpla2zyCJLD/sNtyqPFkUk=; b=riWyiGXK59IGrkmxDp+KuVwwoa
	Iu5uDtc3hXtQhICcJ0mhVtycPjpkf7ofZX8MAWG8uotJi5FcS0gyNPlqVaJuIbGCGrM8nCv7cgx0B
	o2uASltWCyhRxu4BrM9y2Ti1oehiqy9rD27hcw00p8QVpwDAIRJLbw1ACXQ835cZxbohR6Hry6Vug
	5p/n/JItjDy26e/hzPzGGumd1IeCEuc51OquGDQ8A18x+/33iwAdQ+s4q+6wAdcB1P0SXpzTSHIPG
	xIK24oCC7l58jZ4Ie4ZFYWpd186NtP+MMXhGLsDzSGtcspgT9N+IqefGLocqLK8q0EmXaD2njeltt
	SRqGdLFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP7lr-00000008Fs2-3Tu4;
	Tue, 10 Jun 2025 22:48:43 +0000
Received: from mail-vk1-xa29.google.com ([2607:f8b0:4864:20::a29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP4Hi-00000007sV6-2QJK;
	Tue, 10 Jun 2025 19:05:23 +0000
Received: by mail-vk1-xa29.google.com with SMTP id 71dfb90a1353d-530807a856fso88907e0c.0;
        Tue, 10 Jun 2025 12:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749582321; x=1750187121; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EBMArELZ+b7OqxMIf1SSzcpla2zyCJLD/sNtyqPFkUk=;
        b=KydZZ2QzR1VmPnYodPDAydmJlFIgjA21Y3X7jaHX2htchtSDjLpuB9hu6eQOoUuhYQ
         y+NNtv9ntAadG5f2Sa8J5ty/RDf3RNiqEaeOyUIKqT//6TwXXs25O2Okg/9wi04M7P7f
         d2I/vmqXVBmgrjmHu9c3xZJr3iekRq3IrKm95PyR4tP6OAj8qLwYI5GuIt206/MWKsqp
         4Po/BE6lSke8XCrvs9B7ijDSIjkyrTmdHV+K4Cm7I+C4s0VNj2RRXhMW7W0W31bTmhhL
         1fqoMkDlyYu6uOwAeQEJ5umIwhTPDPpmP19p+d6JA0tOJJ/zgzlt75lFjwJ/gkcMPVs1
         xP9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749582321; x=1750187121;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EBMArELZ+b7OqxMIf1SSzcpla2zyCJLD/sNtyqPFkUk=;
        b=DtGwzfm6mpWwuZtMjaxr9kPMS+hQ08Cvz1sab9Kw2HSZ8T3laXoAS8kWYwd9DspAed
         6FO6Qfv8H1f0dm7vZHJ6tLs8do7H+/48W/v3o2kWHUudJHqWbIsFQlB8beXFTrC3MmBU
         WC1fq9FudH5XtbUWiX+zCkqvrBUsF7voXmfiSZ6S0+9mRqsxfM8TtAYFRfcU0h7a6vGw
         uq09VXE2dFR9N3P3lm30xT73HwO3S+dVqME4yU+Rah54gPxncV046E7SGqFwlcSsDPQA
         1U9scD+gA3SJAAHy6zss+jnPI512o4AVLHcKslCOn1oVmOB4LfMLqFGpanDJluGHcRfy
         E1cQ==
X-Forwarded-Encrypted: i=1; AJvYcCU51tAdyh7sUNP5EfazK5rOzDp/OutBeF+l+Gep4b/pkmW6BIOMUKBg3H+hY7qhMUZgkqUELfhplVuiBpt6seWM@lists.infradead.org
X-Gm-Message-State: AOJu0YxBKLWN0XBY/JB6UIi9jhmo6RnD9CWE4sHugbgfwEDELHyYCYEW
	CcfTnyCzNNKOPmnF8j/W5k2ig8V+BPPGgP7PYEysWEu8prYfOaFG88EvS1SZqzXZ
X-Gm-Gg: ASbGncuXiHrkODlzMQvbQubbmhbyjIT17MtbsV6VAkkaUyts5uy8bljwRfkn2Z6jPll
	AodEtQB5qiQ2lBpfux9vVED0nFNVrDBqnx+rXVh0rIgLCfvglwj7kxgpOl1bSt4MGx7Uf2BXZQS
	J6zWs0Sl4z5u+3LBUm3jAPtNl9kXA1giQQKISTf2YjFYiC1pGk3EP3X+001M9n8C+RknyuUVMdS
	rIH21Z2ZJSF+Spbbyj4ytgX1tJsOWL0s3ltv27VgtxIlbZt2TOg7ASerBj8uyTk+dzNrTJoQx71
	5W0N4IgO15HcEovz/e1jmYU3bbURfPOb+1HT8Sq0jHL013k9y7c99cICjl9S
X-Google-Smtp-Source: AGHT+IFvkvLxAMuApjj0TaS8+IPnWrq0/20erFO4UhwpQr7lrHSO8t8VmHDaRPRY4P2rvSgSjxJNlw==
X-Received: by 2002:a05:6122:4f9c:b0:52d:beeb:c6a3 with SMTP id 71dfb90a1353d-53121d50761mr1104020e0c.1.1749582321327;
        Tue, 10 Jun 2025 12:05:21 -0700 (PDT)
Received: from geday ([2804:7f2:800b:5a56::dead:c001])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87eeaf3b7c6sm1735824241.21.2025.06.10.12.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 12:05:20 -0700 (PDT)
Date: Tue, 10 Jun 2025 16:05:10 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: Hugh Cole-Baker <sigmaris@gmail.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH v3 0/3] PCI: rockchip-host: Support quirky devices
Message-ID: <cover.1749582046.git.geraldogabriel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_120522_617580_BD545153 
X-CRM114-Status: GOOD (  12.18  )
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

Hi folks,

while I understand there are lots of already-working PCIe devices
on RK3399 there are also many quirky devices which fail link
training and refuse to enumerate. This RFC series is meant to
alleviate this problem and has been tested on my Rock Pi N10.

Note that with these patches, link will train for quirky devices
but with Gen1 only and only one lane (x1). I have separate patches
for improving to Gen2 and all four lanes (x4). They don't depend on
this fix however and since I predict the present patches are bound
to be controversial, I decided to send the quality improvements
separately.

---
V2 -> V3: separated commit for reordering function as per Bjorn's
suggestion
V1 -> V2: adjusted commit message to be more clear about change

Geraldo Nascimento (3):
  PCI: rockchip-host: reorder rockchip_pcie_set_vpcie()
  PCI: rockchip-host: Retry link training on failure without PERST#
  arm64: dts: rockchip: drop PCIe 3v3 always-on and boot-on

 .../dts/rockchip/rk3399pro-vmarc-som.dtsi     |   2 -
 drivers/pci/controller/pcie-rockchip-host.c   | 141 +++++++++++-------
 2 files changed, 87 insertions(+), 56 deletions(-)

-- 
2.49.0


