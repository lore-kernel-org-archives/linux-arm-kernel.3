Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B642FF8867
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 10:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mg5dUmVXW70nARKkf3AaQz9TWpOfP9f+A5wXwI/yp2U=; b=hxbwalrICNfqVezhMVaFTys6GI
	RnPcblpsv9wNytYrhTNnKj6csCIUs14Zc1mGMhc7zzy6MVOVIxn54ZY/xZy0cb6NGJKTGtU9WV+jc
	F7sO4irGAj8RlvbFvKkMiwuIylZNrE3H/OOHBz842qBd9JkodjSUB1CJdLPWjZuCTd/p0ZiUASQ2i
	jJcNI2E7EcxjNTk4izT1eGk8JZNpQC+SAOr4B6N1Wa4dwh1rSkKUJABRz6sTVehxPVu0WgKhWVTow
	ON/5Meqrrglorwe4EM4m9Po0KZVkoEPmv/n3d2e5MdR6y3e9PU+i7f5OaNd8MAyCTpXqDP6BS+m8a
	rfpevZaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI2WK-00000003U7G-0B7V;
	Wed, 29 Apr 2026 10:51:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI2WJ-00000003U75-0vif;
	Wed, 29 Apr 2026 10:51:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=mg5dUmVXW70nARKkf3AaQz9TWpOfP9f+A5wXwI/yp2U=; b=TAR3o+fEj1wS019jYhgAZg0QDS
	qQNpxaMRGAhashqWPX4YqR/ept/Eh9pjGuWiA1FodSWYrip3zQOYe92ljF2mz85tv5Vmujju2MOMV
	1tZPizvKW18AOkN4Ba6WmYg1seeI9BpFgLaeByQlFYP5YVB65Ne/caSKfhgx9Kl7xVaoMY21Hxhwh
	SOvU4T5vFIA5ufCf9uxNEXHjeYJB/0Jwkb+8n0sNL79H7vy8C0q4LrxjgSsibfjk2sOhdV+9YeFzM
	Xq7XJuhs2jNf++dxGAYBzbYTMBAfiJKNQPvWp25pBsC35/9V5a1jPWjpt5lBCO0+Gz4jpIaaUwFwD
	tgAKydyg==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI2WF-000000059Zc-41Pw;
	Wed, 29 Apr 2026 10:51:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 54E59419C1;
	Wed, 29 Apr 2026 10:51:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8C21C19425;
	Wed, 29 Apr 2026 10:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777459908;
	bh=IEpJtV+tE48jfZ1d3ouiVAaVu5r4QSmmJlWBgtD8agg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uiprtXmdndHcJSdejaMEvKV0in2eRzc1+pRNt85QLE7SkWJe7ouxHVd7lZ9KnAxmO
	 Eh7sAfUr44un9XK5sY7203C1VDIleWvdAHmHQIFjrL6HyH/PZvVWbmnjqDmEnVNex3
	 cJoI3dKy0FZt3XYI2nHQFWYSRiwX1D+Yvp46PoxIh2pEumGKRUYgGrY+5ec7KZe30n
	 MF50mT4ALtujmNL6a2wSzy0AzkbG6XpPT1ARK68nuVsLhJ9ljKaJQCwyY96me5qSck
	 vuovF+h66qy4dY5MeuVJbIz7dYLdP/AMfcmsP5oaTF1kA8d9D9Gwj9iabkjPxdl57y
	 5xff0CYt/Mddw==
Date: Wed, 29 Apr 2026 12:51:45 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next] net: airoha: Introduce
 airoha_fe_get()/airoha_qdma_get() register read helpers
Message-ID: <afHiwU7QJGd3YPYT@lore-desk>
References: <20260428-airoha_fe_get-airoha_qdma_get-v1-1-6cfbdeb42743@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GpI9ZJHIC4pWk8Uc"
Content-Disposition: inline
In-Reply-To: <20260428-airoha_fe_get-airoha_qdma_get-v1-1-6cfbdeb42743@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_115152_361420_B2AD4E58 
X-CRM114-Status: GOOD (  19.41  )
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


