Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE8CAC71133
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 15:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4JmLbSf+VASk+fKQnsr45aK6BIYi/clB3Lzf96u4x7Q=; b=4n1g3cp0lqi1gd2daPlHgJdOj/
	Yb9iBV5FmCQvZCLWCiY3zbY+Ybkh3gxZJBLJSJZUwzymcAcTrhFkzbRCqR133Snk4/DtsSnJIfPN6
	pzRizyu2JiaLYYejQFTGBhds1jRadmbykiZFoGarL2ZiXnsdDOAw3bfXOyZ4Ze5Pqan1vSrbMwBpn
	TAoH4PUejWRYgG1V7MDgP9WwH36kgJn13yTxOqg4aILIUtCFnEklVqOL/RIMQO3GxVY2N+37ai7JJ
	SAe1zSkYYvLfmG++atMVE7nzx2Lyg0MaTQtQfGuTF3ybdeObJa+DXvFUyltpV9+b0VefV9+zyKIg+
	ZK4UsmPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPNGs-0000000AN8a-1tlP;
	Wed, 11 Jun 2025 15:21:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPK5r-00000009ngv-0pLO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 11:58:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5812E5C464A;
	Wed, 11 Jun 2025 11:55:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB847C4CEEE;
	Wed, 11 Jun 2025 11:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749643089;
	bh=lYYMfAjItLC4fLsRYmM8XcrT+WkhPcmAqDN2A8wwZbM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PkSbiwVOZrbtfaxIHOhfWEaCd5XLI8oDnSHWJ+efp/sjm66ZmiBXgBBRycVgnUSgg
	 Du9hcEbUrAJCDLlE6ExgOHzVQuipmpGs6wQX7EOeMI5peGZUOkv++2keNUsy9/J/0k
	 7hYX+DuBNBhtCy2bHY8Ue9ZZNXRrN4dQE9E8r8cEASMA8gG7z9Fv9YLHi1puy5nzk9
	 wpndB4Zr718xZd8tK5xKbtbJCi84cY1JyV2oQWLAwt68eSxMx3tnnzXZ+NBUJLkqB1
	 GerpGtkII1SPdbOVo/se1l0BOUSa1ZPVrh31rqJEmcHf7Vn119gpLmBB6TAWmpEcfT
	 iPNAzCP6hULGQ==
Date: Wed, 11 Jun 2025 12:58:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: catalin.marinas@arm.com, pcc@google.com, will@kernel.org,
	anshuman.khandual@arm.com, joey.gouly@arm.com,
	yury.khrustalev@arm.com, maz@kernel.org, oliver.upton@linux.dev,
	frederic@kernel.org, akpm@linux-foundation.org, surenb@google.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 6/9] kselftest/arm64/mte: add address tag related
 macro and function
Message-ID: <5e937cf0-3b71-4c17-838e-8b38595c153c@sirena.org.uk>
References: <20250611094107.928457-1-yeoreum.yun@arm.com>
 <20250611094107.928457-7-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0+qKX/eUD8jBDCqq"
Content-Disposition: inline
In-Reply-To: <20250611094107.928457-7-yeoreum.yun@arm.com>
X-Cookie: No skis take rocks like rental skis!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_045811_277205_AC4494C5 
X-CRM114-Status: GOOD (  14.12  )
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


--0+qKX/eUD8jBDCqq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 11, 2025 at 10:41:04AM +0100, Yeoreum Yun wrote:
> Add address tag related macro and function to test MTE_FAR feature.

> +void *mte_insert_atag(void *ptr)
> +{
> +	unsigned char atag;
> +
> +	srandom(time(NULL));
> +	atag =  mtefar_support ? (random() % MT_ATAG_MASK) + 1 : 0;
> +	return (void *)MT_SET_ATAG((unsigned long)ptr, atag);
> +}

Ah, this is where the time.h inclusion came from - it just got split
into the wrong patch.  I would move that srandom() into the main()
function, we don't need to reset the RNG every time we generate a tag
and since time() has a resolution of a second depending on how fast the
machine is we might manage to end up setting exactly the same value for
every tag insertion the program does which would seem to defeat the
point of using a RNG here.

--0+qKX/eUD8jBDCqq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhJb0sACgkQJNaLcl1U
h9A+1wf9FqWnxRE/oTBDa+Oapv2ZOPq4qp6V+BctcWuI4/96XjoZ5VwmFrpEbyfa
oq8IZKJQh3Ab9MTvkzQBUpOQT6L6N1DWrmw9j92d1CZ/cCnsbhlECrthCfaAoxZv
fOp9mgm0d33GXm/LvKOMcwTEddRfA3INrDGPJlOfpU2b8fPJHztzpI656I3zz4n0
2n7EFIT/+o69unP5wgmvOcsD/GDXyJ8Vmaw1zTl8GyEonvvmCWSUt+jbGw2biY+T
KNdztBsKkxHQjUrgn8Aqf+QxEcaAuDwr0FL6+Mowa+wHlkEO9ekxCy6vNMAfjCeA
JWfGBw0pL7uQo3zM+Na3LFCkRoC+Yg==
=w5En
-----END PGP SIGNATURE-----

--0+qKX/eUD8jBDCqq--

