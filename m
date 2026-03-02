Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA9C9EB362C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 18:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dbpABA9JU9KyaoLnaTdX+Qzh6UTBVghyj5mUgAc/zc4=; b=3rn5Gc1DMS+DqYXRnJ/ywLsAdu
	zHZ8dg0NcgvbsdylT8YQ1P/a8aiEMrz/w7yjFKgV7Q9/lXr5x51EymLy0mGsDUeacDK7aPcTwCB20
	ZKR30iSepN4c1poCVIqnZINVgVjemy6L+uP8M/B+26oIKET9nsBEQ3v5SiJVENNmdsrmqkRFYW8MJ
	/AswOUe9VQsyORDYSOarDi0KRndtmfOVBam9ceNIEjec7BVoLil920F/mK6z1plhctc5cFKJynn15
	NNPuxJ43/alARuBsrqPQF55xCtVp69JoJQ30gHe/n86dz7CxeTCBHHxrdOq5S11Rr0IDsb5ptqNNB
	XbWXQBhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx7dk-0000000DeOI-1rEi;
	Mon, 02 Mar 2026 18:05:08 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx7dh-0000000DeNh-3e7e
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 18:05:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=dbpABA9JU9KyaoLnaTdX+Qzh6UTBVghyj5mUgAc/zc4=; b=xg
	HA13mQZ5O1YbCy2kc/VtLtTftOkFHafr3zOCksEaxiTMZKhZ0CBVcavvjdwQ2U5aUnKkRGAjwuao3
	MWq05P4bkvs5AXWzKkgcRpVXVrnuQbVGWtJUGya9CcZPR6d5lkjNMQFW1PncpSRiUhoEw/WXwuFie
	63ne8jAIS0bMsuA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vx7dO-009ibj-KT; Mon, 02 Mar 2026 19:04:46 +0100
Date: Mon, 2 Mar 2026 19:04:46 +0100
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
Subject: Re: [PATCH net-next v6 5/5] ARM: dts: aspeed: ast2600-evb: Configure
 RGMII delay for MAC
Message-ID: <d38f54b2-4a99-4a54-8403-e4f4a9704386@lunn.ch>
References: <20260302-rgmii_delay_2600-v6-0-68319a4c4110@aspeedtech.com>
 <20260302-rgmii_delay_2600-v6-5-68319a4c4110@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260302-rgmii_delay_2600-v6-5-68319a4c4110@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_100505_909018_5F583F2B 
X-CRM114-Status: GOOD (  16.36  )
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

On Mon, Mar 02, 2026 at 06:24:32PM +0800, Jacky Chou wrote:
> This change sets the rx-internal-delay-ps and tx-internal-delay-ps
> properties to control the RGMII signal delay.
> The phy-mode for MAC0–MAC3 is updated to "rgmii-id" to enable TX/RX
> internal delay on the PHY and disable the corresponding delay
> on the MAC.
> 
> Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
> ---
>  arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts b/arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts
> index 3f2ca9da0be2..a2a1c1dbb830 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts
> @@ -123,42 +123,54 @@ ethphy3: ethernet-phy@0 {
>  &mac0 {
>  	status = "okay";
>  
> -	phy-mode = "rgmii-rxid";
> +	phy-mode = "rgmii-id";
>  	phy-handle = <&ethphy0>;
>  
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_rgmii1_default>;
> +
> +	rx-internal-delay-ps = <0>;
> +	tx-internal-delay-ps = <0>;

In the binding, you said these default to 0. So you don't need them.

It is also odd that rgmii-rxid becomes rmgii-id, yet both delays are
0?

What was the bootloader doing? This is worth a comment in the commit
messages.

	Andrew

