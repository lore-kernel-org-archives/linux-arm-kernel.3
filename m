Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F6DCCA6012
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 07:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bIN6kVXaJOz/2xV7De35B3BNaqdax21dBtC4ofIPkDc=; b=t7p0v9x/54uPE1W6nbddQ/cfvh
	hI49QpJMupusduwKW/hZpmquoemv+fCJ7uEsf5ByOpKs7r58bM8NfiB5desDDDTVoJs/JSdAkwr2p
	P/R/zKXCi6pRJdwCyi+jnGFKGkMpBlW7TCDzYz+n/R4vYkEwAb6AWdvEP6npGlcT4SDBvz5Z3eIzB
	g14vxI6JLJpvPZN7+b3jlgnkh0wlPbyyXbeGa+5lIa/Q87D7J1JDkERhRxdkyliIhIUH+yKRqm3pY
	+2mylNar+20M8rcV5xpgUyK4dL4FtuZWAzSG6uYVpwkuIts+IFF0MfxBN2edRK0xN0HWttLcczrrH
	ltpMKDdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF4bo-00000005g8b-2UPB;
	Fri, 09 Oct 2026 07:01:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF4bn-00000005g8S-3NDE;
	Fri, 09 Oct 2026 07:01:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DE698602C3;
	Fri,  9 Oct 2026 07:01:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 971AE1F000FF;
	Fri,  9 Oct 2026 07:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791529294;
	bh=bIN6kVXaJOz/2xV7De35B3BNaqdax21dBtC4ofIPkDc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cP/hEPkhU/PGlPuC5tF3GDsygpQaZ5CgIeRIAn1PKrh95VqTa9VjZ3hAr6EjFff76
	 rCgspSzDCC810jAhBBVjLKUL9iWvxWLq1uK/zssIfxZP6tbf5zn3kIstzlPVZ8kpzR
	 KkJwXG0JlBZF6JndDcgDZR1mNg1FZ4i1sJqPvaizEs+i4ir3Y6m4MLQtRFgAM8uoXf
	 SiCj0+h+t33tVIBV0dgTTgG/jf6zEmvrD4VKKZGFybkB7a38ef3jCQX1o04/PmOdGC
	 2/3LlaPGuiwLjOGQ762oVLm13dpCUxZONvjJFmNC5byFcAC6ZLJd5QlSK09EflpMME
	 dllTs+xGK1PEQ==
Date: Fri, 9 Oct 2026 09:01:31 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?TWljaGHFgiBLb3BlxIc=?= <michal@nozomi.space>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, 
	Steven Price <steven.price@arm.com>, =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: gpu: mali-bifrost: Add the MT8188
 MFGCFG phandle
Message-ID: <20261009-sparkling-broad-dormouse-ae1ff8@quoll>
References: <20261003200132.866240-1-michal@nozomi.space>
 <20261003200132.866240-2-michal@nozomi.space>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20261003200132.866240-2-michal@nozomi.space>
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

On Sat, Oct 03, 2026 at 10:01:30PM +0200, Micha=C5=82 Kope=C4=87 wrote:
> On MT8188 the GPU timestamp counter only counts once a register in the
> MFG configuration block routes the SoC system timer to it, and the
> setting is lost whenever the GPU power domain is turned off. The GPU
> driver has to restore it on every power-up, so it needs a reference to
> that block.

This looks rather like power domain issue, e.g. missing restore of
registers. Otherwise next time there will be one more phandle and then
one more, each for one register being lost during power down.

>=20
> Add an optional mediatek,mfgcfg phandle. Allow it on MT8370 as well,
> which shares the GPU and the MFG block with MT8188 and its GPU node in
> mt8188.dtsi. It is optional so that existing devicetrees stay valid;
> without it the timestamp counter reads zero, as before.
>=20
> Signed-off-by: Micha=C5=82 Kope=C4=87 <michal@nozomi.space>
> ---
>  .../bindings/gpu/arm,mali-bifrost.yaml          | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)

Best regards,
Krzysztof


