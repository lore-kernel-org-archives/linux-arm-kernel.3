Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B4E5C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 12:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F5FZuqvEUAT2/PGcwzm4Qov9gm3yBMDweP9yb9iR+HU=; b=eKapGYOD9052plvzn3/FRsfLMV
	YM6cix2E1MY6v+tdYj+E7NnBA3MQx50z3uEQ/lX8W/dloBL1yc/SPSzjMm44nic9eivYhZOltZlqD
	F+G+CTLfD4CwtiW3JpvGuMtTyIYCNxmyEdzrEH4fbPtotZ/IRKflOSKUkljn75ragI9HogTAyq0ak
	fZOD4vpnoFLB5Jg8WArrEUvS+AKOLz/tNdixaiVKW2WEjsmfCkoNtdU6Rn8nVKwZkpa7cUB3x6poi
	185JC0VpZoo4qZyBAfKw4Sa/j+wwdDSg8ho71qnH4hvX4HHH6bDZa8cINULs4cUrPGUa1IpisnZSM
	dBk3/5hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x10sx-00000009GxZ-1kwp;
	Mon, 31 Aug 2026 12:13:11 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x10su-00000009Gwv-491F
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 12:13:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=F5FZuqvEUAT2/PGcwzm4Qov9gm3yBMDweP9yb9iR+HU=; b=ZRFide8oJiPpu9hZmbIkYaN0+4
	4XtdFgm/EkgzNhTbt5eEEiWaD3+OifNF8lBC/8J/GpnGa+xucYWpnCdPUjyXBZdq4NwjIqUWIeNH5
	GW6b4s7GJcXVohYd4clgmE47LMQPpdA70XUiyjLed1CKfrRDOU5HcaAQHutx8i5wxhng=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1x10se-002Acg-Kj; Mon, 31 Aug 2026 14:12:52 +0200
Date: Mon, 31 Aug 2026 14:12:52 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Prasanth <prasanth.padarthi10@gmail.com>
Cc: Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC
Message-ID: <daf98fe8-70f9-410e-8a2a-042a671086c2@lunn.ch>
References: <20260830182036.284736-1-prasanth.padarthi10@gmail.com>
 <d60f234e-1b9e-44cc-9bad-da79e794fe44@lunn.ch>
 <CAMFFDGgTnNouukst3V1rEg0NCNMW-BZ6tM6+fbQc0zeXaOb72w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMFFDGgTnNouukst3V1rEg0NCNMW-BZ6tM6+fbQc0zeXaOb72w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_051309_035789_1892A96A 
X-CRM114-Status: GOOD (  18.25  )
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

On Mon, Aug 31, 2026 at 06:43:46AM +0530, Prasanth wrote:
> Hi Andrew,
> 
> I do not currently have the PCB layout or trace-length information, so I cannot
> prove that the board provides the TX delay externally.
> 
> What I have validated on hardware is:
> 
> rgmii: fails, with RX CRC errors and no valid RX traffic
> rgmii-rxid: passes, 5000/5000 packets, 0% loss, no RX CRC errors
> rgmii-id: also passes with the same traffic test
> 
> This shows that the RTL8211F RX internal delay is required, but it does not
> establish where the TX delay is provided.
> 
> Given that I cannot provide PCB-level evidence for the TX delay, would you
> prefer that I use rgmii-id for the next revision?

There has been a number of threads about the Aspeed SoC. It typically
has delays enabled in its MAC, by the bootloader. The Linux MAC driver
does not disable this, nor does it mask the value passed to the
PHY. So you see many Aspeed .dts files incorrectly using 'rgmii'. Over
the last couple of years i have been pointing out this problem, but
nobody has stepped up to fix the issue. Most DT developers just leave
the Ethernet node out, in order to get something merged.

You case is interesting, because you are not suggesting 'rgmii'. So it
could be there is more going on.

If you look in the email archives you should find the information
about where to configure the delay in the hardware. You might want to
read it out to understand how the bootloader has configured the
hardware.

    Andrew

