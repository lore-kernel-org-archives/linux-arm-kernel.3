Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B31B1061B26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 11:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uIvo1TJ4B7/7+SlOT9rQFMgp+xlBFmRfLbUXv9BYyl8=; b=iiHQ76Af5MhsV89Kfohg0vR7bZ
	fisfIz6QqSd7I0edJK2CIaM2a4QTwFowtnyotBmIj2l3D9yQO8ErErCPtg15QBNuF+9TfwHEy6I/D
	LaKZf3N2yiRfcdE36qJoi+W16nWqkemvl821dmK60r5gHW88zMTbDl6mbevtZLnAPTpoREtx9HmJT
	V0rV1gpb7wXhrtWPrU3OmBHg3C3QtIiKq8ixqVFPszcpRbWqJdmUZKCcDop/rD9gsWX+cAcnuGbar
	Xv4hcNG4DtIM3VrdqwM3V7v+H01728thFWf03q9ZHhMVYrLaoheEsA8XmtOsoWsU2hbMjYz4O7NdX
	wWm1CIiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7WqS-0000000Cp2Q-2gsx;
	Tue, 31 Mar 2026 11:01:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7WqP-0000000Cp1s-4Agh;
	Tue, 31 Mar 2026 11:01:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D148F43BEE;
	Tue, 31 Mar 2026 11:01:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B238C19423;
	Tue, 31 Mar 2026 11:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774954872;
	bh=EcqUphq1wWKi9Qrx2LqMu9kafXOOdcTX03pertRNwaY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qfFzbvRc9ntIvLPffE2ihm5EwV/zP0QiKoUDYe4Ua2auvIHTAVUXvMllYf0H1Ca4B
	 snIqsUg6DGEXx8u/PwOK7h+ZHUOP27eCla2cdd4V+QTKPTgDbfxKBroZ+lDa7oQsDn
	 flG8FnSMVMcIpML9uzJ6g+LphiAAZh66lmsIBz37kF7C1XEgGxYuC7MzeZjZfmYijw
	 jsWb6jq8nw6kkWdY3B9EfYKqv4mCKaU5wzP6vt1Jc13IVZddt1gdrtbT28ZB1a991M
	 W9Ceg6nEPVPoNVrS4Paw6/2m1jXC11aw3g7w7I2b+3MYn4D4+jKt0GCcsZ+9m+/lO5
	 HXdehIJZCMqzg==
Date: Tue, 31 Mar 2026 13:01:10 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	Madhur Agrawal <Madhur.Agrawal@airoha.com>
Subject: Re: [PATCH net] net: airoha: Add missing cleanup bits in
 airoha_qdma_cleanup_rx_queue()
Message-ID: <acupditAioiehGSj@lore-desk>
References: <20260327-airoha_qdma_cleanup_rx_queue-fix-v1-1-369d6ab1511a@kernel.org>
 <20260330172857.0c94685d@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QNFGWspO91D9ZYhL"
Content-Disposition: inline
In-Reply-To: <20260330172857.0c94685d@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_040114_076192_D08D0786 
X-CRM114-Status: GOOD (  23.44  )
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


