Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82089C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 17:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1UWbogJgeco5WHNezkVt8ymTxY2YVnBpAsTKrv/cZmo=; b=rJ1UO6uxaKZhbfGcjXGj80XOTJ
	Km7MJl6PY2V2VXNMqT9mdsyi3XKPwIRUabzJLZfg7UQLETTUqAANMxqyY8+wUTxhZjLuDR99TvLrc
	KViXy/7IB4YquHagaHuHKJgwRYlzr5jNouIH6tkYOAmlRuuAe2IVL7nuzWap3hkvS9HFsDXNDg19/
	/h2k6FpBSgfX0WKkGchb3/kVoQY0Ku6D4IroWZeWhSQHg971ifzmsVCIls0OKsSskxED2qi5rez+V
	Blc6mxS9+SawUcT4u14FNLbs06JJKEtMp/8EuWStkzOJkDm63u1bkl4pV0Q/cVIefOv5fcg1VdoYI
	GZZ3GGIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAu6J-00000002dpq-3QWX;
	Fri, 02 May 2025 17:23:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAtIn-00000002WRz-2BHk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 16:31:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 44DA344856;
	Fri,  2 May 2025 16:31:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E50CC4CEE4;
	Fri,  2 May 2025 16:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746203512;
	bh=1UWbogJgeco5WHNezkVt8ymTxY2YVnBpAsTKrv/cZmo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dFysst/03X8hMdpX7sFMDrNdgbyCwQPuks5HCkYv8hzqEoQPzHdryNaChZk1HshOu
	 o63yTy7OBPNw6CYZdBX+yVGAEL009P8R5Sbe4oUtT74144L2lIBDpdeiV5KoDaCuG6
	 Pviy+zCWGlzVC8jUK107vjFkuGKs9HTF1tA83O02jwuS8ktnFaOiAkk+zSnkx002Jn
	 ZKnOZc3kGfgPpuMSHuB/BWzn8lHsZMXHb+/84agLKZeyxaw2KRRAFhQwPiLjHUSbko
	 CVdnt3iDclcrCjWsGgOk1StOxc+mqmMayJYpiUXjIrJ5270O5CTw57QiEwEV+Xi4IE
	 xvEobnpBn8cww==
Date: Fri, 2 May 2025 17:31:46 +0100
From: Conor Dooley <conor@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Chris Brandt <chris.brandt@renesas.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: timer: renesas,ostm: Document RZ/V2N
 (R9A09G056) support
Message-ID: <20250502-pound-clay-e5c00911b26c@spud>
References: <20250502124627.69644-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250502124627.69644-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1h659JRnvzLpgwnc"
Content-Disposition: inline
In-Reply-To: <20250502124627.69644-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_093153_577317_252C5955 
X-CRM114-Status: GOOD (  13.22  )
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


--1h659JRnvzLpgwnc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 02, 2025 at 01:46:26PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Document support for the Renesas OS Timer (OSTM) found on the Renesas
> RZ/V2N (R9A09G056) SoC. The OSTM IP on RZ/V2N is identical to that on
> other RZ families, so no driver changes are required as `renesas,ostm`
> will be used as fallback compatible.
>=20
> Also update the bindings to require the "resets" property for RZ/V2N
> by inverting the logic: all SoCs except RZ/A1 and RZ/A2 now require
> the "resets" property.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--1h659JRnvzLpgwnc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaBTzcgAKCRB4tDGHoIJi
0pXcAP4z3/dK6X2Ypr13HK+ekeneGtjckP7okUIxK5d79phtnwD/QbJEr7QLNlGo
eAqFaqZ0TrpadWiEN6QfAHSjqdT3awU=
=i5nU
-----END PGP SIGNATURE-----

--1h659JRnvzLpgwnc--

