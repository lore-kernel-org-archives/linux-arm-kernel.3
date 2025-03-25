Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21B06C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 16:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x45WNxy+GXjRDdBoNfsMrlZpihQlvBlFRGtpBrd99JI=; b=3VYaJtp90LH+Co+QTMRFB3WH3u
	E6WcXOmHfh5EsjWrLalw3h+a9m6Z/1S2pWdQb7Rx7T1OATyHXl8nlgryVuKxdilZ3xsCh6Yjvvv7Z
	VDfYBiPkw8OkRp5xXOmhRZ3u9AdELpevepJYILkkSFihPg7VYh+jqsZEHR5Z3WhUoTLdcGaRzc7mc
	WQvnuSkyff3wc9R4rxNPljtuUNz5FIQT0StgXrX5JendQR3xopTl1RT+jTZcWdkelD+QEoS38Or1r
	2ica6xFko5oMxiZaV/wVF0Ey6PelwvrpEseuPVZnDPsj4sV2SaXQfWB9QHoJVKTSaeNClWw+Angn0
	xuWxcZMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx7L1-00000006WDh-0SQT;
	Tue, 25 Mar 2025 16:41:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx7Gg-00000006VCd-2TLl
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 25 Mar 2025 16:36:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=x45WNxy+GXjRDdBoNfsMrlZpihQlvBlFRGtpBrd99JI=; b=HXm6NkyGHT3MtMfIxAiiO/jcN7
	e590qGKvzb1vPHXqKLjcBvo5Qvl46L6cEQ0BFDu/V5kmn9hl+gqXhceEXTqcdMFlUGTJEUbBZrdq8
	57HlDwHIYXYdhSQbJvFQP47/iU6NqeB4JvBYhs42LizqD3xB8DHGiQp4pYfgc3bhTOvjbSC5WyrwQ
	pjPskv/Pk3O6jftPF8GDfGjjsT19AlG7zrq5Kkg8VB34UHyZ7yWiTKfSKY8jKnpz9Pq1e5YAcBUW1
	EgqToJVAcDZZNOUeerjO5EPWJmDfZMEnz/ZZ9D+a25rkUyGdv0pxam8FQe2vJh68krDvDQRZZl4Ux
	29BvlYEw==;
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx7Gd-00000005eqe-0wHI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 16:36:45 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-301493f45aeso9569081a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Mar 2025 09:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742920600; x=1743525400; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=x45WNxy+GXjRDdBoNfsMrlZpihQlvBlFRGtpBrd99JI=;
        b=k+BO/ez+ot+foYB/kzNjd6necSyNR16/Elsr3gfRVHuO24wPnGaL/Iyi9ZKUajtdZ2
         azFLSMsjq0Xk/3qW+7w1YbB6fp+/Jg+007S42Lbp/CtoTg/j0aozPkRMZiaF3T0Ihnm1
         MeDrfxl/AiVCDA9+RZvquWm38pfMlkM8gBC1yfn+2KLANJUASAg2spFOUUDMrHK0Wifi
         DE3WH8qZht5ofWX2f+2+zSORGz+pNDOV1RXa/deI4sBou0S9Q4mqWjVZe4KwAPa9oOHo
         0cO7aUdWdb2QFcSx3imltwvCjjjnfyr+GMiRgC/oUzDBprE6kCoEWPN21kGxpj9pstFa
         PbRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742920600; x=1743525400;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x45WNxy+GXjRDdBoNfsMrlZpihQlvBlFRGtpBrd99JI=;
        b=rw+IHlj66h0Uouc+YDVWs54MpddP8PkaTmGOxsFmLhV73g6ssVTP5KPv7GNNxXw1ez
         SzEAgT1R6PzCPJ1AhCKemc1MBnA3C5dpkMGMgUE0bFBBo6+PbDrXfaUTmBJq2yl9T386
         4C6l2wV72Dw3brdn09SXIkivayKGc9pdYw0ntrEcOGDrkpBR5wqYy0OFp43eMsWg79Pe
         LGzAFEcDaiS9zzhlDWB5AJULMHOYXgwldpDiM7cbyj0ZJ7DpoUzwq9Kxv8oJ+qCur4i8
         Ql18k1aL1YZB9XgkRO9VW9Mm7PrW8hdZsktApz4pExxE7tp2a2GXtPGsNtsGJZ0//VGV
         VZAA==
