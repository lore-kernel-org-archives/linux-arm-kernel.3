Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06FAC109C040
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 18:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pYAxf3VW/HInMToZHO0pS79XW5O33/TonbSLS2yJnCM=; b=DGTxy9QGCGEaN2kK1oz40WQkHX
	MyjCoZxL+Ga2pUmQGIqwzkDyZn2fA5WoeqnTCwQfuLQ8CJc1TQt0mvhpNSkkSjjdyViG+1ia8kKHw
	FNvEHuxIfCpbyHYOMgHTJWILV+uaI+oTheCUcLQVmT35fADnzb+a1Txquz078L/hWuEWUde7+42w2
	gbBo3Qqef9FulqeSKa6/CiJ8skjUnK1S0F51JMSpiRCvYN2NotXCLGkoR4JcYro6y1OJvNGqAnUx9
	M4UUn8jXR8b7+QdtTWUEVwwRlPGEo0+7GSFmZBSjvVsuwlrCmL+vGvekzf4MmXBwK3/YuHz+EWmgd
	LV8PK+Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Slo-000000043hi-34gT;
	Wed, 25 Mar 2026 18:15:56 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Slm-000000043hG-1Gg7;
	Wed, 25 Mar 2026 18:15:55 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1774462530; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=iNSFw4BQJshLLPXQARh8ibRd6UVRs9i/nVifDjGClbRqTsK8CMUFa2XaJhgpqc4MtRpsnvT/MtPhxss5bM5h/LLHv55ciM2sfpAIU13INnA68vLhZ6RzbvhglJBIIAdg7ejAJsyFhRAOCkic27g+OF25EbUbdqX63RRNmO3fJNQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774462530; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=pYAxf3VW/HInMToZHO0pS79XW5O33/TonbSLS2yJnCM=; 
	b=BhMfIrOjgmVvUcay2ns5NiNFyY3DNO+pP2q7c7tt2rl8WWdSVlhf7atcVWpEGU/jjoxfyGpOHz/GfqXTnNvAXDDmjMG9VPyew4I4IRe1p+JZ5vOdFI2Ej/chjpp4yobN8RFuNXrz8Id2WbU8U6l0bq6aPH3wKZs4+tdvOu7y2CE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=louisalexis.eyraud@collabora.com;
	dmarc=pass header.from=<louisalexis.eyraud@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774462530;
	s=zohomail; d=collabora.com; i=louisalexis.eyraud@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=pYAxf3VW/HInMToZHO0pS79XW5O33/TonbSLS2yJnCM=;
	b=TPMTpYTaEUPpWQ7b10E7g1OChCuezPo4/jeaivSdOwpxG85LK5icQ/Bsgl9X9yNg
	l7+jjBMJFoL8r8zvnVcBjx9zKTWXw9gz5ocBEq0ytR25o3jvLQYPf2nwSiVxZT/Ls4e
	huYq5At0370vL091vWdffnEGkMFzr+Gs9V8IPTIY=
Received: by mx.zohomail.com with SMTPS id 1774462528545299.56819553131663;
	Wed, 25 Mar 2026 11:15:28 -0700 (PDT)
Message-ID: <199e674cfdbccad104db761964611b1d6352f9f3.camel@collabora.com>
Subject: Re: [PATCH net-next 2/2] net: phy: Introduce Airoha AN8801/R
 Gigabit Ethernet PHY driver
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, Heiner Kallweit	
 <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	kevin-kw.huang@airoha.com, macpaul.lin@mediatek.com,
 matthias.bgg@gmail.com, 	kernel@collabora.com, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, 	linux-kernel@vger.kernel.org
Date: Wed, 25 Mar 2026 19:15:22 +0100
In-Reply-To: <3fbfabf7-b3af-405b-ade4-4f62db2c1c45@lunn.ch>
References: <20260304-add-airoha-an8801-support-v1-0-0ae4ee5a2f9d@collabora.com>
	 <20260304-add-airoha-an8801-support-v1-2-0ae4ee5a2f9d@collabora.com>
	 <3fbfabf7-b3af-405b-ade4-4f62db2c1c45@lunn.ch>
