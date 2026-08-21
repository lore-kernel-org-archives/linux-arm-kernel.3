Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00CE5C5DF89
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 10:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PgY1M31eUBna9lj2b3bxg1PT8jUYs9RMaq/pBozhfFo=; b=ZA7x4/NLuDzIUyyune4jWkdqtO
	6wNyBE+EfPPbamtdv47zFuajNXHjvxd60sBSkHxVzcpd7co7895ddHZvyv/+uowZwp0gpuxMUD6FG
	cw7IPsZst1VSlCJ8R3WkupNVYoQgohanz/ligMY5wICdL95xbQJJeo8PbQ1a9wd5OzZcltat38WX+
	DZG73V6069Oz1P0BSIZ96OUPfmsTIMQ/FdiQE8TuzlAjFZBzgKwTTiyOSWdD0saM6sJO0I2kCF19I
	KQRfzbPoN2+VzluyQm9LMZU4RUY/dHgnJVVWHr4z5v1De7FIG9XMxPK10eJfgh9t+W8Xn9RHCnpZc
	edYtIgZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxMte-0000000D7n3-0oF5;
	Fri, 21 Aug 2026 10:54:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxMtc-0000000D7me-224j;
	Fri, 21 Aug 2026 10:54:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9EA9160A71;
	Fri, 21 Aug 2026 10:54:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD0D01F000E9;
	Fri, 21 Aug 2026 10:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787309687;
	bh=PgY1M31eUBna9lj2b3bxg1PT8jUYs9RMaq/pBozhfFo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OPLlhxMuijwp1cpaegIpHgaDEYqSlPEXLfZeN11vQaKUhms/r5LmyldSO7pCLrmVS
	 ue+KfDTc0/yBxcBxztTS4g8WiV4mdpI2aE6MYqcnYzAkEjfSIjVnUXMF8qiBmCrwo+
	 xSbikCEK4FTzg4rJWAwKe6PXM5/9ni7AOC1rqIvWIDt7WV9XA833Hoe/PUwQumKOgQ
	 qFOAiwSdF5BCbWFPQwJe7lc3JPb0NAn89tVFq8G+9Gab7zgiiABqHbPzEEzWpsy4V4
	 x2W7B17UYSrqGOfryBJj6wfe7bekhkGHJMXvadaZ+NlkpmXJsakU92hIlS8qKupigd
	 2BPmkWnXkRMzA==
Date: Fri, 21 Aug 2026 11:54:42 +0100
From: Simon Horman <horms@kernel.org>
To: Shiji Yang <yangshiji66@outlook.com>
Cc: netdev@vger.kernel.org, Rex Lu <rex.lu@mediatek.com>,
	Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] net: ethernet: mtk_wed: increase WED v2 WDMA RESV_BUFF
 to 0x80
Message-ID: <20260821105442.GI265046@horms.kernel.org>
References: <OSZPR01MB779537889255E2F606E47EABBCA52@OSZPR01MB7795.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OSZPR01MB779537889255E2F606E47EABBCA52@OSZPR01MB7795.jpnprd01.prod.outlook.com>
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

On Wed, Aug 19, 2026 at 09:07:07PM +0800, Shiji Yang wrote:
> Change WDMA RESV_BUFF from 0x40 to 0x80 to avoid CDM TX FIFO overflow.
> Without this patch mt7986 and mt7981 may have WDMA TX hang issue. This
> patch was pulled from mtk-openwrt-feeds GPL open source project.
> 
> Link: https://github.com/mediatek/mtk-openwrt-feeds/commit/07c87502e854b68b48544d101b6fe17ec059b97b
> Signed-off-by: Shiji Yang <yangshiji66@outlook.com>

As a bug fix for code present in the net tree, this should

1. Be targeted at the net tree

   Subject: [PATCH net] ...

2. Be CCed to stable

3. Have a fixes tag. Perhaps this one?

   Fixes: cf26df8833cc ("net: ethernet: mtk_eth_wed: add mtk_wed_configure_irq and mtk_wed_dma_{enable/disable}")

I'm unsure if the maintainers would like a repost because of this.
But at any rate, please keep it in mind for the future.

More information on the netdev development processes can be found here:
https://docs.kernel.org/process/maintainer-netdev.html

The above not withstanding, this looks good to me.

Reviewed-by: Simon Horman <horms@kernel.org>

