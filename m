Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3206C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 05:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GniGuM78BIcAr7ts8pXvWJNfUZLhduP49+7UQWf5Z0E=; b=p6udGboFgdNfhLZDP3e2loSOkS
	wLGxBEIpZMLAvKL+cghRklfe8flA8ZMkcOpnKbgGuSdfSNFSiQNP6szlQjG8Uvou8+eJ6NKL9YXVV
	EUfNJ0kNT2RyhlsD417UE1JR5N5WyOznvq3PiLk1JF0+iYq2HRffSNptgSjNJdmnAPNNwi0KhZzRn
	aPvmbCao+diLRZjFsp/Y5rfd2pxityIBUUK+JKM/mwUzz9K96ZkZdZEsQYIzSwKp/gIMPy91hR6Ps
	5IJ3yK9qeaVkb9xkyPAvMvn4I/UJ6x/9XDvKpuEupjE4Pc3WHojhLYaQ/4W/+CJcnmU0hEQy2Im7q
	BfbCY8+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thM9x-0000000GFJl-0ZDU;
	Mon, 10 Feb 2025 05:16:41 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thM8W-0000000GF8x-2gfk;
	Mon, 10 Feb 2025 05:15:14 +0000
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-6dd0d09215aso30684766d6.2;
        Sun, 09 Feb 2025 21:15:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739164511; x=1739769311; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GniGuM78BIcAr7ts8pXvWJNfUZLhduP49+7UQWf5Z0E=;
        b=Nu3NuyuMYi0Y6gJ6YqQrPZSssRydVywfPUuBkmRkq30UA56wMsUg90Fh+/LJmBA4+m
         tgHPdiJLXsuJiYN+zrCnRg01VLzPIEJvRFQqNv5FDM2fvLszH++Y3ojeCt0kwcaBPJKT
         GTF5Sj/M8rHW4+DyO7a7HyKNtuEvTwG3eSpcdHUJ1wfqcEBSWPYpgpHU4wH0U+MfKbl/
         1A5xekliOmiyyJT8SvHlp9UEo6w3PlpmuTp7sEqaEQmN51UrvcT/lupCa4twdeXYE4CM
         921uMoi6ffNPtkGK04R4K+BMYyGVLpT9p0fd2PnQWJfHIgRk12PABPHeNZwLQ2XB0F0B
         xPwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739164511; x=1739769311;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GniGuM78BIcAr7ts8pXvWJNfUZLhduP49+7UQWf5Z0E=;
        b=Q4qu2D9B/PYPJk1uDMH5tiD9cKpHz7KMW5BoCvjwppOtYJaHYYKrGTjy55ynvlamd3
         lDdJnxBJ6bqoMt/cgFHlzQVN6JSlthJcAup+M1LfVmwJavReyZ7p7a/4bMskemzB9ITI
         fVzZTfDsGGWAr7jra/gOUsr6UBTxOXWpvznhfZMdEKSV28Fa0O/zeZcDUSAdxUF3fsxQ
         D7McKjo+28jfdziK7CALv5XcIsdXtBMnKK/7Ry2FZpafJty/j1Zs7MvsXW6Meu9uznYE
         rb1dlmSZ2Hbu/SJ9gn+DX/Vh/Z2K9AoC/9TtpGapz1959WU1rRjWTDM9ztUUH+HZ8hWG
         75nw==
X-Forwarded-Encrypted: i=1; AJvYcCWptBOeSsnlCWgtQiy/TDD1pi6CpOmK0CpbXK3ySk+XzGm5ElfoYdr22hjlU44Z+hTDI7sHZlqyS4L+KbeBdv5t@lists.infradead.org, AJvYcCX49/5UOdMrRrvrCuMIXhTn7wlkhuJOoVLNCEwQhaXCdgEaiGM+pZD3wBtKLJ08IQ9UTdS7zeVpBUNBr5Q=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0ogfJd1vM8GFXOaOGw51l1YNpLaDyiD6BU8ZMgoT9ZvMkW8y1
	OyNxnpOHK1IBOKzGfWxIJo0YajcAvB+NjADbOh32scSAmHX2NNhiNjKBuQ==
