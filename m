Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06864C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 06:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tn40w+eQSVbenOj1LRFCOarkvD9KhhmK3GhnDs8tmW8=; b=IPqa3KbUnksJEyGzGwgZm1ZY71
	wPizvdEcB5cZvyhnvsfQTmCq8H5O/GM/nvERtrb8yPgvIKjwK/wZC3+xtUdjp5tdFuDwMP7aKxsSk
	Z6Yzber26XXBDvWpyTpm6QzQgOEyupRPjLxNK+rUdMNVKoeetJAwBBqgMfN14LEmapW/4TUmgZ8Xs
	7W/xMe5Xi2P1J79zeYstOEe/osobcyy9mQ9fW567UPDZQb+zwCs0w0u9Z7G1x2mzP4SJ3ME3ZUtPc
	+MEMUhJeTA5vbG9oAnkI813l9fIZidiD3GIikQ1EXcwGkBYyut3qy/2C4Hk+OAd5agOcj/KdHk7ki
	P+dcsGdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFodH-00000002Ztn-2I0G;
	Fri, 16 May 2025 06:33:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFoZX-00000002ZXm-0EM6;
	Fri, 16 May 2025 06:29:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B567A43C8F;
	Fri, 16 May 2025 06:29:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44775C4CEE4;
	Fri, 16 May 2025 06:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747376970;
	bh=GMpG59QzFjmQJhyXn36tq9RZEy3QQClR9qhP+5osv34=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jru3G860j4OrQ4sjJuJZ0V6IPrStGqsvRShuUKn0qHp7+4y3rDiPqD3+FzUuriZw0
	 Q+gIyBrHOELmci6CLOrj6PyuESjaqph2HgcOUBeZ4hmQgllP34bPOCgf4sEv6kkN7j
	 SEgpor1514gSclkNRx9i0R1O4emrqo54fJgCQBOea8wJGPq1fM3X6ARCV8E0U1XtSt
	 j4roUgnArhLE3hfTvr9FcqQeKOUmWbjT/oqSTLw0hINqa/GjtyWMxb5Fv5fRACO67X
	 FWYDXtZ9JAo3HCB0+56ViYRVGDgSzru7/nSug1xMry2aswKCZLPb0RRdhQZj5MoLtp
	 9uaz9tGuyJQBw==
Date: Fri, 16 May 2025 08:29:28 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next 2/2] net: airoha: Add FLOW_CLS_STATS callback
 support
Message-ID: <aCbbSHkBRrm4yM1f@lore-desk>
References: <20250514-airoha-en7581-flowstats-v1-0-c00ede12a2ca@kernel.org>
 <20250514-airoha-en7581-flowstats-v1-2-c00ede12a2ca@kernel.org>
 <20250515181357.73f98a18@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JVIPhaKnT2FG04Av"
Content-Disposition: inline
In-Reply-To: <20250515181357.73f98a18@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_232931_113186_4DC39DE9 
X-CRM114-Status: GOOD (  10.65  )
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


--JVIPhaKnT2FG04Av
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On May 15, Jakub Kicinski wrote:
> On Wed, 14 May 2025 19:09:58 +0200 Lorenzo Bianconi wrote:
> > Introduce per-flow stats accounting to the flowtable hw offload in
> > the airoha_eth driver. Flow stats are split in the PPE and NPU modules:
> > - PPE: accounts for high 32bit of per-flow stats
> > - NPU: accounts for low 32bit of per-flow stats
> >=20
> > FLOW_CLS_STATS can be enabled or disabled at compile time.
>=20
> sparse isn't happy:
>=20
> drivers/net/ethernet/airoha/airoha_npu.c:382:15: warning: incorrect type =
in assignment (different address spaces)
> drivers/net/ethernet/airoha/airoha_npu.c:382:15:    expected void *stats
> drivers/net/ethernet/airoha/airoha_npu.c:382:15:    got void [noderef] __=
iomem *

ack, I will fix it in v2.

Regards,
Lorenzo

> --=20
> pw-bot: cr

--JVIPhaKnT2FG04Av
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaCbbRwAKCRA6cBh0uS2t
rBb6AQCU1LBy3I0ss9c5I93glLBLPtNpVMYzqWkulMBHE1cEyQD8D9hfs9GxwKEZ
kcYzMMelMHCuvgw1JYcHYp0OLAWalQY=
=6am5
-----END PGP SIGNATURE-----

--JVIPhaKnT2FG04Av--

