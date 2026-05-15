Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42727CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 11:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Cc:To
	:Subject:Message-ID:From:Content-Transfer-Encoding:Content-Type:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xY+E/upLJxEjmvM3j7C4ks+xfWlSY3E/fLSmuAvnhNI=; b=tZhBYayKWbMTOVKGqRVfy9YWQZ
	WQ9pUkerdBBy7jsvflQliujElYmxDGaXpuro3WO8VnLaerlmyrO0clf8nGEvu3aIXk0Ovyxyb6X9W
	4Sd1FJjT0CPtY0RLo78KtyANe0wiv9Vi5AwaxkdOJJNeZIfKqRwwF9MWQjdehbJ2r1orqjRGNcSm6
	+vX8LROfcIvYd/hft0WOmXcG29vBC2uguBqHvvD7ehCqeZ8VpNhZd4dPV15C6ryD/EYm/gxvfGxiG
	K4DeNbC5lM1Kdii9y+SCcIuGw7BPCPXuKmrptZBiGGtRgjAjuDnsQ/NPxBDBZRjAbcwGh4oy9Ce9f
	7xhd0F2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNqU3-000000089NJ-0O9t;
	Fri, 15 May 2026 11:13:35 +0000
Received: from out-185.mta0.migadu.com ([2001:41d0:1004:224b::b9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNqTz-000000089K2-1lEO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 11:13:32 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1778843595;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xY+E/upLJxEjmvM3j7C4ks+xfWlSY3E/fLSmuAvnhNI=;
	b=OaF/xShMio5pJ01/fel5DMXE3YdlVSumEvuZa6aNn7Uw9tp/Z2OdB1rsusp8RHJiyyZ902
	JGsr6f2ap+f4Hdsp637l3HEhTcuEjc0TP1tskvJ/pGVqoUisBO2ugLoqT8yY3ovM4ArsZZ
	+mjHogAd+q2BkujTSSCy1GoKAvIacKw=
Date: Fri, 15 May 2026 11:13:05 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Frank Wunderlich" <frank.wunderlich@linux.dev>
Message-ID: <935a73a6e458b2d4fed2e59192e725483ca62126@linux.dev>
TLS-Required: No
Subject: Re: [net-next v8 2/3] net: ethernet: mtk_eth_soc: Add RSS support
To: "Jakub Kicinski" <kuba@kernel.org>, "Mason Chang"
 <mason-cw.chang@mediatek.com>
Cc: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 netdev@vger.kernel.org, "Russell King" <linux@armlinux.org.uk>,
 linux-kernel@vger.kernel.org, "Andrew Lunn" <andrew+netdev@lunn.ch>,
 "Eric Dumazet" <edumazet@google.com>, linux-mediatek@lists.infradead.org,
 "Daniel Golle" <daniel@makrotopia.org>, "Matthias Brugger"
 <matthias.bgg@gmail.com>, "Paolo Abeni" <pabeni@redhat.com>, "Lorenzo
 Bianconi" <lorenzo@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, "Felix Fietkau" <nbd@nbd.name>,
 "Frank Wunderlich" <linux@fw-web.de>
In-Reply-To: <20260513185625.48e69837@kernel.org>
References: <20260509190938.169290-1-linux@fw-web.de>
 <20260509190938.169290-3-linux@fw-web.de>
 <20260513185625.48e69837@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_041331_668827_05E04586 
X-CRM114-Status: GOOD (  17.23  )
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

Hi Jakub,

thanks for your review, i have to discuss the previous parts (AI-review)
with MTK on how to make it better. The changes there seem not trivial for
me and this will take some time.

Am 14. Mai 2026 um 03:56 schrieb "Jakub Kicinski" <kuba@kernel.org>:
>=20
>=20On Sat, 9 May 2026 21:09:31 +0200 Frank Wunderlich wrote:
>=20
>=20>=20
>=20> From: Mason Chang <mason-cw.chang@mediatek.com>
> >=20=20
>=20>  Add support for Receive Side Scaling.
> >=20=20
>=20>  We can adjust SMP affinity with the following command:
> >  echo [CPU bitmap num] > /proc/irq/[virtual IRQ ID]/smp_affinity,
> >  with interrupts evenly assigned to 4 CPUs, we were able to measure
> >  an RX throughput of 7.3Gbps using iperf3 on the MT7988. Further
> >  optimizations will be carried out in the future.
> >=20
>=20Would be great to split this up a little more for ease of review.

you mean splitting the code into more separate patches or the commit desc=
ription?

> >=20
>=20> +static int mtk_rss_init(struct mtk_eth *eth)
> >  +{
> >  + const struct mtk_soc_data *soc =3D eth->soc;
> >  + const struct mtk_reg_map *reg_map =3D eth->soc->reg_map;
> >  + struct mtk_rss_params *rss_params =3D &eth->rss_params;
> >=20
>=20reverse xmas tree should be followed, please fix everywhere in this
> submission=20

will=20check again when we have the fixed flow (AI-review).

> >=20
>=20>  +/* struct mtk_rss_params - This is the structure holding paramete=
rs
> >  + * for the RSS ring
> >  + * @hash_key The element is used to record the
> >  + * secret key for the RSS ring
> >  + * indirection_table The element is used to record the
> >  + * indirection table for the RSS ring
> >  + */
> >=20
>=20Quite odd looking comment. Having the right side aligned like that
> makes it header to correlate where doc for fields start.
> And there's @ missing for indirection_table.

dito

@Mason: have you found some time for looking into the AI suggestions?
Maybe it is better discussing changes here if they match upstream
requirements as i did only up-port the SDK-patches with some small
changes and made tests :)
As a note: i have not activated RSS/LRO on other mt798x because it was
not clear, if RSS or LRO is better for them and only mt7988 can do both
simultanously. AI also complained about it. And this decision causes
changes in code too.
It would be great if you can use the actual state here as base for
changes so that i do not miss anything when upporting the SDK state again=
.

regards Frank

