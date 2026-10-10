Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83DA9CA6004
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 12:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lYOFjMpVr4WN+qRu9eA734M8lkHfX01y6pvWM4sirYg=; b=DR/C+p/YAOWBOF/96BP7QkisS8
	y/nW6X1hY1j4ibtQdx7rj+aKsXXlF6dKBKi2S2E/wnltjEGz/tBrjS+4Kh16MDxASKUauKZtDyJFi
	ClBYaNxlNfIjeaajtdPgTE54QgLFvzkbwaECCPsIYu/ZT5i8xCMnOVSkNSvrWYdZQq9ygK6JkD5Or
	/jewqeIyaAmK3CuMjpyMvw0rj7hGSHkFdYhJ9sY3/hZbccinnu/TVBFC3ciKQ53gbpPz9M5v0mWrx
	5ZTDOTxnDH+qUuP3oTLyc99bXBNKv1O2JK0lZsih+PGrYmewuvUmpplihP54ta9axvSkcdrFVJe+G
	rmBd+LKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFVgK-00000007xtY-0ok9;
	Sat, 10 Oct 2026 11:56:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFVg8-00000007xlV-3kbb
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 11:55:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 401516021E;
	Sat, 10 Oct 2026 11:55:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 651B61F00899;
	Sat, 10 Oct 2026 11:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791633352;
	bh=lYOFjMpVr4WN+qRu9eA734M8lkHfX01y6pvWM4sirYg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=CeHcW2ERLBuC6Up5uI5UXx5BTnnYEQGohyxV7/c/st6ANYdHVOl9EJxzOGsFQ3WtW
	 J/Pn1IOoOOLenL4/krxpwKNcZQcwjzqgjcyanfZ+2rKpTNZSV41pBShH6P6oWyQkW1
	 o6dlfALqinPOFhyrcdNKG920Q7ZPbckSG1HHOhRKi2kxvU3OlcXDWnRNGOYgiRP8Hl
	 l32kTgedAsJnN/3qJ3ppWs4mNx8sE0OnLbiCdhMHrQVqtjRQ7N7ZrG46HLJzizUs4d
	 M8knvTJNmM+hcuBEdfmmwhNwYagnBv5Zaxj36D4KTDUQt5CYJ0bIiyZHRJenF0FbI5
	 bLhY5vktHVudA==
Subject: Re: [PATCH net-next 5/5] net: sparx5: Offload tc port policers via matchall
From: netdev-bot+sashiko@kernel.org
To: daniel.machon@microchip.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, Steen.Hegelund@microchip.com,
 UNGLinuxDriver@microchip.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Sat, 10 Oct 2026 11:55:50 +0000
Message-ID: <179163335091.434549.13455893877586878292@kernel.org>
In-Reply-To: =?utf-8?q?=3C20261009-b4-lan966x-pci-fdma-sparx5-lan969x-port-p?=
 =?utf-8?q?olicers-v1-5-4916708a7ea2=40microchip=2Ecom=3E?=
References: =?utf-8?q?=3C20261009-b4-lan966x-pci-fdma-sparx5-lan969x-port-po?=
 =?utf-8?q?licers-v1-5-4916708a7ea2=40microchip=2Ecom=3E?=
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 3 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The driver refuses police offload on shared ingress blocks,
  but it does not refuse a police action that is shared between ports by…
- [Medium] The new police offload ignores the police action's MTU limit.
- [Medium] The offloaded matchall policer meters line rate, but tc police
  meters data rate.

--

net: sparx5: Offload tc port policers via matchall

This commit offloads a tc matchall filter with a police action to the
sparx5 per-port ingress policer. Offload is limited to ingress, chain 0,
protocol all, non-shared blocks, drop as the exceed action, and one
policer per port. Pass and drop counts are reported through the matchall
stats.

> diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_tc_matchall.c b/drivers/net/ethernet/microchip/sparx5/sparx5_tc_matchall.c
> index 146d7f28e8f3d..5bf17c52e564e 100644
> --- a/drivers/net/ethernet/microchip/sparx5/sparx5_tc_matchall.c
> +++ b/drivers/net/ethernet/microchip/sparx5/sparx5_tc_matchall.c
> @@ -43,6 +43,13 @@ sparx5_tc_matchall_parse_mirror_action(struct sparx5_mall_entry *entry,
>  	entry->mirror.port = netdev_priv(action->dev);
>  }
>  
> +static void
> +sparx5_tc_matchall_parse_port_policer_action(struct sparx5_mall_entry *entry,
> +					     struct flow_action_entry *action)
> +{
> +	entry->port_policer.police = action->police;
> +}

[Severity: Medium]
Can a police action that is shared by index across ports end up
over-admitting traffic here?

