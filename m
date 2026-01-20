Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 653D6D262A4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 22:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cz8APhsseY0Zk6G5E1jpmPu9bX8/ov5VZe6gD1zzSmc=; b=cPzMjxL/W5n6K9NPVmPH47wuur
	+pglg6jGXv7rP6C5hottdC6wJydlShUiBmz241sioLRcso9Klyk6svnLyxI2PeJnwJ86ly552Ki4G
	WskO9bun4OXYelcHeMSpsfRIzWDi0ybZXjR32LELGQlcLmrzT2K6WGmD3DjG0dky2O8SdBgGn7UFc
	nwgObKl18qQro4YrqjIxJG5HzvjLti+xRejtvbwaiFqpbxNFGQvof+hnAecVAwckQqAibmKc1Wcd7
	osO59KWMh/wphWHMLK4Z7WY0d9Nl8LWhpZqd5TqdZqvVuhsYScpessBXuVro/nwEAAAxK+s+1GiXN
	eDudGTBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viJwV-00000004WQN-16U1;
	Tue, 20 Jan 2026 22:11:19 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viJwT-00000004WPy-0502
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 22:11:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=cz8APhsseY0Zk6G5E1jpmPu9bX8/ov5VZe6gD1zzSmc=; b=0W
	Lm9SWQQov5SYd420XUzSP8tyaiF9Y4ujlBQzmY/Th4asNTZ50ub3BJd9Dlsrxalzcy+e9smXDK7uN
	NqKWIJLS3Yz9jukT5jfXlgISuHH38T+Dy7aAeX+CrQxUfBfk/HmRYj7G1QITxRhI94jWTECv3vxjD
	lw4a8v0h3Xo2qJY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1viJw7-003jIq-CF; Tue, 20 Jan 2026 23:10:55 +0100
Date: Tue, 20 Jan 2026 23:10:55 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Joey Lu <a0987203069@gmail.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
	richardcochran@gmail.com, alexandre.torgue@foss.st.com,
	joabreu@synopsys.com, ychuang3@nuvoton.com, schung@nuvoton.com,
	yclu4@nuvoton.com, peppe.cavallaro@st.com,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH net-next v8 2/3] arm64: dts: nuvoton: Add Ethernet nodes
Message-ID: <2e3f213b-d507-4290-91af-fba7492155d2@lunn.ch>
References: <20260119073342.3132502-1-a0987203069@gmail.com>
 <20260119073342.3132502-3-a0987203069@gmail.com>
 <04df4909-4fdb-4046-917f-2f2e47832c62@lunn.ch>
 <a5cb949f-34c1-470c-bd04-0b35c249455f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a5cb949f-34c1-470c-bd04-0b35c249455f@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_141117_064012_2527D597 
X-CRM114-Status: GOOD (  19.78  )
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

On Tue, Jan 20, 2026 at 09:34:39AM +0800, Joey Lu wrote:
> Dear Andrew,

Please don't top post.

> 
> Thanks for the clarification.
> 
> In our design, the Ethernet PHYs are located on the base boards, not on the
> MA35D1 SOM.
> 
> The SOM base board routes two RGMII interfaces from the SOM to two external
> PHYs on the carrier board.
> 
> On the MA35D1 IoT board, there is no separate SOM and carrier board - it is
> a single integrated board.
> 
> I will update the DTS accordingly so that no PHY nodes appear in .dtsi.
> 
> Thanks!
> 
> Best regards,
> 
> Joey
> 
> Andrew Lunn 於 1/19/2026 11:22 PM 寫道:
> > On Mon, Jan 19, 2026 at 03:33:40PM +0800, Joey Lu wrote:
> > > Add GMAC nodes for our MA35D1 development boards:
> > > two RGMII interfaces for SOM board, and one RGMII
> > > and one RMII interface for IoT board.
> > > 
> > > Signed-off-by: Joey Lu <a0987203069@gmail.com>
> > > ---
> > >   .../boot/dts/nuvoton/ma35d1-iot-512m.dts      | 12 +++++
> > >   .../boot/dts/nuvoton/ma35d1-som-256m.dts      | 10 ++++
> > >   arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       | 54 +++++++++++++++++++

Does ma35d1.dtsi represent the SOM?

If so, what is ma35d1-som-256m.dts ? It looks like some odd sort of
carrier board with a few serial ports and some memory? But systems
like this put the memory on the SOM, not the carrier.

As i said, i'm confused with your naming here.

   Andrew

