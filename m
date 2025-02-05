Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70311C0219C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 17:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LO2er1K6vaE6/L7m9yk2utZM2k5CwTiygTMMgy6dNQ0=; b=40yAEMm5hr5cTsGSRykJCgUA7p
	8lxG3REsMzvjJCybJPBf2R1zmKPKNv9wb1GWXY4wiz6X0c7KqoRBeIyBSeJ4k2dABYsV94jVHWW5j
	ylYjlmw6aiibluUm9OJjFHHYXRFDWaBXYNBTlLzs77M8+v3amqpXx54K1ow/HniGegJ4aYT+1y2Zx
	Wsgayy6Uzeevxbw82fCjqAhMbg08JXAU9nkvBWxEBmmZEE7J+AEo0WZ8JuLd2reZr+Z+ri9Obi2/f
	ZsrZ9vooqU4y37p3Ne86IEkfE/VsfCJfvMQt8fsy9zB5Y3gUKCJ16OdmQ2fy26rbhIHPjfEOklfRU
	OpDbGUUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfjVE-0000000494k-0Xno;
	Wed, 05 Feb 2025 17:47:56 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfjM6-000000047dq-2Zdz;
	Wed, 05 Feb 2025 17:38:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A8064A438D1;
	Wed,  5 Feb 2025 17:36:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9547EC4CEE2;
	Wed,  5 Feb 2025 17:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738777109;
	bh=6QJJPtO3WlYPPGSP0H8aWwAJg0ctvHWUXT0e2WNEeHE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MsLyFODUcEFb8uO9sgi4xZpO9PYRDdZOES/lZgiqBuN8wK0rpYCZyyFUZPsRV/815
	 eVszkZ84dPOVH3oi7rt+AbIWKXy03058S4pFxx7l5DQ6Z1/aI1g+IVpQn6g+cxDIl9
	 QOWiN0BSBHDQPpDQV2dp7S8V+JJQ0tqEreVR/ejFgVrEBi2Hq+i8UV5e3i8elKKxMy
	 3Qgndet8XKwPQTJJutsYvw441+bty+yDxo5KIBzoW3wbIaIspA/f+NL7dZuOf89MPr
	 a6l+h/rNIdMjTWZXDTh2TVMGC4DGBrLzpraW+eHCTJqhl6aVLcGhtxSEM1mV8dmDyy
	 1VNweqr9a9gzA==
Date: Wed, 5 Feb 2025 17:38:24 +0000
From: Simon Horman <horms@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Heiko Stuebner <heiko@sntech.de>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Steven Price <steven.price@arm.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
	stable@vger.kernel.org
Subject: Re: [PATCH netdev] net: stmmac: dwmac-rk: Provide FIFO sizes for
 DWMAC 1000
Message-ID: <20250205173824.GJ554665@kernel.org>
References: <20250204161359.3335241-1-wens@kernel.org>
 <20250204134331.270d5c4e@kernel.org>
 <CAGb2v641vvtVKv8QbiEfHnMWngcKYTJZAgfH5k+G_nOvZcbC9g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGb2v641vvtVKv8QbiEfHnMWngcKYTJZAgfH5k+G_nOvZcbC9g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_093830_721532_B244FBCC 
X-CRM114-Status: GOOD (  13.32  )
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

On Wed, Feb 05, 2025 at 11:45:17AM +0800, Chen-Yu Tsai wrote:
> On Wed, Feb 5, 2025 at 5:43 AM Jakub Kicinski <kuba@kernel.org> wrote:
> >
> > On Wed,  5 Feb 2025 00:13:59 +0800 Chen-Yu Tsai wrote:
> > > Since a fix for stmmac in general has already been sent [1] and a revert
> > > was also proposed [2], I'll refrain from sending mine.
> >
> > No, no, please do. You need to _submit_ the revert like a normal patch.
> > With all the usual details in the commit message.
> 
> Mine isn't a revert, but simply downgrading the error to a warning.
> So... yet another workaround approach.

I think the point is that someone needs to formally
submit the revert. And I assume it should target the net tree.

