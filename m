Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 049E1CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 18:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mnJDg2WGDKJZf/Vr8jH9TK7ujlvyU3706J8AQsGf+6c=; b=0eQM4TZlGsSgxqQsyml9ysAYMc
	ud1V8YL0LAIzJtYCehxs1y2I5gHDT1c3clgnWq8XW4DrdhChd6gLapjf3udCcz50HVWuMhWXwZnfI
	4gmtRPjMIIO+6/rOAJpK/onh+xdS0CVY/BxqboA5z0Oeq0TvrYughokFrr30fdtwa5zuGv/mAeEmk
	1DMlr/vbfNaoed2f59xmK+RvFLAWWF8ZAVFRPUYW+SHakzJPMcR8WYLTONPjR1YSy0QgHVEVa2wlg
	vUJhvbzRGIqEkRfRba9EJko7+qy+aLApNlQAoWTseiwyMIH10VUzsDzvWLPpZiXE0YqYtvo4L91ts
	jeSKCubg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEXQs-00000004c5X-0eXd;
	Thu, 30 Oct 2025 18:31:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEXQq-00000004c5E-3UfR;
	Thu, 30 Oct 2025 18:31:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EB6DD621A4;
	Thu, 30 Oct 2025 18:31:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34D2BC4CEF1;
	Thu, 30 Oct 2025 18:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761849091;
	bh=mnJDg2WGDKJZf/Vr8jH9TK7ujlvyU3706J8AQsGf+6c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RrX5K6wwbb3APve/VViJ7SCkh1wSjv1FBBNDscm6CyEcMzDIL2OhRrHaiyRbM1j+C
	 KXRIIPttDnSkzINlq6735qu0REbZru8+HR4bxWIVvU4it/ajF5t7Tnl1YY8OH2Cko8
	 z8LHrpy5x6paRFIiRmOEg7G10FKwe9jJLwejKMvgf1D4yzXCW8lY8GZasFCHHOwHSO
	 vm0twT0L/qf32ao3hyV0lLpjGCS3iQyUOuUHrXekOnMcWRZht8DNE+taamR18nk92H
	 RuS3GsojVOfKyuScICccgtch4npD5Fuow1w/RjRukOVTVMjydupSC61pDhhdfTRwwv
	 SGIToUdaHGJNA==
Date: Thu, 30 Oct 2025 18:31:26 +0000
From: Conor Dooley <conor@kernel.org>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Lala Lin <lala.lin@mediatek.com>, kernel@collabora.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: nvmem: mediatek: efuse: Add compatible for
 MT8189 SoC
Message-ID: <20251030-sandpaper-baritone-ecb365a33ff9@spud>
References: <20251030-mt8189-dt-bindings-efuse-v1-1-1148e474a9f5@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3UnDEVVN0m5ukz0j"
Content-Disposition: inline
In-Reply-To: <20251030-mt8189-dt-bindings-efuse-v1-1-1148e474a9f5@collabora.com>
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


--3UnDEVVN0m5ukz0j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 30, 2025 at 11:26:10AM +0100, Louis-Alexis Eyraud wrote:
> Add compatible string for the eFuse layout on MT8189 SoC, that is
> compatible with MT8186.
>=20
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--3UnDEVVN0m5ukz0j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQOu/gAKCRB4tDGHoIJi
0jyOAQCMZqMa4KCJVr16fS+kvyHNDmyxiyRUFY0xY3kWUc7SWgD+PRxa7CiB6A5Y
OnbuON6dKugcaPsf6DWFkhLkUoSyOAI=
=oK0x
-----END PGP SIGNATURE-----

--3UnDEVVN0m5ukz0j--

