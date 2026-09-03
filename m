Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74C0FC624D4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 07:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5GkSAaCG350SAl1zxcLpmMMG3tbN6pPeH4jbwcaEpKo=; b=l2S2Cny4+gTgQkK5tqcZ1GVZTL
	JaIgYnJhIiUL1vR67k4vg0disMvQTVltAoVYsVzAoT57govrSme4PsBTH3rhTSiiiL8jvhDdP/9pR
	WvCnJERf7RU/bTZmTx6W8izqSl6rmRDVK9NF1djb8NarathvND95s2iaQl51F+TPYqVioHccG9/6t
	g5treZoWhP+yB8DUtWEHtJJrUG2uJQ017KHdyynFwq39r3F99/mjLxpFepf6q8JBIBtlrixs3J6E/
	GYomM++I7SL3/KS4XcNiXFLlhtFq3puQ1UHutLBiLWpvWpx+Rd6fu4mfHRcBJWEikpHcM5mhmz4qk
	wzoamZlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x21xU-0000000GbLo-2dDs;
	Thu, 03 Sep 2026 07:34:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x21xT-0000000GbKc-177s;
	Thu, 03 Sep 2026 07:34:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B2DF6600D1;
	Thu,  3 Sep 2026 07:34:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E37B01F00A3A;
	Thu,  3 Sep 2026 07:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788420842;
	bh=5GkSAaCG350SAl1zxcLpmMMG3tbN6pPeH4jbwcaEpKo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZDwvEL2+aZNNZq3hP93/rcWqMkJ8wqyx6CZCJ9Q0BtJLn+hcyzHO7VniI99Jesa27
	 dmK3AkwWosiN4Mq1UXXGVaTkfUtgSg7RUV8ON6J25532SDJ6GZXtBTe5UDs1ggIdjx
	 64OH9LReO2Xb7sXrp3DyYbn2g7kqtd7yLCkkIrIEg22BTj3GPyZgx6pa31ZZHv0L0F
	 oRN2GvybqjenPh58fByVfnDQ2tElC1SWn+p4kl5IA0soU80ZgxerNwCrvyL5SGAtjS
	 PHKazOL2AjvMoSsavXSvUt4MUu+qB9oRpp4mCi+VlGJsYarvF3IERAtzPa3NfjVcd0
	 yHhBKHmhSRDHw==
Date: Thu, 3 Sep 2026 09:34:00 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Julius Bairaktaris <julius@bairaktaris.de>
Cc: pablo@netfilter.org, fw@strlen.de, phil@nwl.cc,
	netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
	netdev@vger.kernel.org, nbd@nbd.name, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, horms@kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH nf-next v2 1/2] netfilter: flowtable: carry a priority
 into the offload
Message-ID: <apki6MFlE_cIbSh8@lore-desk>
References: <20260902155136.4963-1-julius@bairaktaris.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SZuuf3m7Y4yQR9kG"
Content-Disposition: inline
In-Reply-To: <20260902155136.4963-1-julius@bairaktaris.de>
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

--SZuuf3m7Y4yQR9kG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> The packets the flowtable forwards bypass the rules that classified
> the connection, so a priority set by "meta priority set" ahead of
> "flow add" reaches the qdisc only on the packets that traversed the
> ruleset before the flow existed; the rest keep the priority they
> arrived with, which for a forwarded packet is normally none. A flow
> rule handed to a driver has the same gap: it describes NAT,
> encapsulation and the output device, but not how the flow should be
> treated on the way out, so hardware with priority queues can only
> fall back on the DSCP the packet carries.
>=20
> Store skb->priority of the packet that created the flow. The software
> fast path applies it to the packets it forwards; the hardware path
> emits it as FLOW_ACTION_PRIORITY, the action act_skbedit already
> emits on the tc path, so the rule handed to the driver describes what
> the software path does. A flow without a priority emits no action and
> leaves skb->priority of the packets it forwards alone.
>=20
> Of the in-tree consumers of these rules, mtk and airoha ignore the new
> action as they do FLOW_ACTION_CSUM. mlx5 has no parser for it and
> rejects the rule, so a flow with a priority stays on the software path
> there, as a flow with PPPoE encapsulation already does.
>=20
> The flowtable holds one flow for both directions and the expression
> runs once, so the priority applies to both; per-direction
> classification is not carried.
>=20
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
> ---
> Changes in v2:
> - apply the priority on the software fast path as well, in the IPv4
>   and IPv6 flowtable hooks, so a flow forwarded in software and one
>   forwarded by hardware get the same treatment (Lorenzo Bianconi)
> - describe it in nf_flowtable.rst
> - add the selftest in 2/2
>=20
> v1: https://lore.kernel.org/netfilter-devel/20260901092632.369248-1-juliu=
s@bairaktaris.de/

