Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C8A5C982DA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 09:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GyJ/Izgdsqp5q8EJHvMUjjmksB1H1LTha8OAdEwdi4o=; b=k6Zh6NHrRBomM+PglNzdzYWddY
	/wv5ZwYQbFC1JgYy1ClWf1d4QHf2lV+UtSQpvnVSN0IldBrX5Uv1IxNICShGXyJasdQJ0OtNXYPfh
	1drfRfLefmlagJobkv50++5nmxpl1VSGCe6kQC2gLh6qShGwbfdtAqsSy2QxQ5vIyuXXD6py20ycZ
	aIk8+ESTVwQWlaMsUkX8/Wje79PNn/TMSmdFqwZQneSPtb9+CrRwYSwCKCttdzgjApkLtNjpNKmmv
	nh8WuZ77NQmPsrBLDo7tDEf8CR1QHKBxf4V7aHnhWM7iQSmkSA5qzM4Uc5Wnb2TCXUgbkVN9jus4q
	rQCFXemw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7UrN-0000000DwSe-2jJ8;
	Fri, 18 Sep 2026 09:26:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7UrM-0000000DwSI-2rDU;
	Fri, 18 Sep 2026 09:26:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B3F1D60A66;
	Fri, 18 Sep 2026 09:26:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDE141F00893;
	Fri, 18 Sep 2026 09:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789723579;
	bh=GyJ/Izgdsqp5q8EJHvMUjjmksB1H1LTha8OAdEwdi4o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dTPAXqIMzE3zycBsqWLtnKbfH7UTA+wPBUSmm9FVCgnVlZS+cSZ4kIBteBFtOZPSX
	 +JIZmqWQf2EyzXBct0o+IRtlpZwSgI8HpNuoofjU7yff+11zadzIkhTCyVlVHmSZge
	 KieiUkq6Twe3H44uy4Y3WTIKX/w07c8tTELWSBCzXTj7JY/up3OsVdsTCQCObX7Oc2
	 95yXJJvKNyiq2jq3l0VGR1HtrHNLkAtyugwIYgazb9PH5Ool0INnJ6Y+OLH6GiUFdk
	 ROA2JKb/JwkCqoKgNXqt/gZbbsFEldDNCHkiWrvXDe0Q0bnKdtzBesW6uD7pUDzfAs
	 EdU7IgGBDDYFw==
Date: Fri, 18 Sep 2026 10:26:14 +0100
From: Mark Brown <broonie@kernel.org>
To: Justin Yeh <justin.yeh@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 0/2] Allow mtk-regulator-coupler to be built as a module
Message-ID: <f034927d-1907-45b7-ae66-a10989116ce8@sirena.org.uk>
References: <20260903062056.1024263-1-justin.yeh@mediatek.com>
 <20260918003722.2764284-1-justin.yeh@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bTlqMwmTvtaxM+Z9"
Content-Disposition: inline
In-Reply-To: <20260918003722.2764284-1-justin.yeh@mediatek.com>
X-Cookie: Dental health is next to mental health.
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


--bTlqMwmTvtaxM+Z9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 08:37:22AM +0800, Justin Yeh wrote:
> Hi Mark, Liam, Matthias, Angelo,
>=20
> Gentle ping on this series, sent two weeks ago:
> https://lore.kernel.org/all/20260903062056.1024263-1-justin.yeh@mediatek.=
com/

Please don't send content free pings and please allow a reasonable time
for review.  People get busy, go on holiday, attend conferences and so=20
on so unless there is some reason for urgency (like critical bug fixes)
please allow at least a couple of weeks for review.  If there have been
review comments then people may be waiting for those to be addressed.

Sending content free pings adds to the mail volume (if they are seen at
all) which is often the problem and since they can't be reviewed
directly if something has gone wrong you'll have to resend the patches
anyway, so sending again is generally a better approach though there are
some other maintainers who like them - if in doubt look at how patches
for the subsystem are normally handled.

--bTlqMwmTvtaxM+Z9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqtA7YACgkQJNaLcl1U
h9Dlkwf/YJOx05NeMMpnlsAzuP7wfrP9ZAT8RAWV4CBWBbKzL922YZOLpb5Ei+eB
Z/xbWC1awCG/N8+oWPgkNAm23hoftpLU8X3Q1oYIBbznNydS8ietdFfibILvPa6/
FrFFyRkzX15QOAMC1OybDghDiPydNv52kyfmBrL3/qM4tDEkUJ5hY8iRTJGz/wKg
nUZBbd81D14Yyf8huMaCaJ6d3i700e47eNMiGvIMNftQ/Ys9U0PIwE++tgvDLyp/
riInpbgojfvNkvvWDS7RFGeHfutXfbFVXS4lq53Httz4RU2I9K/4UAt3RqgUesmi
NZHxugQUq4Er+7UhhPDPUbnnjlmOtQ==
=uW80
-----END PGP SIGNATURE-----

--bTlqMwmTvtaxM+Z9--

