Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11123CD98DA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 12:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RSxvpTbCusWvzxxh+O+6AIb5tE3WgMP54vCTbFP+AEs=; b=SSYMt4IJOprT0Xcgu/mZZSF3QH
	hmLgSWO16hCNZS9nLIbbvy7jAFIWesV1SMDrhkKCmnbfOBZ2QpN/SXcKI2Teybphsirg7oOWWiz81
	CL5ozIsS5QHwiQUoHr/rUN1GLn9lzw5wdLMXmDbFmtUsXBtuOoRVHH92Dtyj91fbyiGD2Nimi+Ska
	xcADzENF/3MvwSpYcl+nEv5n4p27lINv3tnELQsFZdebfD5x5M6Fky30W1jLmh7Oan8GssSIEAQ6+
	W98FNr6oKRqOGA8I6CZiHIBzsrOJ8SGW5cVq7Vj1A30BVtcVDzuYLvDe+EHiTcgzugs6qOAqsdIFj
	jDsto4qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZTAD-0000000FmoH-0ctC;
	Tue, 16 Jun 2026 12:45:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZTAB-0000000Fmo6-0GWq;
	Tue, 16 Jun 2026 12:45:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 96C564343C;
	Tue, 16 Jun 2026 12:45:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEA611F00A3A;
	Tue, 16 Jun 2026 12:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781613906;
	bh=RSxvpTbCusWvzxxh+O+6AIb5tE3WgMP54vCTbFP+AEs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=J5ySzhETylCMwlWJqWi2xiHpCYAbtxTalJzbQ1tiNxnXEXXmlpUF5s76yDrsFT+Th
	 un+UlxxuV43H3KlRjBS7KXnq2/Tfmq9E0BYvkJAFkT0O9Ox7j1qqiwdDFDV9Jw740T
	 knJ3VMAcrqOIDJj0JU1BgIGuVZ+Q0rnNwOuldLegv0CiqvLjQArC/1Yh0izAiP1296
	 uheO3IjE4eXUngi/GISPMiOliLxR+Wd4VDtTXIPkLwr5hMlTxX2e6c4O9wPnRdtEGN
	 +4oADLKrPsimhEzMF/FByaXU/7CqXjgwBEQXgqGFWUe5oBIcB+uyRmgC3OqTD0yAf8
	 XEfLMicbv1dFw==
Date: Tue, 16 Jun 2026 14:45:04 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Wayen Yan <win847@gmail.com>
Cc: netdev@vger.kernel.org, horms@kernel.org, pabeni@redhat.com,
	kuba@kernel.org, edumazet@google.com, andrew+netdev@lunn.ch,
	angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2] [net] net: airoha: Clean up RX queues in
 airoha_dev_stop
Message-ID: <ajFFUFgsd9KDvdGy@lore-desk>
References: <178161160256.2165161.14322392784449633554@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oUOTYG3fwkRvybn7"
Content-Disposition: inline
In-Reply-To: <178161160256.2165161.14322392784449633554@gmail.com>
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


--oUOTYG3fwkRvybn7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jun 16, Wayen Yan wrote:
> When the last port is stopped, airoha_dev_stop() clears TX queues
> but neglects to clean up RX queues. This can lead to:
> - RX ring buffer descriptors remaining valid after device close
> - Potential DMA synchronization issues on device reopen
> - Risk of use-after-free if pages are freed while DMA is still active
>=20
> Add cleanup loop for RX queues to mirror the TX queue cleanup,
> ensuring symmetric resource management.
>=20
> Fixes: 23020f049327 ("net: airoha: Introduce ethernet support for EN7581 =
SoC")
> Signed-off-by: Wayen Yan <win847@gmail.com>

when you send a new revision:
- please add a note of what you changed with respect to the previous one.
- please give some time to reviewers to take a look to the previous revisio=
n.

> ---
>  drivers/net/ethernet/airoha/airoha_eth.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ether=
net/airoha/airoha_eth.c
> index 31cdb11cd7..9ca5bbf64d 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> @@ -1771,6 +1771,13 @@ static int airoha_dev_stop(struct net_device *dev)
> =20
>  			airoha_qdma_cleanup_tx_queue(&qdma->q_tx[i]);
>  		}
> +
> +		for (i =3D 0; i < ARRAY_SIZE(qdma->q_rx); i++) {
> +			if (!qdma->q_rx[i].ndesc)
> +				continue;
> +
> +			airoha_qdma_cleanup_rx_queue(&qdma->q_rx[i]);
> +		}
>  	}

I do not think this patch is needed since there is no point to remove all t=
he
RX buffers from the hw RX queues stopping the device, this is necessary just
removing the module (I think we can avoid it for TX too, I have a patch for=
 it
I need to post).
Moreover, doing so, when the device is opened again, RX queues will be empt=
y.

Regards,
Lorenzo

> =20
>  	return 0;
> --=20
> 2.51.0
>=20
>=20

--oUOTYG3fwkRvybn7
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCajFFUAAKCRA6cBh0uS2t
rEYHAQCdVSubIzZ2cVft7kjoGjr/zu7URV9JU3sxY5jp8tVr4QEA7hR72xCrHK/G
RBtj7gTHqoSlUgRBVIgKNfP494jhvAU=
=a8N+
-----END PGP SIGNATURE-----

--oUOTYG3fwkRvybn7--

