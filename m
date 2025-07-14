Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DDB7C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 18:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4mcaPOCXuzcuqrql8CPC5ZiVQE91mo1ELmABGML81qY=; b=ZpiUvHS9LW9awyr+I5kqXs1QI7
	kGra86EOT/HN9zQ75V4fnQsgRryzGbY/L37F2yXkiDdPM0qbkrfzGq8fB9Hs2vrb8jJx2M2R84+Vm
	dg60Hh7bi8CmXCopJwc/SLzQUnMRabyq6SuBqgUEZTaSOLJUY7m4UwlsINii+sw7IpVXUisvKflk/
	WrAfC15nKgx8G34yBnr2/8e2ptelTL5OVzzbv5ES89gMqg1OmBN77HjbU6xpRY7reoNgE+XXxuRTk
	em7Yytz2aG/U13IPgi1WcTKOVEwZAV3cu461JBsSYRh0Fi/FLs31zYZD2gZ8KIsZhYErIcgzICgNI
	UJ8NCkdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubOKL-000000036Xd-2T8j;
	Mon, 14 Jul 2025 18:55:01 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubOHs-0000000364l-35jf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 18:52:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=4mcaPOCXuzcuqrql8CPC5ZiVQE91mo1ELmABGML81qY=; b=hrFQBCcJKrv941KwidwkQk5On0
	sxEaQxGet6J1wRs/YJC9eALAMFdzcFjE6rM3vHOOOq3smX+wk7XtWc3iet3vCh/bbMQeF6sumdaa9
	VYBJ3aDVS9J7gemohTr+FBreGj6t76boDpUEJrzYRJQau85/5pr1nPUqFB+Tumsb8JRQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1ubOHh-001V2I-Uc; Mon, 14 Jul 2025 20:52:17 +0200
Date: Mon, 14 Jul 2025 20:52:17 +0200
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
Message-ID: <86e1e04a-3242-482c-adb0-dde7375561c1@lunn.ch>
References: <20250714152528.311398-1-matthew.gerlach@altera.com>
 <20250714152528.311398-4-matthew.gerlach@altera.com>
 <de1e4302-0262-4bcc-b324-49bfc2f5fd11@lunn.ch>
 <256054d7-351a-4b1c-8e1a-48628ace091d@altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <256054d7-351a-4b1c-8e1a-48628ace091d@altera.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_115228_773409_B716EFE4 
X-CRM114-Status: GOOD (  22.06  )
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

On Mon, Jul 14, 2025 at 11:09:33AM -0700, Matthew Gerlach wrote:
> 
> 
> On 7/14/25 10:25 AM, Andrew Lunn wrote:
> > > +&gmac2 {
> > > +	status = "okay";
> > > +	phy-mode = "rgmii";	/* Delays implemented by the IO ring of the Agilex5 SOCFPGA. */
> > 
> > Please could you explain in more details what this means.
> > 
> > The normal meaning for 'rgmii' is that the PCB implements the delay. I
> > just want to fully understand what this IO ring is, and if it is part
> > of the PCB.
> 
> The IO ring is the logic in the Agilex5 that controls the pins on the chip.
> It is this logic that sits between the MAC IP in the Agilex5 and the pins
> connected to the PCB that is inserting the necessary delays. Technically the
> PCB is not implementing the delays, but the "wires" between the MAC and the
> external pins of the Agilex5 are implementing the delay. It seems to me that
> "rgmii" is a more accurate description of the hardware than "rgmii-id" in
> this case.

Is this delay hard coded, physically impossible to be disabled? A
syntheses option? Can it be changed at run time? Is the IO ring under
the control of a pinctrl driver? Can i use the standard 'skew-delay'
DT property to control this delay?

For silicon, if the delay cannot be removed, we have MAC drivers masks
the phy-mode to indicate it has implemented the delay. The MAC driver
should also return -EINVAL for any other RGMII mode than rgmii-id,
because that is the only RGMII mode which is possible.

Since this is an FPGA, it is a bit more complex, so i want to fully
understand what is going on, what the different options are.

	Andrew

