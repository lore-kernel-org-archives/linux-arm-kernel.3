Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BBC3C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 09:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PdC6VAzrMyH8O2VveH3lYcAbaxYezDUcJBl9fDQ8Dv4=; b=MZ8U89HSmnUMZQdydkFUGEvYab
	rJHmxeS/NX+SeEmLRqKfsYPQOJ9sriLwV28AaOEi6NxL8BsOaAanQz+cFO1rxeBd6YkqrUOYWJujw
	mOoxl8iDsGhiy8RFSCiW1+m0cI/A9P19gPBnMh4MAbTN/VQG4YwS1zVdLda72oLP9ueNIJjOiXBSx
	KN0Kxn8rYr3CFg1/kY+TDozyinyNWpaJ0X50vp7h99gY18CKZUYxuYMT63fklF9Mv92FXjK8E7i8q
	mVZF9K8JYC/JiRIYNkXXDB1pkOqOydkblcJQmVoI/gnm4RYO3XDEjZ05VT6+e4xGMWYdu8E+UZWtw
	yHqZCxeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trZo3-000000029fM-29fn;
	Mon, 10 Mar 2025 09:52:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trZXY-000000026KR-2SZd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 09:35:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B04E75C53B6;
	Mon, 10 Mar 2025 09:32:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19B0AC4CEEC;
	Mon, 10 Mar 2025 09:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741599315;
	bh=PdC6VAzrMyH8O2VveH3lYcAbaxYezDUcJBl9fDQ8Dv4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ISdDCx5vZ2wsLplSu5yq2lU/hgfCUFTCUX9lm8nWppg61P0zsWqtKtduRwM65jj/P
	 QLS1smHqaPQodqDwLnvoCzmFwB2GmGrzVIpWa2G9yQi8gwSXe2AmicJVT/vnspfNjf
	 AkFVpj+JLrz09tCyWpnUhDjbGnMl6aojwuQT68vv78iYVcncrehPTMfE7pW4fbKja9
	 FO8ahUp7bk4A1DJDIeBq/3yK4T4dxW8tWK5n4XLfyVQJoEwtQ9HSG+TdMfQrJSAlK6
	 7vSNo5Q+sLEIIkrFE0yctMsleC2YnAilktzdg7eNrKOCfNYh+rAa8DdpzAUbfXHqei
	 v0YBSMYIPBIgg==
Date: Mon, 10 Mar 2025 18:35:11 +0900
From: William Breathitt Gray <wbg@kernel.org>
To: =?iso-8859-1?B?Q3Pza+Fz?= Bence <csokas.bence@prolan.hu>
Cc: Kamel Bouhara <kamel.bouhara@bootlin.com>, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] counter: microchip-tcb-capture: Add support for RC
 Compare
Message-ID: <Z86yT0WoGbX7JXND@ishi>
References: <20250306-introduce-compare-component-v1-0-93993b3dca9c@kernel.org>
 <20250306-introduce-compare-component-v1-2-93993b3dca9c@kernel.org>
 <790f00da-d66e-42bc-bae2-339144fbec95@prolan.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="m0vFrlOyE6rOUs9t"
Content-Disposition: inline
In-Reply-To: <790f00da-d66e-42bc-bae2-339144fbec95@prolan.hu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_023516_679595_5DAB9DB5 
X-CRM114-Status: GOOD (  14.69  )
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


--m0vFrlOyE6rOUs9t
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 10, 2025 at 09:38:13AM +0100, Cs=F3k=E1s Bence wrote:
> Hi,
>=20
> On 2025. 03. 06. 8:05, William Breathitt Gray wrote:
> > In Capture mode, the RC register serves as a compare register for the
> > Timer Counter Channel. When a the Counter Value reaches the RC value, a
> > RC Compare event occurs (COUNTER_EVENT_THRESHOLD). This patch exposes
> > the RC register to userspace as the 'compare' Count extension, thus
> > allowing users to configure the threshold condition for these events.
> >=20
> > Signed-off-by: William Breathitt Gray <wbg@kernel.org>
>=20
> I'm assuming you'll merge it with my capture extensions patch. Will this
> `compare` extension be carried over to 104-quad-8 as well? Otherwise:
>=20
> Acked-by: Bence Cs=F3k=E1s <csokas.bence@prolan.hu>
>=20
> Bence

Thank you for the Ack, I've merged this series now and pushed it to
counter-next.

The compare functionality is already exposed through the `preset`
component in the 104-quad-8 module, so I decided not to add a `compare`
because it felt redundant. However, I'm certain `compare` will be useful
in future drivers so that's why I want to get it merged with the rest of
the microchip-tcb-capture changes. :-)

Best regards,

William Breathitt Gray

--m0vFrlOyE6rOUs9t
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCZ86yTwAKCRC1SFbKvhIj
KwWFAQCm5z3VyBDI0W1smBY+8YBSQ+c+bQHoNJ4rM5X3X4wq8gD/bAlld1d1zpIT
5aOtYyixrV+cI01SKHuAhr8txzb7nwg=
=q8uA
-----END PGP SIGNATURE-----

--m0vFrlOyE6rOUs9t--

