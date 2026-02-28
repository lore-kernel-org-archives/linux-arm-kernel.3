Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C55FCFEE4C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 11:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UTE9c1BHJn1ZjTSBIvzmfFexOwAmFAsdMAjNupz4+Oo=; b=R0yzDPuEi56EyxAonJyEOgylBA
	xNOs/7DdOJCBX0khG8UAKgNjeXwSXkA5zmJjOw5Cp04JTi3PLlHOki1rH2BWIE+gInvn0MQjYVXK5
	cphai3PM0QRRNtI9ot+VQEr6PdvfmfI1hU3rHo82im9F6oiqWrEv2YIIKiEK1xlH1pfOLZNmFhYue
	lBDxp5ECrVkfyMJgX3maSyQ2MqeVO81d2+68MVS3K/4lvWtqjFrG68XZrieXcOASv+qxXHyZYjugh
	qw5Dise6rAuB+4IUj9HDJf/R5n2YxJZgMvxeo54iYIX//bx/Iz4wlfs/MyPq0QunQqjDm5IGjgI9u
	YAJ2Zryw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwIgf-00000009nde-3pMT;
	Sat, 28 Feb 2026 11:40:45 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwIgc-00000009ndF-3TLJ;
	Sat, 28 Feb 2026 11:40:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=UTE9c1BHJn1ZjTSBIvzmfFexOwAmFAsdMAjNupz4+Oo=; b=bs/sXo+VvGB98Gvl510BWT5k1j
	FvkeFhe5euRSGn/P77K9Pl7DhCM0iUDUxjlo6ix77WjWZirFv2mCtgiXECRjgt5Et5O05dRVrRndm
	okDku3G2feFdUL31Wqk9SlBhSl7WOLOxKor3h4CAKgOfL9CUWxmSAO5+865EydyU7Bd73GF6msuPR
	jYh3GGxUH/memvqDatrno/74P87IkL5yTSyCgqXS8Simn0y4vg+Lq0Gv+h7+UhaIowIpAFl0hXv6D
	M84y7rtVz5C6TTKuEdBUlv3S4tbOXfeCHrQfyW8dmkJCNw0VsPd7KmK1XolFcbI5sFKUZ0Keweo3a
	h3EEauJw==;
From: Heiko Stuebner <heiko@sntech.de>
To: Fabio Estevam <festevam@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 1/2] ARM: dts: rockchip: rk3036: Move PHY reset to ethernet-phy
 node
Date: Sat, 28 Feb 2026 12:40:36 +0100
Message-ID: <2819870.mvXUDI8C0e@phil>
In-Reply-To: <20260228013257.256973-1-festevam@gmail.com>
References: <20260228013257.256973-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_034043_031499_A36507AB 
X-CRM114-Status: GOOD (  17.29  )
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

Hi Fabio,

Am Samstag, 28. Februar 2026, 02:32:56 Mitteleurop=C3=A4ische Normalzeit sc=
hrieb Fabio Estevam:
> According to rockchip,emac.yaml, 'phy-reset-duration' and 'phy-reset-gpio=
s'
> are not valid properties.
>=20
> Use the valid 'reset-gpios' and 'reset-assert-us' properties under
> the etherne-phy node.
>=20
> This fixes the following dt-schema warning:
>=20
> Unevaluated properties are not allowed ('phy-reset-duration',
> 'phy-reset-gpios' were unexpected)
>=20
> Signed-off-by: Fabio Estevam <festevam@gmail.com>


please don't send patches that "simply" fix devicetree warnings.

As you can see in [0] the driver uses these properties currently.
So while this fixes schema warnings, it will break the actual boards.

So first of all you'll need to adapt the driver to handle the "official"
properties and also provide a fallback in the driver for old devicetrees.

Only then can we think about modifying the actual devicetrees for
the future.


Thanks
Heiko

[0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/drivers/net/ethernet/arc/emac_mdio.c#n153


> ---
>  arch/arm/boot/dts/rockchip/rk3036-evb.dts   | 4 ++--
>  arch/arm/boot/dts/rockchip/rk3036-kylin.dts | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/rockchip/rk3036-evb.dts b/arch/arm/boot/dt=
s/rockchip/rk3036-evb.dts
> index becdc0b664bf..c8100dc4c7ce 100644
> --- a/arch/arm/boot/dts/rockchip/rk3036-evb.dts
> +++ b/arch/arm/boot/dts/rockchip/rk3036-evb.dts
> @@ -16,8 +16,6 @@ memory@60000000 {
> =20
>  &emac {
>  	phy =3D <&phy0>;
> -	phy-reset-duration =3D <10>; /* millisecond */
> -	phy-reset-gpios =3D <&gpio2 RK_PC6 GPIO_ACTIVE_LOW>; /* PHY_RST */
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&emac_xfer>, <&emac_mdio>;
>  	status =3D "okay";
> @@ -28,6 +26,8 @@ mdio {
> =20
>  		phy0: ethernet-phy@0 {
>  			reg =3D <0>;
> +			reset-gpios =3D <&gpio2 RK_PC6 GPIO_ACTIVE_LOW>;
> +			reset-assert-us =3D <10000>;
>  		};
>  	};
>  };
> diff --git a/arch/arm/boot/dts/rockchip/rk3036-kylin.dts b/arch/arm/boot/=
dts/rockchip/rk3036-kylin.dts
> index ae2f84a4e922..bc6e6468fcc4 100644
> --- a/arch/arm/boot/dts/rockchip/rk3036-kylin.dts
> +++ b/arch/arm/boot/dts/rockchip/rk3036-kylin.dts
> @@ -102,8 +102,6 @@ &acodec {
> =20
>  &emac {
>  	phy =3D <&phy0>;
> -	phy-reset-duration =3D <10>; /* millisecond */
> -	phy-reset-gpios =3D <&gpio2 RK_PC6 GPIO_ACTIVE_LOW>; /* PHY_RST */
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&emac_xfer>, <&emac_mdio>;
>  	status =3D "okay";
> @@ -114,6 +112,8 @@ mdio {
> =20
>  		phy0: ethernet-phy@0 {
>  			reg =3D <0>;
> +			reset-gpios =3D <&gpio2 RK_PC6 GPIO_ACTIVE_LOW>;
> +			reset-assert-us =3D <10000>;
>  		};
>  	};
>  };
>=20





