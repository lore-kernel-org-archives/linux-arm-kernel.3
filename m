Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FCFEC43602
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 13:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h2ZClkJNcOlGLeERLZdhE0/N0+ZPPh65+LxTgmB6ghA=; b=OyZBINvp9KVIr54YywV3lZ2LGz
	UJjSPc8CsraLctwubDoYNZ+I06G+jr7bRo+PCtYim8TSLp0AO7+/FIGZafL3cnAtBulU41FR5u5cW
	CPVasGLWGyw3dbcfa/Eq7erHv24FkAq14TxG3hubn8gLcy/nEe9hXQtTUOIqVR03pWpUGcz3XdPGV
	Y3UEiTn+SPOA5B714Yp5IZg9iqAdR6peYsNSBF8hqrbxjKHCWy5QUkWy/k8tAjRkBYc//ngN1gsP3
	3PPHlRf78bLnrrt0PCl8V25TwMd6XIe1B4SMJUty8H4WMvyA0/vFKPv85OCv3T/BAH+X0L/ZQ7CQ1
	bsUitNiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weYz5-0000000HESA-2eVP;
	Tue, 30 Jun 2026 13:58:43 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weYz2-0000000HEQt-0Tbn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 13:58:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=h2ZClkJNcOlGLeERLZdhE0/N0+ZPPh65+LxTgmB6ghA=; b=hThqMAS+a4TWmMfM7VJInRiSw4
	JiPBK5OrvSbMh0fd4+QFbDA74JID9m3EGbNoK3D8olAO4UbMtxGI098ZMDmoe5ExLAvbG8zocWd57
	fFCqI41RsVZTiTGWhMH87Izf1da27Qmqy5/gxG4d9spXVG2C1/fzpX0sy9oQIenM9N9E=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1weYyo-009zDS-Go; Tue, 30 Jun 2026 15:58:26 +0200
Date: Tue, 30 Jun 2026 15:58:26 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: muhammad.nazim.amirul.nazle.asmade@altera.com
Cc: dinguyen@kernel.org, maxime.chevallier@bootlin.com,
	rmk+kernel@armlinux.org.uk, krzk+dt@kernel.org, conor+dt@kernel.org,
	robh@kernel.org, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, andrew+netdev@lunn.ch,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: socfpga: agilex5: Add SoCDK TSN Config2
 board
Message-ID: <edf84080-a5e0-478c-9977-af2376cb71c5@lunn.ch>
References: <20260630133108.27244-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
 <20260630133108.27244-3-muhammad.nazim.amirul.nazle.asmade@altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260630133108.27244-3-muhammad.nazim.amirul.nazle.asmade@altera.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_065840_150553_34743EEE 
X-CRM114-Status: UNSURE (   8.81  )
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

> + * gmac1 is the TSN port. The MAC operates in GMII mode internally
> + * while the PHY-side interface is RGMII, so mac-mode and phy-mode differ.
> + */
> +&gmac1 {
> +	status = "okay";
> +	phy-mode = "rgmii"; /* TX/RX clock delays provided by Agilex5 I/O hardware */

Could you provide more details about this. I want to understand the
big picture.

Normally we talk about the PCB providing the delays. This sounds like
it is the FPGA? So i need convincing this is correct.

https://elixir.bootlin.com/linux/v6.15/source/Documentation/devicetree/bindings/net/ethernet-controller.yaml#L287

	Andrew