--QNFGWspO91D9ZYhL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Fri, 27 Mar 2026 10:48:21 +0100 Lorenzo Bianconi wrote:
> > In order to properly cleanup hw rx QDMA queues and bring the device to
> > the initial state, reset rx DMA queue head/tail index. Moreover, reset
> > queued DMA descriptor fields.
> >=20
> > Fixes: 23020f049327 ("net: airoha: Introduce ethernet support for EN758=
1 SoC")
> > Tested-by: Madhur Agrawal <Madhur.Agrawal@airoha.com>
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
>=20
> Take a look at sashiko, please:
> https://sashiko.dev/#/patchset/20260327-airoha_qdma_cleanup_rx_queue-fix-=
v1-1-369d6ab1511a@kernel.org
>=20
> Looks somewhat orthogonal to the current patch but probably worth
> fixing.

Hi Jakub,

thx for pointing me to the sashiko's issues.

1- Could this code execute while the interface is still administratively up=
 and
   the hardware DMA engines are actively receiving packets?
   Looking at the teardown paths, airoha_hw_cleanup() is called before
   unregister_netdev(). Unmapping buffers and zeroing descriptor addresses
   while the hardware might still be actively writing to them could cause
   physical memory corruption and IOMMU faults.
   Should unregister_netdev() (which quiesces the DMA via ndo_stop) be call=
ed
   before airoha_hw_cleanup() to avoid this?

I think the issue described above is already fixed in the following commit
available in net-next:

commit b1c803d5c8167026791abfaed96fd3e6a1fcd750
Author: Lorenzo Bianconi <lorenzo@kernel.org>
Date:   Sat Mar 21 15:41:44 2026 +0100

    net: airoha: Rework the code flow in airoha_remove() and in airoha_prob=
e() error path
   =20
    As suggested by Simon in [0], rework the code flow in airoha_remove()
    and in the airoha_probe() error path in order to rely on a more common
    approach un-registering configured net-devices first and destroying the
    hw resources at the end of the code.
    Introduce airoha_qdma_cleanup routine to release QDMA resources.
   =20
    [0] https://lore.kernel.org/netdev/20251214-airoha-fix-dev-registration=
-v1-1-860e027ad4c6@kernel.org/
   =20
    Suggested-by: Simon Horman <horms@kernel.org>
    Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
    Reviewed-by: Simon Horman <horms@kernel.org>
    Link: https://patch.msgid.link/20260321-airoha-remove-rework-v2-1-16c7b=
ade5fe5@kernel.org
    Signed-off-by: Paolo Abeni <pabeni@redhat.com>

How can we go ahead on this?

2- This is a pre-existing issue, but while reviewing this cleanup path, I
   noticed a potential NULL pointer dereference if initialization fails ear=
lier.
   If devm_kzalloc() or dmam_alloc_coherent() fails in airoha_qdma_init_rx_=
queue(),
   it returns an error before netif_napi_add() is called, leaving the embed=
ded
   q->napi struct zero-filled.
   However, q->ndesc is set earlier in that function. Since q->ndesc is now
   non-zero, the error cleanup path will try to disable and delete this
   uninitialized NAPI structure, leading to a crash in napi_disable() when =
it
   calls hrtimer_cancel() on the uninitialized timer.
   Could we defer setting q->ndesc until after the allocations succeed?

I think it is fine to set 'q->ndesc' at the end of airoha_qdma_init_rx_queu=
e()
routine but, considering net codebase, it seems the issue can't occur since=
 if
airoha_qdma_init_rx_queue() fails as described above, airoha_probe() will j=
ump
to error_hw_cleanup and netif_napi_del() in airoha_hw_cleanup() will return=
 if
NAPI_STATE_LISTED is not set in __netif_napi_del_locked().
Am I missing something?

3- Is there a missing reset for the CPU producer index (REG_RX_CPU_IDX) her=
e?
   The hardware DMA relies on the gap between the CPU and DMA indices to
   identify valid descriptors. By rewinding the DMA consumer index (REG_RX_=
DMA_IDX)
   to q->tail while leaving the CPU index at its old, advanced value, could
   this create a phantom gap of descriptors?
   If the DMA engine fetches these zeroed descriptors (with addr =3D 0), it=
 might
   attempt to write incoming packets to physical address 0x0. Both indices =
might
   need to be synchronized.

I will post a fix for it.

Regards,
Lorenzo

--QNFGWspO91D9ZYhL
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCacupdgAKCRA6cBh0uS2t
rGAkAQC7aPrumxUx8kh0xKYbqQ6DhGvSZuNb2kDhfm3oCwm/cwEAle7Pisx9yp5u
VAyedjuT92Ot4VKnlokdUVIpSYjhOwY=
=x2rz
-----END PGP SIGNATURE-----

--QNFGWspO91D9ZYhL--

