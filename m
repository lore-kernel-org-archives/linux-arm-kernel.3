Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32B10CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 04:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H7yiL8lrVrCfercd8VJZOnrUXZAUWNvskegvwzX0TS8=; b=1GgK+D/+C35/4dF8PJSHgHnwpv
	r+jfJkSJVjlfFiIFTt/Cmyr3t1Tg6RHGw1QuOEgNBIuKnjmnX1EIQwoWGdwxMPv6O4znBoy3vBa7G
	mtNoE/w193m2TgHduqf2/GMFqdT5e7WNyqRrJd+qrStWv7aLknjxc2CL1LoSNqTXg6sdewOzi8HY8
	1BEjnfRI9j4Yj4YZcu6jPxqLu0HE9ZOR34ACTfe5wA4X+kh9w/5pGO3c01iuZ3DZEUwY4N5svMH91
	GXvwg8AT2T5U4k8pAkSSg5ZW8DsOeXwg4S/M+mr87LHLM+uWaj+ifHQXTQlbfv6hHrcj07twhDBdD
	5fo+AFfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG8EP-0000000B5hR-1x62;
	Tue, 04 Nov 2025 04:01:17 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG8EN-0000000B5h2-0tsv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 04:01:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=H7yiL8lrVrCfercd8VJZOnrUXZAUWNvskegvwzX0TS8=; b=PG
	BKiwpNTDxXNwoYGTDvFE3lrCCRZd1UYwXofw9p2eTl1WFLNSSB0kueGwtnx4PvWmvcXoW/D7rzGSj
	qDSskFz/1KZAATFLTXQJib441VDLxzDE1khI9Awb7wadi72KgsXdA9XArEoUf+6JTK8VKfui8G9if
	F1JOS4G5pPjeFDw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vG8E6-00Cqwu-4D; Tue, 04 Nov 2025 05:00:58 +0100
Date: Tue, 4 Nov 2025 05:00:58 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Po-Yu Chuang <ratbert@faraday-tech.com>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, taoren@meta.com
Subject: Re: [PATCH net-next v3 3/4] ARM: dts: aspeed: ast2600-evb: Configure
 RGMII delay for MAC
Message-ID: <afdd366b-8bf0-40a4-ae02-dfc2ff79011f@lunn.ch>
References: <20251103-rgmii_delay_2600-v3-0-e2af2656f7d7@aspeedtech.com>
 <20251103-rgmii_delay_2600-v3-3-e2af2656f7d7@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251103-rgmii_delay_2600-v3-3-e2af2656f7d7@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_200115_436878_23B1809E 
X-CRM114-Status: GOOD (  17.45  )
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

On Mon, Nov 03, 2025 at 03:39:18PM +0800, Jacky Chou wrote:
> This change sets the rx-internal-delay-ps and tx-internal-delay-ps
> properties to control the RGMII signal delay.
> The phy-mode for MAC0–MAC3 is updated to "rgmii-id" to enable TX/RX
> internal delay on the PHY and disable the corresponding delay
> on the MAC.
> 
> Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
> ---
>  arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts | 28 +++++++++++++++++++++----
>  1 file changed, 24 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts b/arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts
> index de83c0eb1d6e..a65568e637bd 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts
> @@ -121,44 +121,64 @@ ethphy3: ethernet-phy@0 {
>  };
>  
>  &mac0 {
> +	compatible = "aspeed,ast2600-mac01", "aspeed,ast2600-mac", "faraday,ftgmac100";

Is it really compatible to aspeed,ast2600-mac? If a driver binds to
that, not aspeed,ast2600-mac01, doesn't that imply the bootloader
delays are still in use, so phy-mode will be wrong?

I think you should only list aspeed,ast2600-mac01. If somebody uses
this DT blob on an old kernel, then you won't get an ethernet
interface, rather than a not working ethernet interface, which is
probably preferable.

	Andrew

