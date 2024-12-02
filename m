Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD59ED7832F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 15:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8UlTXmqTD0hVxGuezAQrdINnlLV/4cWXAbXA5kGF8qk=; b=2Fict9ajVdG+VNFv6zq4gThH3y
	BvrlISr6DPW4r2TLTG3m/3Cq2Wzw96SwyFxgHk+C8KKkYyBcpMMTAAbWPfavNXzzuTbGkbY/hPlQn
	2UVOZHmUC0FGLRfw4HVhddMjsXGSPSJ0QlJd8jGsDtj1+1cUxm4O4iz1dr2a86JwVaifF3xRnXHb4
	EO06HJ5gSjp3rsWZEL37kufP2a2uaXd7qEopovuUjnEodOX7WTWjqDpKLKY8Pfj4EmanBegDGbDS5
	EPGify/s+/aOhjnUl7gw4b+wzGdtU/y6whzEwVcC9LVCiGZzCrbRUtOWokR+AeoMxHlb3ZfMauW2N
	keWHYKdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI8Qp-00000006fZ4-29Dy;
	Mon, 02 Dec 2024 15:33:51 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI8Pb-00000006fPC-3NUO;
	Mon, 02 Dec 2024 15:32:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=8UlTXmqTD0hVxGuezAQrdINnlLV/4cWXAbXA5kGF8qk=; b=QyFbn5MsXOAB+vwNcAdb4r2vc2
	aKxodi9VxRUY66kSLGVZG9oKFfGaFvxXR6TGHBte5e+HKAroErJ7vVvhQ3KOwa4YDp7pr91br84yR
	2jOW0jBwU5REZorAdkouPFHGKCbSi94tCM0TAZ8cvxO4qWZxNJ5xvKeEZ4dMa+3aBTOPibU79NqJ7
	6AZrFbzWY8CoXvUibAI3BFzne7RNsFC1qXGZHra+Bvtrz5xEdQrrL5V8f1h526gDWDxPdaZnIJYkU
	dA/QOUk4WpzSD0TfSOeAJvFTrOxJZIi0F0R91t103NnhfF0b5L46Rpq6yjSURfPxw235INQrRmtyI
	l1Aj/lAA==;
Received: from i53875bc4.versanet.de ([83.135.91.196] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tI8PM-0003np-2f; Mon, 02 Dec 2024 16:32:20 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Diederik de Haas <didi.debian@cknow.org>,
 Dragan Simic <dsimic@manjaro.org>
Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Peter Robinson <pbrobinson@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: rockchip: enable rng on all rk356x
Date: Mon, 02 Dec 2024 16:32:19 +0100
Message-ID: <2377405.n0HT0TaD9V@diego>
In-Reply-To: <c50f603a9e1a819f17f72e97e92aeebd@manjaro.org>
References: <20241201234613.52322-1-pbrobinson@gmail.com>
 <D6175VTSP13T.200HWIIHOIDQQ@cknow.org>
 <c50f603a9e1a819f17f72e97e92aeebd@manjaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_073235_871580_8438DDE5 
X-CRM114-Status: GOOD (  25.47  )
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

Am Montag, 2. Dezember 2024, 15:50:07 CET schrieb Dragan Simic:
> Hello Diederik and Marcin,
> 
> On 2024-12-02 13:01, Diederik de Haas wrote:
> > On Mon Dec 2, 2024 at 11:40 AM CET, Marcin Juszkiewicz wrote:
> >> W dniu 2.12.2024 o 04:55, Dragan Simic pisze:
> >>  > On 2024-12-02 00:46, Peter Robinson wrote:
> >>  >> The rk356x rng is available on both the rk3566 and rk3568
> >>  >> parts, the IP is all self contained within the SoCs so
> >>  >> it's enabled already by default on rk3568 so let's enable
> >>  >> it in the base rk356x.dtsi so it's enabled consistently
> >>  >> everywhere.
> >>  >
> >>  > Please, go through the mailing list threads [1][2] that have led us
> >>  > to the current state.  To sum it up, it isn't about what's 
> >> supported
> >>  > in the two RK356x SoC variants, but about the RK3566's HWRNG being
> >>  > disabled because the testing showed that it produces unacceptably
> >>  > low quality of random data, for some yet unknown reason.
> >> 
> >> So maybe there should be a comment in rockchip/rk3568.dtsi so we would
> >> not get back to it again.
> > 
> > I suggested to put that in the (original) commit message:
> > https://lore.kernel.org/linux-rockchip/6690040.iosknibmi9@bagend/
> > precisely because this was quite predictable to happen.
> > 
> > So a +1 on a comment in the dtsi with a link to the discussion in the
> > commit message.
> 
> Totally agreed on adding a brief summary to the RK356x base SoC dtsi,
> so I went ahead and sent a patch that adds it. [1]  I also expected
> that to be described in the base dtsi back when the HWRNG support was
> added, but it somehow went in without the description.

thanks a lot for doing that, so I'll drop this patch here now from my inbox.


Heiko



