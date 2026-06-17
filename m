Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C642CD98F0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 12:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IMIppte+gBwuC5XbBRIXlUQ0aozwvo/6xvW4VF9LfrQ=; b=UjL6eEuIW1J97eP0I9NiLV09qZ
	xx406OVcrvhn5ZfJA5RebuyPDwR3WtWXoMAq5H5nlEroQx5kRXmf7qU+vG78QFGGDqW0xoSx5uUbw
	cBCY3/8EBafng6Q6WYt5g9qATBJ7MQFcN9QgTNWzdfRphcTn02QqwBnKUOPl+zXxuiV6bQt1fVawY
	vb7oigvZPoIcZdJIzjzlqMt3Um/tqMy4pMs9VY5OXUQqAzNFerrJZwfskOFOfYaYgaXhYSaWt1ISG
	lahzBezaI1WcEOkYTZrVc1ooDSYcUHPNlAPkez3GGrhPy3dBmBSyTInJ3sOmqX3sY9HvW1d9HcaA3
	BN+shzeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZphQ-0000000HMtC-2b5k;
	Wed, 17 Jun 2026 12:48:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZphP-0000000HMt0-22Et;
	Wed, 17 Jun 2026 12:48:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 10E5840E50;
	Wed, 17 Jun 2026 12:48:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A9831F000E9;
	Wed, 17 Jun 2026 12:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781700534;
	bh=IMIppte+gBwuC5XbBRIXlUQ0aozwvo/6xvW4VF9LfrQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=N+skJEbER87qujetlVk/j6Tkuyd1Vhrm3VXBA4mpK2P60nXN0b5oN1qOIIW6l7Wyj
	 2ms5f0Emq1qAEDkoFKTGqjGgSEtOPjFRk7/XMQBuCoSq6Nvn4CIfyx9BEHS8kIaHzk
	 aTjbGFxY9/L25JBs+T0SFQPMOKYOTOsaunEOmJQPHli7aEr6PlvgTDOQJ2VKMMSCdB
	 q7CRFMHrvi2z+xZaTYC/7Dsa3rYsqlHPTf2v/6JhZoacfchH8uET0V1q8BeohY8UJO
	 vs/F03aR3R1MwdkUoN5GqAtbKaI9jlrVPlelxSmRugQLTvpKc+PNOafKH1LhBkNzKp
	 NHJ3OkNZj3iXw==
Date: Wed, 17 Jun 2026 14:48:52 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Wayen Yan <win847@gmail.com>
Cc: netdev@vger.kernel.org, horms@kernel.org, pabeni@redhat.com,
	kuba@kernel.org, edumazet@google.com, andrew+netdev@lunn.ch,
	angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2] [net] net: airoha: Clean up RX queues in
 airoha_dev_stop
Message-ID: <ajKXtDxPipRcA20X@lore-desk>
References: <178161160256.2165161.14322392784449633554@gmail.com>
 <178170026659.2238511.17652659042899875248@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dwA6XgDlcLvaJ+Fq"
Content-Disposition: inline
In-Reply-To: <178170026659.2238511.17652659042899875248@gmail.com>
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


--dwA6XgDlcLvaJ+Fq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Thanks Simon for forwarding the AI review. I've reviewed all three
> concerns:
>=20
> #1 (NAPI race) and #2 (RX refill) are valid. #2 is the decisive
> issue: airoha_dev_open() has no RX ring refill, so draining the
> queues in stop would cause RX stall on next open. This aligns with
> Lorenzo's earlier feedback =E2=80=94 RX queues don't need cleanup in
> dev_stop(). I'll drop this patch.
>=20
> #3 (q->skb leak) is a pre-existing issue, not introduced by this
> patch. It exists even in the module unload path
> (airoha_qdma_cleanup()). @Lorenzo =E2=80=94 do you think this warrants a
> fix? A one-liner in airoha_qdma_cleanup_rx_queue() would cover both
> paths. Or is this too unlikely to matter in practice?

Soon I will post a patch to run airoha_qdma_cleanup_tx_queue() just in
airoha_hw_cleanup() so I think we should just drop this patch.

Regards,
Lorenzo

--dwA6XgDlcLvaJ+Fq
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCajKXtAAKCRA6cBh0uS2t
rKmiAQDehtR9VrdOdbmTSHIKJQn9uL7BkvVVXPg39gdOUoJbDgD/cL9I+HyY/qdR
q4EY1FHiIibYx/ptSfwkEGZI8MtXrgg=
=owDH
-----END PGP SIGNATURE-----

--dwA6XgDlcLvaJ+Fq--

