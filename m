Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D894FF8867
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 01:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hgz4Kvd/lusgfwOWNi0PL3tGGgHJFSBCGLNYJ8mTbZs=; b=NF0jk1UebfYBB8IAZI12CMaX8O
	yGbR+DqebcCtC3Y/0gt+gt+Z90q2BV+KSez0OhmM1kf8K3+GCyzWTNUEdPXuReb62MZyEsqRr+xpE
	ozW00ILBMCm7TkNpq7DWrPPFJ1/iMEYyrTN9yDeJ+5S7XlLhmH8J44VJxb9X4029GwbBhS/lz1/z7
	9b1BK2NcNiGay9hMNERkneAcnRrkYjbCAZhbMcOoBRx9/+jaRftcx39vFZVQRCU+kkktx+48LEaLN
	2chE6ZFa3ITXfKpKwsfbGZQd6UJVx2wm1eRbqsREgakdhKpnA0ikRM4YuWkP04MfKRclqqwiutNzi
	OuUvf+yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHX5M-00000000NZg-3lLi;
	Tue, 28 Apr 2026 01:18:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHX5K-00000000NYw-3e94
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 01:17:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3F9E143956;
	Tue, 28 Apr 2026 01:17:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFD92C19425;
	Tue, 28 Apr 2026 01:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777339078;
	bh=lnatxAseg/VlSa/dZ3dHZcsixRi59pi17ZRA4tvWVxA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YwLRdUEuT13Z5jL7BIjjEeSClJ3sTIcvE4jKIG9NbEXFEnlw02xmec+nYT4Axfz39
	 loPRdufJfRkYsuf9qJ+nR8MFDe/4xKMF9YU83zX8BwA4XlSh3b7hhKwhAg87AQkgA4
	 o1y+Ga7DXh4Kb9ueGEeJ6kRy+pMOs8lkCyM4oOnb2+RFSgCRXYcWWdyQfkCNeyRslL
	 IahrJzqajPu+KtsVPBv6FaQw084ZKNeDwSDrL7CXj7LoaY8T5XaObqUh3PtaQLJT1d
	 c9U5JmueIQ8eXOdqUaxyrpOeZXWVz3iNCL3VmK9VNvwUjqsVpjDKlIKqmV9TUNvqxk
	 bwkmwtmtZteyg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id D8FCD1AC5840; Tue, 28 Apr 2026 02:17:54 +0100 (BST)
Date: Tue, 28 Apr 2026 10:17:54 +0900
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Arnd Bergmann <arnd@arndb.de>, Thierry Reding <treding@nvidia.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 2/3] ASoC: pxa2xx: push gpio usage into arch code
Message-ID: <afAKwpgvUjlB6dI2@sirena.co.uk>
References: <20260427144658.3609647-1-arnd@kernel.org>
 <20260427144658.3609647-2-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wVzPYmLerYKR8SAr"
Content-Disposition: inline
In-Reply-To: <20260427144658.3609647-2-arnd@kernel.org>
X-Cookie: Victory uber allies!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_181758_935234_2EE13B19 
X-CRM114-Status: GOOD (  14.83  )
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


--wVzPYmLerYKR8SAr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 27, 2026 at 04:46:30PM +0200, Arnd Bergmann wrote:

> +	if (cpu_is_pxa27x()) {
>  		/* Assert reset using GPIOD_OUT_HIGH, because reset is GPIO_ACTIVE_LOW */
>  		rst_gpio = devm_gpiod_get(&dev->dev, "reset", GPIOD_OUT_HIGH);
> -		if (IS_ERR(rst_gpio)) {
> -			ret = PTR_ERR(rst_gpio);
> -			if (ret == -ENOENT)
> -				reset_gpio = -1;
> -			else if (ret)
> -				return ret;
> -		} else {
> -			reset_gpio = desc_to_gpio(rst_gpio);
> -		}
> -	} else {
> -		if (cpu_is_pxa27x())
> -			reset_gpio = 113;
> -	}
> +		if (IS_ERR(rst_gpio))
> +			rst_gpio = NULL;

Unlikely to actually fire but this now squashes -EPROBE_DEFER - the
earlier code propagated any error other than -ENOENT.

--wVzPYmLerYKR8SAr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnwCsIACgkQJNaLcl1U
h9A7IAf/aqc2tJtiaHuK91LB47kTPzvHdNqZm4yTOohJEFun33G6R2au+wsF60Xw
u41rVQner456C0O/uF6YqM3GizfqBE83UdrZuRiIjOUpZLRx18oSoHHULK6CMOT8
85TZh43RxRKnefG62g7uIFEXb28ep5JEmHw7Pu17XEvC5UcOc81M+ktrD2r5SH+g
2Yg95I3GTPlhUaFeIEGWJ91M2ZhllRkEWEyH1tVvj9h63Zl/C+5l+mLIp+erDVts
3NMJa8iZe8WKn/CBiW22rdGgS7XR6Ghkzxm25hXHXm3qwU7qei2fVN0jswDVF1xk
Bn2PaAB7/nukeR1uLu8Sm+EzV5l/LQ==
=cMgY
-----END PGP SIGNATURE-----

--wVzPYmLerYKR8SAr--

