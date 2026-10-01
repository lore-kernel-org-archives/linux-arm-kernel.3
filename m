Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7E7ACA5FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 13:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZISLUrZjX4iOiIppbllyKD1bMSKBGdCj0f514qP2Ki4=; b=SIlc5sPhw5jYricyCgCIzFEqHU
	VskBI5yHF1Qjp03+5tQklICBUqNVBk9HDVu/QSkVLO3v+9Of6aeZpQupf1pGgsW42geR8MDmQcsxe
	M0xYD06bmkyK9mkfD7AAyGM22489vcR1s2lDsKnq5lYQxQFBI5ML+XOaajxu+omt/pT83hYVQ7htu
	moGVq0w5tQ+8NZD/5jnvhx07cWOhhcnm3gPAObkYr/1FiCiMdz1ChtB0VcLi2qY9nUKEVkz9wuHl4
	VeKOZ/4ZVeDQ3csDUZlrrWc5xA9QI4RT/uyBhEM1tTCK0UIANp71quV+vLFbmlQG13Hq10skuBje7
	IIznCWig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCGul-00000009FLs-1F2g;
	Thu, 01 Oct 2026 13:33:35 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCGui-00000009FKU-0AKQ;
	Thu, 01 Oct 2026 13:33:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=ZISLUrZjX4iOiIppbllyKD1bMSKBGdCj0f514qP2Ki4=; b=VA8aJFvKOX5a5dHnydfnZAiZoZ
	xsVbFTkY0Vsp2WeSQcCPHm3bnBB/EXnPPIcEjYhg72PBhEysEIrd2GedfdD7rMFFIgi1qEfpupnGM
	zzruX6GHY60XJaPIr18aS6ZmV2SAoYWQo6rLQPPWOBbeZBuJjcZdK+lN3mG2iXkfimZI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xCGud-008OTL-Sr; Thu, 01 Oct 2026 15:33:27 +0200
Date: Thu, 1 Oct 2026 15:33:27 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: BG9OXA <bg9oxa@163.com>
Cc: linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v2 0/2] arm64: dts: rockchip: add ALIENTEK QuarkPi-CA2
Message-ID: <80eceb66-b573-463a-a577-30ba5793dbc4@lunn.ch>
References: <179051708448.31632.16350193430088134671@163.com>
 <de8c3f72-26d1-4c9a-86c6-12afb3fe97d6@lunn.ch>
 <179086062104.25951.4172888328376175948@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179086062104.25951.4172888328376175948@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_063332_077366_5B280AFE 
X-CRM114-Status: GOOD (  14.49  )
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

On Thu, Oct 01, 2026 at 09:17:01PM +0800, BG9OXA wrote:
> Hello Andrew,
> 
> Following up on the phy-mode point, with the measurements I promised.
> 
> I ran three 15-minute runs at full rate in both directions on this board
> (rk_gmac-dwmac + YT8531 PHY, iperf3, 900 s per direction), rebooting
> between runs so each configuration was fresh:
> 
>   mode          tx_delay   rx_delay   board->host    host->board   retrans
>   rgmii-rxid    0x2f       0x00       922 Mbit/s     939 Mbit/s    0
>   rgmii         0x2f       0x00       922 Mbit/s     939 Mbit/s    0
>   rgmii-id      0x00       0x00       918 Mbit/s     939 Mbit/s    224
> 
> The MAC error counters (rx/tx errors and drops) stayed at zero in all
> three runs, and the link came up at 1000 Mb/s Full duplex every time.
> 
> So plain "rgmii" with the delay added on the MAC side behaves exactly
> like the rxid form, and the "rgmii-id" run - where both sides add the
> delay - is the only one that shows retransmissions. That matches your
> point that only one side should add the delay. I have changed 2/2 to
> phy-mode = "rgmii" and dropped the rxid form: the RGMII traces on this
> board are ordinary length, so nothing in the PCB asks for an extra RX
> delay.

Did you read

https://elixir.bootlin.com/linux/v6.15/source/Documentation/devicetree/bindings/net/ethernet-controller.yaml#L287

phy-mode describes the PCB. 'rgmii-id' says the PCB does not have
extra RX/TX delays. So 'rgmii-id' is correct here. Please spend some
time to understand what delays are being added where, and how you can
get to rgmii-id without any retransmissions.

   Andrew

