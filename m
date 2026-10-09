Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F021CCA6019
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 12:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iYqcn+lw0qC/zQadO5fheUsN/NkKlBYECjVpCgptZMM=; b=EMIEG9t/EdXglThivCUpQKVegI
	25s2DNl1QZeU41+OeDWKIaaPpjwoYyYGKkxjMhIF6BshWIJPxKeGic1n1UEIME7toWT3zHKiT/0in
	zWc3RyMDAr1Ig2XfzN7LZMIacLlVp0W7WDbpXbUfk1zvFEpSHSaWDhRvdyE+Q+tSQmYG/GDVUNwVV
	CPrR5oiB+lhbyaWaCtw7f/dMHKbyyoq+8/bh4Il1dSY8vlq7MZBxgdHWoHhK1FfkBJTgqECN43cm4
	l2unddrdUSODlV6uAbejFkpctdGXIszIsKi47/ytPek/+8g1T4GwdfH1pwNCxHKKgo1UdsZjgyAvE
	39butu6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF9Tr-00000006Gcz-0Kql;
	Fri, 09 Oct 2026 12:13:43 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF9Tp-00000006GcS-2ctK;
	Fri, 09 Oct 2026 12:13:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=iYqcn+lw0qC/zQadO5fheUsN/NkKlBYECjVpCgptZMM=; b=tz
	eHbJbfn2hJXhR7bctqrOQsxWGFsATvqH5M7FqEGjCw/KIWeIC4TlP70keu4PnxMShE7R1Ghh/x90I
	4T5wSY81La24TnQgk+SKelca7e0mnBsktaMOF1VvENjiTXcdre/8LuPXR37vafMP1+H1RTzD2lY6Y
	X4HQUO3qpsENWVI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xF9TY-009mY5-CL; Fri, 09 Oct 2026 14:13:24 +0200
Date: Fri, 9 Oct 2026 14:13:24 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Lucas Tanure <tanure@linux.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 0/7] Add ethernet support for the Amlogic T7
Message-ID: <3a037c87-e4c5-4a4e-9522-cf505e1c6399@lunn.ch>
References: <20261007082627.63807-1-tanure@linux.com>
 <d23dfdf3-5837-459f-afd6-6c198a05c13c@lunn.ch>
 <CAJX_Q+2au4x99kj=UBqn4joQCM3-D2kbaJ0zro9Y4RXka7ePvQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJX_Q+2au4x99kj=UBqn4joQCM3-D2kbaJ0zro9Y4RXka7ePvQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_051341_663261_54374FBA 
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

On Fri, Oct 09, 2026 at 06:59:49AM +0100, Lucas Tanure wrote:
> On Wed, Oct 7, 2026 at 2:01 PM Andrew Lunn <andrew@lunn.ch> wrote:
> >
> > On Wed, Oct 07, 2026 at 09:26:20AM +0100, Lucas Tanure wrote:
> > > The T7 pairs a Synopsys gigabit MAC with the same glue registers the
> > > G12A has, but nothing described it. This adds the binding, the driver
> > > support and the device tree nodes, and enables the port on the Khadas
> > > VIM4.
> > >
> > > Unlike the G12A, the controller reaches DRAM through a pipeline stage
> > > with a gate of its own, sys_ampipe_eth. Nothing else claims it, so
> > > clk_disable_unused switches it off and transfers stop.
> > >
> > > v2 changes the RGMII delays, after review. phy-mode describes the
> > > board, not which chip adds the delay, so this board is rgmii-id.
> > > dwmac-meson8b did the opposite, and ignored the *-internal-delay-ps
> > > properties. Patch 1 fixes that. The VIM4 needs it because the RTL8211F
> > > transmit delay does not work here.
> >
> > What is special about the RTL8211F?
> Maybe nothing, it may be this board. I cannot tell from here.

Yes, look at my other reply. The RTL8211F is very likely correct. It
is the MAC drivers handling of delays which is broken. You get to fix
it for this new device.

   Andrew

