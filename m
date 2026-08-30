Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3CE1C61DD9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Aug 2026 13:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LS22ptcNFo5sZr9YXHlbYGbUQrCOIKJRGsTPTX3eVpw=; b=nWBS7tPrVVA4KGRZcP1OVBFyXa
	AhTpJtN0nSdHQyxEGUv2qYcMeUOvy8nJfvIy1xMzPq9/hVcL+E5IrmsfCHAQj9NrlfPSv+y9PidBe
	whgaXgw30WDBHJzYQBYGD1gS6661ypZoKWlzqW0ODESUYLQQ1bReEzTj8AvLUZi5R5d5XwbcGs9fq
	o4O2tMsTTLDtL0/Gwj5BY7Tf24jyAfrGfvVirvxyptTaVI+Z42v1kqLN67Hw30rxhp6oq90wkC+rD
	lb715uDljlGGVLlbHZAXnjANHWh+sRGCuyqiQ0EzggmUPseI9yS1IiLK/0bcSveXMEYy1z/l/nMg4
	D827uh/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0fY2-00000007kn8-3Ntq;
	Sun, 30 Aug 2026 13:26:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0fY1-00000007kmz-1wAn;
	Sun, 30 Aug 2026 13:26:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AB96541E64;
	Sun, 30 Aug 2026 13:26:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12A051F000E9;
	Sun, 30 Aug 2026 13:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788096368;
	bh=LS22ptcNFo5sZr9YXHlbYGbUQrCOIKJRGsTPTX3eVpw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=c6qBpX2SRQxKjoPuaRAZ8pqv+1PCag3f8dyVt2KfnF3Z54+Pz9kIs7QR2ZMWSNDcJ
	 qOJ33x7P/N+rQoGZ0IzZ84Vff7IwHXLEChs4o8c3Hv6kZHdh809gFpYEpHPN5eIhiZ
	 nGfxvrgf65Prec1CUawf426cT7f3lFWkBhOkLaYV5W2erMCmf8rU1NBqYgA/0NMJ9l
	 3nOdvZ287h1BBf4TGV9y4mh3VEitwmzN6nfpLE4aUCgCEixt7N+G7WgbqG2XosNdML
	 BlPBlCY6+rsLdUJ44Yn7AUWGej7JQ1iO+N7o/JU6ODe4O9SpzxQcRQ+mXsDH+pHaFv
	 x9O6K5RMLpIVg==
Date: Sun, 30 Aug 2026 15:26:06 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Vitaliy Sochnev <sochnev.v.74@gmail.com>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [PATCH net 1/4] net: airoha: handle RX_NO_CPU_DSCP interrupt,
 not just RX_DONE
Message-ID: <apQvbk23AHg3w62J@lore-desk>
References: <20260830095717.37218-1-sochnev.v.74@gmail.com>
 <20260830095717.37218-2-sochnev.v.74@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+n1slZj+Qz0Egvm1"
Content-Disposition: inline
In-Reply-To: <20260830095717.37218-2-sochnev.v.74@gmail.com>
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

