Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C504AC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 23:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=re5vEpWzxNdWCjr9r1o7knlAw2oLCVrTuWhoL9AZx4g=; b=Egxy0DAGdd3VehMxZhpjftSuuq
	TEHMfX0+giFsEFmXR08PHq0TI6UAvaBL+P0QoD9cxr4j1n6OiYu2m/FYpF6PVfF7UB8NiQZTAhuPi
	7cYGLt4C40rwK7KO5bxiOHKQ1fOwIJel73609/nL9ZrQC7I7KVWBm6CekBWY4Y6HTdaabczyoDVr0
	Sry0d9Dh6mSU8n0cs7AwW8KiJiit8UJs7GITy0YSVU5U432VgjVxsz2XKFG3Qzp5EVfSnDP3qyXfx
	QmH4R0LE82cTkitfaH0qKdGYEOgh9uUPwYJeSF7mNrcFMRCOWkHHKKuIYmALLz7zzRgWiG7z65jLP
	9twnuDfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubS9x-00000003Snu-1s14;
	Mon, 14 Jul 2025 23:00:33 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubS7W-00000003SHz-2vfW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 22:58:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=re5vEpWzxNdWCjr9r1o7knlAw2oLCVrTuWhoL9AZx4g=; b=fwkO7GOy6gh70PKilmMQibFb0V
	+X4ndIAYAZUUWrnjfTRP7MHxTmBVi+zHqVuapH+IzjGGDso9u2dFZSrzGOP8AGHidmECNpmwKXGGh
	CG4oA5yqgTt3iutTmvACQjNmfT/f0eZzSKKNYQZPTskc1ActSOjcK2horL4AroxCqVGA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1ubS7N-001W4h-3e; Tue, 15 Jul 2025 00:57:53 +0200
Date: Tue, 15 Jul 2025 00:57:53 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Matthew Gerlach <matthew.gerlach@altera.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, dinguyen@kernel.org,
	maxime.chevallier@bootlin.com, richardcochran@gmail.com,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: socfpga: agilex5: enable gmac2 on the
 Agilex5 dev kit
Message-ID: <8b7f0946-4c95-465a-a462-48fa9887aade@lunn.ch>
References: <20250714152528.311398-1-matthew.gerlach@altera.com>
 <20250714152528.311398-4-matthew.gerlach@altera.com>
 <de1e4302-0262-4bcc-b324-49bfc2f5fd11@lunn.ch>
 <256054d7-351a-4b1c-8e1a-48628ace091d@altera.com>
 <86e1e04a-3242-482c-adb0-dde7375561c1@lunn.ch>
 <baed95d4-c220-4d3b-8173-fc673660432d@altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <baed95d4-c220-4d3b-8173-fc673660432d@altera.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_155802_733716_81A16291 
X-CRM114-Status: UNSURE (   7.42  )
X-CRM114-Notice: Please train this message.
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

> Currently the
> driver, drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c, and its
> bindings, Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml,
> allow all rgmii phy-modes.

There is nothing unusual about allowing all four RGMII modes. Somebody
might design a board with the 2ns delay via extra long clocks lines,
or some other form of delay lines. Such a board would need 'rgmii',
and they do exist, a board like this was added this cycle. There is
one rather odd board with a DT file which has extra long clock line
for TX, but not RX! That needs rgmii-rxid. The majority of boards
don't have any delays on the PCB, so need 'rgmii-id'.

	Andrew

