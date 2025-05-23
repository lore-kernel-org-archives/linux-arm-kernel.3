Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C88D9C54ED0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 16:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S6Ip/EGBVi6qARnvgxZC7YGNzlBftLG+VPwtRvZjRDs=; b=gsh5QVIqQloLtNy62TzaU0k8KX
	uZlkJGC7U/BA1YYdREMmcDFTbMn6nxyKlmHEBPw/ub8qvF7TfwU2hLFPh9yuC9NpVijZnkpE2U+i1
	n+gq5skCK55RLsfjQ8HK8bA/BVekrvshyfRMd8FjB+itrWYH3w0+Tk0ngMJWR8894rcpvF4+rTCWL
	Y/jQ1wLU2tRSMbehajlcPKnWpAtTfo0lWmVoFWvNy9VdkzlGTcAWtPnJSxpNkC/SfifNxYuYonObT
	d0CHwBUPx9IL0QQW5ADuf5zNnSMFwr/w/6b1HM5e4YIme+ar03SMDu/DPVh3ky27kSBrkd2TIuSUd
	yvhSXnyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIVIH-00000004PV3-1y1m;
	Fri, 23 May 2025 16:30:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIUwJ-00000004Lc5-3h1z;
	Fri, 23 May 2025 16:08:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=S6Ip/EGBVi6qARnvgxZC7YGNzlBftLG+VPwtRvZjRDs=; b=kaIJ7NZmYZz4lPuELXdpq1WV7X
	ZCb+RYptW0P62b/zuxgLG2q7tT2tgijV9bTtjvMpwCahZum5akmbWi4lowtKUyPdZre7NG/yIJ3jF
	ZzJp5SE0HaROQUIBC6CZy+m+INjeEgq9J3PW0PW6WKIks9szJN0MICpFWSmE6nSE4GID7UQja1L+r
	fkxQG9Z8xwh3asSOfy7pIYeAKonPm5V2kp2FcrX+SRROL942JF61MkXGrtT1WE+u8y7To+EOGl7aT
	IaRbqodzW8Susz81hLDO6bp2bkImIuvALmUhe+qM7raQFr9Wf9R3BfiOJwBnszMiUL17MOprD6erO
	qhuQ8VoQ==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uIUwG-00000001LrM-2T0h;
	Fri, 23 May 2025 16:08:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=S6Ip/EGBVi6qARnvgxZC7YGNzlBftLG+VPwtRvZjRDs=; b=jkq3ytWedokPjdjZjKAIp5/xdl
	H3VUwiycazQtojv+4ajmUDoFRq6IhH/xb3AvQqGoGsSHQVogjbZcRj53KX9YV3phb4VwuaEmDYyUK
	aykPsQrPLpamYPXtgdrOfjS/Tb+NHzDUpyVOkQDKzY7/QUwZUdLciExd7yZG6CpcmizI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uIUw1-00Dczn-O9; Fri, 23 May 2025 18:07:49 +0200
Date: Fri, 23 May 2025 18:07:49 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Sky Huang <SkyLake.Huang@mediatek.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next 2/2] net: phy: mtk-ge-soc: Fix LED behavior if
 blinking is not set.
Message-ID: <39d5d8af-0bac-4b91-85df-4e04a5835f53@lunn.ch>
References: <20250523113601.3627781-1-SkyLake.Huang@mediatek.com>
 <20250523113601.3627781-3-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523113601.3627781-3-SkyLake.Huang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_170804_908738_D1BDCFB2 
X-CRM114-Status: GOOD (  10.36  )
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

On Fri, May 23, 2025 at 07:36:01PM +0800, Sky Huang wrote:
> From: Sky Huang <skylake.huang@mediatek.com>
> 
> If delay_on==0 and delay_off==0 are passed to
> mt798x_2p5ge_phy_led_blink_set() and mtk_phy_led_num_dly_cfg(),
> blinking is actually not set. So don't clean "LED on" status under
> this circumstance.

Actually, i think mtk_phy_led_num_dly_cfg() is wrong.

https://docs.kernel.org/leds/leds-class.html#hardware-accelerated-blink-of-leds

   The blink_set() function should choose a user friendly blinking
   value if it is called with *delay_on==0 && *delay_off==0
   parameters. In this case the driver should give back the chosen
   value through delay_on and delay_off parameters to the leds
   subsystem.

That is not what mtk_phy_led_num_dly_cfg() does.

    Andrew

---
pw-bot: cr

