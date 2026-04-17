Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BE23F436BD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 16:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lrJMlkRjepbR2+v734nOnTQCfqKwaJyhX1Le4Qo3DI4=; b=g3xlrTVFUp8PFbyV6q61hUBC1j
	fggPH3EebiGVY9kEDy6dzyvmepocjPhjQAbGZpXi2g3Glic/8fQpVicTn9CjUnHSi3Mm42SIIKhKV
	Are4UsiDpblBi7sLVP0iJLgv6uLEV1hgMzWdd5QYv1FPbI/5o73I8+T5/Mh6C7mTmSMj0yM5D3B4g
	EUD1C8VMEwwhr33hDPq3iQJ8Q1znscpk4774gZZ2WF0ktA8z5MKHdADvI8lOygaye9LLCFZkyxQcG
	4w89BcaD/hB1doo5w4Mz0gHEB4cVQNSgQFxeXEnJ2iHYm+WQRCGq1jumebtuQLsbKit1Ucwc+a859
	4L6+i+BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDmFC-00000004Hth-1rFW;
	Fri, 17 Apr 2026 16:40:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDmFA-00000004HtY-3ZbL;
	Fri, 17 Apr 2026 16:40:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E9DCF60145;
	Fri, 17 Apr 2026 16:40:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B168FC19425;
	Fri, 17 Apr 2026 16:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776444035;
	bh=vS+6JjIgSwATnAo0FDNGd2EBykmQuR1wkqPKp83GKMk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J9GWZ1tk5cd9ZwIhZsBOpKbe1Wt4MbDlnyOBqRcBM3Z2ySyLmocXF9Y4f2eXQ0Gzi
	 Nvv6xCB4ZZKL+TEgTyYg3Uj78qNZWG38cCwP/8dPab0YZmsVGkoX4vqzN6g7PB/ARa
	 YLxVw8QCDZnVxh6cZcVhOlG4QNM6klXU4/OqYM6JDfGaqjdDzqSZjqohcZgelD9Uas
	 KnWYQkGlov7sgzkeE8zyidF4Ot5QbarZ23UnlHKMF+sGQP3BLfLDheRiE6EnoFGDix
	 6L1DypqMLaqlpISnowtoZBeVggsS6xPcZy/YJoMyb+Xb8T3grFgqw1hpzFaJbWSMjA
	 ZD84jBXaSRrVA==
Date: Fri, 17 Apr 2026 17:40:30 +0100
From: Conor Dooley <conor@kernel.org>
To: Binbin Shi <binbin.shi@mediatek.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hector Yuan <hector.yuan@mediatek.com>, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	vince-wl.liu@mediatek.com
Subject: Re: [PATCH] dt-bindings: cpufreq: add mt8189 cpufreq hw dt-bindings
Message-ID: <20260417-heat-broom-3ffd6419fa07@spud>
References: <20260417080648.3692438-1-binbin.shi@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="O16sYH1P8rELRFuU"
Content-Disposition: inline
In-Reply-To: <20260417080648.3692438-1-binbin.shi@mediatek.com>
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


--O16sYH1P8rELRFuU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 17, 2026 at 04:06:17PM +0800, Binbin Shi wrote:
> Add mt8189 cpufreq hw compatible in dt-bindings.

Why's this not compatible with the existing device? You've got no driver
change with this so I can't even guess as why. The incompatibility should
be explained in the commit message.

pw-bot: changes-requested

Cheers,
Conor.

>=20
> Signed-off-by: Binbin Shi <binbin.shi@mediatek.com>
> ---
>  .../devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml      | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-h=
w.yaml b/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml
> index d0aecde2b89b..cff52fffc6b8 100644
> --- a/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml
> +++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml
> @@ -16,7 +16,9 @@ description:
> =20
>  properties:
>    compatible:
> -    const: mediatek,cpufreq-hw
> +    enum:
> +      - mediatek,cpufreq-hw
> +      - mediatek,mt8189-cpufreq-hw
> =20
>    reg:
>      minItems: 1
> --=20
> 2.45.2
>=20

--O16sYH1P8rELRFuU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaeJifgAKCRB4tDGHoIJi
0s9TAQD+qCFWSseJi4hwmF+JLmEE23ceOhV1OauB+CRT623n9AD/UTVQllhEmCr7
1OjjOwDL92kHJhFrA7d6dYxHqxkLqQ8=
=VuKY
-----END PGP SIGNATURE-----

--O16sYH1P8rELRFuU--

