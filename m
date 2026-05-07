Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2637ECD343F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 12:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LmEIVv5Hxh+mKmeuHsN7vP/fAMiciYkPlIj13WZ+oiE=; b=fzcQiWJtIlsF642VTDhMbUFHgg
	WgXMdJho6wROOhZfp5PavGW9jucYWiBdQeDaUkPGBkTxziKeABqugs6NGLy4PCdb5CP2bAiOpZHqy
	qjSKW7WLS6zdg5cuzvWyD0UEfoZN+HiE1G2OtOESOEKpBu5Qmv3PVCRasr21AhkGooJfAeZCLS94Q
	HGQxgkrgaClvfVtDPHz3qLP1I7uK4Vpto0PEBr4nvxkJOMxo25K+ATrmOpETpoQeAb0lG4ey7/5CC
	GBk3OY544KjMuJA0MCLzY7ubVShavrcfH866fIUQ7iSV6HUMaprwtSTJeHds+7BcoQhUlTvPFtbIR
	yAiGJ0QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKxr7-00000003mHT-3PH8;
	Thu, 07 May 2026 12:29:29 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKxr4-00000003mGL-2p1M
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 12:29:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=LmEIVv5Hxh+mKmeuHsN7vP/fAMiciYkPlIj13WZ+oiE=; b=MY/2xBVpjxX2ZXH6RhO3LIF2+N
	x4csJK/N/xl92PKhwsmp0UjPRbRm/Rrtz4SozNtBf6AqtO5BJoH769H2UhBcDCNP470yRW+O/UVsa
	pyds4D5Cno6Z40QB5+xOuQhW+Sr4uB2BZ2Pl5t32AxN2j3/AVfxPOL/DF5VxOthAVWf0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wKxqo-001oGr-6c; Thu, 07 May 2026 14:29:10 +0200
Date: Thu, 7 May 2026 14:29:10 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: lizhi2@eswincomputing.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	rmk+kernel@armlinux.org.uk, maxime.chevallier@bootlin.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, ningyu@eswincomputing.com,
	linmin@eswincomputing.com, pinkesh.vaghela@einfochips.com,
	pritesh.patel@einfochips.com, weishangjuan@eswincomputing.com
Subject: Re: [PATCH net v1 1/2] dt-bindings: ethernet: eswin: refine delay
 model and HSP register description
Message-ID: <2436c6e9-4aad-4ffd-9fef-0cbbe38dc66d@lunn.ch>
References: <20260507083037.152-1-lizhi2@eswincomputing.com>
 <20260507083136.175-1-lizhi2@eswincomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260507083136.175-1-lizhi2@eswincomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_052926_714728_B92712AA 
X-CRM114-Status: UNSURE (   6.56  )
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

>      ethernet@50400000 {
>          compatible = "eswin,eic7700-qos-eth", "snps,dwmac-5.20";
>          reg = <0x50400000 0x10000>;
> -        clocks = <&d0_clock 186>, <&d0_clock 171>, <&d0_clock 40>,
> -                <&d0_clock 193>;
> -        clock-names = "axi", "cfg", "stmmaceth", "tx";
>          interrupt-parent = <&plic>;
>          interrupts = <61>;
>          interrupt-names = "macirq";
> -        phy-mode = "rgmii-id";
> -        phy-handle = <&phy0>;
> +        clocks = <&d0_clock 186>, <&d0_clock 171>, <&d0_clock 40>,
> +                <&d0_clock 193>;
> +        clock-names = "axi", "cfg", "stmmaceth", "tx";

Please don't move the clocks around, since they have nothing to do
with RGMII delays.


>          resets = <&reset 95>;
>          reset-names = "stmmaceth";
> -        rx-internal-delay-ps = <200>;
> -        tx-internal-delay-ps = <200>;
> -        eswin,hsp-sp-csr = <&hsp_sp_csr 0x100 0x108 0x118>;
> -        snps,axi-config = <&stmmac_axi_setup>;
> +        eswin,hsp-sp-csr = <&hsp_sp_csr 0x100 0x108 0x118 0x114 0x11c>;
> +        phy-handle = <&phy0>;
> +        phy-mode = "rgmii-id";
>          snps,aal;
>          snps,fixed-burst;
>          snps,tso;
> -        stmmac_axi_setup: stmmac-axi-config {
> +        snps,axi-config = <&stmmac_axi_setup_gmac0>;
> +
> +        stmmac_axi_setup_gmac0: stmmac-axi-config {

And what do these changes have to do with RGMII delays?

    Andrew

---
pw-bot: cr

