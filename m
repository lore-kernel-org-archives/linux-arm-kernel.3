Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F0D6C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 06:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xa+u6TSXdvpnsdktnh6Ldx8knq/jErF9o1mKCq6c5Eo=; b=jwrbKduEnikdYSZqAvEW5qWAYa
	sS/C37R50qK9Tjb2ksSkpYASeA8/I0SJsMhGILL7sLFYLoQQw2ccQTs33JaTX0cO1Brrz18rQRCiA
	Sz3TZDIYhzKYROwzRWJhsPwUCByLWydWqHqNgeTlTkQ8/+Lk0yXHQbhF0WVcKEWhem00z+QRWSq21
	1+TEARbbFPtat5PtvAbIp1aHp0EqJwnhmKebPMmo2mo1WT3JEqzfEWBEq+yDWfMt8/l30+Qa/gv+1
	PpVOgMja2Eob8xMBSjzNCuY3nFQX09zkFYPsEpxoTIoV9unoViKfZflvIqx/aYAEx6OeRF6SS4kYu
	Gua6q3EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thNfV-0000000GQdF-1h1j;
	Mon, 10 Feb 2025 06:53:21 +0000
Received: from fhigh-a4-smtp.messagingengine.com ([103.168.172.155])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thNe5-0000000GQIa-0MTT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 06:51:55 +0000
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 8F66F1140113;
	Mon, 10 Feb 2025 01:51:49 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Mon, 10 Feb 2025 01:51:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1739170309; x=1739256709; bh=Xa+u6TSXdvpnsdktnh6Ldx8knq/jErF9o1m
	KCq6c5Eo=; b=bafjmJG+wuzoGYnXZs3OWuN0rYfKlg+z2CCIwrfj/QfDpdFjR/y
	2cOacgCL54YyWCBNjoZjaFeXcEV8V7Vo3hGDBXfeBAwgBDj7XG8lbNfhpvqcM8Lq
	MD7c6SkqSX0+jdD6DxGDhrPToD93coyrVvPRy+JS80LK5TLdD/tJ9mex2c9TXBV2
	RDi4k71i5JRRXQXGmFRFwv5x5icJjaWE4KnCK2t9wVzlmvzzp37kdp+eOYbgzEF8
	JO8yt50GMwHe0B24pDZCPQRzA3eKNhglAP28MRwvf/dteVtwIGq7wpK2m4JDES9R
	eLhGfH3PxL1+oxB1V0XXxUmbsv/nfiqzaqg==
X-ME-Sender: <xms:BKKpZyEkbPGdJbINekmZfUB-gH5gCVVDb3gdjKHA72CSOPSz_7kAkA>
    <xme:BKKpZzUk4ydXVK9ZjUS9wqvx2FVO73_J9By-pDgU08zri40YosGqHiMTatzrZnw00
    ZLfe2v0vI2btqY>
X-ME-Received: <xmr:BKKpZ8JgelyjxShIgIdKuTBZRJX7HdCtE23GhFzNUZ-5_xaMQxJoWT1i9rff>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefjeefkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddv
    necuhfhrohhmpefkughoucfutghhihhmmhgvlhcuoehiughoshgthhesihguohhstghhrd
    horhhgqeenucggtffrrghtthgvrhhnpeehhfdtjedviefffeduuddvffegteeiieeguefg
    udffvdfftdefheeijedthfejkeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihguohhstghh
    sehiughoshgthhdrohhrghdpnhgspghrtghpthhtohepudehpdhmohguvgepshhmthhpoh
    huthdprhgtphhtthhopedtgiduvddtjeesghhmrghilhdrtghomhdprhgtphhtthhopehn
    vghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqd
    hsthhmfedvsehsthdqmhguqdhmrghilhhmrghnrdhsthhorhhmrhgvphhlhidrtghomhdp
    rhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrg
    guvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhk
    vghrnhgvlhdrohhrghdprhgtphhtthhopegrnhgurhgvfidonhgvthguvghvsehluhhnnh
    drtghhpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphht
    thhopegvughumhgriigvthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepkhhusggrse
    hkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:BKKpZ8HqxAaKpTyiU7gG7xc6MjskSyqqHjmp5EoTbdhh23xWP8oc8A>
    <xmx:BKKpZ4Ue8dCAHoq82cA_LJFEULIs1ZFVQkIxheG1OC16r3dv9aIuzQ>
    <xmx:BKKpZ_MYmJG1HtVP8iAw3V0SX2rTdKIuOKCtCPrfT69AS_SZX5GifQ>
    <xmx:BKKpZ_2CztCc2frUAkqVwVttjA0EA46oQmThzHKTpt6tyFT0gsB3Gw>
    <xmx:BaKpZ5vNx_rkiYc-31LJg39M5YTGKhVW8TNvfHujyxmwpu4E297FVaNz>
Feedback-ID: i494840e7:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 10 Feb 2025 01:51:48 -0500 (EST)
Date: Mon, 10 Feb 2025 08:51:45 +0200
From: Ido Schimmel <idosch@idosch.org>
To: Furong Xu <0x1207@gmail.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>, xfr@outlook.com,
	Jon Hunter <jonathanh@nvidia.com>,
	Brad Griffis <bgriffis@nvidia.com>
Subject: Re: [PATCH net v1] net: stmmac: Apply new page pool parameters when
 SPH is enabled
Message-ID: <Z6miASgDGKfGH9qO@shredder>
References: <20250207085639.13580-1-0x1207@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207085639.13580-1-0x1207@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_225153_665931_0FE671C2 
X-CRM114-Status: GOOD (  12.69  )
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

On Fri, Feb 07, 2025 at 04:56:39PM +0800, Furong Xu wrote:
> Commit df542f669307 ("net: stmmac: Switch to zero-copy in
> non-XDP RX path") makes DMA write received frame into buffer at offset
> of NET_SKB_PAD and sets page pool parameters to sync from offset of
> NET_SKB_PAD. But when Header Payload Split is enabled, the header is
> written at offset of NET_SKB_PAD, while the payload is written at
> offset of zero. Uncorrect offset parameter for the payload breaks dma
> coherence [1] since both CPU and DMA touch the page buffer from offset
> of zero which is not handled by the page pool sync parameter.
> 
> And in case the DMA cannot split the received frame, for example,
> a large L2 frame, pp_params.max_len should grow to match the tail
> of entire frame.
> 
> [1] https://lore.kernel.org/netdev/d465f277-bac7-439f-be1d-9a47dfe2d951@nvidia.com/
> 
> Reported-by: Jon Hunter <jonathanh@nvidia.com>
> Reported-by: Brad Griffis <bgriffis@nvidia.com>
> Suggested-by: Ido Schimmel <idosch@idosch.org>
> Fixes: df542f669307 ("net: stmmac: Switch to zero-copy in non-XDP RX path")
> Signed-off-by: Furong Xu <0x1207@gmail.com>

Reviewed-by: Ido Schimmel <idosch@nvidia.com>

