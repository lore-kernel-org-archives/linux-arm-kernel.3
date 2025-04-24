Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E6E3C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 03:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lYH+LM1fCm/hbiBvZBroMssuWBDhcTYlYtq1jrdxXBw=; b=cJAeFV8gkmHDSXerLvgDLJ6Xr8
	45HdL4QMD5pTFKy2i1q0jmHsLLfDgJtc4oBSzZZMqwCzJ1K17QdpwswB6MknLK0QzHgLpFbWooeZx
	cq1J48osazkY063j4+xriasoR9zuykICDQSCHR7pukdgHuZ2bGpjPQFBCtoPfQZ3hz2a2/fBd09V1
	5kBmlxYx5F4U1kIUKspqAVteWg07ufWeAToHEa3wnGItO+5TvCrWwEA2kFuCdhwBJVNb5rq3k1h9k
	0n8JU+v6j3M5ZCXizpXIFeWxsOhCQypzLiKuAYuo+2HgHiQEhlgR4f0EQKgtzlN4KoVkdWt7WTtAn
	Qc3ecUfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7nJe-0000000Ck8t-2fDS;
	Thu, 24 Apr 2025 03:31:58 +0000
Received: from smtp.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7nGT-0000000Cjo3-1Q9k
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 03:28:44 +0000
Received: from localhost (unknown [116.232.18.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 55D0D342FED;
	Thu, 24 Apr 2025 03:28:40 +0000 (UTC)
Date: Thu, 24 Apr 2025 03:28:36 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH 3/5] arm64: dts: allwinner: a523: Add EMAC0 ethernet MAC
Message-ID: <20250424032836-GYC47799@gentoo>
References: <20250423-01-sun55i-emac0-v1-0-46ee4c855e0a@gentoo.org>
 <20250423-01-sun55i-emac0-v1-3-46ee4c855e0a@gentoo.org>
 <20250424014314.146e088f@minigeek.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424014314.146e088f@minigeek.lan>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_202841_405845_ECFF0BF5 
X-CRM114-Status: GOOD (  23.08  )
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

Hi Andre,

On 01:43 Thu 24 Apr     , Andre Przywara wrote:
> On Wed, 23 Apr 2025 22:03:24 +0800
> Yixun Lan <dlan@gentoo.org> wrote:
> 
> Hi Yixun,
> 
> thanks for sending those patches!
> 
> > Add EMAC0 ethernet MAC support which found on A523 variant SoCs,
> > including the A527/T527 chips.
> 
> maybe add here that MAC0 is compatible to the A64, and requires an
> external PHY. And that we only add the RGMII pins for now.
> 
ok

> > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> > ---
> >  arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 42 ++++++++++++++++++++++++++
> >  1 file changed, 42 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> > index ee485899ba0af69f32727a53de20051a2e31be1d..c3ba2146c4b45f72c2a5633ec434740d681a21fb 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> > +++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> > @@ -126,6 +126,17 @@ pio: pinctrl@2000000 {
> >  			interrupt-controller;
> >  			#interrupt-cells = <3>;
> >  
> > +			emac0_pins: emac0-pins {
> 
> Both the alias and the node name should contain rgmii instead of emac0,
> as the other SoCs do, I think:
> 			rgmii0_pins: rgmii0-pins {
> 
ok
> > +				pins = "PH0", "PH1", "PH2", "PH3",
> > +					"PH4", "PH5", "PH6", "PH7",
> > +					"PH9", "PH10","PH13","PH14",
> > +					"PH15","PH16","PH17","PH18";
> 
> I think there should be a space behind each comma, and the
> first quotation marks in each line should align.
> 
will do

> PH13 is EPHY-25M, that's the (optional) 25 MHz output clock pin, for
> PHYs without a crystal. That's not controlled by the MAC, so I would
> leave it out of this list, as also both the Avaota and the Radxa don't
> need it. If there will be a user, they can add this separately.
> 
make sense

> > +				allwinner,pinmux = <5>;
> > +				function = "emac0";
> > +				drive-strength = <40>;
> > +				bias-pull-up;
> 
> Shouldn't this be push-pull, so no pull-up?
> 
will drop

> The rest looks correct, when compared to the A523 manual.
> 
thanks for review

-- 
Yixun Lan (dlan)