sparx5_add_port_policer() refuses shared ingress blocks, because a shared
police instance has one aggregate rate:

drivers/net/ethernet/microchip/sparx5/sparx5_police.c:sparx5_add_port_policer() {
    ...
	if (entry->port->tc.ingress_block_shared) {
		NL_SET_ERR_MSG_MOD(extack,
				   "Policer is not supported on shared ingress blocks");
    ...
}

A police action shared by index has the same aggregate semantics. Take
this example:

  tc filter add dev eth0 ingress matchall skip_sw \
      action police index 5 rate 1mbit burst 10k conform-exceed drop
  tc filter add dev eth1 ingress matchall skip_sw action police index 5

In software this is a single token bucket covering both ports.
tc_setup_action() passes the shared index to drivers as
entry[k].hw_index = act->tcfa_index. However,
sparx5_tc_matchall_parse_port_policer_action() copies only
action->police, so the index is lost.

Each port then gets its own full-rate policer
(pol.rate = police->rate_bytes_ps * BITS_PER_BYTE). With skip_sw, the
hardware passes N times the configured aggregate rate across N ports.

Should action->hw_index be tracked, and a police action already offloaded
on another port be rejected? It looks like the lan966x and ocelot
matchall paths have the same gap.

>  static int sparx5_tc_matchall_replace(struct net_device *ndev,
>  				      struct tc_cls_matchall_offload *tmo,
>  				      bool ingress)
> @@ -98,6 +105,30 @@ static int sparx5_tc_matchall_replace(struct net_device *ndev,

[ ... ]

> +		sparx5_tc_matchall_parse_port_policer_action(mall_entry,
> +							     action);
> +		err = sparx5_add_port_policer(mall_entry, tmo->common.extack);

[Severity: Medium]
Is the police action's MTU limit dropped on this path?

tcf_police_offload_act_setup() exports the MTU as entry->police.mtu.
sparx5_add_port_policer() rejects peakrate, avrate, overhead and
rate_pkt_ps, but it never checks police->mtu. It programs only type,
rate, burst and idx.

In software, tcf_police_act() takes the exceed action whenever
tcf_police_mtu_check() fails, whatever the token state. When no mtu is
given, tcf_police_init() still sets a finite default:

net/sched/act_police.c:tcf_police_init() {
    ...
		if (R_tab)
			new->tcfp_mtu = 255 << R_tab->rate.cell_log;
    ...
}

With iproute2's default rate table this works out to 2040 bytes.
Software drops frames over that limit, whether it comes from an explicit
"mtu 512" or from jumbo frames under the default. Within rate, the
offloaded hardware policer would forward those same frames.

The flower path in the same driver honours this value
(sf.max_sdu = act->police.mtu in sparx5_tc_flower.c). Should the matchall
path reject, or otherwise handle, a police->mtu the port policer cannot
enforce?

[Severity: Medium]
Does the offloaded policer meter a different rate than tc police
configures?

sparx5_port_policer_conf_set() always programs a 20-byte per-frame gap:

drivers/net/ethernet/microchip/sparx5/sparx5_police.c:sparx5_port_policer_conf_set() {
    ...
	spx5_rmw(ANA_AC_POL_PORT_GAP_GAP_VALUE_SET(SPX5_POLICER_LINE_RATE_GAP),
		 ANA_AC_POL_PORT_GAP_GAP_VALUE,
		 sparx5, ANA_AC_POL_PORT_GAP(portno));
    ...
}

As a result, each frame is charged its length plus 20 bytes of IFG and
preamble. The software police action charges only qdisc_pkt_len(), plus
any user-set overhead.

sparx5_add_port_policer() also rejects a user-supplied police->overhead,
so the user cannot compensate in either direction. With 64-byte frames
the hardware charges 84 bytes per frame and passes only about 55-70% of
the configured rate.

The earlier commit "net: sparx5: Add hardware programming for the port
policer" says this line-rate metering is as on lan966x and ocelot. The
in-tree code seems to do the opposite:

drivers/net/ethernet/mscc/ocelot_police.c:ocelot_port_policer_add() {
    ...
	pp.mode = MSCC_QOS_RATE_MODE_DATA;
    ...
}

ocelot maps that mode to POL_MODE_DATARATE (excl IPG). lan966x_police_add()
uses ANA_POL_MODE_FRM_MODE_SET(1), which is also data rate in this
policer family.

Should the gap be 0 for tc matchall police offload, so the hardware
matches the data-rate semantics of tc police?

> +		if (err) {
> +			kfree(mall_entry);
> +			return err;
> +		}
> +
>  		break;

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261009-b4-lan966x-pci-fdma-sparx5-lan969x-port-policers-v1-0-4916708a7ea2%40microchip.com

