Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F7EC624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 12:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1XdyeznFhql9EgOoZF6ZIKOla/L9yi5hCmaRt5yqyeU=; b=1y/I4kPYXz9mT4t8IJDoCbsRHT
	4/Uq7K1JzVaed+ueGirHmMorcKfCOcbPp5zSyov7yMnk7HDGJCayzE+QO41ImbRpoDUBZiSGlDmOv
	ukh3g3ymCXLXIT4A0xQ0aJurktrf+LBGq7GfyGNc2rBN1yTTRS04vCqF0+rWVmWf4bZ97EyAPotif
	pjQxdBC/U+J+ZiYR78Ik7oeUadB5GcaNimB1JsE1oC0rZFAp7o9vyMkSsEpQ4MgJzmVuCBuZaS57k
	ccygPYZ8ijhUTGLNuoJktcPKO5L60WDxNSUfWo4iOZksOukCHyCB4vu18EQ3o1M/82dRbhFIKAHJK
	n6YKnk8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x26fK-0000000HJGo-30MG;
	Thu, 03 Sep 2026 12:35:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x26fJ-0000000HJGf-1xVs;
	Thu, 03 Sep 2026 12:35:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C2E0142DB0;
	Thu,  3 Sep 2026 12:35:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29F701F000E9;
	Thu,  3 Sep 2026 12:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788438936;
	bh=1XdyeznFhql9EgOoZF6ZIKOla/L9yi5hCmaRt5yqyeU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mKp5TvjNoeGSv27DDg/j6XMUIt65JwtrMSbNG2SS9Jy1NEivmw3yqT/HHLqPv/8YW
	 v+nBzQ/MugMFCPRU2WkuyxSnx0qsZ8N4nEOHRTCkPZWxk/f/5TEQUJLeV7a/qi0xo8
	 waloM/Y6OlNim4+DDqtiX88n9MDliqjzFZbvywEdMhaKWkdIhaLKBEzpSyerAXZKJr
	 0vx1+nnOpjJJGfZUlLArp+g76nw7e34WwZzbDfH0jsQXt/cQbEuoQZwzqjWLGEvtQV
	 MIBY9ETaoI77bLkikG25WrW8CLajC8RdtBhU2df1sYJUjzxXwL+aRUeNWh28VcqXfY
	 8QZQuhcbl33sQ==
Date: Thu, 3 Sep 2026 14:35:34 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	Madhur Agrawal <madhur.agrawal@airoha.com>
Subject: Re: [PATCH net-next v5] net: airoha: add HW GRO offload support
Message-ID: <aplpllPidmCjhSmA@lore-desk>
References: <20260831-airoha-eth-lro-v5-1-6b0f50401121@kernel.org>
 <fce0ee5a-476a-4867-9dd2-08e55993bd90@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EF3/+5Ej5nc/qA39"
Content-Disposition: inline
In-Reply-To: <fce0ee5a-476a-4867-9dd2-08e55993bd90@redhat.com>
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

--EF3/+5Ej5nc/qA39
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On 8/31/26 8:34 AM, Lorenzo Bianconi wrote:
> > Add hardware GRO offload support to the airoha_eth driver, leveraging
> > the EN7581/AN7583 SoC's 8 dedicated LRO hardware queues mapped to RX
> > queues 24-31. HW GRO offloading does not support Scatter-Gather (SG) so
> > it is required to increase the page_pool allocation order to 2 for RX
> > queues 24-31 (LRO queues).
> > Since HW GRO is configured per-QDMA and shared across all devices using
> > it, HW GRO is mutually exclusive with multiple devices bound to the
> > same QDMA block. Call airoha_update_netdev_features() in
> > airoha_dev_set_qdma() so that NETIF_F_GRO_HW availability is re-evaluat=
ed
> > whenever the QDMA user count changes (device registration and runtime Q=
DMA
> > migration).
> > Set CHECKSUM_PARTIAL with pseudo-header checksum on aggregated packets
> > so that L3-forwarded traffic is correctly handled by the GSO/TSO path
> > on the egress device.
> > The HW does not report the per-segment MSS (msg3[31:16] only reports
> > the max aggregated size), so the gso_size of an aggregated packet is
> > just an approximation computed as DIV_ROUND_UP(data_len, agg_count).
>=20
> What is the <max aggregated size> exactly? I read it as the maximum size
> of the aggregated segments, am I correct?

Hi Paolo,

with "max aggregated size" I refer to the length of the aggregated TCP
packet (composed by multiple segments). This value is reported via
QDMA_DESC_LEN_MASK field in the DMA descriptor. Moreover, the hw reports
the exact number of the aggregated segments via QDMA_ETH_RXMSG_AGG_COUNT_MA=
SK
field.

>=20
> Also any more details on how the aggregation engine works? i.e. can it
> aggregate "random" segment sizes (i.e. 200 - 300 - 400) or does it
> respect HW_GRO layout? (i.e. all segments except the last one must have
> equal size, the can be smaller).

The hw engine, for each LRO queue, is configured with:

- CDM_LRO_AGG_NUM_MASK: max number of segments for each aggregated TCP pack=
et
                        (64 in the current configuration).
- CDM_LRO_AGG_SIZE_MASK: max size of the aggregated TCP packet (composed by
                         multiple segments). 16KB in the current configurat=
ion.
- CDM_LRO_AGG_TIME_MASK: max timeout to compose the aggregated TCP packet.

In order to validate the scenario, I run the following test:

TCP client:
------------
- disable TSO/GSO
- set MSS to 256 bytes (iperf3 -M option)

I can see multiple 310 bytes TCP segments on the wire

TCP server: (where rx-gro-hw is enabled):
-------------------------------------------
- the engine aggregates ~64 segments in a ~16Kbyes TCP packet

  so gso_size ~ 16KB / 64 ~ 256B

I guess this would be the behaviour even if the original packets
have different size (not sure if it is a real use-case).

Regards,
Lorenzo

>=20
> In the 'good' scenario, than by definition gso_size =3D=3D <max aggregated
> size> - <total hdr len>, and you are better off computing the gso_size
> from <max aggregated size>.
>=20
> Otherwise I think we can't call this HW_GRO - even if it would be more
> convenient for the driver.
>=20
> /P
>=20

--EF3/+5Ej5nc/qA39
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaplplgAKCRA6cBh0uS2t
rB0ZAP48zGsaOahQ/7/+9gWRoFOHmwQovjU85XOK+X6Ze2iYSwEA7uS7OT9h3/au
H2hDKAHz6p1VAg1AFLFT0LQdDqVX2gQ=
=gEmT
-----END PGP SIGNATURE-----

--EF3/+5Ej5nc/qA39--

