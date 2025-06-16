Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0047EC71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 15:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ploSucNH29V90v2689/j3svshD2BMkR3XA3gPmC2bbo=; b=ey8/6etiP7Vpxux9A2Xq+fRUdR
	gE4IzaIwxVQJHllARXVLraGBhPtIoiH5jFaae+lHQgvcoXntSpUgZBw39GV45EGUIadsnQ/J/qtsl
	FvRHztwNs4ejTCji301SQ0pkdUegOCVAwzFPI3GfgGufXZpxDdZWuRiYNrt/zLzy83PHsgr1+BmXE
	nJXD2tVbxH96LlARCQovb+NzFSKn6s0akfbdhTgfy2UmAqrhPgqJc+KjhI0E+wtN3nthuS7Cm1hn8
	1fxXIaU2E4+wQDyyR69lkTYBoQdXb7CSJZGn2uNJP4EMoo94dHEBQhV6+hO7ZQ6M1/tHBW0NJbReq
	b9SGloqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRBiZ-00000004ox9-2eDA;
	Mon, 16 Jun 2025 15:25:51 +0000
Received: from mail-qk1-f180.google.com ([209.85.222.180])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR8Y8-00000004INq-0XJA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 12:02:53 +0000
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7d2107eb668so716734885a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Jun 2025 05:02:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750075368; x=1750680168;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ploSucNH29V90v2689/j3svshD2BMkR3XA3gPmC2bbo=;
        b=VPXkRUqDaaeot0SieVNOvKE8rrUGF/gg2s4MmKYPFq+66fsjTJjHiKOw+fnBYxbqvO
         TzURFfuVmUbJKefYjmO1wyynpt4KjFXByJhQb7bcZwvkWxHUfHupkDjn9J3t5w7nLWVb
         yyAklERRf/CI44NV8kv5ylVrcu245jAfgaVmF2hcguxN0mabySZw7yFPZHKkvWlydIRd
         NPYWqgCmQ7oDjlEzEmR1HATPMrgLoL7dXkBc4lxUdusfSAnl8+b6UbLqVCKoQp/1swM9
         +vpvj+2uGQv2650oaUN3enyHAY5MgKE5L3VtfoDbpeGz4JVmUSOKeVDKkvpULUvqsCre
         kQ+w==
X-Forwarded-Encrypted: i=1; AJvYcCUKlLjncW2gtbaWmL00/StirO4dpH8dXsAP831SBkBKUmSVjHiNlcijZ2XCV8YHECGMdB1O7/D4csj8gFloV5BB@lists.infradead.org
X-Gm-Message-State: AOJu0YxR1dEi/4krPiu6YJdk2zLV7t9CwZuZp+avIlbPtv0z+aIm3LWX
	e0lw8INLfxbcIuBte5YNw5MaOMaE3YNm4b1EKyx73G+zuV59aLk354yArIPag+2r
X-Gm-Gg: ASbGncuO6YH28m37XCFs0ccSjvSpVkDPvjFTQDblXXrQV0kjVElptZcVUXEGZY+uhm5
	JQXuLG1wZ21XCIoF5JDgMOUsGAc3HhurL7S0ZvTvxYaERWCY2+rVoL1UE11FIqmnGfOPh/tWc/D
	OnukKvpjaUr34G4rA6Ah99zBMVxc9hzx4cGrns6idqSthFyzPnhKXqYP35HM8LbHEJpchujN/EL
	crVHO4BZx5LvIXqcZ3opF9Cq+VmJJaJxOB4xxtSe9lcrQkLtsNBzb7rloX6/DsnZx//nxTY/dI3
	sDv+DWfq3elSNVbVh1CcpO4GG4ooWXFL0xQp1v70e/+76MeDLOjk6qiB3/o+DI7h31CKjW1GZ/7
	apdOGZZDG9PlkA3Vx9KOdronpJgLf
