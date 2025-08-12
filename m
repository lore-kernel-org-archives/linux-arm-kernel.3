Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89D64CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 01:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lKLrL/vRTKmPzP1dHfBCVayfLMY1Nn/TghmhvHD8P8w=; b=SEy1qJCDzIeAbdziGAmqXJabxF
	ZM/tGDVyBP12/UD9Ixe6OtWMvi8SxaT7eNQbB5g/8QPzlRNTyM+mwgEVIarOT2vyYvue2GmO5uWN5
	6+t5io5uSADf5B5Z2lugJ5B3YiVNTPGdsC1iC6NiI2g7Yo5JTbe4qkg+0WnL/Z/WsVBNRsUkkjEfa
	kqtMfgO7XFkoc812bbBrly34EzdgfD2IL3eI+TOxk6TaddT+2ieteEFOXaNnYE22TannGyQHcz2Fm
	7RRLMmyuD/W4WV8uqgjE0ro+szJ+610x/8QEMa+jO+pXmC1EAEpjdYEO8WfpAk/CdTSN67TXvbTiJ
	kp3IefAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uldTH-00000009UgJ-3yOG;
	Tue, 12 Aug 2025 01:06:35 +0000
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uldQf-00000009UVv-2XsX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 01:03:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1754960626;
	bh=lKLrL/vRTKmPzP1dHfBCVayfLMY1Nn/TghmhvHD8P8w=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Fe158qLE/YdAJDDB6MTuOIzElWxiZNc5P4D3y8QIWwhAHGQQiYEc0pQdoxficA8J/
	 dXZU2Yi4joD0IA4J+llokgoJO2f2ef4ruNq8bf1vijuQhisYvMqjFfjhw+PJ8Z0T6u
	 o2uc+NE5N7VYOg00HwPtDehpFGGLtJW2EaG6tEzO5T/LDU6giwxzL5DQcOUUYWkSg7
	 XLMygZeJWpIQT9AX7vAfVouRBO/nSadOUWHAGu9GSEap2YtY1jyd5SFzEuFuDqndLp
	 j9SoAGiXL6+MDeLN5QkXGJn+DtY0GgTTH9ErJhNWsBofK6tGvebaYuJtdMKsp7Syas
	 E7ab5/rw19WeA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4c1Ctn0rLxz4x6n;
	Tue, 12 Aug 2025 11:03:45 +1000 (AEST)
Date: Tue, 12 Aug 2025 11:03:43 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Arnd Bergmann
 <arnd@arndb.de>
Cc: ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the fsl tree
Message-ID: <20250812110343.6dd82e9f@canb.auug.org.au>
In-Reply-To: <20250723094558.5bcfca69@canb.auug.org.au>
References: <20250723094558.5bcfca69@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/DaDPZBJq=QWB.EGQY09Q2OW";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_180354_024428_932369BF 
X-CRM114-Status: GOOD (  13.23  )
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

--Sig_/DaDPZBJq=QWB.EGQY09Q2OW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Christophe,

On Wed, 23 Jul 2025 09:45:58 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> The following commit is also in the arm-soc tree as a different commit
> (but the same patch):
>=20
>   8b3da0519ae6 ("soc: fsl: qe: convert set_multiple() to returning an int=
eger")
>=20
> This is commit
>=20
>   12702f0c3834 ("soc: fsl: qe: convert set_multiple() to returning an int=
eger")
>=20
> in the arm-soc tree.

Since 8b3da0519ae6 is the only commit in the fsl tree and the
duplication is now causing a conflict due to another commit touching
the same file, you could just reset the fsl tree to v6.17-rc1.

--=20
Cheers,
Stephen Rothwell

--Sig_/DaDPZBJq=QWB.EGQY09Q2OW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiaku8ACgkQAVBC80lX
0GxXWAf9Hohi3miKwerAUjseiUccCgRTs9/q+n5WYDNFtNc6BeWyQi03X6MYREnp
Y8KowA0woFzw1BU4WTYywdflH1mdEakDfpdQpIbAtO+FXp5F+6Wg7UEzKl+EdO4V
mUV0TXkB1gj8Jo2f1ctuC50f4LzGZDqYfnBryRqkmpdszvBcAE8MULchqwYmcrVk
hlO7D+1/nof9BB8YoD6jStxcGvgcn78S1jxUYj1w1871yP8bnxNIM0OanJeubtwV
FhV/ifsPnn/enEtVd/dWKmg9d+Pi+pjbfFU08m0rXIGpsworG4mzGshIoPzDPMQP
uxkGM2Dia3jmWWGLJ45uClrFtYVkOQ==
=cAi3
-----END PGP SIGNATURE-----

--Sig_/DaDPZBJq=QWB.EGQY09Q2OW--

