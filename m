Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E5FCFF8875
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 12:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lH+FrJC5yksycqXKbOJVUeSWjjdzfqXuQg3/+D4zcTs=; b=4mmEBz0HxapXX6zx+GmZcQL/yA
	WOuPpnDLBNitlT04RkM9sBTV6B6MUUiAfXSFuSDD2A8HSxgIesm247WdPcq7ouBgIb4Kdh+oOEnnA
	CCxO9DMn8dyAgaY9Rn2biDQ6hVH004BQH0uIhIM89BDRZKRv9ADh7Z+5Oc62uxYoM2WHC2Qo6o6mn
	g7eNBY+3VN69dg3TmrT0HmXshNzIM3ZL97HMzZqxZBzGJMsNkPUtmZICbOoJwgk1Lx6RSBuBlOr7T
	isXJrw290WgSnHo39JlaIm0nGsJGCPGo0YyNPAuBBPxHZTmvpsEpktF46p9+GEf8EaCUEeA7u5QAt
	ZOQ9swmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIQQj-00000005S6T-2Mjd;
	Thu, 30 Apr 2026 12:23:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIQQf-00000005S5I-3TYe;
	Thu, 30 Apr 2026 12:23:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E330060180;
	Thu, 30 Apr 2026 12:23:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43559C2BCB3;
	Thu, 30 Apr 2026 12:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777551820;
	bh=9jQIOHWUDbMyaXsyCpKYu6cCyujvTULfSz7FqVfVXpo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=op3A97ZYlW6JY6JQn8rr8FitB+pkyBEB5XAYYJ1VBsPS+Ucif55Q7M7+nk90YpF8l
	 wOcbnvwdSLgrwvZNEm9VQ/O3oro/dCpOrwlbmH3VqDUhGaMRbBS9eRfvARrM58FZ80
	 XqUaUMPrhUwFdiqNEERTkjWcabRq/D/vATMHBVTpNUdr4GZ5um4t87Lkj4srrLzur5
	 bXqGQjfVpo3EX56RpxhGDEYap4paRAUwxLtT1AK7YQltAkdDo5h0qGp3ENDy0To9Q/
	 KcL/ZKvRhbWLl3lohwP1+X4Bte6tnCmBc6/IOaKdZuVkEhSUUj7F8AznLEbr2L1BWc
	 sMhn0F75dBajA==
Date: Thu, 30 Apr 2026 14:23:38 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Jacob Keller <jacob.e.keller@intel.com>
Cc: Simon Horman <horms@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net v2] net: airoha: Move entries to queue head in case
 of DMA mapping failure in airoha_dev_xmit()
Message-ID: <afNJyrJKz-tPP3VP@lore-desk>
References: <20260429-airoha-xmit-unmap-error-path-v2-1-32e43b7c6d25@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xt+h5H/7PrMUntb6"
Content-Disposition: inline
In-Reply-To: <20260429-airoha-xmit-unmap-error-path-v2-1-32e43b7c6d25@kernel.org>
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


--xt+h5H/7PrMUntb6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> In order to respect the original descriptor order and avoid any
> potential IOMMU fault or memory corruption, move pending queue entries
> to the head of hw queue tx_list if the DMA mapping of current inflight
> packet fails in airoha_dev_xmit routine.
>=20
> Fixes: 3f47e67dff1f7 ("net: airoha: Add the capability to consume out-of-=
order DMA tx descriptors")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
> Changes in v2:
> - Remove leftover airoha_queue_entry initialization inside the loop from
>   the previous version.
> - Link to v1: https://lore.kernel.org/r/20260428-airoha-xmit-unmap-error-=
path-v1-1-aec44c6765c1@kernel.org
> ---
>  drivers/net/ethernet/airoha/airoha_eth.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ether=
net/airoha/airoha_eth.c
> index 5effb4a4ae84..fb4f51d67dd7 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> @@ -2123,14 +2123,12 @@ static netdev_tx_t airoha_dev_xmit(struct sk_buff=
 *skb,
>  	return NETDEV_TX_OK;
> =20
>  error_unmap:
> -	while (!list_empty(&tx_list)) {
> -		e =3D list_first_entry(&tx_list, struct airoha_queue_entry,
> -				     list);
> +	list_for_each_entry(e, &tx_list, list) {
>  		dma_unmap_single(dev->dev.parent, e->dma_addr, e->dma_len,
>  				 DMA_TO_DEVICE);
>  		e->dma_addr =3D 0;
> -		list_move_tail(&e->list, &q->tx_list);
>  	}
> +	list_splice(&tx_list, &q->tx_list);
> =20
>  	spin_unlock_bh(&q->lock);
>  error:

commenting on Sashiko's reported issues:
https://sashiko.dev/#/patchset/20260429-airoha-xmit-unmap-error-path-v2-1-3=
2e43b7c6d25%40kernel.org

- Should the driver be updated to use skb_frag_dma_map() for mapping the SKB
  fragments, and correspondingly use dma_unmap_page() for those fragments in
  this error handling path?
  As we already pointed out here [0], we decided to skip this request and k=
eep
  using dma_map_single() even for skb fragments.

Regards,
Lorenzo

[0] https://lore.kernel.org/netdev/20260427173935.6a1e36ee@kernel.org/

>=20
> ---
> base-commit: 0c7a5ba011d336df4fcd1f667fcc16ea5549be12
> change-id: 20260428-airoha-xmit-unmap-error-path-8125594efb23
>=20
> Best regards,
> --=20
> Lorenzo Bianconi <lorenzo@kernel.org>
>=20

--xt+h5H/7PrMUntb6
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCafNJygAKCRA6cBh0uS2t
rNgvAQDcio7RfE8FHhr52yeau67/5vWcdnxcizu8/yAGQVnyXwD8Caa7RJoxjVnP
Khmg846cqMbyJY1xeHJAYGO5dF2CqAI=
=38rW
-----END PGP SIGNATURE-----

--xt+h5H/7PrMUntb6--