Organization: Collabora Ltd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_111554_398767_C13179D9 
X-CRM114-Status: GOOD (  43.07  )
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

Hi Andrew,

On Wed, 2026-03-04 at 15:59 +0100, Andrew Lunn wrote:
> > +static int an8801r_did_interrupt(struct phy_device *phydev)
> > +{
> > +	u32 irq_en, irq_status;
> > +	int ret;
> > +
> > +	ret =3D air_buckpbus_reg_read(phydev,
> > AN8801_BPBUS_REG_WAKE_IRQ_EN,
> > +				=C2=A0=C2=A0=C2=A0 &irq_en);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D air_buckpbus_reg_read(phydev,
> > AN8801_BPBUS_REG_WAKE_IRQ_STS,
> > +				=C2=A0=C2=A0=C2=A0 &irq_status);
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (irq_status & AN8801_IRQ_WAKE_MAGICPKT)
> > +		return 0;
>=20
> With a name like an8801r_did_interrupt() you would expect the return
> value to be some value of True, if there was an interrupt. I would
> suggest either a different name, or return 1. Maybe also add a
> kerneldoc header indicating the return values, since it is probably
> not going to be standard.
>=20
The function name was not great and confusing.

While reworking the interrupt handling for WoL support for v2, I merged
the function with the an8801r_handle_interrupt function (to process
differently the Magic Packet and Link Change interrupts) so this
function won't be in v2.
=20
> > +static void an8801r_get_wol(struct phy_device *phydev,
> > +			=C2=A0=C2=A0=C2=A0 struct ethtool_wolinfo *wol)
> > +{
> > +	u32 reg_val;
> > +
> > +	air_buckpbus_reg_read(phydev,
> > AN8801_BPBUS_REG_WAKEUP_CTL1, &reg_val);
> > +
> > +	wol->supported =3D WAKE_MAGIC;
>=20
> How does WoL work on this device. Only via interrupts? If so, maybe
> you should only return WAKE_MAGIC as supported if there is a valid
> interrupt?
>=20
Yes, the WoL works via interrupts and indeed it lacks the interrupt
validity check.

In v2, following the RTL8211F wake-on-lan support example given to me
by Russell in his review, I'll fix this by adding a check using
device_can_wakeup in an8801r_get_wol and an8801r_set_wol functions and
adding a probe function (there was none in v1) to mark the PHY device
as wakeup capable if it has a valid interrupt and if the wakeup-source
property is present in the devicetree for the device node.

> > +static int an8801r_rgmii_delay_config(struct phy_device *phydev)
> > +{
> > +	switch (phydev->interface) {
> > +	case PHY_INTERFACE_MODE_RGMII_TXID:
> > +		return an8801r_rgmii_txdelay(phydev, 4);
> > +	case PHY_INTERFACE_MODE_RGMII_RXID:
> > +		return an8801r_rgmii_rxdelay(phydev, 0);
> > +	case PHY_INTERFACE_MODE_RGMII_ID:
> > +		return an8801r_rgmii_txdelay(phydev, 4);
> > +		return an8801r_rgmii_rxdelay(phydev, 0);
>=20
> The parameters look very odd here. 4 means 2ns, but 0 also means 0ns?
> Can this API be improved?
From the info I finally got about these magic values, the differences
between the RX and TX values for the default insert delays can be
explained by the additional RGMII_RXDELAY_ALIGN bit setting when
writing the RX delay register (AN8801_BPBUS_REG_RXDLY_STEP), done by
an8801r_rgmii_rxdelay function because it adds an extra offset.

For TX, the 4 value is the delay step value that is the closest to 2ns
(1.883ns). But For RX, setting the step value to 0 and setting the
RGMII_RXDELAY_ALIGN bit too, inserts a 1.992ns delay. Without align
bit, it would indeed be -0.008ns.

Those delays are also inserted because the an8801r_rgmii_rxdelay and
an8801r_rgmii_txdelay function set the force mode bit
(RGMII_RXDELAY_FORCE_MODE / RGMII_TXDELAY_FORCE_MODE).=20
If this bit is unset, it prevents inserting a delay.

> Also, PHY_INTERFACE_MODE_RGMII_TXID means 2ns delay for TX, but it
> also means 0ns delay for RX. The code appears to be missing this
> second part.
>=20
There is indeed a bug with this double return in
PHY_INTERFACE_MODE_RGMII_ID case so the RX delay is not inserted.

> > +	case PHY_INTERFACE_MODE_RGMII:
>=20
> And here you should be disabling all delays. We have seen boards
> where
> the strapping is wrong, the PHY boots in RGMII_ID, but RGMII is
> required, and so the driver must fully implement
> PHY_INTERFACE_MODE_RGMII disabling the delays.
>=20
You're right it is also missing the delay disabling part.

The an8801r_rgmii_txdelay and an8801r_rgmii_rxdelay function don't
allow to disable them since they always set force mode bit and because
the 0 values does not completely mean no inserted delay.
Their implementations should be modify to be able to do that.

For v2, I've reworked the an8801r_rgmii_delay_config and
an8801r_rgmii_rx/txdelay to handle properly all RGMII configuration
cases and I hope in a simpler manner.

> > +static int an8801r_config_init(struct phy_device *phydev)
> > +{
> > +	u8 led_default_function[AN8801R_NUM_LEDS] =3D { 0 };
> > +	int prev_page, ret;
> > +
> > +	ret =3D an8801r_of_init_leds(phydev, led_default_function);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* Disable Low Power Mode (LPM) */
> > +	ret =3D phy_write_mmd(phydev, MDIO_MMD_VEND2,
> > AN8801_REG_PHY_INTERNAL0,
> > +			=C2=A0=C2=A0=C2=A0 FIELD_PREP(AN8801_PHY_INTFUNC_MASK,
> > 0x1e));
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D phy_write_mmd(phydev, MDIO_MMD_VEND2,
> > AN8801_REG_PHY_INTERNAL1,
> > +			=C2=A0=C2=A0=C2=A0 FIELD_PREP(AN8801_PHY_INTFUNC_MASK,
> > 0x2));
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* Disable EEE by default */
> > +	ret =3D phy_write_mmd(phydev, MDIO_MMD_AN, MDIO_AN_EEE_ADV,
> > 0);
> > +	if (ret)
> > +		return ret;
>=20
> Why? If EEE is broken, this is not sufficient to stop a user
> re-enabling it.
>=20
I've tested by removing these lines and EEE seems working fine.
I'll remove them in v2.

> > +static int an8801r_read_status(struct phy_device *phydev)
> > +{
> > +	int prev_speed, ret;
> > +	u32 val;
> > +
> > +	prev_speed =3D phydev->speed;
> > +
> > +	ret =3D genphy_read_status(phydev);
> > +	if (ret)
> > +		return ret;
>=20
> You configure the PHY to support downshift. If it has performed a
> downshift, does it report the actual speed in the usual registers
> read
> by genphy_read_status(), or is it necessary to read a vendor
> register?
From the tests I've done, I got the actual speed read correctly by
genphy_read_status function.
I did a test by adding in this function the vendor register reading at
the same time and comparing it and did not get a discrepancy too when
switching with ethtool between different speed configurations.

Would it be more reliable to use the vendor register instead?

>=20
> > +static struct phy_driver airoha_driver[] =3D {
> > +{
> > +	PHY_ID_MATCH_MODEL(AN8801R_PHY_ID),
> > +	.name			=3D "Airoha AN8801R",
> > +	.features		=3D PHY_GBIT_FEATURES,
>=20
> Should not be needed, if the PHY enumerates its capabilities
> correctly.
I confirm it is not needed, I'll remove it in v2.

Thanks for the review.

Regards,
Louis-Alexis

>=20
> =C2=A0=C2=A0=C2=A0 Andrew
>=20
> ---
> pw-bot: cr