X-Forwarded-Encrypted: i=1; AJvYcCUPBFTxjGjUSB7CifoBjCOIadIEwwmqjcjVXhn/TPyolw5Shlqs9uHa+0D7AjPQi0pJWMNIQdVFYp3d1z1M/fo+@lists.infradead.org
X-Gm-Message-State: AOJu0YxfTT9ltpGnV0j39tmYr4GOr9ToIuim/iTVP/iTNIYmt1bAA/gn
	p5GjvvUuQPdgdjcw5yZN1wJNPZkYxZXAoZV+o1kn1wa7J2QDg6B9+pWuC9lObw==
X-Gm-Gg: ASbGncsuA5z0jAC1V/tWKjHvjkn6aCk9ExvEw2M8OoD0TLzkcWaSfr3AKpOiDKW76dg
	Rj+5A+SaUahAUOP6j5bC5r3QUd0DybaIYDxJINQr5onjOhcniXh6OjC5//3LhFZEO+9wu83YUz3
	QWrVoHwc4s7GUdj4SYaK61TNAvtYIAgVqqFpdAJisAeAe5Tr+Vo/aOI+qV7NTrFb5vh8KH46/fY
	EHuCkiokJNuzfgK2k3WVLH7l6PJIXVzQHNLjfqSncCMx51dFrLkBoH0qkXZgKHgTV7ZPfCw1Apz
	FZhrcMNC84n1HTk0Z4vu1ndhNhBGWViM2qLsBOKDC/OOwVCkGdUdur1t
X-Google-Smtp-Source: AGHT+IEVZf3cjT/H7LfymK6hzxUjvfOQ2dA0kGMvfu5BvFoGp9VVlRIweYBC+Rpqfm4TthlGV5Mt8g==
X-Received: by 2002:a17:90b:1f8d:b0:2ff:72f8:3708 with SMTP id 98e67ed59e1d1-3030fea9024mr30752421a91.17.1742920599697;
        Tue, 25 Mar 2025 09:36:39 -0700 (PDT)
Received: from thinkpad ([120.60.136.104])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301bf61a49bsm14597634a91.34.2025.03.25.09.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 09:36:39 -0700 (PDT)
Date: Tue, 25 Mar 2025 22:06:32 +0530
From: "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>
To: Hans Zhang <hans.zhang@cixtech.com>
Cc: Peter Chen <peter.chen@cixtech.com>, 
	Siddharth Vadapalli <s-vadapalli@ti.com>, "lpieralisi@kernel.org" <lpieralisi@kernel.org>, 
	"kw@linux.com" <kw@linux.com>, "robh@kernel.org" <robh@kernel.org>, 
	"bhelgaas@google.com" <bhelgaas@google.com>, "vigneshr@ti.com" <vigneshr@ti.com>, 
	"kishon@kernel.org" <kishon@kernel.org>, "cassel@kernel.org" <cassel@kernel.org>, 
	"wojciech.jasko-EXT@continental-corporation.com" <wojciech.jasko-EXT@continental-corporation.com>, "thomas.richard@bootlin.com" <thomas.richard@bootlin.com>, 
	"bwawrzyn@cisco.com" <bwawrzyn@cisco.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, 
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "srk@ti.com" <srk@ti.com>
Subject: Re: [PATCH 0/4] Loadable Module support for PCIe Cadence and J721E
Message-ID: <2sxwud7mllpbtymfvlw5sshv3fhz3rpk37x23x5ywpzle2qlg4@7bsqhcimnfqp>
References: <20250307103128.3287497-1-s-vadapalli@ti.com>
 <Z9pffxeXHVOsoi4O@nchen-desktop>
 <20250319062534.ollh3s5t7znf5zqs@uda0492258>
 <Z9qO1f5MgNcwO5A4@nchen-desktop>
 <20250319095511.hf3y2c6vbbnm3ien@thinkpad>
 <a8966792-fa0e-4e8e-aceb-427819ae4ef5@cixtech.com>
 <bkw4xm4jwe3iuf6sixxl4udosea3bhlwogfua66naf5echbyzv@dlwcbscedh6w>
 <96940e1e-a395-49bc-ac29-7ca86bfb8ad7@cixtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <96940e1e-a395-49bc-ac29-7ca86bfb8ad7@cixtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_163643_423740_158F05AB 
