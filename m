Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9C9DCD3439
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 17:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aKWO1uiPQ6t+YG82CSDBZPlcpzQloIgdBnTnwGbym8U=; b=2crMSx5eDAtzV7pRctdV42kSOR
	gtPbVXTki7raTIgBf/hfIRmpSIuDpKzDAQ3k9aqEOgDDhl1K826LLJPmDBfDaqC4YSM8ely/RaOKL
	6C64IbEGj/vJrlir+1bILKXxaVAjtr/IkNQZEhZgYXQFSeQIT7DghLHX4dAqbPwczMSvWhX0Eh1rW
	ajEJz9kXZRpyA+LogNQBWbn5SvDoCPVIn1CIjBu1k6t9OTRA8W4NxwOQGGyezexMXvwdlCzeYUpPO
	WV8qWfm4M6lDJqstQnLmoRs6EUIZ5zeKnuyHW3Z3GHLx3F0vqXqbKkPo93NWoReWIdDnZw3mhISKI
	sy+ibHmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKg1l-00000001dz2-44Sv;
	Wed, 06 May 2026 17:27:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKg1k-00000001dyj-3FtD;
	Wed, 06 May 2026 17:27:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E609E60139;
	Wed,  6 May 2026 17:27:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 476CBC2BCB0;
	Wed,  6 May 2026 17:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778088435;
	bh=HmDSB8RGwVj0i6+IcLEKJKC3r5SqoF2IF/ST6ULFU5k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LsoZapBs6yowkuRKg3FX+deiQgEzzTuVpKSya3Hw5fH4WGu+0t8FG7x973zAJvwLF
	 uW96m0AIo55ILZk0w0aZzRmUvKVPJtzU0EIuooGlelpMH8pJiJgpC1MNmnE3x3nIB3
	 Hy02Z9T1nV3l6yxG2pmg30zRB4PymXqWVkakE0uvj0APBkKmoDfExIDpbJ5/hn3Ndg
	 9VLTh7QGvc07UgZglJOPiuVzr57E4UFs19x1zGmp/Ly3TUmii020ROS9/BWTCQT3iE
	 xagDUUYZj3GXds47tcDWufFyuz8Zq/hibafbcyBswon8WIA3wk+NTPmINtJzRCpyG7
	 sRX2DVPbukHgQ==
Date: Wed, 6 May 2026 19:27:13 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Felix Fietkau <nbd@nbd.name>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Simon Horman <horms@kernel.org>, David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>, Phil Sutter <phil@nwl.cc>,
	Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH nf-next 0/4] Add IPv4 over IPv6 flowtable SW acceleration
Message-ID: <aft58U5Y0iQGi2JS@lore-desk>
References: <20260505-b4-flowtable-sw-accel-ip6ip-v1-0-9ac39ccc9ea9@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dBWX7q7eS4V4GZda"
Content-Disposition: inline
In-Reply-To: <20260505-b4-flowtable-sw-accel-ip6ip-v1-0-9ac39ccc9ea9@kernel.org>
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


--dBWX7q7eS4V4GZda
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Similar to IPIP and IP6I6 tunnels, introduce sw acceleration for IPv4 over
> IPv6 tunnels in the netfilter flowtable infrastructure.

Please drop this revision, I spotted a bug in MTU configuration in
nf_flow_offload_forward(). I will post v2 fixing the issue and adding
SIT support.

Regards,
Lorenzo

>=20
> ---
> Lorenzo Bianconi (4):
>       net: netfilter: Add ether_type to net_device_path_ctx
>       net: netfilter: Add encap_proto to flow_offload_tunnel
>       net: netfilter: Add IPv4 over IPv6 tunnel flowtable acceleration
>       selftests: netfilter: nft_flowtable.sh: Add IPv4 over IPv6 flowtabl=
e selftest
>=20
>  drivers/net/ethernet/airoha/airoha_ppe.c           |  14 ++-
>  drivers/net/ethernet/mediatek/mtk_ppe_offload.c    |  13 ++-
>  include/linux/netdevice.h                          |   5 +-
>  include/net/netfilter/nf_flow_table.h              |   1 +
>  net/core/dev.c                                     |   6 +-
>  net/ipv4/ipip.c                                    |   1 +
>  net/ipv6/ip6_tunnel.c                              |   6 +-
>  net/netfilter/nf_flow_table_core.c                 |  14 ++-
>  net/netfilter/nf_flow_table_ip.c                   | 129 +++++++++++++++=
+-----
>  net/netfilter/nf_flow_table_path.c                 |  16 +--
>  .../selftests/net/netfilter/nft_flowtable.sh       |  26 +++++
>  11 files changed, 174 insertions(+), 57 deletions(-)
> ---
> base-commit: c1e5127b577c6b88fa48e532616932ae978528d5
> change-id: 20260505-b4-flowtable-sw-accel-ip6ip-7101034cd147
>=20
> Best regards,
> --=20
> Lorenzo Bianconi <lorenzo@kernel.org>
>=20

--dBWX7q7eS4V4GZda
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaft58QAKCRA6cBh0uS2t
rLWvAP99BJDDX3b8y2+zfNm18ZUstMl46XX8mPMDwCOvVThzcgD+N51Qsadb2Qk5
NtKNQbi/t3ChjT3OgvGfw//o+PK0rwg=
=93pw
-----END PGP SIGNATURE-----

--dBWX7q7eS4V4GZda--

