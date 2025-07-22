Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74176C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 23:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JxNIUZNxJi5qlKN93dLziW8I6ljlPVV4y5DEy4ploQQ=; b=PXuhVjID1H0b3rGttdADN9jq5c
	VVU8nOnB2BegHYnsgacZ8lEUKrfj+tGDvach/qAueyO7iGdBpe2UCpOz9Cf9ro6AaZWlXq5zoy3tt
	HB8G5aZUxPRVAtTPFrg8AcL4XFSJ9RywzabhVd0TJ8aSbAF/VlAS209XoEo8w1G9S1QSsFW+OV1ph
	JK4gd8/RSMgDIhC0t489E0D/IrNlfdQ3uxu/7OrgfcRKG2OCu4XI5Ts69MdBEHaP0jLtxIIwgvrIb
	uNgSY4EYYWEsSH8VcEYAcnCDzb0Nxo/9EwHYoYjyIr8PgQyb7WfeN4Kp3ePrX6bk1reXd9B59lqjW
	Ca0wJUww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueM5s-00000003eSk-2VY8;
	Tue, 22 Jul 2025 23:08:20 +0000
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueM3M-00000003e5t-1lAh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 23:05:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1753225379;
	bh=JxNIUZNxJi5qlKN93dLziW8I6ljlPVV4y5DEy4ploQQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=g2Qwx4+Fo8MOWubxPkSUCe4uejPOG6jfeJj0TKRxIjjrWbJXOBbm41z3mXfAS90Hd
	 oPSad9BqZKkaC2zS3FyW2uzgzhX196q6J4jU64T8YKyfp1qdjYXfpgem37TI7QuBSX
	 JOQ384Mm7a9to2MCUGt+hQZDszG8l3yl/IR6W5ubBylteWBNouOXi7/eMFEi0neIIN
	 EMCqrxc/xYarRx5wWWUPLMEwFhNuuNKwo9OwkgsGY2gLgXSmoIMmHBc8WaNl3/TfRJ
	 q15oZXkTz9c7fIO2XaMa1MKZ6ovs++OaYCrteFkCFSeltkuw3kBGsSEWImqYNOTQg2
	 ETV/7Qotg4/8A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bmt8g1jWLz4w2R;
	Wed, 23 Jul 2025 09:02:58 +1000 (AEST)
Date: Wed, 23 Jul 2025 09:05:41 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Wei Xu <xuwei5@hisilicon.com>
Cc: <linux-next@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: Add the hisilicon branch to linux-next
Message-ID: <20250723090541.5652a182@canb.auug.org.au>
In-Reply-To: <687F7586.9040302@hisilicon.com>
References: <687F7586.9040302@hisilicon.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/g7xmY+KOIpqpxv_vI22_5P3";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_160544_815203_CF2C3167 
X-CRM114-Status: GOOD (  16.10  )
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

--Sig_/g7xmY+KOIpqpxv_vI22_5P3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Wei,

On Tue, 22 Jul 2025 19:27:02 +0800 Wei Xu <xuwei5@hisilicon.com> wrote:
>
> Could you please add the following to linux-next?
>=20
>    Repo: https://github.com/hisilicon/linux-hisi.git
>    Branch: for-next
>=20
> This aligns with the MAINTAINERS for the HiSilicon tree.
> Thanks!

Added from today.

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.=20

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and=20
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--=20
Cheers,
Stephen Rothwell=20
sfr@canb.auug.org.au

--Sig_/g7xmY+KOIpqpxv_vI22_5P3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiAGUUACgkQAVBC80lX
0GwmSQf+PnHWc3pRsQ5yggv5+B7VDHQfccUSW1vL9KuXWVTP7Sk9ku4+n+Wg9P5A
jRkcbcSlctXmJK4bbBnE0t7de/7ZdZp+zTUTU6hEshelNQ/+FNGqnoBe43F1cpXf
H2rlv51mb7CW9YTAqiik1cOiZ3KhqtrVE+8Mh3vbVAanSKh2F4jfYpfz5k24dSPI
H8F70WjCjJJ4QVxI2Q1LFWAkM3nELvklAqOv8ISS/LvSKAC2oVsFrPQYjhMDYBQk
dnVdP0dLfOgUyW0xU7k68N7cn54N7s28fcvqRt4LZqIMBESnrn3cQmYSlrTUI16G
it6X6JwybXtA4R7fTMitVnfb5IsVWQ==
=bxDj
-----END PGP SIGNATURE-----

--Sig_/g7xmY+KOIpqpxv_vI22_5P3--

