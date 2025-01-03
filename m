Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51DC1E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 14:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mYtF9idV5u7+bQH/eQgXZrY6v9oUYy083r4PjjJyJkY=; b=AxtUIJUhYckmwmATkzw3DSwk/V
	o60Qsgul+A7KGu03DhMD7EadKxvLHrFMMvvppKvOHmUPofUbjzFefzu56QkTUPr0sBrpvl61zb2q8
	EshrDq4gHhkvg8LnJRTF8m+cQos1mQ3g5u2d5hrOWYNMSVks01QaYUTtghCTHeluWShguMvnkovAR
	4cSmOcqP6pi9ULQxLsPvy6ITxJrLlltsw8ZUhWNHatF1ur0xtHwvtbNKMlP0HPjfWG9y6Pay3d3eo
	UN7YE1N8A+dOuhDomHJ4EQpnMUNc7ij1Mk1452M0togdnfMhPbhAhrwMCR9AhQebnW7FempxHbT9G
	TJyDLpJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTis5-0000000D91Y-1k5E;
	Fri, 03 Jan 2025 14:41:53 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTiqq-0000000D8mc-3cjZ;
	Fri, 03 Jan 2025 14:40:38 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5d3d143376dso17936406a12.3;
        Fri, 03 Jan 2025 06:40:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735915235; x=1736520035; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mYtF9idV5u7+bQH/eQgXZrY6v9oUYy083r4PjjJyJkY=;
        b=ayng3rtV+7wF6/Iy3ad8bPfZUCJYZCC2/RM7i3f3hi3SFF+UI2v4j+0tHmIF4xihId
         0bgApx4KnasvTS+JJoW5EY2GN2aMTrbfsaRRzPrMkCj1xvd7IOjmDq00ZSRgLncTsZ6R
         KU0/xCSMK08RIEITNxt5t97N+K/gxmp8sTh1lm7f4uesJptnZVH937AL+Isfmc8VKK6O
         75jqX2JrL1tH9UW5AxjDd6/sRV47GPbFOGtq++uA05RH1qb9l58sHXvPIMjjM9sfF2Y4
         IfERrp8qizBfevjUjHq/UlDVMoBqCsXA8P8mLlSAiMJc877GTNutrDh69K6ppRfAyRJ8
         Uobw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735915235; x=1736520035;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mYtF9idV5u7+bQH/eQgXZrY6v9oUYy083r4PjjJyJkY=;
        b=VmGWveQv+Pr+YOXArHvK2jwKpoWE9WpFeG3fDRjtVc34EYftTqUANdXTNdP/QB561m
         vo0SeV/AN2uQztDbKl/xluxxAWk3Mv3fLQHgeZm1pVrE5Fupl4WqaaZTGgthvrpB6ILy
         BAMm33hrXs8SPTxfoOH3U0xoqe7yyRw6svBjwGU0KsuDxQ4ld3Nqo3GtwIx1uxlWmjnb
         ZiJw8B1Aas0+HegO/IZ2dpe89JPuaqDEZoS+1gPltrh/tu5Zt+9Z28Ie65d1M/6jBC63
         doIwy2+XfVz0oLEpk8QARAM6kTctAtzJKqH7ieYvFpT+8Hj47Ll/qKXIaYeGU1FFMOS0
         t/9A==
X-Forwarded-Encrypted: i=1; AJvYcCW93TDbMjGeM8U1ToG9MKoO16EmLCwWWZoN9wvJR0irjMnMkWebdkvxAO4eCBDJF4wxMVonmKQTHNfOpniQ9hLQ@lists.infradead.org, AJvYcCWaNkD8StVuJm0G6pVRYcQ2FIeqMtaOhc33JN+Zyf71fJK//vT4IhBKju1KYxwa/2Cl4IafsT4TETcfV1wtQ2M=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/+xrMFxwLQzPaRd6R1OTfkShdeMJWMBT9jxUFiDKdtUQG1ZOA
	Q4a5khUvGJ/Iz4nj3Zm/StvytISfy3LN/TIfiLARvQFCVgA9ewfv0RseDrs4xrmSkT78ouERqst
	6woG+AFJfreRFbH4rt/SV5mCcxufEIT1G9UI=
X-Gm-Gg: ASbGncuCvxoDMhcQuCJpvUqvpTfawTNlilOIiM0iXWobx9ZaYVYSkmKRaQPnCWa86Wn
	4+K6+Sg96jbaEA/F+TK/8Uw9xK2jgRQBN5cTj9g==
X-Google-Smtp-Source: AGHT+IEjqk3b0N0ssUpO0OZqcvf6plJRVZVjRmT4cXVVUQfx76Im4Dz0WkqoOF7bZ30b2au7OXaKBtS7jM85GootQ1Q=
X-Received: by 2002:a05:6402:1e8e:b0:5d0:bcdd:ffa7 with SMTP id
 4fb4d7f45d1cf-5d81dd64027mr41529657a12.3.1735915234754; Fri, 03 Jan 2025
 06:40:34 -0800 (PST)
MIME-Version: 1.0
References: <20240809073610.2517-1-linux.amoon@gmail.com> <Z3fKkTSFFcU9gQLg@ryzen>
 <CANAwSgS5ZWGTP+A11r_qFSrjWZH_DqsM89MLiP+1VAxhz+e+2A@mail.gmail.com> <Z3fzad51PIxccDGX@ryzen>