--+n1slZj+Qz0Egvm1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> The QDMA hardware raises a dedicated interrupt (NO_CPU_DSCP, one bit
> per ring in QDMA_CSR_INT_ENABLE2/3) when an RX ring runs out of free
> CPU descriptors. airoha_qdma_hw_init() already unmasks this interrupt
> for every ring (INT_RX1_MASK()/INT_RX2_MASK() OR it together with the
> RX_DONE bits before writing the enable register), but
> airoha_irq_handler() only ever extracts the RX_DONE bits from the same
> status word - the NO_CPU_DSCP bits are read and acknowledged (cleared)
> along with everything else at the top of the handler, then silently
> dropped.
>=20
> This matters because once a ring is genuinely drained to zero posted
> descriptors, no further RX_DONE interrupt can fire for it: hardware
> has nothing left to receive a frame into, so NAPI is never rescheduled
> and airoha_qdma_fill_rx_queue() (which reposts descriptors) is never
> called again. The ring is stuck until the interface is brought down
> and back up.
>=20
> This is most visible on rings that carry low, bursty volumes of
> protocol control traffic, in particular RX ring 4, to which
> airoha_fe_vip_setup() force-routes ~15 unrelated VIP-classified
> protocols (BOOTP, PPPoE Discovery, ISAKMP, DHCPv6, SIP, LLDP, PPP
> LCP/IPCP/CHAP/PAP/IPv6CP, ...) via PATN_FCPU_EN_MASK, all sharing the
> same RX_DSCP_NUM() default of 16 descriptors. A short burst on that
> ring (e.g. a DHCP lease renewal exchange, or the LCP/IPCP/CHAP/PAP
> negotiation that follows a PPPoE PADO) can drain it faster than the
> CPU reposts descriptors, after which every one of those protocols
> silently stops being received on that device until it is reconfigured
> - with no error, warning, or netdev/ethtool counter indicating why.
>=20
> Fix airoha_irq_handler() to treat NO_CPU_DSCP the same as RX_DONE for
> the purpose of scheduling NAPI: airoha_qdma_rx_process() already calls
> airoha_qdma_fill_rx_queue() unconditionally at the end of every poll,
> even when zero descriptors were reaped, so scheduling NAPI in response
> to NO_CPU_DSCP is sufficient to make an emptied ring recover on its
> own. airoha_qdma_rx_napi_poll() is updated to re-enable the
> NO_CPU_DSCP bit alongside RX_DONE when napi_complete() runs, mirroring
> the existing disable/enable dance so the interrupt isn't left masked
> after its first use.
>=20
> One open question worth flagging explicitly: if the underlying
> no-free-descriptor condition re-latches this bit immediately after the
> ack write (rather than only on the next empty->non-empty transition),
> a ring that airoha_qdma_fill_rx_queue() genuinely cannot repost into
> (e.g. page_pool_dev_alloc_frag() returning NULL under memory pressure)
> would turn this into a self-reasserting interrupt storm on the hard
> IRQ path: mask -> napi_schedule() -> poll reaps 0, refills 0 ->
> napi_complete() -> unmask -> NO_CPU_DSCP fires again immediately. I
> don't have documentation confirming which behavior this bit actually
> has. Regardless of the answer, masking NO_CPU_DSCP until a refill
> actually succeeds - the natural-looking alternative - is worse: a
> fully memory-starved ring can never fire RX_DONE either (nothing was
> posted for hw to complete), so that would leave it permanently dead
> once the memory pressure clears rather than self-healing. A bounded
> storm tied to genuine memory pressure, if that's what this is, seems
> preferable to a ring with no way back either way.

Hi Vitaliy,

I do not have info about it. Adding airoha folks in CC.

>=20
> Fixes: 23290c7bc190 ("net: airoha: Introduce Airoha NPU support")
> Link: https://github.com/openwrt/openwrt/issues/24715
> Signed-off-by: Vitaliy Sochnev <sochnev.v.74@gmail.com>
> ---
>  drivers/net/ethernet/airoha/airoha_eth.c | 28 +++++++++++++++++++-----
>  1 file changed, 23 insertions(+), 5 deletions(-)

thx for working on it. Just a couple of nit inline. Fixing them:

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

>=20
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ether=
net/airoha/airoha_eth.c
> index 64619e9a704d..a3e5aaeb75b3 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> @@ -784,13 +784,15 @@ static int airoha_qdma_rx_napi_poll(struct napi_str=
uct *napi, int budget)
>  		int i, qid =3D q - &qdma->q_rx[0];
>  		int intr_reg =3D qid < RX_DONE_HIGH_OFFSET ? QDMA_INT_REG_IDX1
>  							 : QDMA_INT_REG_IDX2;
> +		u32 bit =3D qid % RX_DONE_HIGH_OFFSET;

nit: what about doing something like:

		u32 irq_id =3D qid % RX_DONE_HIGH_OFFSET;
		u32 intr_mask =3D BIT(irq_id) |
				BIT(irq_id + RX_NO_CPU_DSCP_LOW_OFFSET);

