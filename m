Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9C9FC02181
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jan 2025 11:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/spJSHqIQvCifSPNA5IORZa7iILcSbhvBOGPaB29zc0=; b=YsZnOK/KRA5+KAS5rCfvBHGNBH
	g4jGBb7hLhVvdjZA5tAw2Hah2DILLo4c1eAFmG45DOzHg0wbZVSCeqfh+DYgVi4xBkEoNqSsivi5L
	NQUg2rohSwD2BlAmjA8zlGar9oGg56KEWwtsp5BwVav/UG6coiMu2xvblpXGZ6xyVgkiEGHEO7IX6
	dagpVkT4bUfD6l3jyihTDlmxyF5n5QPizBvuBjKdEN6u2ZQqal4Z1TR5b4QB5Cn3w0xVcZB8YNQUr
	v/oOCK7CX0KTzb5kzqnoQbz4Dbow7WYPX0RTAKlD20p9Y5xZIWpHBUemsAnKJgyB1VvkdKiexYfLn
	pglmBi3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tc0x0-0000000HMKy-11bX;
	Sun, 26 Jan 2025 11:37:14 +0000
Received: from fhigh-b1-smtp.messagingengine.com ([202.12.124.152])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tc0vi-0000000HMGF-1FbZ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jan 2025 11:35:55 +0000
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfhigh.stl.internal (Postfix) with ESMTP id B9F90254015C;
	Sun, 26 Jan 2025 06:35:49 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Sun, 26 Jan 2025 06:35:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1737891349; x=1737977749; bh=/spJSHqIQvCifSPNA5IORZa7iILcSbhvBOG
	PaB29zc0=; b=Y8tmgiwrz6KcJXnRZjLSOg+mPrFgoJjHoRFJ90cUjs7pBizfn31
	JSTsv+sqG5ucSP+iXM83meBKt1kDutS/Sut2VTfg19vExS73lsIYnBmudDLDHIDw
	fWTUNKW3br6oYNEDlSVEdLAk744nvdTUVvxXF8N2BwwlWwKhFYxluqk3y3iytkL/
	0R5HvA7eIGpCcG7oepVIo9+n+n2VzdWOBDtfeM0o5SLgkWiC2JyV59KoIvbpOtyC
	qCN8/ZJ3BfTpBNzjJ2gyaN6yGikklG9GQP7uE2WVOXPG8nf9Cn2tqMwEFJL6ZI8L
	0X6pDgHkXEYIOcPcr7QMsYtRJ6urHVDQtPw==
X-ME-Sender: <xms:FB6WZ8f-WLkuDXLB2EXrNz9FAGBL96J2UpBbmEIiSX4DBLuV3JV6QQ>
    <xme:FB6WZ-NgNZlYbTyyhf_7z936gWiqD1VX6Vk-r1zUfsveBTwo309CSlFiawwFXfzSO
    QTRNb7NixPyJuE>
X-ME-Received: <xmr:FB6WZ9iKalO6abMZGMMJ8QS6oyltvuPLAuGJ2FhR2zyLiBBCHrpUIlSTLXM6>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudejgedguddtudehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddt
    vdenucfhrhhomhepkfguohcuufgthhhimhhmvghluceoihguohhstghhsehiughoshgthh
    drohhrgheqnecuggftrfgrthhtvghrnhepvddufeevkeehueegfedtvdevfefgudeifedu
    ieefgfelkeehgeelgeejjeeggefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepihguohhstghhsehiughoshgthhdrohhrghdpnhgspghrtghp
    thhtohepudekpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopedtgiduvddtjeesgh
    hmrghilhdrtghomhdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphht
    thhopegsghhrihhffhhishesnhhvihguihgrrdgtohhmpdhrtghpthhtohepjhhonhgrth
    hhrghnhhesnhhvihguihgrrdgtohhmpdhrtghpthhtohepnhgvthguvghvsehvghgvrhdr
    khgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqshhtmhefvdesshhtqdhmug
    dqmhgrihhlmhgrnhdrshhtohhrmhhrvghplhihrdgtohhmpdhrtghpthhtoheplhhinhhu
    gidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtg
    hpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhr
    tghpthhtoheprghlvghkshgrnhguvghrrdhlohgsrghkihhnsehinhhtvghlrdgtohhm
X-ME-Proxy: <xmx:FB6WZx-aHtGWYiUFgCgFz4FgkhYngiTxV03FHG6t-oTqAsi6uuJWGg>
    <xmx:FB6WZ4s9V7tFbW6AZMlzX70tSyZdSKYJTXRti6ivZXnY4hts3FyPqw>
    <xmx:FB6WZ4GyeuzP7gvhy1ZZhuxFbHvK_bAkdIRbIWdKDUzyVz07W6kc_w>
    <xmx:FB6WZ3N4J8wUCnlwi038MkgNoyBawDrI15wgkw7ZvHFgpxP2FfQ5rQ>
    <xmx:FR6WZ4SOy9OOXHnaFL47e6lgU4uX-1dkcioxVmPJM-eiyALH1GhPpZIE>
Feedback-ID: i494840e7:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 26 Jan 2025 06:35:47 -0500 (EST)
Date: Sun, 26 Jan 2025 13:35:45 +0200
From: Ido Schimmel <idosch@idosch.org>
To: Furong Xu <0x1207@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Brad Griffis <bgriffis@nvidia.com>,
	Jon Hunter <jonathanh@nvidia.com>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Joe Damato <jdamato@fastly.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH net-next v3 1/4] net: stmmac: Switch to zero-copy in
 non-XDP RX path
Message-ID: <Z5YeEVrI3zx4VOtF@shredder>
References: <bd7aabf4d9b6696885922ed4bef8fc95142d3004.1736910454.git.0x1207@gmail.com>
 <d465f277-bac7-439f-be1d-9a47dfe2d951@nvidia.com>
 <20250124003501.5fff00bc@orangepi5-plus>
 <e6305e71-5633-48bf-988d-fa2886e16aae@nvidia.com>
 <ccbecd2a-7889-4389-977e-10da6a00391c@lunn.ch>
 <20250124104256.00007d23@gmail.com>
 <Z5S69kb7Qz_QZqOh@shredder>
 <20250125224342.00006ced@gmail.com>
 <Z5X1M0Fs-K6FkSAl@shredder>
 <20250126183714.00005068@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250126183714.00005068@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250126_033554_720361_51A909EF 
X-CRM114-Status: UNSURE (   9.54  )
X-CRM114-Notice: Please train this message.
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

On Sun, Jan 26, 2025 at 06:37:14PM +0800, Furong Xu wrote:
> The "SPH feature" splits header into buf->page (non-zero offset) and
> splits payload into buf->sec_page (zero offset).
> 
> For buf->page, pp_params.max_len should be the size of L3/L4 header,
> and with a offset of NET_SKB_PAD.
> 
> For buf->sec_page, pp_params.max_len should be dma_conf->dma_buf_sz,
> and with a offset of 0.
> 
> This is always true:
> sizeof(L3/L4 header) + NET_SKB_PAD < dma_conf->dma_buf_sz + 0

Thanks, understood, but are there situations where the device is unable
to split a packet? For example, a large L2 packet. I am trying to
understand if there are situations where the device will write more than
"dma_conf->dma_buf_sz - NET_SKB_PAD" to the head buffer.

