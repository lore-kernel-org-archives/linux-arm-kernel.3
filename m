Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B3DEC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 17:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PqD5SeR91WD33KrMaU60d9QQSfgY2roP1/3YgPyVOHY=; b=sk4RarbeZWCO3bZyPsU+4/TWh+
	g+ndYcsH6f2AV8lb8/osIrdUyGlqswWucG0slnUgntCOBfRqnNbCBTwmEynOmbAIAoCDQtBGV1/+9
	AReWd6BMJjMj2AgCbmgt9khHO9IQIsEhnFPOeb2argD6w83E1mXIFhGmRSmRSezOMqiVWkW2fm0c3
	+IlHi8t+5bF5/hFRNIlg6IDVjRJPXRxQ/31y7n9wx7iK41itmaOREcYqGGo1EIO9Ds1lPPDwTnpdh
	oIvAPjXTFaONsEDcV2xwWQ0k32ZzoUiVIaXOngGpqyKMskoyV36cv+/+2F+ZmzfcCOaELkqc1I6Ud
	3pWR/CuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH4iI-0000000A2jH-0uHA;
	Mon, 19 May 2025 17:55:46 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH41x-00000009vRd-3aC8;
	Mon, 19 May 2025 17:12:03 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 6D21425A24;
	Mon, 19 May 2025 19:12:00 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ShMum505WjK7; Mon, 19 May 2025 19:11:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1747674719; bh=1M08tbMPKZIQwA166WgmYRAIrkDv6G6ToLEOnILqPFE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hJBMq/Kw4XA76Nuf9u+aIIaa8FYuHF5IdWTy+M6dSd1fPRry8yXkbNc4be1LyT+Ja
	 C2bj8zMtqUwgz61KwraY7pSqBcaqa5bwx2wVlpukeNzT6e3bEZnnCe4XlVkHNFMOOj
	 rfWddaatS0X1FFU/KeY9uCcs8FElX+xVtkSu+OT6VAAwZzRaeGGKqfdiI8rjlJegK/
	 mEUylHgwmKOGnPN0eWbt3oqSr8bSrxi2APOAh/WN66K+sZIQTh18fEkEi8XSeV+sPJ
	 VuceCm6xhSe0YhEz7NfzbRp0k8kP+kPv69bWTgvPuxIc8voFcCauZxDIwfpOtY/aTk
	 HmBaVKWqee0Hg==
Date: Mon, 19 May 2025 17:11:32 +0000
From: Yao Zi <ziyao@disroot.org>
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
	Jonas Karlman <jonas@kwiboo.se>,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chukun Pan <amadeus@jmu.edu.cn>,
	linux-rockchip@lists.infradead.org, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/9] pmdomain: rockchip: Add support for RK3528
Message-ID: <aCtmREp_H6_K00jR@pie.lan>
References: <20250518220707.669515-1-jonas@kwiboo.se>
 <20250518220707.669515-3-jonas@kwiboo.se>
 <aCthtDxm25RU_fd3@pie.lan>
 <3416319.KgjxqYA5nG@diego>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3416319.KgjxqYA5nG@diego>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_101202_021449_5147A482 
X-CRM114-Status: GOOD (  23.16  )
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

On Mon, May 19, 2025 at 07:07:39PM +0200, Heiko Stübner wrote:
> Hi,
> 
> Am Montag, 19. Mai 2025, 18:52:04 Mitteleuropäische Sommerzeit schrieb Yao Zi:
> > On Sun, May 18, 2025 at 10:06:49PM +0000, Jonas Karlman wrote:
> > > Add configuration and power domains for RK3528 SoC.
> > > 
> > > Only PD_GPU can fully be powered down. PD_RKVDEC, PD_RKVENC, PD_VO and
> > > PD_VPU are used by miscellaneous devices in RK3528.
> > 
> > Thanks for your work!
> > 
> > > Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> > > ---
> > >  drivers/pmdomain/rockchip/pm-domains.c | 27 ++++++++++++++++++++++++++
> > >  1 file changed, 27 insertions(+)
> > > 
> > > diff --git a/drivers/pmdomain/rockchip/pm-domains.c b/drivers/pmdomain/rockchip/pm-domains.c
> > > index 4cce407bb1eb..242570c505fb 100644
> > > --- a/drivers/pmdomain/rockchip/pm-domains.c
> > > +++ b/drivers/pmdomain/rockchip/pm-domains.c
> > > @@ -35,6 +35,7 @@
> > >  #include <dt-bindings/power/rk3366-power.h>
> > >  #include <dt-bindings/power/rk3368-power.h>
> > >  #include <dt-bindings/power/rk3399-power.h>
> > > +#include <dt-bindings/power/rockchip,rk3528-power.h>
> > >  #include <dt-bindings/power/rockchip,rk3562-power.h>
> > 
> > But I had some trouble applying this patch on either Rockchip SoC tree
> > or linux-pm. Looking through the context, seems the patch depends on
> > some RK3562 PMU driver changes, which I couldn't find with some brief
> > searching among the list.
> > 
> > Which branch is the series based on?
> 
> are you sure you looked at the right linux-pm tree?
> 
> In [0] I do see rk3562 powerdomains applied.

Oops, thanks for the link! I was digging through rafael/linux-pm.git
actually...

> Heiko
> 
> 
> [0] https://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git/commit/?h=next&id=f89c082d44914f24dfb5b0219eb140369de5b612
> 
> 

Best regards,
Yao Zi

