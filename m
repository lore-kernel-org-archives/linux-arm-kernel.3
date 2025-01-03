Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8598CE7718F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 15:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yXglbPGb9C6MIAjoR3rdlsuhmeM8DLLc/3DAkc0exoU=; b=bszm6Bu/MLKebQo8ljDyFEAKiK
	oRkaZqrGAY9WEWGO4Ty3EMjsaH+nXYaH+XsYnERm/wVsnX7YFBBtDwz3U0bmF4sTva1jwG/r3xlVx
	mangD3BSbxf9KealibKi1W5DpwogbpyewVpTE9OOavTsvrrxcWaShsciuj0GC5b0nZ9ZZx93iX9t1
	qyPYwDxZF6OqvvzIObM0YwNGd+BSGTXEbq1oqTRDOWDIdYEjQR5CPGmZMsO6tj+yMM+KMplFw7IB4
	ldxNGiy7CwXxpPkkux/1eu38662WASN5v5MehSPhjdFk82puDT5LHF/BtdbjrGvuc4KQ0h5iArY4i
	mhrtBSRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTjI6-0000000DDgt-0XXX;
	Fri, 03 Jan 2025 15:08:46 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTjG2-0000000DDJx-19R2;
	Fri, 03 Jan 2025 15:06:39 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-aaeec07b705so1248852166b.2;
        Fri, 03 Jan 2025 07:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735916796; x=1736521596; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yXglbPGb9C6MIAjoR3rdlsuhmeM8DLLc/3DAkc0exoU=;
        b=PWSMZ14KU43lB9uaGGIHoRXfil8ZALnXNExyDTT1xsNNAROW8yuKobIn1UVp08sQkU
         cBeNbWIpml7DRB1MBPZIcr+pn2xT8rZ8ifLkQWEOpZ4qL4EiXiJGqzWs8jy0YXPk2xJy
         Q0dHwKpyzfb8A+87FQl5Dss8/dkp+tzuLJkpghMrVefBtbvrX2yJSkcmKiupwObmS/7l
         Tshx0Rna3IBNaViqlBNGY5n7K0Zd0TE0xuzNtIqtghNMMgSlcVBz8AFrmJLXRU8kX/Nd
         DfMAbmwNMJGbS4u4uzZ0C+H03u88UaDSh06Nh82237En0Gh2nVfPuVIhciLK7b/+LVM9
         f9TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735916796; x=1736521596;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yXglbPGb9C6MIAjoR3rdlsuhmeM8DLLc/3DAkc0exoU=;
        b=BgI1WMsP0PS6qJO/35GIeAkWLQep+SiCjEPQ9qSQkujB4VwHXBfnhdM7t+195vnghQ
         Ktog1canpufTrt/o2w/U668pFx46iU/9yap/ZI6QMJmcN8JEPDbfqzpOUZ1EYVYSGaLi
         e6vLhHUFGNgvqjbbMwsOlbNWX81HTdNRhT7eR9aD7mHh43Dtok8UdeNLH/+rRkr7nAxX
         thb7/u1VQw6sQk8G68QW928GSJuOBKvJ9WCVL2aW07F4VsjXTEWRWWl3RYElASkjulGu
         qMXoZctkcFHYNYpZVyqCO+LnkyexpAgXE1lASolzjBIw3sTvCv46U6YT+fyfbES2h0wO
         tRPA==
X-Forwarded-Encrypted: i=1; AJvYcCVPcAH+EE6X6mtKpvJUMujdihnWeBo9FUGBY0Nuv0Cc75YVcpF7YXtUpM1BlOrmfsumLbk+7HzPKInkjRe6qmLE@lists.infradead.org, AJvYcCXHi/BPDBA4zzEDkA3lO5UExkEVjngOkpSBeScdliurehPpnLDL0UIPj7H8W3bB5fC/zgdjVDejR+bi7uL9R4I=@lists.infradead.org
X-Gm-Message-State: AOJu0YylrwvnJjk5ZouCp3+OKVLWvSELlkP9gDrziM96HykehYsKZrn0
	qbuB8qsvaka+0COJhQiYTO4ZkRlI3uo0S/yJ72yJGPzeG4IjWy9LPmbAKT4Fj6GkTg+A3MvevI4
	8W9zkr5KiNust3TbhDaQUgwX6Ics=
X-Gm-Gg: ASbGncuO0a1yI9IErk0tBIYWdnletT6ifJMduRLBJAXm4v2rbZu6HZN2kbkCSeLNxVW
	3xOBIkUsoa34cU6y81aZT7iPdNwa0cwe5OFboMg==