X-CRM114-Status: GOOD (  61.68  )
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

On Wed, Mar 26, 2025 at 12:03:01AM +0800, Hans Zhang wrote:
> 
> 
> On 2025/3/25 23:26, manivannan.sadhasivam@linaro.org wrote:
> > EXTERNAL EMAIL
> > 
> > On Thu, Mar 20, 2025 at 10:14:02AM +0800, hans.zhang wrote:
> > > 
> > > 
> > > On 2025/3/19 17:55, manivannan.sadhasivam@linaro.org wrote:
> > > > EXTERNAL EMAIL
> > > > 
> > > > On Wed, Mar 19, 2025 at 05:31:01PM +0800, Peter Chen wrote:
> > > > > On 25-03-19 14:25:34, Siddharth Vadapalli wrote:
> > > > > > > > 
> > > > > > > > Hello,
> > > > > > > > 
> > > > > > > > This series enables support to build the PCIe Cadence Controller drivers
> > > > > > > > and the PCI J721E Application/Wrapper/Glue driver as Loadable Kernel
> > > > > > > > Modules. The motivation for this series is that PCIe is not a necessity
> > > > > > > > for booting the SoC, due to which it doesn't have to be a built-in
> > > > > > > > module. Additionally, the defconfig doesn't enable the PCIe Cadence
> > > > > > > > Controller drivers and the PCI J721E driver, due to which PCIe is not
> > > > > > > > supported by default. Enabling the configs as of now (i.e. without this
> > > > > > > > series) will result in built-in drivers i.e. a bloated Linux Image for
> > > > > > > > everyone who doesn't have the PCIe Controller.
> > > > > > > 
> > > > > > > If the user doesn't enable PCIe controller device through DTS/ACPI,
> > > > > > > that's doesn't matter.
> > > > > > 
> > > > > > The Linux Image for arm64 systems built using:
> > > > > > arch/arm64/configs/defconfig
> > > > > > will not have support for the Cadence PCIe Controller and the PCIe J721e
> > > > > > driver, because these configs aren't enabled.
> > > > > > 
> > > > > > > 
> > > > > > > > @@ -209,6 +209,12 @@ CONFIG_NFC=m
> > > > > > > >    CONFIG_NFC_NCI=m
> > > > > > > >    CONFIG_NFC_S3FWRN5_I2C=m
> > > > > > > >    CONFIG_PCI=y
> > > > > > > > +CONFIG_PCI_J721E=m
> > > > > > > > +CONFIG_PCI_J721E_HOST=m
> > > > > > > > +CONFIG_PCI_J721E_EP=m
> > > > > > > > +CONFIG_PCIE_CADENCE=m
> > > > > > > > +CONFIG_PCIE_CADENCE_HOST=m
> > > > > > > > +CONFIG_PCIE_CADENCE_EP=m
> > > > > > > 
> > > > > > > The common Cadence configuration will be select if the glue layer's
> > > > > > > configuration is select according to Kconfig.
> > > > > > > 
> > > > > > > Please do not set common configuration as module, some user may need
> > > > > > > it as build-in like dw's. Considering the situation, the rootfs is at
> > > > > > > NVMe.
> > > > > > 
> > > > > > The common configuration at the moment is "DISABLED" i.e. no support for
> > > > > > the Cadence Controller at all. Which "user" are you referring to? This
> > > > > > series was introduced since having the drivers built-in was pushed back at:
> > > > > 
> > > > > We are using Cadence controller, and prepare upstream radxa-o6 board
> > > > > whose rootfs is at PCIe NVMe.
> > > > > 
> > > > 
> > > > It doesn't matter. Only criteria AFAIK to build the driver as built-in in
> > > > defconfig is that it should be a depedency for console. For some time, storage
> > > > was also a dependency, but for sure PCIe is not.
> > > > 
> > > > Moreover, CONFIG_BLK_DEV_NVME is built as a module in ARM64 defconfig. So it
> > > > doesn't matter if you build PCIe controller driver as a built-in or not. You
> > > > need to load the NVMe driver somehow.
> > > > 
> > > > So please use initramfs.
> > > > 
> > > > > You could build driver as module for TI glue layer, but don't force
> > > > > other vendors using module as well, see dwc as an example please.
> > > > > 
> > > > 
> > > > DWC is a bad example here. Only reason the DWC drivers are not loadable is due
> > > > to the in-built MSI controller implementation as irqchip. People tend to build
> > > > the irqchip controllers as always built-in for some known issues. Even then some
> > > > driver developers prefer to built them as loadable module but suppress unbind to
> > > > avoid rmmoding the module.
> > > Hi Mani,
> > > 
> > > I think the MSI RTL module provided by Synopsys PCIe controller IP is not a
> > > standard operation. The reason for this MSI module is probably to be used by
> > > some cpus that do not have ITS(LPI interrupt) designed. Or RISC-V SOC, etc.
> > > MSI is defined as an MSI/MSIX interrupt that starts with a direct write
> > > memory access.
> > > 
> > 
> > Yeah, DWC MSI controller is not a great design. The older ones are even more
> > horrible (using SPI interrupts for reporting AERs etc...).
> 
> Hi Mani,
> 
> Currently Synopsys and Cadence provide SPI interrupts for reporting AERs
> etc... This IP vendor only provides an alternative approach that actually
> requires SOC design companies to design according to PCIe SPEC and conform
> to linux OS software behavior.
> 
> I have a way to workaround AER is SPI interrupt. It can also use aer.c
> drivers. However, I have been afraid to submit patch, because this is a
> problem of SOC designers themselves, which does not conform to the port
> driver of linux os (aer.c). So it will certainly not be accepted.
> 

