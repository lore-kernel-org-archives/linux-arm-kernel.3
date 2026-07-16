Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46834C44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 07:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	In-Reply-To:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M+e8FMjxlu8Cvc0CcQFMRL+Ex/ZuCg6jnE3zP0pwq4U=; b=nGtS0JbMdvTpl2q6GKIwnUBbzZ
	dQgG/tDZleKOmMScorGYUKaKV8tlnO80mtRJGtCIqeAx4DcaoDOK9LSH8LcYrHtPiD7PU9utwZx01
	Fi38YJ3I4kK+2bEUxmTAm+cBUuLPqD9BFH+7599icQj3/0cEdsU/ci5O7Z/WxwqG/hNEGICL5AlI0
	gvpEGXxvto4hS5jpOXB51VjiedmizPrdz/BbH/lcRUnzSlh1DlQsuLJ6ia8QetOce1xQaGYPhXZ0t
	QITQ6Diua2uwnuVxONlOPzZ4+r5oXrtEYuy97ZdRpAF7eBHzGjfc4KuERrgQ/E6RGmO+LmLvI6dhf
	ikelQ8tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkGdK-0000000GfR8-2CuE;
	Thu, 16 Jul 2026 07:35:50 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkGdE-0000000GfPm-3Qc9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 07:35:48 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260716073538euoutp02b6646f31a736254d3885799a26bc091d~CtO5yOydO2959729597euoutp02h
	for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 07:35:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260716073538euoutp02b6646f31a736254d3885799a26bc091d~CtO5yOydO2959729597euoutp02h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1784187338;
	bh=M+e8FMjxlu8Cvc0CcQFMRL+Ex/ZuCg6jnE3zP0pwq4U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=gpW2bGyQPkW2DQuND9WIVOPGBhWEhVs8s4iSAo6piFBydKSW/pGoysIKwRWhZCZIL
	 29o2QSF4xI2Ede9bQm8CnFzo3TZynFYuT12fcqvO4I4AZusZ2YGKUG06wTFI7n00sA
	 Mm/Q5KESOpgVg4EeQ05UmmzFfHItHV9HTMUV6/ng=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260716073538eucas1p24a4107355cfa7017ab15cca1a61f7148~CtO5UFkJv2490924909eucas1p2p;
	Thu, 16 Jul 2026 07:35:38 +0000 (GMT)
Received: from AMDC4622.eu.corp.samsungelectronics.net (unknown
	[106.120.77.34]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260716073536eusmtip13d05195b5fa03e5b16b777862996ec76~CtO4Qrw5B0331203312eusmtip1g;
	Thu, 16 Jul 2026 07:35:36 +0000 (GMT)
Date: Thu, 16 Jul 2026 09:35:33 +0200
From: Jakub Raczynski <j.raczynski@samsung.com>
To: Shiming Cheng =?utf-8?B?KOaIkOivl+aYjik=?= <Shiming.Cheng@mediatek.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"dsahern@kernel.org" <dsahern@kernel.org>, "imv4bel@gmail.com"
	<imv4bel@gmail.com>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "alice@isovalent.com"
	<alice@isovalent.com>, "daniel.zahka@gmail.com" <daniel.zahka@gmail.com>,
	"eilaimemedsnaimel@gmail.com" <eilaimemedsnaimel@gmail.com>, "nbd@nbd.name"
	<nbd@nbd.name>, "horms@kernel.org" <horms@kernel.org>, "kuba@kernel.org"
	<kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>,
	"edumazet@google.com" <edumazet@google.com>,
	"willemdebruijn.kernel@gmail.com" <willemdebruijn.kernel@gmail.com>,
	"willemb@google.com" <willemb@google.com>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "davem@davemloft.net" <davem@davemloft.net>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"sd@queasysnail.net" <sd@queasysnail.net>, "steffen.klassert@secunet.com"
	<steffen.klassert@secunet.com>, "stable@vger.kernel.org"
	<stable@vger.kernel.org>, Lena Wang =?utf-8?B?KOeOi+WonCk=?=
	<Lena.Wang@mediatek.com>
Subject: Re: [PATCH v7] net: gro: fix double aggregation of flush-marked
 skbs
Message-ID: <aliJuE/c+tNaSAU0@AMDC4622.eu.corp.samsungelectronics.net>
MIME-Version: 1.0
In-Reply-To: <99ce187af1495ffac592bfcf7ef97fc61a7f780b.camel@mediatek.com>
X-CMS-MailID: 20260716073538eucas1p24a4107355cfa7017ab15cca1a61f7148
X-Msg-Generator: CA
Content-Type: multipart/mixed;
	boundary="----KNnB4kTNYKyYcmQL5sxXd.jAMLTdcyVYkfyqBoax5Juj2j1a=_3e3ed_"
X-RootMTR: 20260716073538eucas1p24a4107355cfa7017ab15cca1a61f7148
X-EPHeader: CA
X-CMS-RootMailID: 20260716073538eucas1p24a4107355cfa7017ab15cca1a61f7148
References: <20260709014704.3625-1-shiming.cheng@mediatek.com>
	<willemdebruijn.kernel.2801a1401793d@gmail.com>
	<99ce187af1495ffac592bfcf7ef97fc61a7f780b.camel@mediatek.com>
	<CGME20260716073538eucas1p24a4107355cfa7017ab15cca1a61f7148@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_003545_476684_362AB39F 
X-CRM114-Status: GOOD (  12.00  )
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

------KNnB4kTNYKyYcmQL5sxXd.jAMLTdcyVYkfyqBoax5Juj2j1a=_3e3ed_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline

On Thu, Jul 16, 2026 at 01:41:12AM +0000, Shiming Cheng (成诗明) wrote:
> Hello everyone, 
> 
> it looks like this has been peeding for a while.
> Is there anything else I need to do or follow up on ?
> 
> Thanks
>

Hi,

There was an announcement
https://lore.kernel.org/netdev/c0cd72bd-6298-47a4-82a3-c43811c98063@redhat.com/
and currently there are over 1000 patches waiting for processing
https://patchwork.kernel.org/project/netdevbpf/list/

So need to be patient.

BR
Jakub Raczynski

------KNnB4kTNYKyYcmQL5sxXd.jAMLTdcyVYkfyqBoax5Juj2j1a=_3e3ed_
Content-Type: text/plain; charset="utf-8"


------KNnB4kTNYKyYcmQL5sxXd.jAMLTdcyVYkfyqBoax5Juj2j1a=_3e3ed_--

