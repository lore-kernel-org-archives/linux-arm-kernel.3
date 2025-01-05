Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD295E77197
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jan 2025 17:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lIykvlmhFYKrh2hGvG0EqISiN/aGTtZGMfzgjXPy2TQ=; b=S3p17eHGmf7OJhK/IJGW84n/s9
	gMZeEuFtsBGAP3joGSENkZuBtkEQ1sYUsihhfhQj7QJfqkLJWUWVhr0u2OOlFEkjxMQ0Bzjf6OkVK
	UriXXrI3fs60ZKzprjO7CEF0OUD9szpLER7AG8fnVdLvvnw5GUUUQuASAPWZKoL5jiKSB3eWS3HoM
	2XsTnuf2BtekSQAjomOQA7ED7oRJtFhozTykqCDwWCc5meig0EvxivwklbRXrq6MZjxXFwBiRjnoD
	rhBbg8OQV/6MOgOE+aofzs6kuaXHG6X2t9yPX8RvHzCKWsbHy73IKwnPfD/ru06j55CA2Xm4B8VbZ
	L82JCHBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUUix-0000000HCzq-0XCu;
	Sun, 05 Jan 2025 17:47:39 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUUhk-0000000HChM-46jj;
	Sun, 05 Jan 2025 17:46:26 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5d3d2a30afcso25419508a12.3;
        Sun, 05 Jan 2025 09:46:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736099183; x=1736703983; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lIykvlmhFYKrh2hGvG0EqISiN/aGTtZGMfzgjXPy2TQ=;
        b=TaaZrNwm0k+mwQPBHl/eQQDbrGGWyb8VenSGbYOGejXCuvx33Fm6sh5dhhkhhMrML9
         lySY0EkP+5Vlu/NOt6D7GdbihV2Cl5aRiAUYqWSzbB0tkaeHSGO1yJ7IlncBKVe2N49V
         Alt6CyzFL4y8H2MN7Efqscvdup0asv/Gjz/AmQdUUHfimN4KZ50Ol2Fh4ejLnp7elEgi
         n6Aetqx8ipCBzPVxYNW4Y+YUHKWd7+xON/crd8w959WiTFQpdpHgBicQ4BBKSg1aBU/M
         DcN6pjJNA4nlwQoY0wSZXskVfRWYVsBWJ4AfdJmW3IVqnX8RGL7gJL/U5foauKQ0M5gT
         ISjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736099183; x=1736703983;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lIykvlmhFYKrh2hGvG0EqISiN/aGTtZGMfzgjXPy2TQ=;
        b=WAbo3sLwSzY9Vhi5e1Lyd6ECM2Itvc+Uib6yzeyWerWXlTNIsA1mZ0CmP7Vmyn2d90
         Xmg3fue9mLLYumXzcDbydmwzhKnwzHz+KVvdJoPZvPiuMFGoqXWzs+k4sHs+GRXDhCYQ
         oug9EJzxpewABdY34lBQreleZKb4xtjL/Er+ty1K3ME9BEIkayOcnRIS2OetRSjd0JR0
         pSfGwypkSOsepEcKzMgJobMYxnGsMffyo9TpePOKPHmYJ5gHuU+hhpDgjiYtwLMhL93t
         LUPi5Sk+KrBbxhlOV4uFDj6uIiPTzVTChBtwYsg8JjxD0ef9EDFKk1+h0AQOZwVajvKN
         LaBA==
X-Forwarded-Encrypted: i=1; AJvYcCWguPY/dfgcNdGaNHrkoof0sU7GG/J22aXJyHMfFHBLA4Kwk9BWBOyoHyDwEl9YUtGP1p2136sax0azr0y3g14=@lists.infradead.org, AJvYcCX5BMWglzTsOG91U7mLrRkEftQtBo+z7Jdnv+FTWPUBEUB7WweYkDzk4jk5ctSsBit+zPjs7HlMChMe5J5pXN3O@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5xQgVa6eUztfX0BlqTiYAw46fbu2B7TvAAgKs93/QTKJUeDKd
	DA/Y9HecQr3tVMSbezSM5EOytPRzCpDJkv66ZBaIe6mfHqKUs2DjYlPSLVb9vwCARP1qwb1vLOR
	LtfVovUXJdk2MKHPO7HEMz42DkGo=
X-Gm-Gg: ASbGncsx0yxllwYBmm4j8ckRWjmvrWE15XY2zWvGxWFZUVN3J7iQcSgDwNj2n6m4wm8
	FnReXuMobCMwijICok9dOBCATZfWHm/x2zQkG4g==
X-Google-Smtp-Source: AGHT+IHKoLQ3bbk5sX9596VJfsx7MTb1NN/9SirZSGNKB5kB6RJj6mYW7ASrHVq7n/gBHPzbAHYnTQkgOBJmhlHwrKc=
X-Received: by 2002:a05:6402:230e:b0:5d9:a55:8104 with SMTP id
 4fb4d7f45d1cf-5d90a55812fmr8206307a12.21.1736099182361; Sun, 05 Jan 2025
 09:46:22 -0800 (PST)
MIME-Version: 1.0
References: <20240809073610.2517-1-linux.amoon@gmail.com> <Z3fKkTSFFcU9gQLg@ryzen>
 <CANAwSgS5ZWGTP+A11r_qFSrjWZH_DqsM89MLiP+1VAxhz+e+2A@mail.gmail.com> <Z3fzad51PIxccDGX@ryzen>
In-Reply-To: <Z3fzad51PIxccDGX@ryzen>
From: Anand Moon <linux.amoon@gmail.com>
Date: Sun, 5 Jan 2025 23:16:05 +0530
Message-ID: <CANAwSgS3iXUOH2_4CYK0W+A09xitDdXhQFns=E7XjwqOTUXMRg@mail.gmail.com>
Subject: Re: [PATCH v2] PCI: dw-rockchip: Enable async probe by default
To: Niklas Cassel <cassel@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_094625_020454_420F1039 
X-CRM114-Status: GOOD (  34.09  )
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

Hi Niklas,

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
I am unable to reproduce this issue on my end. Could you share your
config file with me?
Additionally, if we build most of the ROCKCHIP components as modules..."

You will see this warning, which is the main reason for this patch

[   34.642365] platform fc400000.usb: deferred probe pending: dwc3:
failed to initialize core
[   34.642529] platform a41000000.pcie: deferred probe pending:
rockchip-dw-pcie: missing PHY
[   34.642604] platform a40800000.pcie: deferred probe pending:
rockchip-dw-pcie: missing PHY
[   34.642674] platform fcd00000.usb: deferred probe pending: dwc3:
failed to initialize core

> >
> > To my surprise, we have not enabled mdio on Rock-5B boards.
> > can you check if these changes work on your end?
>
> I think these changes are wrong, at least for rock5b.
>
> On rock5b the RTL8125 NIC is connected via PCI, and PCI devices should not
> be specified in device tree, as PCI is a bus that can be enumerated.
>

According to RK3588 (TRM) documentation specifies the requirement for
a dedicated GMAC controller
to effectively manage certain critical network features. In the
absence of this specialized controller,
the network interface card (NIC) may operate solely as a standard PCIe
NIC, potentially leading to
suboptimal performance and a lack of robust flow control mechanisms.

Log analysis indicates that Ethernet probing occurs before the
initialization of the PCIe PHY and PCIe hosts.
To investigate this issue, please test with the following configuration changes:

1 Set CONFIG_DWMAC_ROCKCHIP=m.
2 Enable the probe mode PROBE_PREFER_ASYNCHRONOUS for the DWMAC_ROCKCHIP driver.

Thanks
-Anand
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

