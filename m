Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F26AED3517C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 12:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9DOQvg5WrGBgRTNT0tvidwz1X36JlOTmxmoNAM1Eia4=; b=bVYQCe3fxJVsjc088KoTgCBy3h
	olQcly8lP8HllIU9m62FUo77D8lavBqSRBGvxzNtM0DVRkh4VrsARZ6M4ptJtKRuN4C1z14eIBnJT
	ns5Sx35aERBdyCBiTXfcGQsIQIbL3LJoQ8kETwyKafiWj7RTqy6FBctdRPCHZlFxthYpZENunt9ya
	6zWfPRShjXAmrKE46xfwZfGKO2AXfKulh71Xjm60x71JupfMXFI2JI8+pogDT0f2a1406l0K/6veZ
	9AlmIVuAJ+Ep93U3tOJwBi0OU73EsSGp+JigKDjI+LjHBGLbCg3vtrLGnhSohQq190mp6DQqNnRDN
	NKjh2uXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7v4c-0000000FG3k-2z6w;
	Wed, 01 Apr 2026 12:53:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7v4a-0000000FG3J-21uT
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 01 Apr 2026 12:53:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=9DOQvg5WrGBgRTNT0tvidwz1X36JlOTmxmoNAM1Eia4=; b=i7eC6FEYJ29dXN1/pcpMKgQqJ7
	vLL2SHtPDLEmp42BDLc9sKh6tKcob5zpuaM3W4VfVGCkNWUQe3v8Mc8pRirF/tA5v1w5rtR3Irtbu
	9QzDj7qIf2ltEI+CN8uDP9VkOgg09H4On8H/OmW+o+XSKIZ6lbX9Ca+PFkFiwGL6oI850eKXvxsyY
	BQvxzVGr8To5vtAgLldqumXNTbyV8Vg+GHGTw7uLJEvtst5iLCNuM/UOr/BDnwxcW7AO9jpP6Pgta
	4JIv3VSjeHyw/S+ctAQhDNvW83mqKlovEJjwkoWcfyvHYSCysbwH/jXULrNfdC5ImoUWWZH5/IO+B
	fr6ocxKA==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7v4X-00000000Od6-29y0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 12:53:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 62D7840678;
	Wed,  1 Apr 2026 12:53:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD7EFC4CEF7;
	Wed,  1 Apr 2026 12:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775047998;
	bh=NhZ9Dfz82FMBwxsljQsgPH0vFz3iOT6rifZERR7g1HQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MWXorNXuAglfn3NULlXkjKj7vf/JQXMQ3KCl6hSs7EAJwYJuuF7sqmVhM5z5mDytd
	 2rm+pbQeFimjMrsRfqUkGXkYxrzWzj6fbpnNU8ogvE0NFnLzJjPUsVZXSZsOGWUEfX
	 spOUEuRumLiBdVX5Bp8J8FUxyDtTHgFcUUKje3xn6OCfNpLHi69uPkpfatrbR+zVVy
	 522l4KSvQ7RuCvwtNo0Xc4dqYnYuER6sm2BsiTOtA8VH/tbBNKebOjg3QM0D9RlUWo
	 V52nT5X1Qva9139XnYn5rjmKSLoDiuKkqHUX9t53zi7zvzXc9RSW+5hQlCQUcXTGMt
	 8Fzc7tWP9kXiQ==
Date: Wed, 1 Apr 2026 13:53:13 +0100
From: Mark Brown <broonie@kernel.org>
To: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, linux-sound@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: mxs-sgtl5000: disable MCLK on error paths of
 mxs_sgtl5000_probe()
Message-ID: <b2ed3765-e19e-4774-8563-120ffb65cddd@sirena.org.uk>
References: <20260401053051.586290-1-lihaoxiang@isrc.iscas.ac.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BDU/dGlo8E/LbM+4"
Content-Disposition: inline
In-Reply-To: <20260401053051.586290-1-lihaoxiang@isrc.iscas.ac.cn>
X-Cookie: "Yo baby yo baby yo."
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_135325_783461_58606A12 
X-CRM114-Status: GOOD (  13.05  )
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


--BDU/dGlo8E/LbM+4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 01, 2026 at 01:30:51PM +0800, Haoxiang Li wrote:
> Call mxs_saif_put_mclk() to disable MCLK on error
> paths of mxs_sgtl5000_probe().

>  	ret = devm_snd_soc_register_card(&pdev->dev, card);
> -	if (ret)
> +	if (ret) {
> +		mxs_saif_put_mclk(0);
>  		return dev_err_probe(&pdev->dev, ret, "snd_soc_register_card failed\n");
> +	}

This fixes the leak here, however it does highlight that there's a
preexisting issue on remove where we disable the MCLK in remove() but
due to the use of devm_ above we're only unregistering the card after
that has returned.

--BDU/dGlo8E/LbM+4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnNFTgACgkQJNaLcl1U
h9DOXQf5AcbwFdz9apvNWirnYcrrWbyKumZoekQOCejHpmc7lXLVRNSu5jhIsr1I
5CGsvQg3lFDMM0hPcFhBQgJ50ifogQKw815Zof+igMFJQhfrEWsb0+H514cnZ2pR
tmZlYoy0cJfJqqhUSLo5Ue263Ba++w9P6f/ekBluPkLKp05dpF1kpJgCsjBPMpv3
lMS7ESfW6rVxCUtEYUkAoj8JT5tMCNPZ3h5/IxVT//mBe8AA3zn8UCxS7LjSgZRq
heEmkFq4jswsf04zdQ0VEqovHpWNUodaMJArBXVdzxnTkNTKurups4WSZxiJwSeY
YRO0sOdFBU9VFjsE2PEgKGJPpEIJkA==
=56IW
-----END PGP SIGNATURE-----

--BDU/dGlo8E/LbM+4--

