Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C710FCD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 10:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3dPLuA4vT67WlsEOzheeR5XKFKVaNwjUTiSu6XRzeEs=; b=hfgg9IOeGa6A4LAl3kmn2NSOtL
	B93+G7XbjZv4ZIBFud/sX8XVDUbGok9HIsVyuaq0wsnVnRTvA96MraWwWq9xSd5YxEy9kOtU1G/Re
	5nqinTJSrOdxhIVMYWuPsbXSteFgUKTAHCdM9Sw6/MhZjp79enGIeo0LLfd4J06uE1r6aB+YR3+am
	nDigF7G82rkxdxPIxR4IOr8Hx6WdTyrk8FusbD2tfkkr4oM00f5yuEZ/VF2KEGGdG6rcpjqmXa48V
	TfedEZpnJrpQednHmE5oyXnNluTPFXkPJIIkVheqJobhg6T8ubz4Z5cdpWXBVPXDd/ntB1jVLRRM+
	0cylUwrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSBJ1-00000003ljp-1UIU;
	Wed, 27 May 2026 10:16:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSBIy-00000003lht-26cs;
	Wed, 27 May 2026 10:16:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0CFA84458A;
	Wed, 27 May 2026 10:16:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65FF91F000E9;
	Wed, 27 May 2026 10:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779876963;
	bh=3dPLuA4vT67WlsEOzheeR5XKFKVaNwjUTiSu6XRzeEs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=J1kgVvWEgjVp9TSYzYChMEM+d5y6nWj1RTKgXN0G2jskVcaLXX6/yfiDZ6Cp1nwp5
	 Z9JQSSbLlPgup4j8+jYw5Zw5bJbf4ejioD5iej55uYmDMVHZHrVT1t/ZiOMqiouRXr
	 kKwjZm7FPK3h5GngqtvPJJWfzp7qXYvQMCGsNK4097Uzciv5uAJfZM+uZL1wYm9VcN
	 gGaWLVuM+fG6Qvi1m0TjG8n9/Q9L/p4Kkg1Q+zBwFm4o04sFDmJUWyfZOUOfybU5SB
	 JXYhtHuP3Vlq1GkfIquYZlBG0fLRvp0wXwgM6kHSuE8nNnsJ7iA42LoLy7geeu/nYc
	 ZhN2IEVrY1OLA==
Date: Wed, 27 May 2026 12:16:01 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, Xuegang Lu <xuegang.lu@airoha.com>,
	Madhur Agrawal <madhur.agrawal@airoha.com>
Subject: Re: [PATCH net-next v8 00/10] net: airoha: Support multiple
 net_devices connected to the same GDM port
Message-ID: <ahbEYeiSzB9h3VgQ@lore-desk>
References: <20260519-airoha-eth-multi-serdes-v8-0-6bd70e329df6@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="az65s5W1t/JkTr+5"
Content-Disposition: inline
In-Reply-To: <20260519-airoha-eth-multi-serdes-v8-0-6bd70e329df6@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_031604_581075_200226D0 
X-CRM114-Status: GOOD (  24.78  )
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


