Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72510C5DF97
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 15:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/EhSTVyMRvH1ZrsOqPUQS6lF97pGd760mnYd+lPjepk=; b=KJ/xPrfjurftqOxVuNjvr2tOVO
	V1ZO0c+7j5uWRss+cBr5+y/XBO7grVNaPBvKRmK30zhV5LFjqrLcQHZIm2EVAFL6Nr/YyJcB7Iwr5
	3m5QIHA3jhBTaTUfl61zOhPjVmf0hWxoYTVj7ndrRlW5dblz6sNjx0ipyQ+log4SOhPTfUPPWyt3E
	7sTzNNr04p2kUZvXcgBeXiKHmYzBso7Nq1gUr5Vu16HnNw8GWcwN/lawnOxFkEMwe8R5+WHmi84z3
	0OU2U13xBRYKyNopAl/tIWngsud/W+KSesURjOoKx99ojSOzcNdGqYsJGLUnQjfE0G+Y9Iy0LlyHy
	V+xyoYsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzFPx-00000002emp-1Qb5;
	Wed, 26 Aug 2026 15:19:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzFPv-00000002emX-2moq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 15:19:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6F9736020E;
	Wed, 26 Aug 2026 15:19:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6610A1F000E9;
	Wed, 26 Aug 2026 15:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787757594;
	bh=/EhSTVyMRvH1ZrsOqPUQS6lF97pGd760mnYd+lPjepk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=baiGS0ec/NQRSuJUVRR7rANxNNCsCDdwxfmQPA48kfdREeX0JzQFy+Z5Pv2sXJzX7
	 OKCHJmyquRyluyR+QJZ+AW6mo3RUsRt6Cde1qJEB85A+jy4j9QA7xPQVraxnA8MMRb
	 ov1QOtL8CM7LS7fNI1sflnrb5b8PD06mbnKdc80VV7YpzjOaVFJ6oeBR+3vUN+j5hi
	 ozh0YJeCOFqdQadPCh+4YLzDXq5NO6HzCvMJa5xXQLZonAaPb5N+PhvqrThjEvL1fR
	 /xkLy0OmItlbF5gy3R6YCLZFdPqoIXbBSYl6jcD6wzjyfu6ny7VcG1s3sX4QHVCW+2
	 WAZRgyRI5TqrQ==
Date: Wed, 26 Aug 2026 16:19:49 +0100
From: Mark Brown <broonie@kernel.org>
To: Sushanto <seditorofficial@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: sun4i-codec: Fix OF node reference leaks for
 analog controls
Message-ID: <f85f13cf-15a4-406a-8348-ca18a9e3c3ab@sirena.org.uk>
References: <20260825141035.784-1-seditorofficial@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hiQ//mDqVcF3f7in"
Content-Disposition: inline
In-Reply-To: <20260825141035.784-1-seditorofficial@gmail.com>
X-Cookie: Obey all traffic laws.
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


--hiQ//mDqVcF3f7in
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 25, 2026 at 08:10:35PM +0600, Sushanto wrote:
> The device node obtained from of_parse_phandle() for
> "allwinner,codec-analog-controls" in sun8i_a23_codec_create_card(),
> sun8i_h3_codec_create_card(), and sun8i_v3s_codec_create_card()
> has its reference count incremented by of_parse_phandle().

This doesn't apply against current code, please check and resend.

--hiQ//mDqVcF3f7in
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqPBBUACgkQJNaLcl1U
h9CZaAf+PNSZtr30Psfd1D71HSSAJAQqew/fXp6EhxqPNu/88MCkIeI/EPnvaQnB
Y0verE4QxaeReuDBqIF4GRjswmiVHYwxzKr6Xeo3ko+KASuiN8qf9uqzcDxYwv5o
TiYmunH7jLyZFfB8vzxlik1avzqRJpm86Rgqf1WAGjHPeyYbe89kl/JBE3a8BNE0
vY43az8n2RTferb/3Lu4GZ9iN3gXn5TYcSlPDHkm5x0NmrfBQGuZ6jGJnMP6pu2a
EuPvO/TP/7uvYP/2HSxBxZ3y+KD/uQMiE5yFlwLKrTNeZCkoupFbUeX+kYvX/0vM
SiXD48oPc7rskQVbSSumQiwa08T6dg==
=A6Rx
-----END PGP SIGNATURE-----

--hiQ//mDqVcF3f7in--

