Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E06A8CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 16:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JOAeQRAcKFGRxblfDU244OOP9WFFlvWgqZXVyH4PcvI=; b=1jFlm6jRYcPK7dNYCPs99hmUL1
	TWcXMj5sO/8y1GKAP4hob94S4LLL4Dgd485RiCEpG+uY9XdaxdKTTC9I6bvpz1WA2Fl6bsEcySqMa
	MLZHAvqowYR7JqXhKue5QAvbs6mQShEco2gt11mKX6k8+hnP4Wmi5j0xETU9pmlNBS5B2PQlzFjxi
	Ry2Z87Mu4S0GKYqqDbtG71E9K2rdNMKsR//Trz9+DmzIXJHZ0PoaV1Wib8qoN3p0JpPGSB/594lAg
	xy0jfQcBh4EJcueKSJGQ7IkhrAniSt1p0aud0mZCXOXmkc7jNW4jZzWOQOO6TDuC/38OFDaFCv58R
	INMtTTjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHPnX-000000009rr-3hnm;
	Fri, 07 Nov 2025 16:58:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHPnU-000000009qK-2uXT;
	Fri, 07 Nov 2025 16:58:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D348443702;
	Fri,  7 Nov 2025 16:58:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6264C116B1;
	Fri,  7 Nov 2025 16:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762534725;
	bh=Deg5hP1tnfyqQJxvp93MwJaREyzV5XSriYRCDYcaoIw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RG1x+TTAKKD/cyeabvnyLQecTtAkAoJJdfXtmDUm8y4WRJwTUuGfS1kSik8J3F0Ng
	 ltIw6btFhrVQVWmeGr2l5UxLm5IdNDaO1rPcBm1232Oxohl3Mwp+KeF5/hHO+mymBy
	 7TrK5Dnl1il/lZUrOS9g5Bph4wy9DNDEhePBGtYuHJryAlcE4i60yxGO0glFbIS88F
	 fmdw2CUEV6Bvobj4VvUnWGwoeBpx5A1HE2dYzDRXHPQpiAIGssEQ6yi/7jrG8c9voT
	 C+Xj2YNNwOtzX0gUk5GA442O5BfZl3ULta/AU5KWYtthWMy6gZ0A7FnVsbP040WX98
	 zB7gyNcFs5ERQ==
Date: Fri, 7 Nov 2025 16:58:39 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: "Rob Herring (Arm)" <robh@kernel.org>,
	"irving.ch.lin" <irving-ch.lin@mediatek.com>,
	linux-kernel@vger.kernel.org, sirius.wang@mediatek.com,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-pm@vger.kernel.org,
	linux-clk@vger.kernel.org, netdev@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>, jh.hsu@mediatek.com,
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
	Qiqi Wang <qiqi.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Michael Turquette <mturquette@baylibre.com>,
	vince-wl.liu@mediatek.com,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v3 02/21] dt-bindings: power: mediatek: Add MT8189 power
 domain definitions
Message-ID: <20251107-fabric-handbook-fa4aea68e64e@spud>
References: <20251106124330.1145600-1-irving-ch.lin@mediatek.com>
 <20251106124330.1145600-3-irving-ch.lin@mediatek.com>
 <176243607706.3652517.3944575874711134298.robh@kernel.org>
 <20251106-spearhead-cornmeal-1a03eead6e8a@spud>
 <20251107-polar-satisfied-kestrel-8bd72b@kuoka>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="T8z4/ZRRt2Y/34dZ"
Content-Disposition: inline
In-Reply-To: <20251107-polar-satisfied-kestrel-8bd72b@kuoka>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_085848_778585_BA16445D 
X-CRM114-Status: GOOD (  17.46  )
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


--T8z4/ZRRt2Y/34dZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 07, 2025 at 08:26:34AM +0100, Krzysztof Kozlowski wrote:
> On Thu, Nov 06, 2025 at 05:17:39PM +0000, Conor Dooley wrote:
> > On Thu, Nov 06, 2025 at 07:34:37AM -0600, Rob Herring (Arm) wrote:
> > >=20
> > > On Thu, 06 Nov 2025 20:41:47 +0800, irving.ch.lin wrote:
> > > > From: Irving-CH Lin <irving-ch.lin@mediatek.com>
> > > >=20
> > > > Add device tree bindings for the power domains of MediaTek MT8189 S=
oC.
> > > >=20
> > > > Signed-off-by: Irving-CH Lin <irving-ch.lin@mediatek.com>
> > > > ---
> > > >  .../power/mediatek,power-controller.yaml      |  1 +
> > > >  .../dt-bindings/power/mediatek,mt8189-power.h | 38 +++++++++++++++=
++++
> > > >  2 files changed, 39 insertions(+)
> > > >  create mode 100644 include/dt-bindings/power/mediatek,mt8189-power=
=2Eh
> > > >=20
> > >=20
> > > My bot found errors running 'make dt_binding_check' on your patch:
> > >=20
> > > yamllint warnings/errors:
> > > ./Documentation/devicetree/bindings/clock/mediatek,mt8189-clock.yaml:=
25:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
> >=20
> > pw-bot: changes-requested
>=20
> I think this was bot's false positive - that's a different file, not
> changed here. The patch seems fine.
>=20
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Oh dear, my bad! Good thing I sent the mail, so you noticed, rather than
just setting the status in patchwork. I saw "mediatek,mt8189" and read
nothing else in the error, I suppose.

--T8z4/ZRRt2Y/34dZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQ4lOwAKCRB4tDGHoIJi
0sKSAPwKZVe3dwNNrDJA98CxIbR5p1CvuU/zHuxccA9twIforwEA80yya84iofrG
AhtlRaBMllXkasNygF6wjSxLj+4AYwU=
=hCrv
-----END PGP SIGNATURE-----

--T8z4/ZRRt2Y/34dZ--

