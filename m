Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E3E6C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 13:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TPIBLMkyqCCRU9BiXFydTEUTOZadVywM+LAhxWqzrUk=; b=RFCyaFd9nqplVGmpvpcNANIgl9
	bqhNn368AsdlyYuItWw802Aqnow0LUM9k8aPA/bIDXGzu9Ue8oYO7xRbxnsOUisQTcmirfszlBl7F
	UkuKLVHQ1uGABKB251K8P/2MbA3UUQSLWjXbMLQaZEQQrcUFdY9cIlpJsocL5cHNJffHck2R8rG2K
	1oxt9TKk3uCDARg9wSqsGZFgYWsGlhoIRfa/VjrhgytvzcpbcAW9PtkDEFaPaUaZjHGbJfO6U3ruo
	kKJhCOZIHQGT7Z0kuC6y3eIWOTVafHOKKMfQAuXWv9sKR+pb/qPC/Y4T+6f4TvUXbtHieND/e9K5n
	Wa2pTrIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnFjf-0000000GSlk-36iG;
	Fri, 24 Jul 2026 13:14:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnFje-0000000GSlS-1WS9;
	Fri, 24 Jul 2026 13:14:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BE807416A2;
	Fri, 24 Jul 2026 13:14:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 243721F000E9;
	Fri, 24 Jul 2026 13:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784898881;
	bh=TPIBLMkyqCCRU9BiXFydTEUTOZadVywM+LAhxWqzrUk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=a8GTXkdaCG6aamySV2K94kqMSRvGlz2FGy5pds62TNBmEnmnkbM+GRZuA9Xh2YbGS
	 ihOm7ba4ONO8ML9BXyNEYUn4RgQAFtVFBq5NK8CUTf9DhibNQGltyOXzT66cQoXyHn
	 sUJ/9usKWAutf+EY9e/bhXm1s5i+D/Kb1xj9u8cz+8jBvAouG6AATEm18/E6SRWzp6
	 zXw3A3VRLS0CI7dHhK9lmG2nWc90HUj5uSvE4/gWvi8A3fTs/f7fCYQR1kT4GpWFzp
	 k1V6qJqtHE3KNWJdetgOsfYlScOvOo+pbA0aefj7fw02kX0hJPQ5JZu2odjkG5bZdo
	 f/kn/1q+idv2g==
Date: Fri, 24 Jul 2026 15:14:39 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	Jacob Keller <jacob.e.keller@intel.com>,
	Madhur Agrawal <madhur.agrawal@airoha.com>
Subject: Re: [PATCH net-next v10 0/3] airoha: add the capability to configure
 GDM3/GDM4 as WAN/LAN on demand
Message-ID: <amNlP37tMJYp-Hdp@lore-desk>
References: <20260722-airoha-ethtool-priv_flags-v10-0-d2562c5dd942@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KEhLaGquhBZth/a3"
Content-Disposition: inline
In-Reply-To: <20260722-airoha-ethtool-priv_flags-v10-0-d2562c5dd942@kernel.org>
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

--KEhLaGquhBZth/a3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Add the capability to configure GDM3/GDM4 as WAN/LAN on demand when QoS
> offload is created or destroyed.
> Make dev->qdma an RCU pointer so the TX path can safely dereference it
> without holding RTNL.
> Introduce airoha_qdma_start() and airoha_qdma_stop() helpers.

please drop this series, I will post a new one to address sashiko's comment=
s.

Regards,
Lorenzo

