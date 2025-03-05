Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80CEFC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 13:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yTpT/u9tOJzbuDrIadcgJIx+4mrWB9CtBxj4SvKyNVY=; b=dxTrN3Wpjs2CIPMyDsOG18bM8t
	91m28+HPNsXtaIghXmlT60MtqxS7EO40WKa22p5q0In+ING11Hes4hvDN99DVwUdKz62zKZQhpACY
	xhfgNWSfLRiahth2qzc3Nwr+Y6ZtzwbMtEIOzRouKsY6xKzqvebcyVSax6VGxGt+GB9t8/AvAQO4E
	fHiJKMZGvDh8SjR2x/Mpqv+k3rWnmQzT6w8xc9pcw2jyEyU5JW6O5l0QmFnCzmozZMd0/PEVC+8ur
	3zVpMJkYtCU7i5w/33s6rXrlJCfS8PnPtkHvNS7Q75eAFV8tkOiNEgsrYSuGgXAoM9WZt7xHJ9sj9
	Go+/IF2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpoPU-000000086l8-2WN2;
	Wed, 05 Mar 2025 13:03:40 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpmW4-00000007n1p-1Sv1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 11:02:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B63F5A4553F;
	Wed,  5 Mar 2025 10:56:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43DB4C4CEE8;
	Wed,  5 Mar 2025 11:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741172539;
	bh=yTpT/u9tOJzbuDrIadcgJIx+4mrWB9CtBxj4SvKyNVY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KxtHUvNhQeoGIAQx62mLp1ON9SskQGRYRGf+ejfCPoQ3Y2s9L3dc2OBP6vcFOXXgx
	 pFwpLVhkPhWYWX9jCff69oXdzxx7Okvcdmv9iqrr0L2g8YWKm0E0P8K/68X+gUhPAG
	 5nCax0DIjz+w0yQpABLStA3AJ1T2hLmZx3VCk4eSeQah8YcBHFU32sFXST0sAw9JCy
	 AyI+3GXHX4wEYJQiSW/ZvHqITHjATYfGIxqg004eEqAxr40qUDjxo1ICG2j7BOfxR1
	 A4CT8lRjhjs+YUhrvZq+3r85Cfl5/zIFm+vixipZYY18eBUbuJe1WwMWIDLQCOUY/d
	 wVjSvqv34jxtA==
Date: Wed, 5 Mar 2025 20:02:15 +0900
From: William Breathitt Gray <wbg@kernel.org>
To: =?iso-8859-1?B?Q3Pza+Fz?= Bence <csokas.bence@prolan.hu>
Cc: Kamel Bouhara <kamel.bouhara@bootlin.com>,
	linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] counter: microchip-tcb-capture: Fix undefined counter
 channel state on probe
Message-ID: <Z8gvN1CvcSV8nfVP@ishi>
References: <20250305-preset-capture-mode-microchip-tcb-capture-v1-1-632c95c6421e@kernel.org>
 <93ce1511-53f6-42a3-b1a5-b6732105e87d@prolan.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pFddjXJg41wFrn79"
Content-Disposition: inline
In-Reply-To: <93ce1511-53f6-42a3-b1a5-b6732105e87d@prolan.hu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_030220_450233_106ED033 
X-CRM114-Status: GOOD (  12.86  )
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


--pFddjXJg41wFrn79
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 05, 2025 at 11:50:27AM +0100, Cs=F3k=E1s Bence wrote:
> This duplicates a lot of `mchp_tc_count_function_write()`. I'd much rather
> have this code in a separate function called something like
> `mchp_tc_setup_channels()`, that, depending on `priv->qdec_mode`, sets up
> the BMR, CCR and CMRs, and then have both probe() and function_write() ca=
ll
> it. Or alternatively, have probe() call function_write() at the end, but
> that's not as nice.

Hi Bence,

I agree, the mchp_tc_count_function_write() could be cleaned up and
divided into separate functions dedicated to configuring each mode
(perhaps regmap_update_bits() could be leveraged too), but that would be
a much more invasive update. For the sake of making backporting easy to
address this particular issue, I've kept the changes here localized to
just the probe() function. Once the fix is merged, someone can try
tackling a more proper refactor of the mchp_tc_count_function_write()
code.

William Breathitt Gray

--pFddjXJg41wFrn79
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCZ8gvNwAKCRC1SFbKvhIj
K0q6AQCykzFD3ZbJXRdRLZExpEPQHYVKRM2NITaUgXmy4R80pQD/fjGX1DSzN4Z0
gFKcYKH+sV0KGDTjDpoqS0rFmXIJjw0=
=sVWK
-----END PGP SIGNATURE-----

--pFddjXJg41wFrn79--