X-Gm-Gg: ASbGnct5Jc8RpPz6ehxW0mzxOuKXzyZ1sd4vp5N1VkVwP1YwWSrHG6N18AE+w4HUJya
	JlLYIgRzRTpskcbtsojVwzABDW3flsmXvkWDs6Cxf+OEnVToMMUTbzjvemHZjJOCzNtwZz1ptVM
	gjkIscGXcYqOzGw1JItatGZCxnPbAcKNOV+YMqpz8Fdo0DyPKxRoCtxk6ld4AKXrKdCW8iCCHUD
	ZHT8x//ojXfDHPDyNshGBZI4UOiLl3JFlEYFtoYn1mUxF/X6TfUbo1lGELbA/+0Auk=
X-Google-Smtp-Source: AGHT+IH28KSGQngpOC4sMgaBVZJQsS3ItIqPoUQbHrVhyVBUOfjf9q5guk+CZKNPKJ4L2waMIxeNTQ==
X-Received: by 2002:ad4:5caf:0:b0:6da:dc79:a3cd with SMTP id 6a1803df08f44-6e4453fdde1mr194721716d6.0.1739164511260;
        Sun, 09 Feb 2025 21:15:11 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6e460380644sm8468166d6.120.2025.02.09.21.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 21:15:10 -0800 (PST)
Date: Mon, 10 Feb 2025 13:15:05 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: Chen Wang <unicorn_wang@outlook.com>, soc@lists.linux.dev, 
	Inochi Amaoto <inochiama@outlook.com>, Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Sebastian Reichel <sre@kernel.org>, devicetree@vger.kernel.org, 
	Haylen Chu <heylenay@outlook.com>, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org, Inochi Amaoto <inochiama@gmail.com>
Subject: Re: [PATCH 00/10] arm64 support for Milk-V Duo Module 01 EVB
Message-ID: <xfvvie67ncfy5vnmk2lcjatvpmyneponc7ex4nv7otiiolruij@ejpqdomocv7z>
References: <20250209220646.1090868-1-alexander.sverdlin@gmail.com>
 <BMXPR01MB244050BA1841F4416FF0484CFEF22@BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BMXPR01MB244050BA1841F4416FF0484CFEF22@BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_211512_692121_47E9339B 
X-CRM114-Status: GOOD (  31.52  )
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

On Mon, Feb 10, 2025 at 08:02:12AM +0800, Chen Wang wrote:
> 
> On 2025/2/10 6:06, Alexander Sverdlin wrote:
> > This series adds very basic support for Milk-V Duo Module 01 EVB [1] in
> > arm64 mode. The SoC (SG2000) is dual-arch, RiscV and ARM64, the latter has
> > been chosen because the upstream toolchain can be utilized.
> > 
> > Sophgo SG2000 seems to be a continuation of the Cvitek CV18xx series, same
> > peripherals with an addition of ARM64 core. Therefore it would be
> > beneficial not to copy-paste the peripherals' device-tree, but rather split
> > the most suitable riscv DT into ARCH-specific and peripherals parts and
> > just include the latter on the arm64 side.
> > 
> > This series adds the device-tree for Milk-V Duo Module 01 EVB, which
> > in turn contains Milk-V Duo Module 01 (separate .dtsi) on it, which has
> > SG2000 SoC inside (separate .dtsi).
> > 
> > This series has been tested with Sophgo-provided U-Boot binary [2]: it
> > boots from SD card, pinctrl, serial, GPIO drivers are functional (same
> > as for RiscV-based CV18xx SoCs).
> > New reset driver is provided as an alternative to the ATF PSCI handler,
> > which Sophgo only provides in binary form.
> 
> I just see Inochi posted a patchset about cv18xx reset driver [1]. FYI.
> 
> Maybe you and Inochi need to communicate with each other and synchronize the
> related work in this regard.
> 
> Link: https://lore.kernel.org/linux-riscv/20250209122936.2338821-1-inochiama@gmail.com/
> [1]
> 

