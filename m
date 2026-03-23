Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2F3BF4613A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 15:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Gqyh445RFNhCMpOGQ+ZUm8h8QVvK3gHOuBtceouwcw=; b=2/vqwGIK99GdKFYwWs8eGS9Y7v
	PGhzyd+66R+FPbWn4XE6fESpV1aE5kP+vUbeRxW23qLbj5IKT6RBLEOxjDQxaRafOwHPLAtrYHC0f
	yzS+hOL70NujANfOeftzSU8pKu+rWNmc7Up2MtlN4b8UvE+KfH0JCcbDzMmOq46kMTmnp5gLT8nRR
	/zhKd5yreEIREc9cbW2RqMhcIS+y99ZFuE1nHShXYDOAPBKXtxnbs+AdN1gtTmg3NClIQ05qpeitF
	WSCiJ6j8CQWwNdmMsCidy6veCgaDYjz7vtP7MIGEHfA56aR0mHtqxcboYM76ywJSAYmkniiNLXT7E
	JyV+J69g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4gsQ-0000000GyrJ-28p0;
	Mon, 23 Mar 2026 15:07:34 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4gsM-0000000Gyqr-0WhD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 15:07:32 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 0CD90C58081;
	Mon, 23 Mar 2026 15:07:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CAA495FEF6;
	Mon, 23 Mar 2026 15:07:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B553E10450FC6;
	Mon, 23 Mar 2026 16:07:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774278444; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8Gqyh445RFNhCMpOGQ+ZUm8h8QVvK3gHOuBtceouwcw=;
	b=pddg8evVZ/u+oX5Z3HmeCu6mTDmmsG29OJWSy/T0XDbuYnmjBZLPs9dQoicD8wTQEK41OY
	jHJW7mYb14w4rBY+u2mBTdAEJjCRj2Fya6QLbH9wxp2MP40VodcnojcQV20wkC3AjC/qDz
	TX7gt4mc7IWyc7oHN4/qY2OAf35HyqP8St/OCjjJFCyfFTDE+ZIy3GygwNeGiZIJ+fT1fr
	3UnNKIWiTjO2JjR/VhVc0LZ33mC3tM4cG1CxcvQcAMW3RxDJfgf1pY+ejG2GGC4a3fZGPA
	OIauvxitAsKvf+KEGtEAG7hNsY/Oa4ksa9VS8dL06jyIhYeBk8uvilHnAeQcLw==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Gabor Juhos <j4g8y7@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Miquel
 Raynal <miquel.raynal@bootlin.com>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Gabor Juhos <j4g8y7@gmail.com>
Subject: Re: [PATCH v3] arm64: dts: marvell: armada-37xx: drop
 'marvell,usb-misc-reg' from USB host nodes
In-Reply-To: <20260319-armada-37xx-drop-usb-misc-reg-v3-1-8585c8a0a8ba@gmail.com>
References: <20260319-armada-37xx-drop-usb-misc-reg-v3-1-8585c8a0a8ba@gmail.com>
Date: Mon, 23 Mar 2026 16:07:19 +0100
Message-ID: <87tsu64mag.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_080730_311983_39C8D9C2 
X-CRM114-Status: GOOD (  22.13  )
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

> The 'marvell,usb-misc-reg' property is present both in the EHCI and
> in the XHCI USB host device nodes, however it is not documented. Thus
> 'make dtbs_check' produces warnings like these:
>
>   /arch/arm64/boot/dts/marvell/armada-3720-db.dtb: usb@58000 (marvell,arm=
ada3700-xhci): Unevaluated properties are not allowed ('marvell,usb-misc-re=
g' was unexpected)
>           from schema $id: http://devicetree.org/schemas/usb/generic-xhci=
.yaml
>   /arch/arm64/boot/dts/marvell/armada-3720-db.dtb: usb@5e000 (marvell,arm=
ada-3700-ehci): Unevaluated properties are not allowed ('marvell,usb-misc-r=
eg' was unexpected)
>           from schema $id: http://devicetree.org/schemas/usb/generic-ehci=
.yaml
>
> Apart from the fact that the properties are not documented, those are
> not even used by any USB host drivers. Due to this, drop the properties
> in order to get rid of the warnings.
>
> Note:
>
> With the same name, there is a property used for the Armada 3700 USB
> UTMI PHYs of which dt-bindings documentation has been added in commit
> e60958699afa ("dt-bindings: phy: mvebu-utmi: add UTMI PHY bindings").
>
> Additionally, the property is handled by the 'phy-mvebu-a3700-utmi'
> driver since commit cc8b7a0ae866 ("phy: add A3700 UTMI PHY driver").
>
> When the nodes of the UTMI PHYs has been added to the SoC dtsi by
> commit 05d168a56fae ("arm64: dts: marvell: armada-37xx: declare USB2
> UTMI PHYs"), the properties has been added to the USB host controller
> nodes also. According to the commit message this was unintentional,
> however in regard to the USB hosts, neither the respective documentation,
> nor driver support has been added into the tree since that.
>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>


Applied on mvebu/dt64

Thanks,

Gregory


> ---
> Changes in v3:
>   - s/intentional/unintentional/
>   - add Reviewed-by tag from Miquel
>   - Link to v2: https://lore.kernel.org/r/20260317-armada-37xx-drop-usb-m=
isc-reg-v2-1-ddff72114414@gmail.com
>
> Changes in v2:
>   - add Reviewed-by tag from Andrew
>   - change subject and reword commit message
>   - Link to v1: https://lore.kernel.org/r/20260304-armada-37xx-drop-usb-m=
isc-reg-v1-1-800c1b746b7a@gmail.com
> ---
>  arch/arm64/boot/dts/marvell/armada-37xx.dtsi | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi b/arch/arm64/bo=
ot/dts/marvell/armada-37xx.dtsi
> index ea1824f5321fbb32fc4373c08a0d94bca1dc793b..44c47409f8793ae1266303607=
812ef481edbfbc5 100644
> --- a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
> +++ b/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
> @@ -369,7 +369,6 @@ usb3: usb@58000 {
>  				compatible =3D "marvell,armada3700-xhci",
>  				"generic-xhci";
>  				reg =3D <0x58000 0x4000>;
> -				marvell,usb-misc-reg =3D <&usb32_syscon>;
>  				interrupts =3D <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
>  				clocks =3D <&sb_periph_clk 12>;
>  				phys =3D <&comphy0 0>, <&usb2_utmi_otg_phy>;
> @@ -393,7 +392,6 @@ usb32_syscon: system-controller@5d800 {
>  			usb2: usb@5e000 {
>  				compatible =3D "marvell,armada-3700-ehci";
>  				reg =3D <0x5e000 0x1000>;
> -				marvell,usb-misc-reg =3D <&usb2_syscon>;
>  				interrupts =3D <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
>  				phys =3D <&usb2_utmi_host_phy>;
>  				phy-names =3D "usb";
>
> ---
> base-commit: 98226a594f313442fcba38cefc1df0b6c1691c7e
> change-id: 20260304-armada-37xx-drop-usb-misc-reg-e9635498cae6
>
> Best regards,
> --=20
> Gabor Juhos <j4g8y7@gmail.com>
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

