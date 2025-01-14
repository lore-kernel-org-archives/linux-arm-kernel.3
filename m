Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FAC6C02183
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 17:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h2KjFxw06B6LF0hjxFSlzMrtvNrwKNPLhQ/ilvcbkX4=; b=N3txv+lx0/YrKkMcaL5LI+C1BI
	u+Ymd6ALw1PbOvBtoC3vBGrcbLjJlUWQyYCpg8BntSyld7xsoatYz8m1UV1iEvWaQNuxSfN+29+ug
	WWaA+hweVtR687cswa5Dzryj+9AyKAwHeWiDnbUlrr7X5hFfhZHxIIXBYrdIlxR54APN8o+cA+8qy
	B4IjlvQMfWAQ5wb6GovnZbKlPRSF84Tk6Yla9+tXrWyJ3VsLPoRBv5GpDC11ysfXit0hMLE3I9lUG
	LxOyrZKYZa4ebiEDInNsj89ewJmoQrjdnxpSabRA1XOW60TbEQtUYBk+M+YUpWehfZt7ToaLF92zr
	f5uz20kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXl9H-00000009HKd-1i7G;
	Tue, 14 Jan 2025 17:56:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXl7z-00000009GxV-3Ou7;
	Tue, 14 Jan 2025 17:55:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6FFA55C4CCF;
	Tue, 14 Jan 2025 17:54:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B0F6C4CEE0;
	Tue, 14 Jan 2025 17:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736877298;
	bh=h2KjFxw06B6LF0hjxFSlzMrtvNrwKNPLhQ/ilvcbkX4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nITs+2XR8wmsdQrQGJWbuKOARecDv2a3AFL/gs+NcQZMLBl3EqGnAeiEgJXU9pqkJ
	 1dO6vmt9BnP/LxBbBjuHKlHdP7ag8exsuqsZ0Oo6P66DyE8p8f86aRoqoo+gAif500
	 Yf9VkNkWEhRBJ6HO+sZnBYmD726Ry2jUWPHXKmKI0MBKCxJy/hplIE1Hv7o1v3Ffds
	 1UGJr6YrdwX/iMhvmrDtNIXpX7Er05V6rBhgyQ3E7CW+J+g2QlxK7+MXqtMqpqsXsP
	 VWwR1ap9+VpBYslRdKyxxytSfACL7AX6MRVMY88zq5/dt5fsSuNBHN8bLCg8+qKYdD
	 zX7w00xVaGAow==
Date: Tue, 14 Jan 2025 17:54:54 +0000
From: Conor Dooley <conor@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH 1/3] dt-bindings: arm: mediatek: add mt8370-evk board
Message-ID: <20250114-lily-defensive-3383449a7945@spud>
References: <20250114-dts_mt8370-genio-510-v1-0-8517ee0fdbe8@collabora.com>
 <20250114-dts_mt8370-genio-510-v1-1-8517ee0fdbe8@collabora.com>
 <ef8bbe7a-64fa-4e51-86f3-4f7fc0bb3760@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RPVpWBDX/FhXg1pP"
Content-Disposition: inline
In-Reply-To: <ef8bbe7a-64fa-4e51-86f3-4f7fc0bb3760@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_095459_888491_88C0266F 
X-CRM114-Status: GOOD (  10.34  )
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


--RPVpWBDX/FhXg1pP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 14, 2025 at 11:32:47AM +0100, AngeloGioacchino Del Regno wrote:
> Il 14/01/25 08:38, Louis-Alexis Eyraud ha scritto:
> > Add bindings for the MediaTek mt8370-evk board, also known
> > as the "Genio 510-EVK".
> >=20
> > Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
>=20
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>

Can either of you explain why there's a fallback here to the mt8188?

--RPVpWBDX/FhXg1pP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ4ak7gAKCRB4tDGHoIJi
0lBDAP9PkgIDwITUruIjeBxtqMSUuwk4v1X1d2SYS+SiD4O9fQEA6DtkErzD+2iZ
/x0RtcvkgL8gPS8oyQr68/8LSBuoIQE=
=5gLi
-----END PGP SIGNATURE-----

--RPVpWBDX/FhXg1pP--