--az65s5W1t/JkTr+5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> EN7581 or AN7583 SoCs support connecting multiple external SerDes (e.g.
> Ethernet or USB SerDes) to GDM3 or GDM4 ports via a hw arbiter that
> manages the traffic in a TDM manner. As a result multiple net_devices can
> connect to the same GDM{3,4} port and there is a theoretical "1:n"
> relation between GDM ports and net_devices.
>=20
>            =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=90
>            =E2=94=82                                 =E2=94=82    =E2=94=
=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90
>            =E2=94=82                         P1 GDM1 =E2=94=9C=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=96=BAMT7530=E2=94=82
>            =E2=94=82                                 =E2=94=82    =E2=94=
=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98
>            =E2=94=82                                 =E2=94=82      ETH0 =
(DSA conduit)
>            =E2=94=82                                 =E2=94=82
>            =E2=94=82              PSE/FE             =E2=94=82
>            =E2=94=82                                 =E2=94=82
>            =E2=94=82                                 =E2=94=82
>            =E2=94=82                                 =E2=94=82    =E2=94=
=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90
>            =E2=94=82                         P0 CDM1 =E2=94=9C=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=96=BAQDMA0=E2=94=82
>            =E2=94=82  P4                     P9 GDM4 =E2=94=82    =E2=94=
=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98
>            =E2=94=94=E2=94=80=E2=94=80=E2=94=AC=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=AC=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=98
>               =E2=94=82                         =E2=94=82
>            =E2=94=8C=E2=94=80=E2=94=80=E2=96=BC=E2=94=80=E2=94=80=E2=94=
=90                 =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=96=BC=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90
>            =E2=94=82 PPE =E2=94=82                 =E2=94=82   ARB   =E2=
=94=82
>            =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=98                 =E2=94=94=E2=94=80=E2=94=AC=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=AC=E2=94=80=E2=94=98
>                                      =E2=94=82     =E2=94=82
>                                   =E2=94=8C=E2=94=80=E2=94=80=E2=96=BC=E2=
=94=80=E2=94=80=E2=94=90=E2=94=8C=E2=94=80=E2=96=BC=E2=94=80=E2=94=80=E2=94=
=80=E2=94=90
>                                   =E2=94=82 ETH =E2=94=82=E2=94=82 USB =
=E2=94=82
>                                   =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=98=E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=98
>                                    ETH1   ETH2
>=20
> This series introduces support for multiple net_devices connected to the
> same Frame Engine (FE) GDM port (GDM3 or GDM4) via an external hw
> arbiter. Please note GDM1 or GDM2 does not support the connection with
> the external arbiter.

In order to make easier the inclusion of this series I am splitting it in t=
wo
smaller ones:
- a preliminary rework series (just code adjustments)
- a smaller series where we introduce the real support for multiple net_dev=
ices
  connected to the same FE GDM port.

This way we can unlock even other patches in my queue.

Regards,
Lorenzo