In-Reply-To: <Z3fzad51PIxccDGX@ryzen>
From: Anand Moon <linux.amoon@gmail.com>
Date: Fri, 3 Jan 2025 20:10:17 +0530
Message-ID: <CANAwSgQEunirUf3O3FJJAUsQu9mQYD_Y40uJ_zMYDZYVy5J=wQ@mail.gmail.com>
Subject: Re: [PATCH v2] PCI: dw-rockchip: Enable async probe by default
To: Niklas Cassel <cassel@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_064036_902118_6D60E9B1 
X-CRM114-Status: GOOD (  31.80  )
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

On Fri, 3 Jan 2025 at 19:55, Niklas Cassel <cassel@kernel.org> wrote:
>
> Hello Anand,
>
> On Fri, Jan 03, 2025 at 07:24:07PM +0530, Anand Moon wrote:
> >
> > Thanks for testing this patch.
> >
> > This patch should have been tested on hardware that includes all the
> > relevant controllers,
> > such as PCI 2.0, PCI 3.0, and the SATA controller.
> > I will test this patch again on all the Radxa devices I have.
> >
> > This patch's dependency lies in deferring the probe until the PHY
> > controller initializes.
> >
> > CONFIG_PHY_ROCKCHIP_NANENG_COMBO_PHY=m
>
>
> Note that the splat, as reported in this thread, and in:
> https://lore.kernel.org/netdev/20250101235122.704012-1-francesco@valla.it/T/
>
> is related to the network PHY (CONFIG_REALTEK_PHY) on the RTL8125 NIC,
> which is connected to one of the PCIe Gen2 controllers, not the PCIe PHY
> on the PCIe controller (CONFIG_PHY_ROCKCHIP_NANENG_COMBO_PHY) itself.
>
> For the record, I run with all the relevant drivers as built-in:
> CONFIG_PCIE_ROCKCHIP_DW_HOST=y
> CONFIG_PHY_ROCKCHIP_NANENG_COMBO_PHY=y (for the PCIe Gen2 controllers)
> CONFIG_PHY_ROCKCHIP_SNPS_PCIE3=y (for the PCIe Gen3 controllers)
> CONFIG_R8169=y
> CONFIG_REALTEK_PHY=y
>
>
> >
> > To my surprise, we have not enabled mdio on Rock-5B boards.
> > can you check if these changes work on your end?
>
> I think these changes are wrong, at least for rock5b.

We need to enable the GMAC PHY and reset it using the proper GPIO pin
(PCIE_PERST_L).
Please refer to the schematic for more details.

These changes also apply to other device tree nodes for different boards.

Thanks
-Anand
>
> On rock5b the RTL8125 NIC is connected via PCI, and PCI devices should not
> be specified in device tree, as PCI is a bus that can be enumerated.
>
>
> >
> > -----8<----------8<----------8<----------8<----------8<----------8<-----
> > alarm@rock-5b:/media/nvme0/mainline/linux-rockchip-6.y-devel$ git diff
> >    arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
> > b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
> > index c44d001da169..5008a05efd2a 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
> > +++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
> > @@ -155,6 +155,19 @@ vcc_1v1_nldo_s3: regulator-vcc-1v1-nldo-s3 {
> >         };
> >  };
> >
> > +&mdio1 {
> > +       rgmii_phy1: ethernet-phy@1 {
> > +               /* RTL8211F */
> > +               compatible = "ethernet-phy-id001c.c916";
> > +               reg = <0x1>;
> > +               pinctrl-names = "default";
> > +               pinctrl-0 = <&rtl8211f_rst>;
> > +               reset-assert-us = <20000>;
> > +               reset-deassert-us = <100000>;
> > +               reset-gpios = <&gpio3 RK_PB0 GPIO_ACTIVE_LOW>;
> > +       };
> > +};
> > +
> >  &combphy0_ps {
> >         status = "okay";
> >  };
> > @@ -224,6 +237,21 @@ &hdptxphy_hdmi0 {
> >         status = "okay";
> >  };
> >
> > +&gmac1 {
> > +       clock_in_out = "output";
> > +       phy-handle = <&rgmii_phy1>;
> > +       phy-mode = "rgmii";
> > +       pinctrl-0 = <&gmac1_miim
> > +                    &gmac1_tx_bus2
> > +                    &gmac1_rx_bus2
> > +                    &gmac1_rgmii_clk
> > +                    &gmac1_rgmii_bus>;
> > +       pinctrl-names = "default";
> > +       tx_delay = <0x3a>;
> > +       rx_delay = <0x3e>;
> > +       status = "okay";
> > +};
> > +
> >  &i2c0 {
> >         pinctrl-names = "default";
> >         pinctrl-0 = <&i2c0m2_xfer>;
> > @@ -419,6 +447,12 @@ pcie3_vcc3v3_en: pcie3-vcc3v3-en {
> >                 };
> >         };
> >
> > +       rtl8211f {
> > +               rtl8211f_rst: rtl8211f-rst {
> > +                       rockchip,pins = <3 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
> > +               };
> > +       };
> > +
> >         usb {
> >                 vcc5v0_host_en: vcc5v0-host-en {
> >                         rockchip,pins = <4 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
> > >
> > > Kind regards,
> > > Niklas
> >
> > Can you check this on your end
> >
> > alarm@rock-5b:~$ sudo cat /sys/kernel/debug/devices_deferred
> > [sudo] password for alarm:
> > fc400000.usb    dwc3: failed to initialize core
> > alarm@rock-5b:~$ sudo cat /sys/kernel/debug/devices_deferred
>
> Sure:
> # cat /sys/kernel/debug/devices_deferred
> fc400000.usb    dwc3: failed to initialize core
>
>
> Kind regards,
> Niklas

