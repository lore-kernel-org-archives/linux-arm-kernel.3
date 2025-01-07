Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67766E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 21:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FkDBWKwAmmDzOrLOk18A/F49yWqkCfBKpPfknDBfP7o=; b=UTKTVmeLjFMrAt2J16aPFG8vM+
	giVQiJL/0nUdrrB+8E5MBopqaMAbo1LkN01VoiU4V+7ngPQwjJFH9Fee1ULpoZVS5d/+YUvIDfzCq
	nAFTJSOns+qVk0yPOVY6q9PaQss9t2+zzt4SYTAYw5QMWtNXayUTheYsjf9f11QzcG5oCgeEfwtL3
	+VzKhPiV5S6AqFBPyksMgIpMworWqDwGqFu28QGog/uHDS82GISihWpNkTX/YdlnQHrgAdBSYAsBZ
	54YDiiLZuyQbHiaArXBuIqacbngjl3WgZ6f5pB4ULo0mtra0VQ0F9iqrYp10R0WnpdKxK4myACsAn
	dCtwZTJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVHZL-00000006N8Y-37Vl;
	Tue, 07 Jan 2025 21:56:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVHY8-00000006N4v-2opx;
	Tue, 07 Jan 2025 21:55:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5247B5C6018;
	Tue,  7 Jan 2025 21:55:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0CFFC4CED6;
	Tue,  7 Jan 2025 21:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736286943;
	bh=jtmnWEARWEmD43FDdt9F+BHYo1jphXJeqPvu4IFcjkY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fVoYtMb2lHtH0/uYJDLRVOiHAMjmdE1b0iUlXhpMQ15n/SMSqRrR2b004IrUwheGd
	 qyg/hyC8QZCOGZiFjr7cqJbGvUlmoiZqKKxdy2QLY89ciGs725kz8Z6DVGldgvIgo2
	 vBRB4/f3lXTMCi61aD3GVtFioYTbZ6zw+DYSgebyZ08eaBZ6L+tC4/YN+1uAwNmzzp
	 I/xDuStj50j3hR7Ix/3kN61S6MtMPpJvyqwDAej80IYiUHvriyNTMaNaHF+nURV6dn
	 tLW0z2PzXTDJ7+Q4oTJb0KM/6gBR9Jps2zWosoX5ftn+N/yiy5I1ce9fdw6+UzC018
	 ksBbCeT5r4wHg==
Date: Tue, 7 Jan 2025 22:55:40 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Davide Caratti <dcaratti@redhat.com>
Cc: patchwork-bot+netdevbpf@kernel.org, nbd@nbd.name,
	sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [PATCH net-next 0/4] net: airoha: Add Qdisc offload support
Message-ID: <Z32i3EGrLfE2OlLN@lore-desk>
References: <20250103-airoha-en7581-qdisc-offload-v1-0-608a23fa65d5@kernel.org>
 <173625003251.4120801.586359106755098449.git-patchwork-notify@kernel.org>
 <CAKa-r6v0bEjQfbSG75E9kV1Qki-5eAbrqiy2maB2iG2O4Wf5Xw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Rv8LOhYFLOQcML4d"
Content-Disposition: inline
In-Reply-To: <CAKa-r6v0bEjQfbSG75E9kV1Qki-5eAbrqiy2maB2iG2O4Wf5Xw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_135544_752243_D7E55492 
X-CRM114-Status: GOOD (  15.16  )
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


--Rv8LOhYFLOQcML4d
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> hi,
>=20
> On Tue, Jan 7, 2025 at 12:40=E2=80=AFPM <patchwork-bot+netdevbpf@kernel.o=
rg> wrote:
> >
> > Hello:
> >
> > This series was applied to netdev/net-next.git (main)
> > by Paolo Abeni <pabeni@redhat.com>:
> >
> > On Fri, 03 Jan 2025 13:17:01 +0100 you wrote:
> > > Introduce support for ETS and HTB Qdisc offload available on the Airo=
ha
> > > EN7581 ethernet controller.
> > >
> > > ---
> > > Lorenzo Bianconi (4):
> > >       net: airoha: Enable Tx drop capability for each Tx DMA ring
> > >       net: airoha: Introduce ndo_select_queue callback
> > >       net: airoha: Add sched ETS offload support
>=20
> I was about to comment that ETS offload code probably still lacks
> validation of priomap [1]. Otherwise every ETS priomap will behave
> like the one that's implemented in hardware. It can be addressed in a
> follow-up commit, probably.

sorry, I forgot about it. I am fine to enforce priomap if it is required wi=
th a
follow-up patch.=20

Regards,
Lorenzo

>=20
> thanks,
> --
> davide
>=20
> [1] https://lore.kernel.org/netdev/CAKa-r6shd3+2zgeEzVVJR7fKWdpjKv1YJxS3z=
+y7QWqDf8zDZQ@mail.gmail.com/
>=20

--Rv8LOhYFLOQcML4d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZ32i3AAKCRA6cBh0uS2t
rIr6AQD7Gjch5GSpHsIaSEqrXwCHjxSHuhrQdfBAepQ5SPB4UgD+Ox/WGqd9I9jr
x8iG9A7gy4ZsLv9KHdYITc7HfixhugA=
=ibn2
-----END PGP SIGNATURE-----

--Rv8LOhYFLOQcML4d--