It is a power restart device, not the reset controller, I suggests you change
the device name.

> > 
> > Partial SoC documentation is available [3].
> > 
> > This series lacks the support of:
> > - USB
> > - Audio
> > - Ethernet
> > - WiFi
> > - Bluetooth
> > - eMMC
> > - Video
> > 
> > It would probably make sense that the whole series would go into SOC tree,
> > even though technically nothing prevents the reboot/reset driver to come
> > in PM/reset tree. If everything would come together, `reboot` command would
> > work out of the box.
> > 
> > [1] https://milkv.io/docs/duo/getting-started/duo-module-01
> > [2] https://github.com/milkv-duo/duo-buildroot-sdk-v2/releases/
> > [3] https://github.com/sophgo/sophgo-doc/releases/download/sg2000-trm-v1.01/sg2000_trm_en.pdf
> > 
> > Alexander Sverdlin (10):
> >    arm64: Add SOPHGO SOC family Kconfig support
> >    riscv: dts: sophgo: cv18xx: Split into CPU core and peripheral parts
> >    arm64: dts: sophgo: Add initial SG2000 SoC device tree
> >    arm64: dts: sophgo: Add Duo Module 01
> >    arm64: dts: sophgo: Add Duo Module 01 Evaluation Board
> >    dt-bindings: mfd: syscon: Add Cvitek CV18xx rtcsys core and ctrl
> >      compatible
> >    dt-bindings: reset: sophgo: Add CV18xx reset controller
> >    riscv/arm64: dts: cv18xx: Add sysctl and reset nodes
> >    power: reset: cv18xx: New driver
> >    arm64: defconfig: Enable rudimentary Sophgo SG2000 support
> > 
> >   .../devicetree/bindings/mfd/syscon.yaml       |   4 +
> >   .../bindings/reset/sophgo,cv1800-reset.yaml   |  38 ++
> >   MAINTAINERS                                   |   1 +
> >   arch/arm64/Kconfig.platforms                  |  12 +
> >   arch/arm64/boot/dts/Makefile                  |   1 +
> >   arch/arm64/boot/dts/sophgo/Makefile           |   2 +
> >   arch/arm64/boot/dts/sophgo/sg2000.dtsi        |  79 +++++
> >   .../sophgo/sg2000_milkv_duo_module_01.dtsi    |  84 +++++
> >   .../sophgo/sg2000_milkv_duo_module_01_evb.dts |  30 ++
> >   arch/arm64/configs/defconfig                  |   3 +
> >   arch/riscv/boot/dts/sophgo/cv181x.dtsi        |   2 +-
> >   arch/riscv/boot/dts/sophgo/cv18xx-periph.dtsi | 329 ++++++++++++++++++
> >   arch/riscv/boot/dts/sophgo/cv18xx.dtsi        | 305 +---------------
> >   drivers/power/reset/Kconfig                   |  12 +
> >   drivers/power/reset/Makefile                  |   1 +
> >   drivers/power/reset/cv18xx-reset.c            |  89 +++++
> >   16 files changed, 689 insertions(+), 303 deletions(-)
> >   create mode 100644 Documentation/devicetree/bindings/reset/sophgo,cv1800-reset.yaml
> >   create mode 100644 arch/arm64/boot/dts/sophgo/Makefile
> >   create mode 100644 arch/arm64/boot/dts/sophgo/sg2000.dtsi
> >   create mode 100644 arch/arm64/boot/dts/sophgo/sg2000_milkv_duo_module_01.dtsi
> >   create mode 100644 arch/arm64/boot/dts/sophgo/sg2000_milkv_duo_module_01_evb.dts
> >   create mode 100644 arch/riscv/boot/dts/sophgo/cv18xx-periph.dtsi
> >   create mode 100644 drivers/power/reset/cv18xx-reset.c
> > 

