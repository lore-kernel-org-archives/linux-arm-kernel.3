Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A2CCE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 16:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kef15OjRvGqUB+zEmVxSQr9gAePzm85eOXIQPtstMZs=; b=KJ1D/PbOKQTfBR/I1Ko+APrHoJ
	8t2HzfI2vqjF7+0qGrGyByervqtsE4uzvEm9cDvPcU9fJ79WQKVvFYbh7UDSy1l93TJ4UXz8eI5nr
	JnBfSY2yw6NnpnLhO5o98DJI9JaXYF1douLAxKkgMBvivgGLIKLJ7VQizFobZA+NlcpVI0kUGaZMo
	f/MI87jnPhXY+egZ0YrV4ABpmaxLDrx1i28PrYzBah6X+Pp7h+1F8wzGKNN+Yg3FMvBk95g3wfDTd
	iX4dj+S3RemLP4It0JAgJMeKHqDQwkdgO1SdTT6mH1UB4xtNmxbS3TaljkIwlANgvn1gFaPaL2NYq
	/MYqKt5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWHVJ-0000000G9AD-39jd;
	Fri, 10 Jan 2025 16:04:57 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWH5o-0000000FzfX-1Kmo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 15:38:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=kef15OjRvGqUB+zEmVxSQr9gAePzm85eOXIQPtstMZs=; b=DG
	BA6mWpmmAcZhO/CuBfQGcX7JmP6/Py9BPkLAtM4dcpF7xielUeAvTdam9teBM6d8R+TU4t3ti/rmG
	5kvDb2vcZnoJKvHEIfvTu+13nvFyh/86ESthfE7J3KBr0sdMpeAeientgN+zgEa9KW+ZcpgyxUjgf
	RM+DgRd225AUVZU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tWH5W-003H4u-HL; Fri, 10 Jan 2025 16:38:18 +0100
Date: Fri, 10 Jan 2025 16:38:18 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Ninad Palsule <ninad@linux.ibm.com>
Cc: Jacky Chou <jacky_chou@aspeedtech.com>,
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
Subject: Re: =?utf-8?B?5Zue6KaGOiDlm57opoY6IFtQQVRD?= =?utf-8?Q?H?= v2 05/10]
 ARM: dts: aspeed: system1: Add RGMII support
Message-ID: <0ee94fd3-d099-4d82-9ba8-eb1939450cc3@lunn.ch>
References: <0c42bbd8-c09d-407b-8400-d69a82f7b248@lunn.ch>
 <b2aec97b-63bc-44ed-9f6b-5052896bf350@linux.ibm.com>
 <59116067-0caa-4666-b8dc-9b3125a37e6f@lunn.ch>
 <SEYPR06MB51344BA59830265A083469489D132@SEYPR06MB5134.apcprd06.prod.outlook.com>
 <8042c67c-04d3-41c0-9e88-8ce99839f70b@lunn.ch>
 <c0b653ea-3fe0-4bdb-9681-bf4e3ef1364a@linux.ibm.com>
 <c05c0476-c8bd-42f4-81da-7fe96e8e503b@lunn.ch>
 <SEYPR06MB5134A63DBE28AA1305967A0C9D1C2@SEYPR06MB5134.apcprd06.prod.outlook.com>
 <9fbc6f4c-7263-4783-8d41-ac2abe27ba95@lunn.ch>
 <81567190-a683-4542-a530-0fb419f5f9be@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <81567190-a683-4542-a530-0fb419f5f9be@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_073836_362739_86971772 
X-CRM114-Status: GOOD (  22.43  )
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

> Do we need updates on this description. It doesn't talk about external PCB
> level delays?
> 
> https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/net/ethernet-controller.yaml#L77-L90
> 
> This is what you explained:
> 
> MAC driver reads following phy-mode from device tree. 95% of mac driver
> directly
>  pass it to PHY through phy_connect.
> 
> rgmii - PCB has long clock lines so delay is added by PCB
>         On this mode PHY does nothing.
> rgmii-id - PCB doesn't add delay. Either MAC or PHY needs to add the delay
>            Add delays in both directions. Some PHY may not add delay in that
>            case MAC needs to add the delay mask rgmii-id to rgmii.
> rgmii-rxid - If there is an extra long TX clock line, but not RX clock,
>              you would use rgmii-rxid
> rgmii-txid - When there is an extra long RX clock line on the PCB, but not
>              the TX clock line, you would use rgmii-txid

The documentation is not great, that has been said a few times.  What
is described here is the view from the PHY, which is not ideal.

      # RX and TX delays are added by the MAC when required
      - rgmii

From the perspective of the PHY, this means it does not need to add
delays, because the MAC has added the delays, if required, e.g. the
PCB has not added the delays.

We have the problem that DT is supposed to describe the
hardware. Saying the PHY should add the delays, but if the MAC adds
the delays it needs to mask the value passed to the PHY does not
describe the hardware, it is Linix implementation details. The DT
Maintainers don't want that in the DT binding because other OSes might
decide to implement the details differently.

So your description becomes:

rgmii      - PCB has long clock lines so delays are added by the PCB
rgmii-id   - PCB doesn't add delay. Either MAC or PHY needs to add the delays
             in both directions.
rgmii-rxid - There is an extra long TX clock line on the PCB, but not the RX clock.
rgmii-txid - There is an extra long RX clock line on the PCB, but not the TX clock.

It is correct, but leaves so much unsaid developers will still get it
wrong. What we really want is that developers:

1) Read the mailing list. Patches for RGMII delays are posted at least
   once an month and i point out how they are wrong. If developers
   actually read the mails, they would not make the same mistake again
   and again.

2) Developers for some reason like to invent their own code, rather
   than taking the easy route of copy from a driver already in Linux.
   The majority of drivers in Linux get this right, so if you copy
   another driver, you should get it right for free as well.

	Andrew

