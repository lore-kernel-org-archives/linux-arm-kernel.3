Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DE68F8E4AD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 06:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L7W2NwOmQcYn12AhW02hBSPgw/7vFq3UW/cSZw6RXNA=; b=ZrUSkiPE0GtielBe7YT3VzoVxh
	TZN98AJadwLRkwZ8qTnyQfwnrQmFYQ/hLp/xS16zY+4fSS1hX3MvAD0HeeQQI333zpWNag6gnRn9d
	TwV2WmuCHV+0lhgmFs+AMHPbps147Mp/ZBCl/eGvSv8kk8u5zhff+iZVYPSiuxHMUIHzWoYRn33nz
	/37ZTG7cul198Ih0Q7AY91xWkmqbcb/HLqj4oI8+Y7gAnmwGSLBZj2ceuEizKygFjoeC6VfrVgkNM
	4YRBwJ2QgytycV8wJmSlPV86GsO3AnyMkUG+5rSCuR4czHxmjVpj+Xt9AL3hXkyTtUZlAGCNuFxYx
	Mve2+PPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDcfH-00000003X93-49tq;
	Fri, 17 Apr 2026 06:26:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDcfE-00000003X80-3hdd;
	Fri, 17 Apr 2026 06:26:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D96F943BD7;
	Fri, 17 Apr 2026 06:26:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66FE8C19425;
	Fri, 17 Apr 2026 06:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776407211;
	bh=8olc5JPtTmNs7JxzhXfknZC5ye3nqkDyWIxX6NLqcsc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ii+baCT79b7tsFmDK4rVJilzHvdXtIHbisNirrznWimmbKglALdtQXerrKDhDcSbM
	 KhKzlnwVjNR29gKZ+kjzF5KFQMjCS8LfRfVfOdk3aF1BRmXCal64jH8GV/6xTjQWcm
	 dGs5q8+1ARMgDpuuOm6LRPgAyEAcjXC5PwyA5yVUDMR68pprVCp7J9UZzayT3+3cEw
	 lvqEbxg+uuTszo83t304CAtD91MjvhLzmRgEB+ykI/7yPVM3WD26EWzazmQuBZ1FE9
	 0UMylePmu5izj10h8YmcpluQfWuPUqWWqCZleHqFF0SArMKuE/ZldLM4LsKGyXGGso
	 S7cwrntiphIEA==
Date: Fri, 17 Apr 2026 08:26:49 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net v3 0/3] net: airoha: Fix
 airoha_qdma_cleanup_tx_queue() processing
Message-ID: <aeHSqQoFPE_OqSre@lore-desk>
References: <20260416-airoha_qdma_cleanup_tx_queue-fix-net-v3-0-2b69f5788580@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="csZElj/PTazYvxbd"
Content-Disposition: inline
In-Reply-To: <20260416-airoha_qdma_cleanup_tx_queue-fix-net-v3-0-2b69f5788580@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_232652_947068_A4D9C8DA 
X-CRM114-Status: GOOD (  12.28  )
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


--csZElj/PTazYvxbd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Add missing bits in airoha_qdma_cleanup_tx_queue routine.
> Fix airoha_qdma_cleanup_tx_queue processing errors intorduced in commit
> '3f47e67dff1f7 ("net: airoha: Add the capability to consume out-of-order
> DMA tx descriptors")'.
>=20
> ---
> Changes in v3:
> - Move ndesc initialization fix in a dedicated patch.
> - Add patch 2/3 to move entries to queue head in case of DMA mapping
>   failure in airoha_dev_xmit().
> - Cosmetics.
> - Link to v2: https://lore.kernel.org/r/20260414-airoha_qdma_cleanup_tx_q=
ueue-fix-net-v2-1-875de57cc022@kernel.org
>=20
> Changes in v2:
> - Move q->ndesc initialization at end of airoha_qdma_init_tx routine in
>   order to avoid any possible NULL pointer dereference in
>   airoha_qdma_cleanup_tx_queue()
> - Check if q->tx_list is empty in airoha_qdma_cleanup_tx_queue()
> - Link to v1: https://lore.kernel.org/r/20260410-airoha_qdma_cleanup_tx_q=
ueue-fix-net-v1-1-b7171c8f1e78@kernel.org
>=20
> ---
> Lorenzo Bianconi (3):
>       net: airoha: Move ndesc initialization at end of airoha_qdma_init_t=
x()
>       net: airoha: Move entries to queue head in case of DMA mapping fail=
ure in airoha_dev_xmit()
>       net: airoha: Add missing bits in airoha_qdma_cleanup_tx_queue()

Please drop this version, I will send a new one dropping patch 2/3.

Regards,
Lorenzo

>=20
>  drivers/net/ethernet/airoha/airoha_eth.c | 42 ++++++++++++++++++++++++++=
------
>  1 file changed, 35 insertions(+), 7 deletions(-)
> ---
> base-commit: 3f20012a3964f487ae1e9ff942e2f35d4e9595bf
> change-id: 20260410-airoha_qdma_cleanup_tx_queue-fix-net-93375f5ee80f
>=20
> Best regards,
> --=20
> Lorenzo Bianconi <lorenzo@kernel.org>
>=20

--csZElj/PTazYvxbd
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaeHSqQAKCRA6cBh0uS2t
rBPrAP0WKNNrlDxxVSNL8TT1jgwKosyG90oakRKSIfQ5f+0hKAEA+FwgEcTw4hCs
OoZLhItk2oKK9Mr2kaBLED692czC6g0=
=DBkL
-----END PGP SIGNATURE-----

--csZElj/PTazYvxbd--

