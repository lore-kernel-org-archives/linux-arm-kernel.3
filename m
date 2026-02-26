Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3563FD461E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 05:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OHjA+gD2gl/+zcPzbbJ9jvIxiqgAysEUeuXfqossHNc=; b=RXGOROSw2GIKEqLozye5siW3FI
	CtDSPKKIb78ac90xEgaqPzkXb0tcJ0ULoLVEg32l3vSW9NDsV6p37JmddYp1hdGhWMWeXP3B1jjVo
	IXZBqSaujcvCAai3m4g1cH4epn2yNnepvaPgIBjgCp8LDBdQAsYvpWgMCYHNi+RuD8uCtl5kdxZPs
	9U56BUDE8csaPvqSoSWa6YdilKzbHhoyZH0JupafGbkTyVtBuUSRB8AagHWZL9JoF/IgvnseJMC/t
	YT/HmSaGLyyqvKqnL6N91ggjJ/zZAgHYGT0R1KxHyPBAWs9xlvddtD451bv8F3FqUoX8P0uHxt45H
	ZSTvSLhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvTaB-00000005P62-0kOl;
	Thu, 26 Feb 2026 05:06:39 +0000
Received: from mail-vk1-xa35.google.com ([2607:f8b0:4864:20::a35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvTa7-00000005P56-3OV7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 05:06:37 +0000
Received: by mail-vk1-xa35.google.com with SMTP id 71dfb90a1353d-567543b8989so220768e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 21:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772082394; x=1772687194; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OHjA+gD2gl/+zcPzbbJ9jvIxiqgAysEUeuXfqossHNc=;
        b=bUWGdEDd9uj40L50E2E9Ra10XgNtPlIv7/CZcHuVIKeotDSyeZMygqFW/C2x3RVEUg
         Cq2Kpj+spJHVO7x4306fPZ2nBa2TXAZ87ZAsVRscuOMtbUXJdS0DvQ76D5+AH8cwbusX
         UAWlcUnINWOPN9oRM+O7ydrqajn4R4QuyA68JSyaVSznajRyvHOg6qnj/o+OdgSRqz41
         HMaSGRWllx6iy1MfBawhRK90bEEd7pvoE6edzkJufYe5CNDHrvd8dYk9P1Wqc/nUSuzd
         ODgHrglEI7WPoud+NQfXmw7XyfU+CnxaGHBoegpp0vPPJdGCFd2p16uYzvthokVRxESM
         UnPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772082394; x=1772687194;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OHjA+gD2gl/+zcPzbbJ9jvIxiqgAysEUeuXfqossHNc=;
        b=vtTIGe49jduXBK0x3r7GLy+oyL8TlyLZ6+sokSNSgWT06HooRKoTlZEM1ao9mrDtNs
         ybRNQX28LOqEouvs0ocBgCjE91Zx3NtU64aEQGCWv4RCs/BxmOKgb9XtF3CXtT7uDAa2
         zGfHHZHAup+zFSxFoJXgohe/dzWsp59FMW92OKXS/b+O++pqVmr721xNJnASpQPiFquH
         f+WTaKJN9seh5gthOVokpzov8RhpYDW3vt7Uw+BPfVOp5sfEv5c/MsdHSiVUBvReHOah
         6H12paFfZEnbVQfMXZ3g7T97Cw9j6s0vQlDVXtlXDD6z368Ay43lJ1K2GZebDwrYRlon
         sFpA==
X-Forwarded-Encrypted: i=1; AJvYcCXwBN4PVnK/obvh4SkYNVF6reEWBW+pzs7iKHPx0QOam7XWewRIENnx3TZpi99YYfFfyGA2kBv4PYR17+QtGqQK@lists.infradead.org
X-Gm-Message-State: AOJu0YxzzcA7bOy1BlHoGrQywDTinDsxeDHksywW35r1v4S1QSolA4M+
	FjoAaro3Lh+fAz5UjEmcIISNlhjJg9Ufl6SoDWp3ViO4XXr9Jq4aNXQy
X-Gm-Gg: ATEYQzzND2gH60whlgqX76NKCsYRH7e5sUQV8n/5DHBfyYZoPhvuB0H8e/xyjWc0rp3
	RIqpBfEryBnLej+jbw3vXouy6ZPJnnoFZqGtU7zYcX8KE1AMeyzWpwJqpf5ZNlTJlFOf//USMDi
	5oA4gWHr8NMDrXfR9GgZ7MSXHnMrZvY+EZbqSan/DPoR2WPgR0Fib8iRvppTl9BoGtNUDsc2Z+U
	f7TGA4485oM3AmizmTk7jp3vrkuNusg6Bto/Sh6EJ0NljAyjnlwF98aZTzOSkCGi1Vl6HHwwJdD
	gHFddtUAsUgPYrKKHj4FQhAyB6QSo8+c7cns58mBxbKa0O7UnBVs1KqDoItA5vmIxteocGUFl8q
	Zphnf4qha0c3GXi+NVHJZni4RK5kdfU61nMv/eMMYOiBFTUR6fuSkSwPkEwmKhRFQdnsoaynU2L
	aimeWSLTfDjA==
X-Received: by 2002:a05:6122:2a55:b0:566:221e:a98e with SMTP id 71dfb90a1353d-568e48f5862mr7505040e0c.18.1772082393912;
        Wed, 25 Feb 2026 21:06:33 -0800 (PST)
Received: from geday ([2804:7f2:800b:f14d::dead:c001])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56a920493f9sm1290815e0c.13.2026.02.25.21.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 21:06:32 -0800 (PST)
Date: Thu, 26 Feb 2026 02:06:24 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Dragan Simic <dsimic@manjaro.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] PCI: rockchip-host: comment danger of 5.0 GT/s
 speed
Message-ID: <aZ_U0ASjuK2fZi5h@geday>
References: <8db835ffe384db63ee598a203751b298ad1cc267.1772057799.git.geraldogabriel@gmail.com>
 <20260226001229.GA3794668@bhelgaas>
 <aZ-RaBLVfEZA_FxU@geday>
 <e0aa10e5-ec0a-4d0d-6f71-6797286221cc@manjaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e0aa10e5-ec0a-4d0d-6f71-6797286221cc@manjaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_210635_873965_1BB84368 
X-CRM114-Status: GOOD (  15.65  )
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

Hi Dragan, thank you for the review!

On Thu, Feb 26, 2026 at 05:52:58AM +0100, Dragan Simic wrote:
> I agree about removing the effectively unused code block that handles
> the "link_gen == 2" case from pcie-rockchip-host.c, but then please
> remove the PCIE_CLIENT_GEN_SEL_2 define from pcie-rockchip.h and its
> single "link_gen == 2" use from pcie-rockchip.c as well.

Good.

There's also some code that needs to be dropped from the endpoint
driver.

> 
> As part of that additional removal, an early check for "link_gen == 1"
> should be added to function rockchip_pcie_init_port() in pcie-rockchip.c,
> because that will become the only "link_gen" value it supports.

What do you think, should the driver bail out completely if
link_gen != 1 or just let it force 2.5 GT/s speed with a warning?

I tend to go with the latter.

Thanks,
Geraldo Nascimento

