Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 712FDCD13D2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 18:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/lgbv0xkkeEeyCFTxzletftyEsQCLKdX/zZrCKZT90Y=; b=KMTEIMNuIvjQfPVq1Zc1s2VdF9
	aKezWiPoT65AuM4MHzOtnBwxDwrAx0pLP2g7xYrqmu70MWff10ro56C3M+9n06A0tsnHIhcsuQChH
	bOhQixDn8i9O6mogyHWOCJh5mObmxYwYMlFWErgc9AzNoAHXAJsc4QovYIPZzyCcFVPpn/Hezjknf
	Xj0uoWA7XWM16ExiP1b843wGGbfQe3cNHIDurvNMjagiSlMgaVFfvYSe49X/PCogmxlNPp+N9UGl4
	U4BJw8eHvxvDAT00EB4TRECrNHGr1eL68I/5QoRbfvAYCT2DbixM8sOt+1U57pfWyDA0xtzHBRBEM
	Ii6XhaSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHQxh-00000000QXp-3J0j;
	Fri, 07 Nov 2025 18:13:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHQxf-00000000QWc-3tJT;
	Fri, 07 Nov 2025 18:13:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3CC924085A;
	Fri,  7 Nov 2025 18:13:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD698C19423;
	Fri,  7 Nov 2025 18:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762539203;
	bh=/lgbv0xkkeEeyCFTxzletftyEsQCLKdX/zZrCKZT90Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bi5QEyLrlIvHfU1JgbyRk1+DvTo+x8gaYn8el+yDhjo+Q/r6xqEaJ1GCgrciPTGVz
	 SDGNRXdUSm6u6gSKlv5ANzbyxkL566qHADV8aWXLnSTXztPC2ace9lwFA3XwRy8hcu
	 ZqaImqFajA8peXiyJRkmBLtO8Kw5MlqcMjq/y7Y1hP4XdypVHjZougqdIRDW07JcRV
	 lJujxFkBr5zwfNxCjBDfHpTV0MQmMhz7Yubh4LE2+LM7eeKKgzUFcAhiCqtMmP/Add
	 Kvi6uavYpwPkMSnMwPTMnK5mwhWVqK6tSz4niZFIZ7uKbwLrZq7E8pJHcCWt6LUcGh
	 h8QxbbxL00WBQ==
Date: Fri, 7 Nov 2025 18:13:18 +0000
From: Conor Dooley <conor@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/4] dt-bindings: phy: Add documentation for Airoha
 AN7581 USB PHY
Message-ID: <20251107-marina-cramp-cf3d60a52524@spud>
References: <20251107160251.2307088-1-ansuelsmth@gmail.com>
 <20251107160251.2307088-3-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2fzr6I2tBaj3GaUW"
Content-Disposition: inline
In-Reply-To: <20251107160251.2307088-3-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_101323_987949_69EFB48B 
X-CRM114-Status: GOOD (  16.37  )
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


--2fzr6I2tBaj3GaUW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 07, 2025 at 05:02:44PM +0100, Christian Marangi wrote:
> Add documentation for Airoha AN7581 USB PHY that describe the USB PHY
> for the USB controller.
>=20
> Airoha AN7581 SoC support a maximum of 2 USB port. The USB 2.0 mode is
> always supported. The USB 3.0 mode is optional and depends on the Serdes
> mode currently configured on the system for the relevant USB port.
>=20
> To correctly calibrate, the USB 2.0 port require correct value in
> "airoha,usb2-monitor-clk-sel" property. Both the 2 USB 2.0 port permit
> selecting one of the 4 monitor clock for calibration (internal clock not
> exposed to the system) but each port have only one of the 4 actually
> connected in HW hence the correct value needs to be specified in DT
> based on board and the physical port. Normally it's monitor clock 1 for
> USB1 and monitor clock 2 for USB2.
>=20
> To correctly setup the Serdes mode attached to the USB 3.0 mode, the
> "airoha,usb3-serdes" property is required. This can be either
> AIROHA_SCU_SERDES_USB1 or AIROHA_SCU_SERDES_USB2 and is used to identify
> what modes support the PHY and what register to use to setup the
> requested mode.
>=20
> The first USB port on the SoC can be both used for USB 3.0 operation or
> Ethernet (HSGMII).
> The second USB port on the SoC can be both used for USB 3.0 operation or
> for an additional PCIe line.
>=20
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks for the updates.

--2fzr6I2tBaj3GaUW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQ42vgAKCRB4tDGHoIJi
0m0kAP4gAHkA1J0WWkcLSZGH7kvvrR6oW8Jlf337BzlRYd59+gEAy2sT0GPBd5a+
zrhUJiag68MXCXu33BAdntJ5dD5L/wY=
=VZaV
-----END PGP SIGNATURE-----

--2fzr6I2tBaj3GaUW--

