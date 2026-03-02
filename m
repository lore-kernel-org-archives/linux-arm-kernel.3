Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAFBBEA4E24
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 15:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FYAWwVXpESUSi/WobVHvguowQxIxeIjbkgDoK4X/Hz4=; b=LdAXeAuQLUCV/kWcgSyAHZxuXW
	RtJEhSjLSZhPpub6lwlq2Dx+pFMOO0IWjc6vK2BogS22H+vCNBo0Ck3V4Gjqc1xxgezdh8o5Y9ctC
	6097TTsdknRcxePZtvMdFoTK5RnCmf2cDBBSX0WyF9BukljfzX0aunaS7pcv+3YUiTWE386JSLttY
	qLDIIJXTVZvFBMp8ZmJa75oGiPUR6dgZUE3d1WuEfTyilR4QhfpmKmTRsfPl/3aHplkHqqAKxqOcp
	fIGLNk0id4M4qiXpjAh1CineupxDL7eadhMViPfMQRYc6X0z8FXeLXTXjl533dElu+FXfisw4GFC4
	6f0lkFbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx5SW-0000000DORc-31CE;
	Mon, 02 Mar 2026 15:45:24 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx5SU-0000000DOQT-3AXf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 15:45:24 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E1C6C4E41046;
	Mon,  2 Mar 2026 15:45:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B63885FE89;
	Mon,  2 Mar 2026 15:45:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6756F1036959D;
	Mon,  2 Mar 2026 16:45:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772466319; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=FYAWwVXpESUSi/WobVHvguowQxIxeIjbkgDoK4X/Hz4=;
	b=mzKnAythfuXX+WDnpsNLgQVAAYTlL8oXpMwt6iPjxdCgXscB9QcXL2ZKovd+VIFWuWoRyT
	AUAZj3dV1Y2KCOpxL1LHOH324mvVz5I/zTOtaN+TD8IwwpQuyeq7PZBx03WXBO6ygxpwRk
	kP9okf0lbAlhyonKkJzoO1lfu1uDvLv9G+uy4VsgIYaBHZydQAE3v5zYkgp4k5fqa8/NQ0
	ugyr5SzBWWjti4vZUDwpB3KgbQPdpEwg2D0vO444JzO87ucA4IPCin6WNAEuTvOhfF6qGy
	T3LMYm+wd8lw+UYVuhOfUXP2hyNgAQ6I5tYlr61SBrPh+HlRwFiz0vJQCP0xdg==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Gabor Juhos <j4g8y7@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Sebastian
 Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Gabor Juhos <j4g8y7@gmail.com>
Subject: Re: [PATCH] arm64: dts: marvell: armada-37xx: align 'phy-names' of
 EHCI node with DT schema
In-Reply-To: <20260220-armada-37xx-fix-ehci-phy-name-v1-1-27c9907aab8e@gmail.com>
References: <20260220-armada-37xx-fix-ehci-phy-name-v1-1-27c9907aab8e@gmail.com>
Date: Mon, 02 Mar 2026 16:45:18 +0100
Message-ID: <87jyvufd69.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_074522_924287_8275F50E 
X-CRM114-Status: GOOD (  18.05  )
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

Gabor Juhos <j4g8y7@gmail.com> writes:

> According to the 'generic-ehci.yaml' schema, the name of the first phy
> in an EHCI node must be "usb", however the 'usb@5e000' node in the
> 'armada-37xx.dtsi' uses "usb2-utmi-host-phy" instead.
>
> This causes dtbs_check warnings like the following ones:
>
>   arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dtb: usb@5e000 (marvel=
l,armada-3700-ehci): phy-names:0: 'usb' was expected
>       from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml
>   arch/arm64/boot/dts/marvell/armada-3720-db.dtb: usb@5e000 (marvell,arma=
da-3700-ehci): phy-names:0: 'usb' was expected
>       from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml
>   arch/arm64/boot/dts/marvell/armada-3720-eDPU.dtb: usb@5e000 (marvell,ar=
mada-3700-ehci): phy-names:0: 'usb' was expected
>       from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml
>   ...
>
> Use "usb" as a name for the phy to avoid the warnings.
>
> No functional change, the USB interface works after the change:
>
>     [    1.472393] orion-ehci d005e000.usb: EHCI Host Controller
>     [    1.477847] orion-ehci d005e000.usb: new USB bus registered, assig=
ned bus number 1
>     [    1.487127] orion-ehci d005e000.usb: irq 40, io mem 0xd005e000
>     [    1.505759] orion-ehci d005e000.usb: USB 2.0 started, EHCI 1.00
>     [    1.512493] hub 1-0:1.0: USB hub found
>     [    1.516434] hub 1-0:1.0: 1 port detected
>     ...
>     [    4.175746] usb 1-1: new high-speed USB device number 2 using orio=
n-ehci
>     [    4.347643] usb-storage 1-1:1.0: USB Mass Storage device detected
>     [    4.359972] scsi host0: usb-storage 1-1:1.0
>     [    5.367100] scsi 0:0:0:0: Direct-Access     ADATA    USB Flash Dri=
ve  1.00 PQ: 0 ANSI: 6
>     [    5.387091] sd 0:0:0:0: [sda] 30869504 512-byte logical blocks: (1=
5.8 GB/14.7 GiB)
>     [    5.398420] sd 0:0:0:0: [sda] Write Protect is off
>     [    5.408108] sd 0:0:0:0: [sda] Write cache: disabled, read cache: d=
isabled, doesn't support DPO or FUA
>     [    5.477359]  sda: sda1
>     [    5.480037] sd 0:0:0:0: [sda] Attached SCSI removable disk
>
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>

Applied on mvebu/dt

Thanks,

Gregory
> ---
>  arch/arm64/boot/dts/marvell/armada-37xx.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi b/arch/arm64/bo=
ot/dts/marvell/armada-37xx.dtsi
> index 87f9367aec1227c2c6de52f358d51bcff758c147..a8d10e4de81619c44ccbe0f08=
e69707dc28005a3 100644
> --- a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
> +++ b/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
> @@ -396,7 +396,7 @@ usb2: usb@5e000 {
>  				marvell,usb-misc-reg =3D <&usb2_syscon>;
>  				interrupts =3D <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
>  				phys =3D <&usb2_utmi_host_phy>;
> -				phy-names =3D "usb2-utmi-host-phy";
> +				phy-names =3D "usb";
>  				status =3D "disabled";
>  			};
>=20=20
>
> ---
> base-commit: fcaf733ca526b69595ed1d227e2cc59ddd24eff7
> change-id: 20260217-armada-37xx-fix-ehci-phy-name-cdfc108b2473
>
> Best regards,
> --=20
> Gabor Juhos <j4g8y7@gmail.com>
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