Hi Julius,

I think this patch is technically correct (just a nit inline), but IIRC Pab=
lo
would lean towards to a more general solution where you can specify these n=
ew
parameters (e.g. priority) inside the flowtable nft configuration. @Pablo?

Regards,
Lorenzo

>=20
> The consumer of the emitted action is a DSA driver for the IPQ8074 PPE,
> maintained in OpenWrt; measured there, "meta priority set" ahead of
> "flow add" places hardware-offloaded flows in the port's priority
> queues, and with hardware offload disabled a 30 MB IPv4 and a 30 MB
> IPv6 transfer both land in the stamped priority band with only the
> handshake traversing the ruleset. The selftest in 2/2 passes on this
> series and fails on the base commit, x86_64 under QEMU, three runs
> each. The mtk and airoha hunks are compile-tested only. The new field
> grows struct flow_offload by eight bytes on 64-bit; the entry allocates
> from its own kmem_cache, so no allocation-class change.
>=20
>  Documentation/networking/nf_flowtable.rst       |  4 +++-
>  drivers/net/ethernet/airoha/airoha_ppe.c        |  1 +
>  drivers/net/ethernet/mediatek/mtk_ppe_offload.c |  1 +
>  include/net/netfilter/nf_flow_table.h           |  1 +
>  net/netfilter/nf_flow_table_ip.c                |  6 ++++++
>  net/netfilter/nf_flow_table_offload.c           | 11 +++++++++++
>  net/netfilter/nft_flow_offload.c                |  5 +++++
>  7 files changed, 28 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/networking/nf_flowtable.rst b/Documentation/ne=
tworking/nf_flowtable.rst
> index d757c21c10f2..5844ab19aec6 100644
> --- a/Documentation/networking/nf_flowtable.rst
> +++ b/Documentation/networking/nf_flowtable.rst
> @@ -71,7 +71,9 @@ forwarding path including the Netfilter hooks and the f=
lowtable fastpath bypass.
> =20
>  The flowtable entry also stores the NAT configuration, so all packets are
>  mangled according to the NAT policy that is specified from the classic IP
> -forwarding path. The TTL is decremented before calling neigh_xmit(). Fra=
gmented
> +forwarding path. The TTL is decremented before calling neigh_xmit(). The=
 flow
> +also stores the priority of the packet that created it, so a priority se=
t before
> +``flow add`` applies to the packets that the flowtable forwards. Fragmen=
ted
>  traffic is passed up to follow the classic IP forwarding path given that=
 the