> =20
>  		for (i =3D 0; i < ARRAY_SIZE(qdma->irq_banks); i++) {
>  			if (!(BIT(qid) & RX_IRQ_BANK_PIN_MASK(i)))
>  				continue;
> =20
>  			airoha_qdma_irq_enable(&qdma->irq_banks[i], intr_reg,
> -					       BIT(qid % RX_DONE_HIGH_OFFSET));
> +					       BIT(bit) |
> +					       BIT(bit + RX_NO_CPU_DSCP_LOW_OFFSET));
>  		}
>  	}
> =20
> @@ -1468,16 +1470,32 @@ static irqreturn_t airoha_irq_handler(int irq, vo=
id *dev_instance)
>  	if (!test_bit(DEV_STATE_INITIALIZED, &qdma->eth->state))
>  		return IRQ_NONE;
> =20
> -	rx_intr1 =3D intr[1] & RX_DONE_LOW_INT_MASK;
> +	/* A ring can also raise NO_CPU_DSCP when it runs out of free RX
> +	 * descriptors (e.g. a burst of VIP-classified control traffic
> +	 * forced onto a small ring). Once a ring is fully drained no more
> +	 * RX_DONE interrupts can fire for it, since there are no free
> +	 * descriptors left for hardware to receive into, so without this
> +	 * NAPI is never rescheduled and the ring never gets refilled again.
> +	 * Treat NO_CPU_DSCP the same as RX_DONE for scheduling NAPI:
> +	 * airoha_qdma_rx_process() unconditionally calls
> +	 * airoha_qdma_fill_rx_queue() at the end of every poll, even when
> +	 * zero descriptors were reaped, so this alone is enough to recover
> +	 * the ring.
> +	 */

I guess this comment (AI driven??) should go into the commit message, it se=
ems too
verbose for the code and it is quite obvious what you want to do.

> +	rx_intr1 =3D intr[1] & (RX_DONE_LOW_INT_MASK | RX_NO_CPU_DSCP_LOW_INT_M=
ASK);
>  	if (rx_intr1) {
>  		airoha_qdma_irq_disable(irq_bank, QDMA_INT_REG_IDX1, rx_intr1);
> -		rx_intr_mask |=3D rx_intr1;
> +		rx_intr_mask |=3D (rx_intr1 & RX_DONE_LOW_INT_MASK) |
> +				((rx_intr1 & RX_NO_CPU_DSCP_LOW_INT_MASK) >>
> +				 RX_NO_CPU_DSCP_LOW_OFFSET);

What about defining a macro in airoha_regs.h

#define RX_NO_CPU_DSCP_INT_RX1_MASK(_n) (((_n) & RX_NO_CPU_DSCP_LOW_INT_MAS=
K) >>\
					 RX_NO_CPU_DSCP_LOW_OFFSET)

>  	}
> =20
> -	rx_intr2 =3D intr[2] & RX_DONE_HIGH_INT_MASK;
> +	rx_intr2 =3D intr[2] & (RX_DONE_HIGH_INT_MASK | RX_NO_CPU_DSCP_HIGH_INT=
_MASK);
>  	if (rx_intr2) {
>  		airoha_qdma_irq_disable(irq_bank, QDMA_INT_REG_IDX2, rx_intr2);
> -		rx_intr_mask |=3D (rx_intr2 << 16);
> +		rx_intr_mask |=3D ((rx_intr2 & RX_DONE_HIGH_INT_MASK) |
> +				 ((rx_intr2 & RX_NO_CPU_DSCP_HIGH_INT_MASK) >>
> +				  RX_NO_CPU_DSCP_LOW_OFFSET)) << 16;

I guess here you do not need to shift RX_NO_CPU_DSCP_HIGH_INT_MASK mask sin=
ce
it is already in the range [31:16], just mask like:

	(rx_intr2 & RX_NO_CPU_DSCP_HIGH_INT_MASK)

>  	}
> =20
>  	for (i =3D 0; rx_intr_mask && i < ARRAY_SIZE(qdma->q_rx); i++) {
> --=20
> 2.55.0
>=20

--+n1slZj+Qz0Egvm1
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCapQvbgAKCRA6cBh0uS2t
rGUqAP9IvUwCNsyPGTeoxS+D6eoCsDWK8oOAT/3gFutObN/a2QD/WbrK3un8wViZ
iX/+4HPRROOBsEtzoTLPa//smD9jAQI=
=XH++
-----END PGP SIGNATURE-----

--+n1slZj+Qz0Egvm1--

