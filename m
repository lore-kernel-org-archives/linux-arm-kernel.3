Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 187DCC36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 17:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cAwFFUfKFN9OSJ4UGurTOyDpV7qsMZYsDRtosdCidE4=; b=ZoCQjVkehq61ariRDb15Lfijaz
	tJbShzViWpnxqbLAVmOTq97B99aAPmyfQPsL/jiAKkNLDieKFn81CW9mxD4AY/NNHGaTQzRwgaLTC
	4Rj/64M3lvRWKuEENGUrP6w07M+Q+zu4smiMD/kp+qMZMsEyj/ChGgIFi2bYzGSDqv6QkYVUPcmI/
	xY5kKRKMEhrLs85oRdzmUj5mgqRvfw9en7TFM7H0ZJgpa/5wH0K8JKHZ4/oz4trAWkqSkZuBlBNvJ
	hjyxmdkWBUZdT/y2cHUGfUOSwgY26xHNvlcG/FuIJHUKNv0Ryv0LbeL3csGPA6IEcHsi3g2spa7Sg
	JFApEpjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2ZKC-000000083fh-0RQX;
	Wed, 09 Apr 2025 17:34:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2ZHY-000000083M2-3pkY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 17:32:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 096795C2635;
	Wed,  9 Apr 2025 17:29:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A50BC4CEE2;
	Wed,  9 Apr 2025 17:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744219931;
	bh=CJfNldk7riGW7qvaL/6GoeDx0jI4W+dG3suAYMdrzPc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jr8iDijxNl0BjjNZr7ATN3ByX0QV2SjhK2iZo8VOUT76KYdj/bN6R7FSfm7pEgv2K
	 bCLLeptGqMw8GCttvWFWXnIKxQwXKUhDLZDwWk4e3PlncfhakCR634J858RGJWqxvo
	 ALpHzBIQdSoOgnELt7RIHvtxnPn2Wp52FW2I6SOycAlNGbHXMZJGfh3n7n1r84UPBD
	 VHQW7KezTgfpfOQBoaNZb4d6X1lPHD3k6iFDPykUs6Mf8VNEwAyZlKpH096gB6LwQX
	 J2cqWZZFlKnKaK2zQipPWpcLLB6Sgu+H5WNbFrm7nPkqufsszLCd8uK5MRvSwjr+O+
	 ls18y0yMNxw2Q==
Date: Wed, 9 Apr 2025 18:32:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, ardb@kernel.org,
	catalin.marinas@arm.com, maz@kernel.org, will@kernel.org
Subject: Re: [PATCH v2 02/13] arm64/fpsimd: Remove unused
 fpsimd_force_sync_to_sve()
Message-ID: <7879a7a9-8f47-42c1-84d1-501d2cd00aec@sirena.org.uk>
References: <20250409164010.3480271-1-mark.rutland@arm.com>
 <20250409164010.3480271-3-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="egkjX1OH0k+GrhvU"
Content-Disposition: inline
In-Reply-To: <20250409164010.3480271-3-mark.rutland@arm.com>
X-Cookie: Words must be weighed, not counted.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_103213_004719_FAA3F5D3 
X-CRM114-Status: UNSURE (   9.16  )
X-CRM114-Notice: Please train this message.
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


--egkjX1OH0k+GrhvU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 09, 2025 at 05:39:59PM +0100, Mark Rutland wrote:
> There have been no users of fpsimd_force_sync_to_sve() since commit:
>=20
>   bbc6172eefdb276b ("arm64/fpsimd: SME no longer requires SVE register st=
ate")
>=20
> Remove fpsimd_force_sync_to_sve().

Reviewed-by: Mark Brown <broonie@kernel.org>

--egkjX1OH0k+GrhvU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmf2rxYACgkQJNaLcl1U
h9DCBQf9E9eg3Aq2iCyax1grth7ufaPelsVKd5/Gu4GDnTNsHbgTVoRgu5fne7de
7E632CPy35IoWZ6+ZEYGIduU7yLJPAbiAsSqW6efKo58Q77/kaef/liyfqIlacU3
9M6bHCF75pWY46U3IU7o/IGWq1LoX/+u6KVq0mrd+AK+S4fH/UQqF6RpDYQzK/1y
6IuFH4QpFheKMhwKoXyK1LlBalBQxiq0AAyKjhj2TZYLMv1K9vI3ua9AXppyWOt0
yy1mArzkgJzXe15h4vAQj/zuiO77FpgLoNAi+31kUmEIXkUq4LFz/jsaLrvUf99h
/UP2Nl9fx9Ndzbog00oVAukjqjFdSg==
=tJd+
-----END PGP SIGNATURE-----

--egkjX1OH0k+GrhvU--