>  transport header is missing, in this case, flowtable lookups are not pos=
sible.
>  TCP RST and FIN packets are also passed up to the classic IP forwarding =
path to
> diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ether=
net/airoha/airoha_ppe.c
> index 92611802801e..2afce76ad131 100644
> --- a/drivers/net/ethernet/airoha/airoha_ppe.c
> +++ b/drivers/net/ethernet/airoha/airoha_ppe.c
> @@ -1161,6 +1161,7 @@ static int airoha_ppe_flow_offload_replace(struct a=
iroha_eth *eth,
>  		case FLOW_ACTION_REDIRECT:
>  			odev =3D act->dev;
>  			break;
> +		case FLOW_ACTION_PRIORITY:

here you can do something like:

diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/etherne=
t/airoha/airoha_ppe.c
index 92611802801e..e790305ea955 100644
--- a/drivers/net/ethernet/airoha/airoha_ppe.c
+++ b/drivers/net/ethernet/airoha/airoha_ppe.c
@@ -1161,6 +1161,9 @@ static int airoha_ppe_flow_offload_replace(struct air=
oha_eth *eth,
 		case FLOW_ACTION_REDIRECT:
 			odev =3D act->dev;
 			break;
+		case FLOW_ACTION_PRIORITY:
+			priority =3D act->priority;
+			break;
 		case FLOW_ACTION_CSUM:
 			break;
 		case FLOW_ACTION_VLAN_PUSH:

>  		case FLOW_ACTION_CSUM:
>  			break;
>  		case FLOW_ACTION_VLAN_PUSH:
> diff --git a/drivers/net/ethernet/mediatek/mtk_ppe_offload.c b/drivers/ne=
t/ethernet/mediatek/mtk_ppe_offload.c
> index 99b28aaa7cc4..4ee99e8e4a34 100644
> --- a/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
> +++ b/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
> @@ -378,6 +378,7 @@ mtk_flow_offload_replace(struct mtk_eth *eth, struct =
flow_cls_offload *f,
>  		case FLOW_ACTION_REDIRECT:
>  			odev =3D act->dev;
>  			break;
> +		case FLOW_ACTION_PRIORITY:
>  		case FLOW_ACTION_CSUM:
>  			break;
>  		case FLOW_ACTION_VLAN_PUSH:
> diff --git a/include/net/netfilter/nf_flow_table.h b/include/net/netfilte=
r/nf_flow_table.h
> index f2e2771f188f..23218c8cbc3d 100644
> --- a/include/net/netfilter/nf_flow_table.h
> +++ b/include/net/netfilter/nf_flow_table.h
> @@ -202,6 +202,7 @@ struct flow_offload {
>  	unsigned long				flags;
>  	u16					type;
>  	u32					timeout;
> +	u32					priority;
>  	struct rcu_head				rcu_head;
>  };
> =20
> diff --git a/net/netfilter/nf_flow_table_ip.c b/net/netfilter/nf_flow_tab=
le_ip.c
> index c8c29a9a1684..c85e2d608c32 100644
> --- a/net/netfilter/nf_flow_table_ip.c
> +++ b/net/netfilter/nf_flow_table_ip.c
> @@ -509,6 +509,9 @@ static int nf_flow_offload_forward(struct nf_flowtabl=
e_ctx *ctx,
>  	ip_decrease_ttl(iph);
>  	skb_clear_tstamp(skb);
> =20
> +	if (flow->priority)
> +		skb->priority =3D flow->priority;
> +
>  	if (flow_table->flags & NF_FLOWTABLE_COUNTER)
>  		nf_ct_acct_update(flow->ct, tuplehash->tuple.dir, skb->len);
> =20
> @@ -1104,6 +1107,9 @@ static int nf_flow_offload_ipv6_forward(struct nf_f=
lowtable_ctx *ctx,
>  	ip6h->hop_limit--;
>  	skb_clear_tstamp(skb);
> =20
> +	if (flow->priority)
> +		skb->priority =3D flow->priority;
> +
>  	if (flow_table->flags & NF_FLOWTABLE_COUNTER)
>  		nf_ct_acct_update(flow->ct, tuplehash->tuple.dir, skb->len);
> =20
> diff --git a/net/netfilter/nf_flow_table_offload.c b/net/netfilter/nf_flo=
w_table_offload.c
> index 801a3dd9ceea..caaadffc2563 100644
> --- a/net/netfilter/nf_flow_table_offload.c
> +++ b/net/netfilter/nf_flow_table_offload.c
> @@ -696,6 +696,17 @@ nf_flow_rule_route_common(struct net *net, const str=
uct flow_offload *flow,
>  	    flow_offload_eth_dst(net, flow, dir, flow_rule) < 0)
>  		return -1;
> =20
> +	if (flow->priority) {
> +		struct flow_action_entry *entry;
> +
> +		entry =3D flow_action_entry_next(flow_rule);
> +		if (!entry)
> +			return -1;
> +
> +		entry->id =3D FLOW_ACTION_PRIORITY;
> +		entry->priority =3D flow->priority;
> +	}
> +
>  	tuple =3D &flow->tuplehash[dir].tuple;
> =20
>  	for (i =3D 0; i < tuple->encap_num; i++) {
> diff --git a/net/netfilter/nft_flow_offload.c b/net/netfilter/nft_flow_of=
fload.c
> index 32b4281038dd..ca91924b4de3 100644
> --- a/net/netfilter/nft_flow_offload.c
> +++ b/net/netfilter/nft_flow_offload.c
> @@ -117,6 +117,11 @@ static void nft_flow_offload_eval(const struct nft_e=
xpr *expr,
>  	if (tcph)
>  		flow_offload_ct_tcp(ct);
> =20
> +	/* The packets the flow forwards in its place bypass the rules that
> +	 * classified this one; carry the result with the flow.
> +	 */
> +	flow->priority =3D pkt->skb->priority;
> +
>  	__set_bit(NF_FLOW_HW_BIDIRECTIONAL, &flow->flags);
>  	ret =3D flow_offload_add(flowtable, flow);
>  	if (ret < 0)
>=20
> base-commit: 91ec2035134982b98fab0609a9fd8480e8217dc1
> --=20
> 2.53.0
>=20

--SZuuf3m7Y4yQR9kG
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCapki6AAKCRA6cBh0uS2t
rL3cAQDhh9diYlmQ+5GMLhPnY3Z6AsI2DGeRr8ELV50bah/oygD8Cp99E+LhGw66
QbWI7C7cV/H/HSfT+2y6wvO/i2UA4gQ=
=zywy
-----END PGP SIGNATURE-----

--SZuuf3m7Y4yQR9kG--

