Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F40F6C369D3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 04:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EGXsqwKJ/ZgFZ60usmcBKW80zfa/vL+TvC0sWqiZqyM=; b=dyNBn3jjkdRTVHlhj5WXsODp4C
	SBiFGdBNrhYFDi9LEHtQzJQEm4F2nnrvLa1SujjzCrDTpTJEZB+6khNyxPmq0UOG98kKMA2ZsjvZd
	nAZN1dYj1fvuMMQAqbPXzLzFfN7Yfwof7sRZRpzPZLIw93r623bqx6/v4pPrahsh6oPKgZ2TBFJO0
	Ao4fpAphY2I8ZgWVLo6oPTFYKux+Mie3Jsw0dc8r7vOXbF56zTXNkXu74GJVUIAoJjS27ySErtpJS
	k4hCwAR+4ep+fERP3IdNps3Ld7/lY9XkWzxo6yYhPkcK61bTdKWduvcHOPxamj6piDABJehLWLMwi
	rtAafT5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8B0X-0000000FwEH-1oGq;
	Fri, 25 Apr 2025 04:49:49 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Ayg-0000000Fw6K-2aFx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 04:47:55 +0000
Received: from localhost (unknown [116.232.18.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 21DF3340C76;
	Fri, 25 Apr 2025 04:47:51 +0000 (UTC)
Date: Fri, 25 Apr 2025 04:47:47 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Chukun Pan <amadeus@jmu.edu.cn>, andre.przywara@arm.com,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	jernej.skrabec@gmail.com, krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev, robh@kernel.org, samuel@sholland.org
Subject: Re: [PATCH 1/1] arm64: dts: allwinner: correct the model name for
 Radxa Cubie A5E
Message-ID: <20250425044747-GYA50408@gentoo>
References: <20250425023527-GYA50272@gentoo>
 <20250425030006.45169-1-amadeus@jmu.edu.cn>
 <CAGb2v649ntfAEUdV5S1wM8nUGhvaOP-RBw07XcxwdbafbC2PYQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGb2v649ntfAEUdV5S1wM8nUGhvaOP-RBw07XcxwdbafbC2PYQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_214754_676010_5B13CC3B 
X-CRM114-Status: GOOD (  21.95  )
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

Hi Chukun, Chen-Yu,

On 11:52 Fri 25 Apr     , Chen-Yu Tsai wrote:
> On Fri, Apr 25, 2025 at 11:00 AM Chukun Pan <amadeus@jmu.edu.cn> wrote:
> >
> > Hi,
> >
> > > It seems I'm a little bit late for this, but while we are here,
> > > Can we also append 'cubie' to dts file name?
> > > e.g. - sun55i-a527-radxa-cubie-a5e.dts
> >
> > Usually we use the device name (without the vendor name),
> > maybe sun55i-a527-cubie-a5e.dts would be better?
> 
> I agree with this one.
> 
I personally would prefer to keep vendor name, it's more explicit
and easy for poeple to distinguish/find the board dts

but, this isn't something I really care, so I won't insist on this,
please proceed either way, thanks

> I can probably squash in a name change (since I'll be squashing in the
> SD card slot fix anyway). Andre?
> 
I think it is better

> 
> In that case would you prefer to keep your current patch separate, or
> squashed in so that everything is clean from the first commit?
> 
> It's up to you since you lose out on commit stats.
> 
> 
> Thanks
> ChenYu
> 
> > Thanks,
> > Chukun
> >
> > --
> > 2.25.1
> >
> >

-- 
Yixun Lan (dlan)