X-Google-Smtp-Source: AGHT+IGv35rgadjf8znaZQLVz3K1KIPEPeKOuo+0JkzaKHwXws3FA8990fqTAoZFurMjVv8lHvntcQ==
X-Received: by 2002:a05:622a:2d1:b0:4a2:719b:1231 with SMTP id d75a77b69052e-4a73c5ae3e6mr134355021cf.35.1750075368319;
        Mon, 16 Jun 2025 05:02:48 -0700 (PDT)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com. [209.85.222.177])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a72a3112b8sm48006751cf.31.2025.06.16.05.02.47
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 05:02:47 -0700 (PDT)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7d2107eb668so716718885a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Jun 2025 05:02:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWsfz/g0wrVODtGaM31oj+c5wqOpmV9BrWp95ktG/DXHVMCEe8EBPs4LReiyZ+vyRpwgvhmHtfCEmfi1EVniz61@lists.infradead.org
X-Received: by 2002:a05:620a:2a03:b0:7d3:8df8:cc04 with SMTP id
 af79cd13be357-7d3c6cc98efmr1411274185a.35.1750075366742; Mon, 16 Jun 2025
 05:02:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAMuHMdW_89naftFMo881zp=7QGJDznFzzqLQ-kLEuyJ=KJWQnA@mail.gmail.com>
 <20250613220104.GA986309@bhelgaas>
In-Reply-To: <20250613220104.GA986309@bhelgaas>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Jun 2025 14:02:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU=+Hxz09DJeVOhZ1N5yS=UJgMsr5R40KBeu=ftoq4zrw@mail.gmail.com>
X-Gm-Features: AX0GCFvGpF0UKvY33FJrsFmSliyEKvidiVPDSH8oJwCDkQnKl_S7otDQDQqSNxs
Message-ID: <CAMuHMdU=+Hxz09DJeVOhZ1N5yS=UJgMsr5R40KBeu=ftoq4zrw@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] PCI/pwrctrl: Add optional slot clock to pwrctrl
 driver for PCI slots
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	linux-arm-kernel@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Anand Moon <linux.amoon@gmail.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_050252_170643_3575952D 
X-CRM114-Status: GOOD (  32.53  )
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

Hi Bjorn,

On Sat, 14 Jun 2025 at 00:01, Bjorn Helgaas <helgaas@kernel.org> wrote:
> On Thu, Jun 12, 2025 at 03:16:45PM +0200, Geert Uytterhoeven wrote:
> > On Sat, 7 Jun 2025 at 21:46, Marek Vasut
> > <marek.vasut+renesas@mailbox.org> wrote:
> > > Add the ability to enable optional slot clock into the pwrctrl driver.
> > > This is used to enable slot clock in split-clock topologies, where the
> > > PCIe host/controller supply and PCIe slot supply are not provided by
> > > the same clock. The PCIe host/controller clock should be described in
> > > the controller node as the controller clock, while the slot clock should
> > > be described in controller bridge/slot subnode.
> > >
> > > Example DT snippet:
> > > &pcicontroller {
> > >     clocks = <&clk_dif 0>;             /* PCIe controller clock */
> > >
> > >     pci@0,0 {
> > >         #address-cells = <3>;
> > >         #size-cells = <2>;
> > >         reg = <0x0 0x0 0x0 0x0 0x0>;
> > >         compatible = "pciclass,0604";
> > >         device_type = "pci";
> > >         clocks = <&clk_dif 1>;         /* PCIe slot clock */
> > >         vpcie3v3-supply = <&reg_3p3v>;
> > >         ranges;
> > >     };
> > > };
> > >
> > > Example clock topology:
> > >  ____________                    ____________
> > > |  PCIe host |                  | PCIe slot  |
> > > |            |                  |            |
> > > |    PCIe RX<|==================|>PCIe TX    |
> > > |    PCIe TX<|==================|>PCIe RX    |
> > > |            |                  |            |
> > > |   PCIe CLK<|======..  ..======|>PCIe CLK   |
> > > '------------'      ||  ||      '------------'
> > >                     ||  ||
> > >  ____________       ||  ||
> > > |  9FGV0441  |      ||  ||
> > > |            |      ||  ||
> > > |   CLK DIF0<|======''  ||
> > > |   CLK DIF1<|==========''
> > > |   CLK DIF2<|
> > > |   CLK DIF3<|
> > > '------------'
> > >
> > > Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > Reviewed-by: Anand Moon <linux.amoon@gmail.com>
> > > Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> >
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > Bartosz: Any chance you can apply this patch to an immutable branch,
> > so I can merge that before taking the other two patches?
> > The alternative is to postpone the DTS patches for one cycle.
>
> I applied this patch only to pci/pwrctrl for v6.17 and made a note
> that the commit should be immutable:
>
>   66db1d3cbdb0 ("PCI/pwrctrl: Add optional slot clock for PCI slots")
>
> We will likely add other pwrctrl patches to this branch during this
> cycle; I assume that will be OK as long as 66db1d3cbdb0 remains
> untouched, right?

Great, I will merge that branch, and will apply the DTS patches on top.
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

