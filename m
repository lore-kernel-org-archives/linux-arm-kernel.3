Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D2A8CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 12:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LT8UUy5Ej3UyVlJPtvk5iRBgSEzEU437pG46R+ymarY=; b=uEszN+jXyv3PvW7+g2aVaa05cY
	a30Bj9JI/Es67nqxXtctuijK3r7kEiTR0jTcT+j1wFLQ4WF/eHZ8lzbkZ8rjo+DtRMTOKv2IY1J+z
	QAW9gMRTyxHeP4TPCAfF4nfIagIMZh4qd8xxU0MiRlnAYuJytKK3g4epnXbSndMiWYJnur1vmCC/S
	g1R+u7awbBa7lm5l3jHRqtVYwvhj/56+UTCqsIy2llrBpB3mGphUZVyKssebwpi/EeNkJ36V7V+pT
	8GtZVcnbHq+3U0n818EXMuw92kQutex/Qe0HkdUo3ZOMu4KB2zAvIRRZnEVt93y+0fwVdj7T7pWxu
	WlcelnKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vApKB-0000000DcvN-22bT;
	Mon, 20 Oct 2025 12:49:19 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vApKA-0000000Dcv8-2z59;
	Mon, 20 Oct 2025 12:49:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=LT8UUy5Ej3UyVlJPtvk5iRBgSEzEU437pG46R+ymarY=; b=Sckcs4B1DMoAf+R+VKASmCSlsH
	UuL+8/5Vq90WXxiopcDXRshB2d5vkuJvC3PgnMB/kGlJ2caebfPirKbSLfWlkqJveSHiLZ5Rw6DPB
	N0nN8UewjWozirdXYg4fq9t47zUJP9gAie6eeDbdp28wsejDHLtJxmE6APQHdIEMuATHYkoMZ9KUm
	yArDJVdESTMjXJL4Qyy5/hjKWU9d1WUrwiGGweNSz03q7nDWX6YQUjiOIA5qfV+/Ynz4OF+ZVFXlP
	+v1/1M4VWmvvgrMaOCkB1RhWET3LLS0+nG+BwlOwU4x9ejvQu8SRItzGrLV+SCX3Ga97a89XZbF9o
	IIXsIixA==;
Received: from gloria.sntech.de ([185.11.138.130])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vApK6-00000007Ug6-2zGb;
	Mon, 20 Oct 2025 12:49:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=LT8UUy5Ej3UyVlJPtvk5iRBgSEzEU437pG46R+ymarY=; b=t8qVnE7A5m3NrSDtXnEhrdx7oQ
	GuDvt4aKjvYuD5KxLgHuTFwBuvqYZ9xOEN2q90ikgdkzDwTlxrWocmflwGb5z0hRiDqz9U42cRdsY
	R8CSpzsS/ZEJtBp9gv3OYLvpTjZMxMaIUK+4C0w00Uz9daMN2Di6EUosKmxapNblnFB+X/NiLGc/H
	qCxsAPlLyz8ZGipQgIaxh/OqFIgkbxHGGI1KOrRG0N2mGDV9aM65nPqC6jOiIIRLiC5/98VpfpckX
	P1il/ZXHNeecX9PH6kATylv9hWtIsXJuHTmAwj06x1g80o9a9JnAmL0h55UKbHb/Sp9kzBIIq5MPE
	z47iTySw==;
Received: from [141.76.253.240] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vApK3-0001CH-4r; Mon, 20 Oct 2025 14:49:11 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Quentin Schulz <quentin.schulz@cherry.de>, mturquette@baylibre.com,
 sboyd@kernel.org, zhangqing@rock-chips.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH] clk: rockchip: rk3588: Don't change PLL rates when setting
 dclk_vop2_src
Date: Mon, 20 Oct 2025 14:49:10 +0200
Message-ID: <4856104.usQuhbGJ8B@phil>
In-Reply-To: <eumxn7lvp34si2gik33hcavcrsstqqoxixiznjbertxars7zcx@xsycorjhj3id>
References: <20251008133135.3745785-1-heiko@sntech.de> <2749454.BddDVKsqQX@diego>
 <eumxn7lvp34si2gik33hcavcrsstqqoxixiznjbertxars7zcx@xsycorjhj3id>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_134916_003662_B9275B85 
X-CRM114-Status: GOOD (  18.58  )
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

Am Donnerstag, 16. Oktober 2025, 00:57:15 Mitteleurop=C3=A4ische Sommerzeit=
 schrieb Sebastian Reichel:
> Hi,
>=20
> On Wed, Oct 15, 2025 at 03:27:12PM +0200, Heiko St=C3=BCbner wrote:
> > Am Mittwoch, 15. Oktober 2025, 14:58:46 Mitteleurop=C3=A4ische Sommerze=
it schrieb Quentin Schulz:
> > > Hi Heiko,
> > >=20
> > > On 10/8/25 3:31 PM, Heiko Stuebner wrote:
> > > > dclk_vop2_src currently has CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_R=
EPARENT
> > > > flags set, which is vastly different than dclk_vop0_src or dclk_vop=
1_src,
> > > > which have none of those.
> > > >=20
> > > > With these flags in dclk_vop2_src, actually setting the clock then =
results
> > > > in a lot of other peripherals breaking, because setting the rate re=
sults
> > > > in the PLL source getting changed:
> > > >=20
> > > > [   14.898718] clk_core_set_rate_nolock: setting rate for dclk_vop2=
 to 152840000
> > > > [   15.155017] clk_change_rate: setting rate for pll_gpll to 168000=
0000
> > > > [ clk adjusting every gpll user ]
> > > >=20
> > > > This includes possibly the other vops, i2s, spdif and even the uart=
s.
> > > > Among other possible things, this breaks the uart console on a board
> > > > I use. Sometimes it recovers later on, but there will be a big block
> > >=20
> > > I can reproduce on the same board as yours and this fixes the issue=20
> > > indeed (note I can only reproduce for now when display the modetest=20
> > > pattern, otherwise after boot the console seems fine to me).
> >=20
> > I boot into a Debian rootfs with fbcon on my system, and the serial
> > console produces garbled output when the vop adjusts the clock
> >=20
> > Sometimes it recovers after a bit, but other times it doesn't
> >=20
> > > Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
> > > Tested-by: Quentin Schulz <quentin.schulz@cherry.de> # RK3588 Tiger w=
/DP carrierboard
>=20
> I'm pretty sure I've seen this while playing with USB-C DP AltMode
> on Rock 5B. So far I had no time to investigate further.
>=20
> What I'm missing in the commit message is the impact on VOP. Also
> it might be a good idea to have Andy in Cc, so I've added him.

Hmm, it brings VP2 in line with the other two VPs, only VP2 had this
special setting - even right from the start, so it could very well
have been left there accidentially during submission.

So in the end VP2 will have to deal with this, because when the VP
causes a rate change in the GPLL, this changes so many clocks of
other possibly running devices. Not only the uart, but also emmc
and many more. And all those devices do not like if their clock gets
changed under them I think.


Heiko