>=20
> ---
> Changes in v8:
> - Fix dts schema issues reported by sashiko.
> - Fix possible NULL-pointer dereference in patch 2/10.
> - Fix max mtu computation in airoha_dev_change_mtu().
> - Link to v7: https://lore.kernel.org/r/20260516-airoha-eth-multi-serdes-=
v7-0-99e0093303e2@kernel.org
>=20
> Changes in v7:
> - Fix dma_sync_single_for_cpu() size in airoha_qdma_rx_process().
> - Fix hw stats reset.
> - Fix typos.
> - Add fix for airoha_tc_remove_htb_queue queue index.
> - Fix dts schema issues.
> - Remove hw stats patch from the series.
> - Link to v6: https://lore.kernel.org/r/20260511-airoha-eth-multi-serdes-=
v6-0-c899462c4f75@kernel.org
>=20
> Changes in v6:
> - Reconfigure REG_GDM_LEN_CFG() whit max 'running' MTU in
>   airoha_dev_stop().
> - Fix port staring MIB counters in airoha_update_hw_stats().
> - Fix regression in TC_HTB_NODE_MODIFY command.
> - Fix length check in airoha_qdma_rx_process().
> - Fix dts schema.
> - Link to v5: https://lore.kernel.org/r/20260509-airoha-eth-multi-serdes-=
v5-0-805e38edc2aa@kernel.org
>=20
> Changes in v5:
> - Move qos_sq_bmap bitmap in airoha_gdm_dev struct.
> - Unregister netdevice before running of_node_put().
> - Move stat MIB counters in airoha_gdm_dev struct.
> - Fix airoha_ppe_init_upd_mem() mac address configuration.
> - Do not return -EBUSY if we try to decrease configured MTU of a shared
>   GDM port, just skip hw configuration.
> - use int instead of atomic_t for GDM port users.
> - Add patch "net: airoha: Reserve RX headroom to avoid skb reallocation"
> - Fix typos.
> - Link to v4: https://lore.kernel.org/r/20260507-airoha-eth-multi-serdes-=
v4-0-af613b61ae02@kernel.org
>=20
> Changes in v4:
> - Make ethernet-port property available just for GDM3 and GDM4 in DTS
>   specification
> - Move cpu_tx_packets, fwd_tx_packets qos_sq_bmap fields in airoha_qdma
>   struct
> - Fix of_node leak removing the net_device in airoha_remove() or
>   airoha_probe() error path
> - Fix nbq backward compatibility
> - Link to v3: https://lore.kernel.org/r/20260406-airoha-eth-multi-serdes-=
v3-0-ab6ea49d59ff@kernel.org
>=20
> Changes in v3:
> - Fix MTU and VIP configuration when the GDM port is shared between
>   multiple net_devices.
> - Add sanity check for nbq parameter.
> - Add missing of_node_get() for net_device np node.
> - Check if GDM port is shared before decresing device MTU.
> - Move port forward configuration in airoha_dev_stop() before
>   configuring DMA tx/rx engine.
> - Introduce PRIV_FLAG_WAN parameter.
> - Link to v2: https://lore.kernel.org/r/20260401-airoha-eth-multi-serdes-=
v2-0-ac427ae4beeb@kernel.org
>=20
> Changes in v2:
> - Rename multiplexer in arbiter in the commit logs.
> - Rebase on top of net-next main branch.
> - Add missing PPE cpu port configuration for GDM2 when loopback is
>   enabled.
> - Link to v1: https://lore.kernel.org/r/20260329-airoha-eth-multi-serdes-=
v1-0-00f52dc360ca@kernel.org
>=20
> ---
> Lorenzo Bianconi (10):
>       dt-bindings: net: airoha: Add GDM port ethernet child node
>       net: airoha: Introduce airoha_gdm_dev struct
>       net: airoha: Move airoha_qdma pointer in airoha_gdm_dev struct
>       net: airoha: Rely on airoha_gdm_dev pointer in airoha_is_lan_gdm_po=
rt()
>       net: airoha: Move qos_sq_bmap in airoha_gdm_dev struct
>       net: airoha: Move {cpu,fwd}_tx_packets in airoha_gdm_dev struct
>       net: airoha: Support multiple net_devices for a single FE GDM port
>       net: airoha: Do not stop GDM port if it is shared
>       net: airoha: Introduce WAN device flag
>       net: airoha: Support multiple LAN/WAN interfaces for hw MAC address=
 configuration
>=20
>  .../devicetree/bindings/net/airoha,en7581-eth.yaml |  56 +-
>  drivers/net/ethernet/airoha/airoha_eth.c           | 833 +++++++++++++++=
------
>  drivers/net/ethernet/airoha/airoha_eth.h           |  47 +-
>  drivers/net/ethernet/airoha/airoha_ppe.c           |  43 +-
>  4 files changed, 702 insertions(+), 277 deletions(-)
> ---
> base-commit: 7a348a95f696d20f15c776de4df8b4415bcf3d77
> change-id: 20260324-airoha-eth-multi-serdes-fb4b556ee756
>=20
> Best regards,
> --=20
> Lorenzo Bianconi <lorenzo@kernel.org>
>=20

--az65s5W1t/JkTr+5
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCahbEYQAKCRA6cBh0uS2t
rLVLAP97LnytXlCsUgWwxi7sHBXsDqL4HTn0qSR1j/K68IIUWgEAnGWw3Xw3bdax
jUWz++G6bPA1lorI2Tx+4DUR2tg8UgA=
=FgFf
-----END PGP SIGNATURE-----

--az65s5W1t/JkTr+5--

