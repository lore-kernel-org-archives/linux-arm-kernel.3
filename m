Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 600E5C36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 23:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s2yWl97ovmpgvlPVOC1vm3SnHhqTufbXu1TkSI5pMJ4=; b=v5FY05T0VD9rv7XIK29DsQ+GOo
	l4xHmpKhruPqs5+z+Sf4ZS2caEdzxHcKWR9cqmwIXofaZ1yN7F1lJyogaNQzzwQXV0zQDXTLlqT6w
	nvWjL8u6S02C8Q8QdZwVj09dTToYell+1BxcCHp/f0/KPMOt/uD0W2GxRTjUqVytOq//WPUaoJPqc
	9Enc4htCpkhvVz+wY2l+p45VlzkxP4tm+0W0IyOUlL3UJb4KSs+7qDGK/3nHjeIAeqB8qBuH6er1P
	sDXqYV3KTmw84+9PYgdRtz+EsPIO6138X075VOy5Hzs4+coPV3GU5QiQVva1WWc83jMzsN9abe1vM
	tByI/JNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1vcq-00000002GQU-0Eej;
	Mon, 07 Apr 2025 23:11:32 +0000
Received: from mout01.posteo.de ([185.67.36.65])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1vb3-00000002GGc-4C6T
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 23:09:43 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 02556240028
	for <linux-arm-kernel@lists.infradead.org>; Tue,  8 Apr 2025 01:09:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1744067378; bh=O74ZcjE1OQcfzpO0kSxXYabLxllHbRodD/griblwqRc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=evTTQNeq+5tyiYgfXbWGpw+B8C3f+zTyO5vx+qOOZr1x1dG7dxECxAEVlb8uclcyk
	 6QpEDOo97vPxiQeV+D+BCW4oiEnegLZWsrQLnTaDyv1TlK+noe/0Whk8UIRyjsWraU
	 exRyemlkFtaslIugBnayZvi8eeHboilpeMX+ONpVMswzKhh2soS30CelHhiXoU/u9Y
	 8HP/ytUmgHZcnaag3AkimbcA3qlcyvoPmHppI9uJUt9UsQFNjBjPJwq4aMW1psB0xn
	 UpmoeOwLo7fqJRbr9fo0nT8sHVkLpiB97r+axxO0ln4017eZR/5d828ofPhoIfqef7
	 vkQT9GsHp6yOw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4ZWlKD3rbZz6v0r;
	Tue,  8 Apr 2025 01:09:36 +0200 (CEST)
Date: Mon,  7 Apr 2025 23:09:36 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 3/3] ARM: dts: amlogic: Add TCU Fernsehfee 3.0
Message-ID: <Z_RbMLu27AKHaCIO@probook>
References: <20250323-fernsehfee-v1-0-2621341cd37a@posteo.net>
 <20250323-fernsehfee-v1-3-2621341cd37a@posteo.net>
 <CAFBinCD13CNuxRkrSoPXUMNQ9AJH7UV0gsOfdgeRKhkXsANgnw@mail.gmail.com>
 <Z-vjWFFWvo1gesCe@probook>
 <CAFBinCDgn30H13hfkEsfyzSjO-HJ-XpAUwSwimBk7VPpKyNKMw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFBinCDgn30H13hfkEsfyzSjO-HJ-XpAUwSwimBk7VPpKyNKMw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_160942_312426_59E03C22 
X-CRM114-Status: GOOD (  29.79  )
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

