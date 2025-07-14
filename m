Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5627FC83F27
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 18:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wL7y/Nn7lZ/3su+iamM0BGUV0JlXorw1/aqkJA86Ld0=; b=2uhlwWrQGNxD0oKGolLY2qEc4a
	gJaXnrSJ42wWbncQwLv4DCoG2TBEiVzo+ks4LUgOEWGh/zclgdrDK42KIrPROYPLiyFw1lm7jcMCa
	XdmIq8KXax9o4RxbJwVJefuGO8q/H/2/IFtwA0zh+nK621d3McultnZ1YROT9FTV6X9ymZravoKTc
	vv4Rs7wcImQleqhuAV7UWSYdVmqM47krLTgidxEsT/SUf4WWPp5kTtbjeFEYU+6SHGNjbhRFKrK+9
	OsFBrO8anGVAnRCLMgShqGpWUU4ksrm6jOc77X96mb6H+S9O5JcLGTh4OS93xE2FzIx6kriCfoSy/
	JIqxTuQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubOFr-000000034Uv-1hrJ;
	Mon, 14 Jul 2025 18:50:23 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubMvY-00000002xCu-450j
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 17:25:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=wL7y/Nn7lZ/3su+iamM0BGUV0JlXorw1/aqkJA86Ld0=; b=cVmRZpNNmKdhZl30VJDzK5k6/2
	Fdnk5u2nGfc8d3aA9HHImCPqgivZ9aaJohjxs/C4cRZVL16T7kpTiIdAbtogly5w3JH12/azRZVPq
	bxeiItAxABCAAaEXFW/xQgc0HbKRSRx0NXad/uPPhJu6qEPf2/+25uKyFyXzENHezBuI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1ubMvG-001UUB-Dt; Mon, 14 Jul 2025 19:25:02 +0200
Date: Mon, 14 Jul 2025 19:25:02 +0200
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
Message-ID: <de1e4302-0262-4bcc-b324-49bfc2f5fd11@lunn.ch>
References: <20250714152528.311398-1-matthew.gerlach@altera.com>
 <20250714152528.311398-4-matthew.gerlach@altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250714152528.311398-4-matthew.gerlach@altera.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_102521_008061_40FFBF62 
X-CRM114-Status: UNSURE (   8.14  )
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

> +&gmac2 {
> +	status = "okay";
> +	phy-mode = "rgmii";	/* Delays implemented by the IO ring of the Agilex5 SOCFPGA. */

Please could you explain in more details what this means.

The normal meaning for 'rgmii' is that the PCB implements the delay. I
just want to fully understand what this IO ring is, and if it is part
of the PCB.

> +	phy-handle = <&emac2_phy0>;
> +	max-frame-size = <9000>;
> +	mdio0 {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		compatible = "snps,dwmac-mdio";
> +		emac2_phy0: ethernet-phy@0 {
> +			reg = <0>;
> +		};

Please add a newline in here to separate the inner node from the
rest.

    Andrew

---
pw-bot: cr