--GpI9ZJHIC4pWk8Uc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Add airoha_fe_get() and airoha_qdma_get() as utility routines for reading
> a masked field from a specified register.
> This is a non-functional refactor, no logical changes are introduced to
> the existing codebase.
>=20
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  drivers/net/ethernet/airoha/airoha_eth.c | 13 ++++---------
>  drivers/net/ethernet/airoha/airoha_eth.h |  4 ++++
>  drivers/net/ethernet/airoha/airoha_ppe.c |  5 ++---
>  3 files changed, 10 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ether=
net/airoha/airoha_eth.c
> index 2bb0a3ff9810..40b7a00c7d95 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> @@ -201,15 +201,13 @@ static void airoha_fe_vip_setup(struct airoha_eth *=
eth)
>  static u32 airoha_fe_get_pse_queue_rsv_pages(struct airoha_eth *eth,
>  					     u32 port, u32 queue)
>  {
> -	u32 val;
> -
>  	airoha_fe_rmw(eth, REG_FE_PSE_QUEUE_CFG_WR,
>  		      PSE_CFG_PORT_ID_MASK | PSE_CFG_QUEUE_ID_MASK,
>  		      FIELD_PREP(PSE_CFG_PORT_ID_MASK, port) |
>  		      FIELD_PREP(PSE_CFG_QUEUE_ID_MASK, queue));
> -	val =3D airoha_fe_rr(eth, REG_FE_PSE_QUEUE_CFG_VAL);
> =20
> -	return FIELD_GET(PSE_CFG_OQ_RSV_MASK, val);
> +	return airoha_fe_get(eth, REG_FE_PSE_QUEUE_CFG_VAL,
> +			     PSE_CFG_OQ_RSV_MASK);
>  }
> =20
>  static void airoha_fe_set_pse_queue_rsv_pages(struct airoha_eth *eth,
> @@ -227,9 +225,7 @@ static void airoha_fe_set_pse_queue_rsv_pages(struct =
airoha_eth *eth,
> =20
>  static u32 airoha_fe_get_pse_all_rsv(struct airoha_eth *eth)
>  {
> -	u32 val =3D airoha_fe_rr(eth, REG_FE_PSE_BUF_SET);
> -
> -	return FIELD_GET(PSE_ALLRSV_MASK, val);
> +	return airoha_fe_get(eth, REG_FE_PSE_BUF_SET, PSE_ALLRSV_MASK);
>  }
> =20
>  static int airoha_fe_set_pse_oq_rsv(struct airoha_eth *eth,
> @@ -247,8 +243,7 @@ static int airoha_fe_set_pse_oq_rsv(struct airoha_eth=
 *eth,
>  		      FIELD_PREP(PSE_ALLRSV_MASK, all_rsv));
> =20
>  	/* modify hthd */
> -	tmp =3D airoha_fe_rr(eth, PSE_FQ_CFG);
> -	fq_limit =3D FIELD_GET(PSE_FQ_LIMIT_MASK, tmp);
> +	fq_limit =3D airoha_fe_get(eth, PSE_FQ_CFG, PSE_FQ_LIMIT_MASK);
>  	tmp =3D fq_limit - all_rsv - 0x20;
>  	airoha_fe_rmw(eth, REG_PSE_SHARE_USED_THD,
>  		      PSE_SHARE_USED_HTHD_MASK,
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ether=
net/airoha/airoha_eth.h
> index e389d2fe3b86..c81433d44e3e 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.h
> +++ b/drivers/net/ethernet/airoha/airoha_eth.h
> @@ -619,6 +619,8 @@ u32 airoha_rmw(void __iomem *base, u32 offset, u32 ma=
sk, u32 val);
>  	airoha_rmw((eth)->fe_regs, (offset), 0, (val))
>  #define airoha_fe_clear(eth, offset, val)			\
>  	airoha_rmw((eth)->fe_regs, (offset), (val), 0)
> +#define airoha_fe_get(eth, offset, mask)			\
> +	FIELD_GET((mask), airoha_fe_rr((eth), (offset)))
> =20
>  #define airoha_qdma_rr(qdma, offset)				\
>  	airoha_rr((qdma)->regs, (offset))
> @@ -630,6 +632,8 @@ u32 airoha_rmw(void __iomem *base, u32 offset, u32 ma=
sk, u32 val);
>  	airoha_rmw((qdma)->regs, (offset), 0, (val))
>  #define airoha_qdma_clear(qdma, offset, val)			\
>  	airoha_rmw((qdma)->regs, (offset), (val), 0)
> +#define airoha_qdma_get(eth, offset, mask)			\
> +	FIELD_GET((mask), airoha_qdma_rr((eth), (offset)))

commenting on Sashiko's report:
https://sashiko.dev/#/patchset/20260428-airoha_fe_get-airoha_qdma_get-v1-1-=
6cfbdeb42743%40kernel.org

- This isn't a bug, but is the first parameter of airoha_qdma_get() supposed
  to be named qdma instead of eth?
  This is correct, I will fix it in v2.

Regards,
Lorenzo


> =20
>  static inline bool airoha_is_lan_gdm_port(struct airoha_gdm_port *port)
>  {
> diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ether=
net/airoha/airoha_ppe.c
> index 5c9dff6bccd1..697af6fdd4c3 100644
> --- a/drivers/net/ethernet/airoha/airoha_ppe.c
> +++ b/drivers/net/ethernet/airoha/airoha_ppe.c
> @@ -80,9 +80,8 @@ bool airoha_ppe_is_enabled(struct airoha_eth *eth, int =
index)
> =20
>  static u32 airoha_ppe_get_timestamp(struct airoha_ppe *ppe)
>  {
> -	u16 timestamp =3D airoha_fe_rr(ppe->eth, REG_FE_FOE_TS);
> -
> -	return FIELD_GET(AIROHA_FOE_IB1_BIND_TIMESTAMP, timestamp);
> +	return airoha_fe_get(ppe->eth, REG_FE_FOE_TS,
> +			     AIROHA_FOE_IB1_BIND_TIMESTAMP);
>  }
> =20
>  void airoha_ppe_set_cpu_port(struct airoha_gdm_port *port, u8 ppe_id, u8=
 fport)
>=20
> ---
> base-commit: 790ead9394860e7d70c5e0e50a35b243e909a618
> change-id: 20260428-airoha_fe_get-airoha_qdma_get-7a087a23aef4
>=20
> Best regards,
> --=20
> Lorenzo Bianconi <lorenzo@kernel.org>
>=20

--GpI9ZJHIC4pWk8Uc
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCafHiwQAKCRA6cBh0uS2t
rGO1AQD9EhkXvmgjx5KZl7StlDhHzDJLBGQgiwWzDQjacOOVNQEAm2A5EKnJ6WOc
bRXSgX1qxX2zmE3c8lyer9r7jQv4gQY=
=oaxY
-----END PGP SIGNATURE-----

--GpI9ZJHIC4pWk8Uc--

