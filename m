Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CFA9E77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 13:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AbzsTNESBgo/hgO+hKhyZlCDUe5rI0jUjzYdhN5OFAo=; b=LBcXfe9jp+geBEDAGAdt48/pJb
	ZuETnXRF8Ua3zgF25Lsp5qt+3ZTCz0++Mi9gU4XLyIzKZmf+9wXCqsSurYizdscYkOsW4qD1glPmO
	M3N3MlPWbnwMNOQ9FAyBQSehMr1l4nQrg2yJg/6y4ZtzOm/B34W/Sm0Qru0QhIJw2VvsbSJgjQOki
	Iey/kyWEQAs9rd2snnIMcC+d6qREkY53YY/1PeumyXjuygIOvLcsGCWcj2GUuGtTqGdLN4/z3ImRm
	6K9nb6e91DR1ZiYdgkPoCSmJM+D2BPztIrD5Md58PWjOkjKIkJ4CuTQMjhES/kBYqkwj26wLFBGWt
	rfrFyjeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVsUz-0000000C0WF-2eKu;
	Thu, 09 Jan 2025 13:22:57 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVsTm-0000000C0GB-0KhP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 13:21:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=AbzsTNESBgo/hgO+hKhyZlCDUe5rI0jUjzYdhN5OFAo=; b=u7GKAuu3isEhqufnQh+qheI5XK
	wl6jZD4/rFT59G3X8Lt96IZC8bssyWI7i79odb5w8ky0KYyYlCZG7gjjaKAhiSBlJ/rzH5WOXy5AK
	8ShrWiJBf3VI/zzF3ZkZRljn8NYayPMr97fibqcB7kqggZ+Dy7ezXrQQ6Tz5cqGpeTmA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tVsTT-002tdk-RI; Thu, 09 Jan 2025 14:21:23 +0100
Date: Thu, 9 Jan 2025 14:21:23 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: Ninad Palsule <ninad@linux.ibm.com>,
	"andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"eajames@linux.ibm.com" <eajames@linux.ibm.com>,
	"edumazet@google.com" <edumazet@google.com>,
	"joel@jms.id.au" <joel@jms.id.au>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"minyard@acm.org" <minyard@acm.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"openipmi-developer@lists.sourceforge.net" <openipmi-developer@lists.sourceforge.net>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	"ratbert@faraday-tech.com" <ratbert@faraday-tech.com>,
	"robh@kernel.org" <robh@kernel.org>
Subject: Re: =?utf-8?B?5Zue6KaGOiBbUEFUQw==?= =?utf-8?Q?H?= v2 05/10] ARM:
 dts: aspeed: system1: Add RGMII support
Message-ID: <8042c67c-04d3-41c0-9e88-8ce99839f70b@lunn.ch>
References: <SEYPR06MB5134CC0EBA73420A4B394A009D122@SEYPR06MB5134.apcprd06.prod.outlook.com>
 <0c42bbd8-c09d-407b-8400-d69a82f7b248@lunn.ch>
 <b2aec97b-63bc-44ed-9f6b-5052896bf350@linux.ibm.com>
 <59116067-0caa-4666-b8dc-9b3125a37e6f@lunn.ch>
 <SEYPR06MB51344BA59830265A083469489D132@SEYPR06MB5134.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SEYPR06MB51344BA59830265A083469489D132@SEYPR06MB5134.apcprd06.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_052142_137961_0015C6C0 
X-CRM114-Status: GOOD (  21.05  )
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

On Thu, Jan 09, 2025 at 10:33:20AM +0000, Jacky Chou wrote:
> Hi Andrew,
> 
> > > There are around 11 boards in Aspeed SOC with phy-mode set to "rgmii"
> > > (some of them are mac0&1 and others are mac2&3). "rgmii-rxid" is only
> > mine.
> > >
> > > No one in aspeed SOC using "rgmii-id".
> > 
> > O.K, so we have to be careful how we fix this. But the fact they are all equally
> > broken might help here.
> > 
> > > > Humm, interesting. Looking at ftgmac100.c, i don't see where you
> > > > configure the RGMII delays in the MAC?
> > 
> > This is going to be important. How are delays configured if they are not in the
> > MAC driver?
> 
> The RGMII delay is adjusted on clk-ast2600 driver. Please refer to the following link.
> https://github.com/AspeedTech-BMC/linux/blob/f52a0cf7c475dc576482db46759e2d854c1f36e4/drivers/clk/clk-ast2600.c#L1008

O.K. So in your vendor tree, you have additional DT properties
mac1-clk-delay, mac2-clk-delay, mac3-clk-delay. Which is fine, you can
do whatever you want in your vendor tree, it is all open source.

But for mainline, this will not be accepted. We have standard
properties defined for configuring MAC delays in picoseconds:

        rx-internal-delay-ps:
          description:
            RGMII Receive Clock Delay defined in pico seconds. This is used for
            controllers that have configurable RX internal delays. If this
            property is present then the MAC applies the RX delay.
        tx-internal-delay-ps:
          description:
            RGMII Transmit Clock Delay defined in pico seconds. This is used for
            controllers that have configurable TX internal delays. If this
            property is present then the MAC applies the TX delay.


You need to use these, and in the MAC driver, not a clock driver. That
is also part of the issue. Your MAC driver looks correct, it just
silently passes phy-mode to the PHY just like every other MAC
driver. But you have some code hidden away in the clock controller
which adds the delays. If this was in the MAC driver, where it should
be, this broken behaviour would of been found earlier.

So, looking at mainline, i see where you create a gated clock. But
what i do not see is where you set the delays.

How does this work in mainline? Is there more hidden code somewhere
setting the ASPEED_MAC12_CLK_DLY register?

	Andrew

