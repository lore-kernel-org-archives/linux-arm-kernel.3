Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 502F1C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 15:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DmD+OzcP3hxAXs0Zz1yHPXf2Fl6f2W68HIV2dY8Fuvo=; b=sIPmWuPkpz0xZY8plk6TaHdC/K
	Rdioy5jxJ5I4TeD/aPvCDA4Yaeu8hOaz8+7Ll1Plowhc1ZlkOPWoNj/iHlrZ15oFOlpq7EYrIxEZN
	9HSsANoGbga4gnE1upZqlH081BL8+oXE9Dxg/PV/RHomir4vD8F9r+WroYqmEORw/e3dBJydg+M8J
	lUPHid4jHblsvympvbPF52Ac6KEgvWvbcMpu3rOFitDIKRqlA59EiR2uYdoXcainq54SMVvFVUWkB
	iYw2DpLKWSYEGoP1kJdfKyVjeuuT0e1s958x+XmXZ070PbwtRjjmYjepNE9KHhpIKFhzUmiCX1Lm3
	mAt8QL4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weaLN-0000000HN2t-0fO6;
	Tue, 30 Jun 2026 15:25:49 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weaLK-0000000HN21-3LG3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 15:25:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=DmD+OzcP3hxAXs0Zz1yHPXf2Fl6f2W68HIV2dY8Fuvo=; b=u8
	YI+Vb20Zu09I/rIon96W7/QgPk4U+ZkBc/rYUj1VeEInlWZZ9zvHkyrlBBNVyPdsPoWLosuzvd2sO
	LlYNxr4IPV1a65A3sDas4YfkHmAOGmsdVWlzhds6kElu/PZfs9ganbPwKe/AnLhPV5BbcCY4BYCjG
	D41n0/HJS9Z2seg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1weaL4-00A0Yx-C3; Tue, 30 Jun 2026 17:25:30 +0200
Date: Tue, 30 Jun 2026 17:25:30 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Nazle Asmade, Muhammad Nazim Amirul" <muhammad.nazim.amirul.nazle.asmade@altera.com>
Cc: "dinguyen@kernel.org" <dinguyen@kernel.org>,
	"maxime.chevallier@bootlin.com" <maxime.chevallier@bootlin.com>,
	"rmk+kernel@armlinux.org.uk" <rmk+kernel@armlinux.org.uk>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"edumazet@google.com" <edumazet@google.com>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	"andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/3] arm64: dts: socfpga: agilex5: Add SoCDK TSN Config2
 board
Message-ID: <e4cf8d95-0467-4bdc-8e19-228ced3a8bbc@lunn.ch>
References: <20260630133108.27244-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
 <20260630133108.27244-3-muhammad.nazim.amirul.nazle.asmade@altera.com>
 <edf84080-a5e0-478c-9977-af2376cb71c5@lunn.ch>
 <347c50ed-234a-4f29-b63a-1e0010c6b09d@altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <347c50ed-234a-4f29-b63a-1e0010c6b09d@altera.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_082546_839407_9580A024 
X-CRM114-Status: GOOD (  21.77  )
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

On Tue, Jun 30, 2026 at 02:39:50PM +0000, Nazle Asmade, Muhammad Nazim Amirul wrote:
> On 30/6/2026 9:58 pm, Andrew Lunn wrote:
> >> + * gmac1 is the TSN port. The MAC operates in GMII mode internally
> >> + * while the PHY-side interface is RGMII, so mac-mode and phy-mode differ.
> >> + */
> >> +&gmac1 {
> >> +	status = "okay";
> >> +	phy-mode = "rgmii"; /* TX/RX clock delays provided by Agilex5 I/O hardware */
> > Could you provide more details about this. I want to understand the
> > big picture.
> > 
> > Normally we talk about the PCB providing the delays. This sounds like
> > it is the FPGA? So i need convincing this is correct.
> Hi Andrew,
> 
> Thanks for your quick review and yes, it is the FPGA — specifically a 
> soft IP block in the FPGA fabric that implements the RGMII clock delays 
> and is configured before Linux boots via the FPGA bitstream. The driver 
> must not add additional delays on top.

So it depends on how the converter block is described, but ....

From a big picture, MAC and PHY pair, it is the MAC which
implements the delays.

https://elixir.bootlin.com/linux/v6.15/source/Documentation/devicetree/bindings/net/ethernet-controller.yaml#L346

# There are a small number of cases where the MAC has hard coded
# delays which cannot be disabled. The 'phy-mode' only describes the
# PCB.  The inability to disable the delays in the MAC does not change
# the meaning of 'phy-mode'. It does however mean that a 'phy-mode' of
# 'rgmii' is now invalid, it cannot be supported, since both the PCB
# and the MAC and PHY adding delays cannot result in a functional
# link. Thus the MAC should report a fatal error for any modes which
# cannot be supported. When the MAC implements the delay, it must
# ensure that the PHY does not also implement the same delay. So it
# must modify the phy-mode it passes to the PHY, removing the delay it
# has added. Failure to remove the delay will result in a
# non-functioning link.

    Andrew

---
pw-bot: cr

