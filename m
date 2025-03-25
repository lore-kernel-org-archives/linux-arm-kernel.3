Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3531EC3600B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 16:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8envqdz1HzVBk/AC7bUCztFD3Rt0l4ml1ELc4W8/Jns=; b=oHwquZBLwQSm483dZibMQYUbFu
	XWmHF1FdIAqIZvgO1Lp8yv7tf86lUyV4Fcey3GRuOyyvEKUqIawW7iMoPttGcNKXjodWb9nhV2DpI
	SvlRDhvxobGceCEUByh5ScdSDB+2nwT98FMLaCu08kgUZDoFvSO3BX8r8f8/BPoh+9h724/lGo/X+
	ntS/eFnr/st0cAHLLWOAbY2ck2RF97hYPzVbjZPdclkRckxkiRS/exE968OR728Dd5Lxm6X4nlKhW
	zSoC42xR8AW7ydNFUFBPwKMSuyEncGFG1rHIzRoF3bmn0dYwSjF/s7X4fwY2jtTYPwNjcWTHovYSs
	9kz0wkkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx7An-00000006UV0-3ENr;
	Tue, 25 Mar 2025 16:30:41 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx74h-00000006TRa-0UYT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 16:24:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=8env
	qdz1HzVBk/AC7bUCztFD3Rt0l4ml1ELc4W8/Jns=; b=PJ1V+p7+M71shBjhIjt3
	gvk6z4VFbYRotNfxRcfpM49VJnSiB0qcvt8vK89F+fB90LKfePxM06ikYlkxpqtX
	8PpuOaOucRD+djwr0Tw2yfwkmLpVXK43fjG8rp2QYxOwEInd6g7cRjfhcSLLtcCj
	UNn1NZs+z99dTQPPm2VxYWn4uZ3i/N0OOLen2RlKDozNtG4+GjNJBpWkdJkcZuxm
	//XmVEthnluyJr1vE4ct/Oi6pp+UoqVdqE8Yz/pp4rWh0aYEaeB2YNpEjhUjWZBF
	kcjaTfcFILXcJqZvQvzISS/IJe89z9agkfsU62YthF/d/fdZtZLQlF8wbTGFadBT
	eg==
Received: (qmail 3150851 invoked from network); 25 Mar 2025 17:24:13 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Mar 2025 17:24:13 +0100
X-UD-Smtp-Session: l3s3148p1@AZ28Ji0x7usujnsv
Date: Tue, 25 Mar 2025 17:24:13 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: thierry.bultel@linatsea.fr, linux-renesas-soc@vger.kernel.org,
	geert@linux-m68k.org, paul.barker.ct@bp.renesas.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 13/13] arm64: defconfig: Enable Renesas RZ/T2H serial
 SCI
Message-ID: <Z-LYrS3g-A17yQF3@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	thierry.bultel@linatsea.fr, linux-renesas-soc@vger.kernel.org,
	geert@linux-m68k.org, paul.barker.ct@bp.renesas.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250325160904.2688858-1-thierry.bultel.yh@bp.renesas.com>
 <20250325160904.2688858-14-thierry.bultel.yh@bp.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2sIjaC3kYYWGMAIO"
Content-Disposition: inline
In-Reply-To: <20250325160904.2688858-14-thierry.bultel.yh@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_092424_033512_95DE322B 
X-CRM114-Status: UNSURE (   8.15  )
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


--2sIjaC3kYYWGMAIO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 25, 2025 at 05:09:01PM +0100, Thierry Bultel wrote:
> Selects RZ/T2H (aka r9a09g077) SCI (serial) specific code.
>=20
> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--2sIjaC3kYYWGMAIO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfi2K0ACgkQFA3kzBSg
KbaTKw//a/WIeIycQC7xEn8lZeof/blj3eX+KR73rn+D3gNXu/Qh/EP7NDp/XqKS
GaLQn4I+/OpfTOjLJEkLICKcqTKuPviZCTYFUOFFgDULxCpHPuOY5kNSEWjrbWCY
qdVf11KDV+UbugjuZZRqbxl5Y+Chz4rmcQVCvMhrWDy6hAO3+BCsnBwZgJTtV7Ze
GT6fzQbuqVcn97SI9miknopovSU0NQjP4JhRtyVh8/+RALA08Mq0Vqk5eVB29AI8
XabGA8w3PKQMrFMGxV+NIjJ0sNTByg/YioMehqvuuXICcgYGk7hE1gB1c2jQwmLU
mppJGFtMFLyL4sadWTYr4WhAcHTRTSVlHtaKzDh62EmVT3TQdxJcQLPnx60GjB+9
sgOJCvfa9KLNcO17/s1GU2o1i6gj8CqWN6LJ6UgMxR3pFakReiczPMc5Bsznwxzz
YURAqQCKgIrepcN+00hclxyspZxh7gM6GuQ6HVCvLCHTKLD0MbTHUj8TPlAKcjlB
BFYnh570b3w3bRL4ju79Eg1QmD7fFPrePBn5+caekYaMDaVnEKxcIp0N7bsu39no
11T9b9t/eOBixKYmGJvhTqtpX8DZl43OWMw2PnZZO5P4oy47HqqnrE/SRkOmJ1M1
EUhhldymmmxpC5XCR/FqOrpsk103tozwD4VIL0N2q5lHfrvqEEM=
=6Lzt
-----END PGP SIGNATURE-----

--2sIjaC3kYYWGMAIO--

