Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BB9EC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 15:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JSJYrNhgOhppZDmysPyu0LnxuGVuTI+omogB4HqJOVc=; b=ePl1m4HP4JGV0QlfLExvaTg3B7
	PFuJU26P8h/Ag8kbtSQRv136Ej3j8UiaLNInReA1kMb1opbC3lZgOUHF3HMN5HpaXt60L3wK/P7j6
	NFVonXWIlRXftt6atr7QEoxMPgRuKn2sDIy/2IFxDkz8EdWpUx9AF8hBIjnbroCSrCh51UKi3V/hW
	haGriPnK6UB/+0FSD3PLHOfaw2Ewp/6CRcjXq+mynkXd3Zs23mVP2nSCC1Sb9PUti3pEI8bAr7rqU
	HbA1WNrYBmVcIXQbGKAKT0TLd2uDCotSJkjANYARFZLQtWqy0NrNHmIsqmyI0Ve4gGlkSpl+PC7vz
	AK5n2tZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWzZJ-00000008pV7-1ll9;
	Wed, 02 Jul 2025 15:40:17 +0000
Received: from fhigh-b3-smtp.messagingengine.com ([202.12.124.154])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWylF-00000008fnI-2mQx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 14:48:34 +0000
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id B14027A021F;
	Wed,  2 Jul 2025 10:48:32 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Wed, 02 Jul 2025 10:48:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1751467712;
	 x=1751554112; bh=JSJYrNhgOhppZDmysPyu0LnxuGVuTI+omogB4HqJOVc=; b=
	NktXbBCQByuFoajc90Lz1m3A1h+qLS7ZwtyC6gzEBsdbXOyK2zDpYraaSHu7rutR
	827B+6NKnNsbW89Cu0OgwGi0KEA7ksLCNf9S6h1R1yeiW73FFnciMXR5D49NWM9H
	CoWo/FfQxFdxmx8JnJHF2DC7HhBqfwKezE7MdwMZ2ecGgkOVf0vF0fn2A36VrMGQ
	GpFLY++jDNQaG4oFBXo+Q+Ujc3JdQ+3r2ga/XNWmZ9QhOUGt+aObEe7WyTp9VxOz
	4U/YENf24uLFoW2boqRRgSz+tl5oLNkJc+GUouTmbu2Izqcksz079AmBYpFqNS48
	Zc1sc0Rz9WZGIMgpS2A3aA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1751467712; x=
	1751554112; bh=JSJYrNhgOhppZDmysPyu0LnxuGVuTI+omogB4HqJOVc=; b=Z
	qNGs0kOX1IHcxh7vMz1eqLsB6yhG2SOG7kVPEOYTKHJdmKoTV4u7On/0qObG+c8o
	9GJoJo+Ca6xu1rnrcWWQO5sI4cDbC49q2HUjH3b8MKGcFHVjF2IH2w/kFcvTOU9W
	IUfAzKrNC5Yy+Op+vtIxYo2efBqolTWyWu6gciQ4yOfn5v9iZ+WJL+AP3FqFjP+g
	GJFUx+0Ak0YIDTofYNLc2tS48sVKBvBpMS+Ae6qfQzeQPf4ePokmaPC7Q5MWNYoe
	KUQETEYfxRtLwInJFltZiy1y0Rxd+zBrtLnHJ259B5WLZYvMwAYHZV3URKt2DK2o
	kBvvND96oj2UxffEqLFQw==
X-ME-Sender: <xms:wEZlaKB5dT21vap6UcE6raQn-bA7W3s7rX6jAsLYFDS5XBNigTVDeQ>
    <xme:wEZlaEilwN26rmoCxOMaI198S34UM7ZsetjSGbHvPIN9FtqZ6vUIJlGAiiZkGMt84
    oO6QheP2mp52sQkVzM>
X-ME-Received: <xmr:wEZlaNlnRUXGAn52zK-25djw86qOreo789JU8OTD-96S6MUq0EcSlQMM-xgy30cptuQnuhSLqnrYMNq4i6lHC6wNLINU1Lvz0w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddujeeikecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomheppfhikhhlrghs
    ucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrth
    gvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepveetgedtvddvhfdtkeeghfeffeehteeh
    keekgeefjeduieduueelgedtheekkeetnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgr
    thgvtghhrdhsvgdpnhgspghrtghpthhtohepudeipdhmohguvgepshhmthhpohhuthdprh
    gtphhtthhopeguvghmohhnshhinhhguhhrsehgmhgrihhlrdgtohhmpdhrtghpthhtohep
    tghoshhmihhnrdhtrghnihhslhgrvhesrghnrghlohhgrdgtohhmpdhrtghpthhtohepth
    homhhirdhvrghlkhgvihhnvghnodhrvghnvghsrghssehiuggvrghsohhnsghorghrugdr
    tghomhdprhgtphhtthhopehmtghhvghhrggssehkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhhulhhivghnrdhmrghs
    shhothestgholhhlrggsohhrrgdrtghomhdprhgtphhtthhopehsrghkrghrihdrrghilh
    husheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehlrghurhgvnhhtrdhp
    ihhntghhrghrthesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepghhrvg
    hgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhg
X-ME-Proxy: <xmx:wEZlaIyZyQiQZkqckgp3ruj70dNn1_pYhleQAoCWwA-NNX2WUjbqcQ>
    <xmx:wEZlaPTsHQ-T2nPzTfUU_Mon87pYTd57mzQsDLmHHk80LT5gm5xnpQ>
    <xmx:wEZlaDa4d9zA3f7HeaOgn1h7VeZA8P7c1lVq_7DrCtuq90SNF-Y9bg>
    <xmx:wEZlaISE34Y3nX3ENQBmX1yuz3pYTGpWGc2sffmZrsS3jTkXhnmA5g>
    <xmx:wEZlaGANUj28khHrizasaaSNc9LBrBmioGRvwoW6uNnYZTZ_Ge2lKFzG>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Jul 2025 10:48:31 -0400 (EDT)
Date: Wed, 2 Jul 2025 16:48:30 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v5 21/24] arm64: defconfig: disable deprecated MAX96712
 driver
Message-ID: <20250702144830.GC3830050@ragnatech.se>
References: <20250702132104.1537926-1-demonsingur@gmail.com>
 <20250702132104.1537926-22-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250702132104.1537926-22-demonsingur@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_074833_764166_3ADE1D85 
X-CRM114-Status: GOOD (  17.20  )
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

HI Cosmin,

Thanks for your work.

On 2025-07-02 16:20:47 +0300, Cosmin Tanislav wrote:
> The staging MAX96712 driver will be removed as its functionality has
> been moved to the MAX96724 driver which makes use of the Maxim
> GMSL2/3 deserializer framework.
> 
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> ---
>  arch/arm64/configs/defconfig | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 897fc686e6a9..6f4254f562da 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1300,7 +1300,6 @@ CONFIG_GREYBUS=m
>  CONFIG_GREYBUS_BEAGLEPLAY=m
>  CONFIG_STAGING=y
>  CONFIG_STAGING_MEDIA=y
> -CONFIG_VIDEO_MAX96712=m

I wonder, should this not be replaced with the new symbol 
CONFIG_VIDEO_MAX96724?

>  CONFIG_VIDEO_MESON_VDEC=m
>  CONFIG_SND_BCM2835=m
>  CONFIG_CHROME_PLATFORMS=y
> -- 
> 2.50.0
> 

-- 
Kind Regards,
Niklas Söderlund

