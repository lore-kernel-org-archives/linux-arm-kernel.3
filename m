Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2A23CD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 17:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3X58+ak98zXIl0hmCwArn7OR21uOOHpsO2nLWNu5Jz8=; b=OvNExx6iJOI8kzFNUyz62PvL8g
	BkFxNiTruY+xi+fEhNRODrUdJ4ur1ItyJ3KNeUlT7dJAHN4HK42VN2Z+1lztBYYAE3xUcNFvK8+Sf
	NEh6chjbC4bjvBGb20F8GV4HQlmUF9AaiP6pUvsX+THltVf3jNoQ+NdaPoe5MZfRtt24uMyxkbDgU
	WGZXDEdfshI/lw0letkY3d40sZOqsUimVHVNU225WNmYqlwlmFGOgNqG93dhJ5wPqTbZDzOnih5UP
	AyUGXQ79KHxWNR7TiEXWxDjdlKrUtaDzqLwii7OSq7zvmE3H65xo8wD+G7UgjpPfLAMussSqFU+qM
	PinI4GIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWdsM-00000004Cr4-48As;
	Mon, 08 Jun 2026 17:35:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWdsL-00000004CqZ-1Vhm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 17:35:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8A42C6001D;
	Mon,  8 Jun 2026 17:35:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AFC81F00893;
	Mon,  8 Jun 2026 17:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780940100;
	bh=3X58+ak98zXIl0hmCwArn7OR21uOOHpsO2nLWNu5Jz8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GgF9d1mJ5KXoPgzadwHPsD5LEFsR8UtWI0lxxsgSQm1ybcppy6X+/fjlDyzG/7WnM
	 TG0s+Q3u+3fmhb18wIPBCvOo+atURJCqjdYhbaJxndpFezTFTDOHP79n7Vnb2VIzkr
	 yPMoTBBle9hVplin8Y6woZZKFtCrn3v1nnDOiIxJ1YTKy9Tw7UaVXFVUvraAh68xZH
	 eOXgoMUO7hu1w8TX0Wbo4aXnOjFuDvwfgUmHm9qqqd92xtQQGiQYXmaFaadCroP7TK
	 x+FJjzO7+8xnudkVajSdZhNJ2qNsCwoZynXqRCvc+PCSZNwO/5FCk2bVC0QYH+LCPA
	 E4zb1nd1CFQpQ==
Date: Mon, 8 Jun 2026 18:34:56 +0100
From: Conor Dooley <conor@kernel.org>
To: Geetha sowjanya <gakula@marvell.com>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	mark.rutland@arm.com, will@kernel.org, krzk+dt@kernel.org
Subject: Re: [PATCH 3/3] dt-bindings: perf: marvell: Extend CN10K TAD PMU
 binding for CN20K
Message-ID: <20260608-spiral-unsterile-66189c3241f8@spud>
References: <20260607125101.17778-1-gakula@marvell.com>
 <20260607125101.17778-4-gakula@marvell.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GYpgjdsQiQTsrVfP"
Content-Disposition: inline
In-Reply-To: <20260607125101.17778-4-gakula@marvell.com>
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


--GYpgjdsQiQTsrVfP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 07, 2026 at 06:21:01PM +0530, Geetha sowjanya wrote:
> Allow marvell,cn20k-tad-pmu alongside marvell,cn10k-tad-pmu, document
> CN20K in the title and description, add a maintainer, and include a
> CN20K example node with the same required properties as CN10K.

This is great and all, but is evident from the diff (other than the fact
it talks about an example that does not exist).
What is missing is an explanation of why a fallback comaptible is not
usable.
pw-bot: changes-requested

Thanks,
Conor.

>=20
> Signed-off-by: Geetha sowjanya <gakula@marvell.com>
> ---
>  .../bindings/perf/marvell-cn10k-tad.yaml      | 20 +++++++++++--------
>  1 file changed, 12 insertions(+), 8 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/perf/marvell-cn10k-tad.yam=
l b/Documentation/devicetree/bindings/perf/marvell-cn10k-tad.yaml
> index 362142252667..1612052b59ae 100644
> --- a/Documentation/devicetree/bindings/perf/marvell-cn10k-tad.yaml
> +++ b/Documentation/devicetree/bindings/perf/marvell-cn10k-tad.yaml
> @@ -4,23 +4,27 @@
>  $id: http://devicetree.org/schemas/perf/marvell-cn10k-tad.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
> =20
> -title: Marvell CN10K LLC-TAD performance monitor
> +title: Marvell CN10K / CN20K LLC-TAD performance monitor
> =20
>  maintainers:
>    - Bhaskara Budiredla <bbudiredla@marvell.com>
> +  - Geetha sowjanya <gakula@marvell.com>
> =20
>  description: |
> -  The Tag-and-Data units (TADs) maintain coherence and contain CN10K
> -  shared on-chip last level cache (LLC). The tad pmu measures the
> -  performance of last-level cache. Each tad pmu supports up to eight
> -  counters.
> +  The Tag-and-Data units (TADs) maintain coherence and contain the
> +  shared on-chip last level cache (LLC) on Marvell CN10K and CN20K SoCs.
> +  The TAD PMU measures last-level cache performance. Each TAD PMU
> +  supports up to eight counters.
> =20
> -  The DT setup comprises of number of tad blocks, the sizes of pmu
> -  regions, tad blocks and overall base address of the HW.
> +  The DT setup describes the number of TAD blocks, the sizes of PMU
> +  regions and TAD pages, and the overall MMIO base of the hardware.
> =20
>  properties:
>    compatible:
> -    const: marvell,cn10k-tad-pmu
> +    items:
> +      - enum:
> +          - marvell,cn10k-tad-pmu
> +          - marvell,cn20k-tad-pmu
> =20
>    reg:
>      maxItems: 1
> --=20
> 2.25.1
>=20
>=20

--GYpgjdsQiQTsrVfP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaib9QAAKCRB4tDGHoIJi
0iuaAP96ctiNghyt5d2J1nsjhd7clrVmybndmOZ62qcSmQkpFAEAtRVcR6SCoSR7
HhSMhZEIIzV91tr2oTChrnix/m86bQM=
=JDcj
-----END PGP SIGNATURE-----

--GYpgjdsQiQTsrVfP--

