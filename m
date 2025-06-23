Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69CE5C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 17:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oWXHzMFQWrf3zwl6nd3ar71G9P2ea95Xb7EiOWcUnfA=; b=BSgqafb59mIyc1BBFWaVY1JpFQ
	B9LS06ojc1EF6xQA2liAk4+vcSyNihwgQUEbOAxtdsFU2PYrrI7YysmVN6V7XG/Mkr1DiAlfliqOC
	4yFNFG2gFdoh09t3ozuhumghaRtxio8Qj0NhqyM1yhXWtHTk+QovKUxSTU5uYaIyo+pNJCMp+cBfh
	h2Dox8PnU4WQ/DD7Vuwn3um0DoROOjcxBFQ7rOQ8Tk9PFvq46swX8BDTEsW3UNxXBj3GNzC2DQViG
	SOBqEANXMvwmT86ftoi0pwcU3TyZnYGEqn/k73b4GLQdAsTXEgkKzdENlYsqI3pY98Me9Vr1TNZGy
	Os1d2/0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTkXR-00000003V54-2TGa;
	Mon, 23 Jun 2025 17:00:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uThFh-00000002siv-2AL3;
	Mon, 23 Jun 2025 13:30:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8641E113E;
	Mon, 23 Jun 2025 06:30:06 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B7C723F58B;
	Mon, 23 Jun 2025 06:30:22 -0700 (PDT)
Date: Mon, 23 Jun 2025 14:30:15 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
	sudeep.holla@arm.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, arm-scmi@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH v1 0/2] firmware: Add MediaTek TinySYS SCMI Protocol
Message-ID: <aFlW5zVERnpwIkS4@pluto>
References: <20250623120136.109311-1-angelogioacchino.delregno@collabora.com>
 <aFlFw-AjqxXcIuBO@pluto>
 <9e8d0dfc-7dc4-461d-afd9-bd381219422f@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9e8d0dfc-7dc4-461d-afd9-bd381219422f@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_063025_598777_85DBE5CA 
X-CRM114-Status: GOOD (  25.44  )
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

On Mon, Jun 23, 2025 at 02:32:24PM +0200, AngeloGioacchino Del Regno wrote:
> Il 23/06/25 14:17, Cristian Marussi ha scritto:
> > On Mon, Jun 23, 2025 at 02:01:34PM +0200, AngeloGioacchino Del Regno wrote:
> > > This series adds basic support for the MediaTek TinySYS SCMI Protocol,
> > > found on the MediaTek Dimensity 9200, 9300 and 9400, other than on the
> > > MT8196 Chromebook SoC.
> > > 
> > > This is used to communicate with the CM_MGR and other MCUs for power
> > > management purposes.
> > 
> > Hi Angelo,
> > 
> > thanks for this.
> > 
> > I will do a proper review in the coming days of this series anyway, but
> > upfront for future V2:
> > 
> > - you should provide some sort of documentation for this new
> >    vendor protocol and its messages, as an example from IMX:
> > 
> > 	drivers/firmware/arm_scmi/vendors/imx/imx95.rst
> 
> Noted.
> 
> > 
> > - where is the SCMI driver that will call all the new vendor ops
> >    defined in: scmi_mtk_protocol.h ?
> 
> This was tested with code that is not clean at all (hence I can't push it upstream)
> and well... I didn't think about the fact that, effectively, without an user, this
> code ends up being unused.
> 
> I can't promise to send a clean user in this cycle, but I would really appreciate
> if you could still check the protocol code, so that if there's anything that you
> can spot I can fix it while the rest gets done :-)

Sure, I will anyway review, but a driver user exampe would be useful, maybe
posting it at the end of the series as a NOT-FOR-UPSTREAM/RFC (something like that)
so that we can have an iddea of the usage patterns while being aware that it is
still not clean for upstream.

Thanks,
Cristian

