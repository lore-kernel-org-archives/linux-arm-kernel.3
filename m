Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24C7FCCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 17:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BZxMvMgp/oTJXG8V0pkzxp4anTh6Z7OzA6kttBVt1Tk=; b=wYl3D0Uh1QHiojfsVttk4Oy0Pe
	5Jndf81ER8qpOLyxeaX/Tm1qmwVIIEflkcAUxxPGTGzDoPzzsfPcBp/xT/hExeRMpH0CBj7s38uO5
	AUatwI76ugVXYKjFzcrGkF6UYRPN0rSVeIvUVFE6fjLMrXo+a6S0L+5WGO0GW1WZ4uAtUVg4LZNlt
	193nPmsUMe1DvOMBDnN0ZZBpmX82/POHVGoq/7JElXbbytbPveZ+IN4sYPvkUph0Ivymag+Owtbv7
	kJ5OdYSopySbjmxdjNmS2rEa8TsYVI+0VczjJlx7tt6Ul9oUzh+kPgMR4aDu4UrYt6X8fe5Md47Dc
	Pc+jjk3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEA7D-00000002ECA-42Z4;
	Wed, 29 Oct 2025 17:37:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEA7A-00000002E8A-3fUm;
	Wed, 29 Oct 2025 17:37:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 314C5451FD;
	Wed, 29 Oct 2025 17:37:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C6D0C113D0;
	Wed, 29 Oct 2025 17:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761759460;
	bh=BZxMvMgp/oTJXG8V0pkzxp4anTh6Z7OzA6kttBVt1Tk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AUH/wVOAwFD6vnYUs4aYrhtlV71ZIBmTuztwLl1wysr5+NjY26oeRCv5SJHEZUaDr
	 lWLio7QgKGnfPhERc2RFpRXfgvL7m0GZEfnH1D4TzMfgBfdAElVHGogJL8UuYg8b5B
	 Ux9rJUGM2LiE/D7mmXt42wjmAyug9WHz/f0v3US4D/ONOkc7PGJdcGADSbjceRuX+K
	 rgOskbKmgOVDoLurTn7SRrUsNQdhMeXgJ58h1/OlC/LVtOrcDmUjOsRD4G/0ydcsiF
	 U3UGU9JbJHnf9L3AjgtyZQJOf7M1ZJ+9b4p2Y+SRnrJWnxtEJRr0rN87I2VZU3AUy8
	 K8zbeldIj2Wdg==
Date: Wed, 29 Oct 2025 17:37:35 +0000
From: Conor Dooley <conor@kernel.org>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
	kernel@collabora.com, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: spmi: spmi-mtk-pmif: Add compatible for
 MT8189 SoC
Message-ID: <20251029-energize-synopses-14b86eeaaa2c@spud>
References: <20251029-mt8189-dt-bindings-spmi-v1-1-fbea12a4ed5e@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3Q7C2oA8gPlSdO/P"
Content-Disposition: inline
In-Reply-To: <20251029-mt8189-dt-bindings-spmi-v1-1-fbea12a4ed5e@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_103740_956951_070BB558 
X-CRM114-Status: GOOD (  10.97  )
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


--3Q7C2oA8gPlSdO/P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 29, 2025 at 02:31:16PM +0100, Louis-Alexis Eyraud wrote:
> Add compatible string for the SPMI block on MT8189 SoC, which is
> compatible with the one used on MT8195.
>=20
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--3Q7C2oA8gPlSdO/P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQJQ3wAKCRB4tDGHoIJi
0mlQAP90Purps8XXysFdri+DkHVn5X8gpgEJrCBoYShUbvTPNAD/RDmppUCgpXif
UI01VO/FYSNXlqL+z/TNwb0ynrPp9gM=
=tHul
-----END PGP SIGNATURE-----

--3Q7C2oA8gPlSdO/P--