On Sun, Apr 06, 2025 at 10:36:18PM +0200, Martin Blumenstingl wrote:
> On Tue, Apr 1, 2025 at 3:00 PM J. Neuschäfer <j.ne@posteo.net> wrote:
> >
> > On Sun, Mar 30, 2025 at 11:10:28PM +0200, Martin Blumenstingl wrote:
> > > Thanks for your patch!
> > >
> > > On Sun, Mar 23, 2025 at 1:38 PM J. Neuschäfer via B4 Relay
> > > <devnull+j.ne.posteo.net@kernel.org> wrote:
> > > [...]
> > > > +               eth_phy0: ethernet-phy@0 {
> > > > +                       /* IC Plus IP101A (0x02430c54) */
> > > > +                       reg = <0>;
> > > Does reg = <1> also work on your board?
> > > 0 is the broadcast address. It's unfortunately something that we still
> > > have incorrect in a lot of .dts files.
> >
> > Unfortunately not. I tried addresses 1 to 31 without success, which
> > seems strange; my guess was that the PHY should respond to one of them.
> > I get this error:
> >
> > # ip l set eth0 up
> > [    6.806847] meson6-dwmac c9410000.ethernet eth0: Register MEM_TYPE_PAGE_POOL RxQ-0
> > [    6.810609] meson6-dwmac c9410000.ethernet eth0: __stmmac_open: Cannot attach to PHY (error: -19)
> Thanks for testing. Let's keep it at zero then.
> 
> > >
> > > [...]
> > > > +&i2c_AO {
> > > > +       status = "okay";
> > > > +       pinctrl-0 = <&i2c_ao_pins>;
> > > > +       pinctrl-names = "default";
> > > > +
> > > > +       pmic@32 {
> > > > +               compatible = "ricoh,rn5t618";
> > > > +               reg = <0x32>;
> > > > +               system-power-controller;
> > > Here I'm a bit surprised:
> > > Aren't some of the outputs used to drive VCCK (CPU power rail) and
> > > VDDEE (everything else power rail, which also powers the GPU)?
> >
> > Unfortunately I don't have schematics and I wasn't able to trace the
> > connections on the board because they're so tiny. So it's quite possible that
> > you're right, but I can't be sure.
> >
> > Are there voltage sensors in the Meson8 SoC that I could use to establishs the
> > relation between PMIC outputs and SoC supplies?
>
> There aren't any sensors (that I'm aware of). But you can check
> /sys/kernel/debug/regulator/regulator_summary and compare the values
> with the ones from arch/arm/boot/dts/amlogic/meson8m2-mxiii-plus.dts
> Also the vendor u-boot and kernel logs may provide some information.

The values in /sys/kernel/debug/regulator/regulator_summary do indeed
match the values in meson8m2-mxiii-plus.dts:

 DCDC1                            0    0      0 unknown  1100mV     0mA     0mV     0mV
 DCDC2                            0    0      0 unknown  1150mV     0mA     0mV     0mV
 DCDC3                            0    0      0 unknown  1500mV     0mA     0mV     0mV
 LDO1                             0    0      0 unknown  2900mV     0mA     0mV     0mV
 LDO2                             0    0      0 unknown  1800mV     0mA     0mV     0mV
 LDO3                             0    0      0 unknown  1800mV     0mA     0mV     0mV
 LDO4                             0    0      0 unknown  2850mV     0mA     0mV     0mV
 LDO5                             0    0      0 unknown  1800mV     0mA     0mV     0mV
 LDORTC1                          0    0      0 unknown  2700mV     0mA     0mV     0mV
 LDORTC2                          0    0      0 unknown   900mV     0mA     0mV     0mV

After I copy the regulator table from meson8m2-mxiii-plus.dts, I can indeed
observe the effect of regulators being on/off. I will use that to further
investigate how the regulators are used.

The vendor u-boot/kernel aren't very useful, unfortunately.
The downstream devicetree includes these settings:

	rn5t618 {
		status = "okay";
		ddr_voltage   = <1500000>; // 1.5V
		vddao_voltage = <1200000>; // 1.2V
		[...]
	};

The corresponding driver seems to associate ddr_voltage with DCDC2 and
vddio_voltage with DCDC3, although this part of the code[1] is "#if 0"'d.

[1] https://github.com/endlessm/linux-meson/blob/master/drivers/amlogic/power/ricoh/ricoh_pmu.c#L127


Best regards,
J. Neuschäfer