X-Google-Smtp-Source: AGHT+IGCd5KMQFAQzvrcouo2Ud/xiJbNIhdYf82yQR4GFtXoLT6FjxC+PsYw+V7e4lq8bAmqOaKWWNmajdpv0ZS7Brk=
X-Received: by 2002:a17:907:1b1e:b0:aae:ec9d:5fdb with SMTP id
 a640c23a62f3a-aaeec9d6191mr3759466966b.28.1735916795882; Fri, 03 Jan 2025
 07:06:35 -0800 (PST)
MIME-Version: 1.0
References: <20240809073610.2517-1-linux.amoon@gmail.com> <Z3fKkTSFFcU9gQLg@ryzen>
 <CANAwSgS5ZWGTP+A11r_qFSrjWZH_DqsM89MLiP+1VAxhz+e+2A@mail.gmail.com>
 <Z3fzad51PIxccDGX@ryzen> <CANAwSgQEunirUf3O3FJJAUsQu9mQYD_Y40uJ_zMYDZYVy5J=wQ@mail.gmail.com>
 <Z3f4JQZ6yYV1BJ-b@ryzen>
In-Reply-To: <Z3f4JQZ6yYV1BJ-b@ryzen>
From: Anand Moon <linux.amoon@gmail.com>
Date: Fri, 3 Jan 2025 20:36:18 +0530
Message-ID: <CANAwSgRTcHuDNLvPJAs7ZaV-NnepeOkHj_kVc5OAJtP03hd6pQ@mail.gmail.com>
Subject: Re: [PATCH v2] PCI: dw-rockchip: Enable async probe by default
To: Niklas Cassel <cassel@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_070638_314720_3A5FB697 
X-CRM114-Status: GOOD (  29.93  )
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

Hi Niklas

On Fri, 3 Jan 2025 at 20:16, Niklas Cassel <cassel@kernel.org> wrote:
>
> On Fri, Jan 03, 2025 at 08:10:17PM +0530, Anand Moon wrote:
> > Hi Niklas
> >
> > On Fri, 3 Jan 2025 at 19:55, Niklas Cassel <cassel@kernel.org> wrote:
> > >
> > > Hello Anand,
> > >
> > > On Fri, Jan 03, 2025 at 07:24:07PM +0530, Anand Moon wrote:
> > > >
> > > > Thanks for testing this patch.
> > > >
> > > > This patch should have been tested on hardware that includes all the
> > > > relevant controllers,
> > > > such as PCI 2.0, PCI 3.0, and the SATA controller.
> > > > I will test this patch again on all the Radxa devices I have.
> > > >
> > > > This patch's dependency lies in deferring the probe until the PHY
> > > > controller initializes.
> > > >
> > > > CONFIG_PHY_ROCKCHIP_NANENG_COMBO_PHY=m
> > >
> > >
> > > Note that the splat, as reported in this thread, and in:
> > > https://lore.kernel.org/netdev/20250101235122.704012-1-francesco@valla.it/T/
> > >
> > > is related to the network PHY (CONFIG_REALTEK_PHY) on the RTL8125 NIC,
> > > which is connected to one of the PCIe Gen2 controllers, not the PCIe PHY
> > > on the PCIe controller (CONFIG_PHY_ROCKCHIP_NANENG_COMBO_PHY) itself.
> > >
> > > For the record, I run with all the relevant drivers as built-in:
> > > CONFIG_PCIE_ROCKCHIP_DW_HOST=y
> > > CONFIG_PHY_ROCKCHIP_NANENG_COMBO_PHY=y (for the PCIe Gen2 controllers)
> > > CONFIG_PHY_ROCKCHIP_SNPS_PCIE3=y (for the PCIe Gen3 controllers)
> > > CONFIG_R8169=y
> > > CONFIG_REALTEK_PHY=y
> > >
> > >
> > > >
> > > > To my surprise, we have not enabled mdio on Rock-5B boards.
> > > > can you check if these changes work on your end?
> > >
> > > I think these changes are wrong, at least for rock5b.
> >
> > We need to enable the GMAC PHY and reset it using the proper GPIO pin
> > (PCIE_PERST_L).
> > Please refer to the schematic for more details.
>
> The PERST# GPIO is already asserted + deasserted from the PCIe Root Complex
> (host) driver:
> https://github.com/torvalds/linux/blob/v6.13-rc5/drivers/pci/controller/dwc/pcie-dw-rockchip.c#L191-L206
>
> which will cause the endpoint device (a RTL8125 NIC in this case)
> to be reset during bootup.
>
Thanks for letting me know. It seems like a workaround.
I'll try to disable this and test it again.

My point is that we haven't enabled the GMAC PHY (device nodes)
and must properly reset the GMAC.

We're relying on the code above hack to do that job.

>
> Kind regards,
> Niklas
Thanks
-Anand