>=20
> ---
> Changes in v10:
> - Fix a theoretical race condition between tx completion NAPIs moving the
>   net_device between different QDMA.
> - Rebase on top of next-next main branch
> - Link to v9: https://lore.kernel.org/r/20260721-airoha-ethtool-priv_flag=
s-v9-0-9c15d8b71a56@kernel.org
>=20
> Changes in v9:
> - Rebase on top of next-next main branch
> - Link to v8: https://lore.kernel.org/r/20260703-airoha-ethtool-priv_flag=
s-v8-0-015ba5ac89ee@kernel.org
>=20
> Changes in v8:
> - Rebase on top of next-next to fix conflicts.
> - Link to v7: https://lore.kernel.org/r/20260701-airoha-ethtool-priv_flag=
s-v7-0-b4153bd44428@kernel.org
>=20
> Changes in v7:
> - Fix ETS stats accounting in patch 2/3
> - Reset ETS stats accounting in airoha_dev_set_qdma().
> - Link to v6: https://lore.kernel.org/r/20260629-airoha-ethtool-priv_flag=
s-v6-0-86bc600d31bc@kernel.org
>=20
> Changes in v6:
> - Rebase on top of next-next
> - Add patch 1/3: "rename airoha_priv_flags to airoha_dev_flags"
> - Drop patch 2/3: "refactor QDMA start/stop into reusable helpers"
> - Link to v5: https://lore.kernel.org/r/20260611-airoha-ethtool-priv_flag=
s-v5-0-c11de08486d1@kernel.org
>=20
> Changes in v5:
> - Add patch 1/3: use int instead of atomic_t for qdma users counter
> - Protect dev->flags with flow_offload_mutex mutex.
> - Introduce AIROHA_PRIV_F_QOS in order to handle better WAN/LAN
>   switching.
> - Link to v4: https://lore.kernel.org/r/20260610-airoha-ethtool-priv_flag=
s-v4-0-60e89cf28fea@kernel.org
>=20
> Changes in v4:
> - Move back QDMA TX/RX DMA enable to airoha_dev_open()/airoha_dev_stop().
> - Configure GDM3/4 as WAN if GDM2 is not available in ndo_init()
>   callback.
> - Protect qdma pointer in airoha_gdm_dev struct using RCU.
> - Rely on rtnl_dereference() to access qdma pointer in the control path.
> - Add airoha_qdma_start() and airoha_qdma_stop() utility routines in
>   patch 1/2
> - Link to v3: https://lore.kernel.org/r/20260608-airoha-ethtool-priv_flag=
s-v3-1-3e8e3dc3f715@kernel.org
>=20
> Changes in v3:
> - Do not introduce ethtool private flags support to configure LAN/WAN
>   for GDM3/4 and rely on tc qdisc offload for it instead.
> - Set GDM3/4 ports as LAN by default.
> - Move QDMA TX/RX DMA enable from airoha_dev_open() to airoha_probe()
>   and the corresponding disable from airoha_dev_stop() to airoha_qdma_cle=
anup().
> - Link to v2: https://lore.kernel.org/r/20260607-airoha-ethtool-priv_flag=
s-v2-1-742c7aa1e182@kernel.org
>=20
> Changes in v2:
> - Rework airoha_dev_set_wan_flag routine
> - Enable GDM_STRIP_CRC_MASK in airoha_disable_gdm2_loopback()
> - Do not always reset REG_SRC_PORT_FC_MAP6 in
>   airoha_disable_gdm2_loopback() but use the same condition used in
>   airoha_enable_gdm2_loopback().
> - Link to v1: https://lore.kernel.org/r/20260606-airoha-ethtool-priv_flag=
s-v1-1-401b2c9fe9f1@kernel.org
>=20
> ---
> Lorenzo Bianconi (3):
>       net: airoha: rename airoha_priv_flags to airoha_dev_flags
>       net: airoha: fix ETS QoS stats counter underflow and cross-channel =
corruption
>       net: airoha: defer GDM3/GDM4 WAN mode and GDM2 loopback to QoS offl=
oad
>=20
>  drivers/net/ethernet/airoha/airoha_eth.c  | 268 ++++++++++++++++++++++++=
++----
>  drivers/net/ethernet/airoha/airoha_eth.h  |  26 ++-
>  drivers/net/ethernet/airoha/airoha_ppe.c  |   9 +-
>  drivers/net/ethernet/airoha/airoha_regs.h |   1 +
>  4 files changed, 261 insertions(+), 43 deletions(-)
> ---
> base-commit: 88f380ef2304db4c68bc4bf14fc6c1604f6dd15c
> change-id: 20260606-airoha-ethtool-priv_flags-b6aa70caa780
>=20
> Best regards,
> --=20
> Lorenzo Bianconi <lorenzo@kernel.org>
>=20

--KEhLaGquhBZth/a3
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCamNlPwAKCRA6cBh0uS2t
rEbXAP9TBPic+WUY6BAE3Sm9oho1WMIYlT3puIgnWd3RElBQ/gD+Jdf77Dl8gaTl
VrsmBh/aVrCEQ668SmmVAkE08mphpwo=
=+Bwn
-----END PGP SIGNATURE-----

--KEhLaGquhBZth/a3--

