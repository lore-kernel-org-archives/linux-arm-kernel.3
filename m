Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAC0CE77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 16:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TCzXSFKN0uJRINAtWAWqMnJMiDEhZQKKnHn6spoOT3A=; b=rdRWL+C4U7DOm5DpjqgU8b5eG1
	tzWcuPWSvJQeDH2xtd7DaGIBDwYv+lWewBEF1VrsCwQv6iA21VAWgHvSG1aeU2641vAu3lkubgBhy
	SSJ4vfbJWiAJFTiNEr26noNg4xwLTTNUw4BPpQRblVJ1+LUAVoYYB8XCkYoHrNR3rbaCOk6tsXr+L
	ZNjRlCAP+gc84JlsRuj2yW/7QR9EUOO5WvBRDXhr9kqSMFqfxpmKoEkdqCY5IfcC6vr1pOWi/AJlM
	vBL/d3ZozQsdZfgKy8jVSoZ0OJjYOoOQThEBKG/LDWUZAA6DpLczx1jgPaiTofy87OJgnMR1FcF/z
	71tcd+Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNx8n-0000000HDWD-0ekI;
	Wed, 18 Dec 2024 16:43:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNx7i-0000000HDKt-09oI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 16:42:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3C0415C63A7;
	Wed, 18 Dec 2024 16:41:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4143CC4CECD;
	Wed, 18 Dec 2024 16:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734540129;
	bh=dhyOE4YUoRsGIZT0ogQrkPhGxu4aVtP1g3XBoISLt7U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NGeejggJplLLEXCN7Ii1Dq8SyLlYw30CUocD41RmWjnxx3EwtrNvzMPCYRFIjFgGa
	 dn06ELmZRukffUJI/rA03m4rm8tVWntwlg2SzelkNiHd4hbFR7pyZgPS9/lNl+EBut
	 k4mHsCVhTwXVw9dvBR+nYpQKD0RUwbZkxxnZ13SbevGIrEMNcZW8PRZ0fl36aJy/fF
	 zp1P2TxU+oUP/yOSADxFSiGox7l/11PTdN0PPv3tk6F3j4IORiN5YwG80ui+TMEjO8
	 PWxoyFNb/TdyxAPPkFEDaTTVzsPSR0kT/SqQ2fclwdPIteujVHXMhclDZjuafTo1kt
	 caR+mBYrSeuuQ==
Date: Wed, 18 Dec 2024 16:42:03 +0000
From: Conor Dooley <conor@kernel.org>
To: Frieder Schrempf <frieder@fris.de>
Cc: linux-arm-kernel@lists.infradead.org, Marek Vasut <marex@denx.de>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Robin Gong <yibin.gong@nxp.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Joy Zou <joy.zou@nxp.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 1/9] dt-bindings: regulator: pca9450: Add properties
 for handling LDO5
Message-ID: <20241218-yapping-driver-d67cf1662b57@spud>
References: <20241218152842.97483-1-frieder@fris.de>
 <20241218152842.97483-2-frieder@fris.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="coNBr7QctIEeG3n2"
Content-Disposition: inline
In-Reply-To: <20241218152842.97483-2-frieder@fris.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_084210_161775_521DA34E 
X-CRM114-Status: GOOD (  26.04  )
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


--coNBr7QctIEeG3n2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 18, 2024 at 04:27:24PM +0100, Frieder Schrempf wrote:
> From: Frieder Schrempf <frieder.schrempf@kontron.de>
>=20
> This reverts commit 27866e3e8a7e93494f8374f48061aa73ee46ceb2 and
> implements a new future-proof way of handling the mismatch between
> the PMIC driver and the hardware for LDO5.
>=20
> It turned out that this feature was implemented based on the wrong
> assumption that the SD_VSEL signal needs to be controlled as GPIO
> in any case.
>=20
> In fact the straight-forward approach is to mux the signal as
> USDHC_VSELECT and let the USDHC controller do the job.
>=20
> Most users never even used this property and the few who did have
> been or are getting migrated to the alternative approach.
>=20
> In order to know the current status (which of the two control
> registers is used) for the LDO5 regulator, we need to route back the
> USDHC_VSELECT signal by setting the SION bit in the IOMUX.
>=20
> By adding the according GPIO as sd-vsel-gpios to the LDO5 node, we
> allow the regulator driver to sample the current status of the
> SD_VSEL signal that is used to select the correct control register.
>=20
> The SD_VSEL on the PMIC is always an input. It's driven by the SoC's
> VSELECT signal (controlled by the USDHC controller) and we use the
> SION bit in the IOMUX to internally loop back the signal in order to
> sample it using the GPIO.
>=20
> As the SD_VSEL pin is directly routed to the LDO5 regulator in the
> PMIC, make the sd-vsel-gpios property part of the LDO5 node.
>=20
> SoC                                  PMIC
> +-----------------------+           +-------------------+
> |                       |           |                   |
> |                       |           |                   |
> |  GPIO <----------+    |           |                   |
> |                  |    |    SD_VSEL|   +-------+       |
> |  USDHC_VSELECT ->+------------------->| LDO5  |       |
> |                       |           |   +-------+       |
> |                       |           |                   |
> +-----------------------+           +-------------------+
>=20
> For boards which have the SD_VSEL tied to a fixed low level, we add
> 'nxp,sd-vsel-fixed-low'. The voltage of LDO5 is therefore only controlled
> by writing to the LDO5CTRL_L register.
>=20
> If none of 'nxp,sd-vsel-fixed-low' or 'sd-vsel-gpios' is set, we keep
> the same behavior as before. The driver assumes that SD_VSEL is tied
> high and the LDO5CTRL_H register can be used, which is in fact not true
> for all known boards and works merely by chance.
>=20
> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

--coNBr7QctIEeG3n2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ2L7WwAKCRB4tDGHoIJi
0gWzAQDUtj59/3nzuoweiBKWKKIPBYM16b8nOrc4NaUzXTNqqAEA1PaDp23BDn/E
L/KEjG6qhat2oumCyi6ESkLp+wQhkQY=
=YsDx
-----END PGP SIGNATURE-----

--coNBr7QctIEeG3n2--

