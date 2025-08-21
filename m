Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7C9BCA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 23:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IwkemSw4Vx24EVbbSX7QEvQKVtin90a3h15SG3fkg6Y=; b=du5WX6OgJHdieCx+Ni48HfmsGs
	NXRbhDoqcvc8g66zqD0ACJJewLILuNVnwiwn1CxHpcNO0TtT81BusOjSJXav2CDhGkPQH5m7tOHZe
	jbKWTlt0qRj3MCdpXlHeQrwCj5prsbm8WZh/fQIW91VUa37FSgMrggxnYAPrdggaazPGUXdpw7YnR
	HFUS3TlM5dzalrpL4d8MCPPjdURxqyctc0+Zv+88iak3LVbtJ3YvGlhHSBX7f6PJGXRHCAdTpyHn/
	IqPYU7rLGSFiTaIGnXT7aU4ObAnAF5Yx2E6vBrM0dIoIJFb14E57SncgxZ5fXUfbUmCjxIIA1rVvP
	xQQM2rMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upElh-00000000wTb-38cw;
	Thu, 21 Aug 2025 23:32:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up9m5-0000000098B-0t8q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 18:12:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 54F2A601F8;
	Thu, 21 Aug 2025 18:12:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79B2DC4CEEB;
	Thu, 21 Aug 2025 18:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755799952;
	bh=tyZZ+il8BMFYTQkAPqh2zWtcW1YYUU3DlFkhMHgu0cs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jrbldMhWX5CiMxOc8iQ+3bFUFDSo2J7QvQoVDX5+d2TS/S4+JogfQay5R7re4KtMX
	 4raE5FpjqgERfbc5DUol18xjsccrX+F4mjJvwJcPcFYo9wLbe25hV++timmdwvbtCc
	 xNCrh6GKumyWk8LSextmRdyKWgyNiFIxOWyKIt5XeyAipeIIzsqAXdcIS77zfYBvrX
	 sLQcrvKhsbtwrvaDl7AQbGn2s+DTlReSPgE9h5S5O6pCNuz4GEruNpq8wmrhoASfUI
	 5lDe9xaOMaCMZcr38WASAKZ83RIBIONE1ppqPBE2OA6tZ+rGoMOvbxfTmU+5KnrJ/i
	 YzWMANvgvwPcg==
Date: Thu, 21 Aug 2025 19:12:27 +0100
From: Conor Dooley <conor@kernel.org>
To: Donald Shannon <donalds@nvidia.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	joel@jms.id.au, andrew@codeconstruct.com.au,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org, etanous@nvidia.com
Subject: Re: [PATCH 2/2] ARM: dts: aspeed: Add NVIDIA VR144NVL board
Message-ID: <20250821-baffling-immersion-e86971edb6e0@spud>
References: <20250821051047.3638978-1-donalds@nvidia.com>
 <20250821051047.3638978-3-donalds@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="I8HKQZSFF8kf2/3M"
Content-Disposition: inline
In-Reply-To: <20250821051047.3638978-3-donalds@nvidia.com>
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


--I8HKQZSFF8kf2/3M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 20, 2025 at 10:10:47PM -0700, Donald Shannon wrote:
> +// I2C2
> +// Baseboard 0 Management 1
> +&i2c1 {
> +	clock-frequency = <400000>;
> +	status = "okay";
> +
> +	i2c-mux@70 {
> +		compatible = "nxp,pca9548";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		reg = <0x70>;
> +		i2c-mux-idle-disconnect;
> +		vdd-supply = <&reg_3v3_stby>;
> +
> +		c0uphy0: i2c@0 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		reg = <0>;

Incorrect indent.

> +		};
> +
> +		c0uphy2: i2c@1 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <1>;
> +		};
> +
> +		c0unused2: i2c@2 {

If these are unused, why are they here?

> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <2>;
> +		};
> +
> +		c0unused3: i2c@3 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <3>;
> +		};
> +
> +		c0unused4: i2c@4 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <4>;
> +		};
> +
> +		c0unused5: i2c@5 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <5>;
> +		};
> +
> +		c0unused6: i2c@6 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <6>;
> +		};
> +
> +		c0unused7: i2c@7 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <7>;
> +		};
> +	};

--I8HKQZSFF8kf2/3M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaKdhiwAKCRB4tDGHoIJi
0m2xAP4wGIl/Es2Bp6NAxJ+HV4Tf8VzTJK8IeGd3GjtpjTwM/gD/QRt1hUb5Xf9D
jc00evZQh79KWiMdlVcfo/aTExP+xws=
=y2Po
-----END PGP SIGNATURE-----

--I8HKQZSFF8kf2/3M--