Right. There is not clean way afaik.

> 
> > 
> > > There are also SOC vendors that do not use the built-in MSI RTL module.
> > > Instead, MSI/MSIX interrupts are transmitted directly to the GIC's ITS
> > > module via the GIC V3/V4 interface. For example, RK3588, they do not use the
> > > PCIe controller built-in MSI module. Some Qualcomm platforms also modify the
> > > PCIe controller's built-in MSI modules to connect each of them to 32 SPI
> > > interrupts to the GIC. I was under the impression that the SDM845 was
> > > designed that way. The only explanation is that SPI interrupts are faster
> > > than LPI interrupts without having to look up some tables.
> > > 
> > 
> > If ITS is available, platforms should make use of that. There is no way DWC MSI
> > is superior than ITS. We are slowly migrating the Qcom platforms to use ITS.
> > 
> 
> I agree with you.
> 
> > And btw, Qcom DWC MSI controller raise interrupts for AER/PME sent by the
> > downstream components. So enabling ITS is uncovering AER errors which were
> > already present :)
> > 
> > > So the dwc driver can also compile to ko?
> > > 
> > 
> > Only if the MSI support is made as a build time option and there is a guarantee
> > that the platform will never use it (which is difficult to do as the driver can
> > only detect it during the runtime based on devicetree).
> 
> Anyway, I would still like to request that the Cadence PCIe controller
> driver not be in module mode. Cadence also has a lot of customers, we are
> one of them, it's just that many customers don't have upstream. We are about
> to upstream.
> 
> This series was introduced since having the drivers built-in was pushed back
> at:
> https://lore.kernel.org/linux-arm-kernel/20250122145822.4ewsmkk6ztbeejzf@slashing/
> 
> Hans:
> The Cadence PCIe root port driver can not be made into module mode because
> of TI's idea. We should consider the ideas of other customers. If you have
> to make it module mode, I think all peripheral drivers should be module
> mode. Maybe I'm being direct, but that's probably the case.
> 

It is not about one company's idea to make the driver as a module. Linux kernel
community in general strongly encourages developers to build the drivers as
module unless there are exceptions (which I have already quoted). If you keep
building the drivers as built-in, it will result in a bloated kernel image. For
sure vendors would want *their* interested drivers to be built-in so that they
do not need to package the drivers in initramfs/rootfs, but that's not a
practice which is encouraged by the Linux community.

So I'm in favor of making the PCIe controllers as module if there are no
technical issues.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

