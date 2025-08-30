Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2386ECA0FFD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 21:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lGPDXnyGYW0XoDW4eruhlRzw1Pka3lDz/kJqkb3Hz1k=; b=TUSuv01CYGYjqBErlMQAJAQ+19
	rR2dxSMoEDB/NUaWGB47kX4fG95uxMWyo1HY7OwImhFIDXcXbc5uKWEgWBeX6PEFkt2Re1IFsfafN
	FZWHgf+EukupmokLibco7vIWmzIn/YOLCJDGgtXSFbwwejprT9dQ3M8wTgf0GjycE8SBCrvB5OBjM
	IPF3TiPgr8dv3eImQ/xqVhi/pQUnrQ3VkAcqo/LuRn+uKgzm0HIyTLzEsYo8sJbFDRnOUho0TKtxh
	5E6lW1ID51NANqPc5FpIIoVRhTevB8EMaoIonelIySwKiA1FKOEMgg/gTBIg2o2Ip1nlWp1cusNe5
	NNYo/ZhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usTR0-00000008T2h-0RTN;
	Sat, 30 Aug 2025 21:48:30 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usTNE-00000008Srn-3Exp
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 21:44:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=lGPDXnyGYW0XoDW4eruhlRzw1Pka3lDz/kJqkb3Hz1k=; b=ble5xxoLGxUvv/PLnLcgzkto+N
	QjyWij/EswwddxjEC0pKfxn9Mp72yHI9nXr4naY+HhD6S/DRkrHLFRfBtG5OCWL4c8W63HD89DLsl
	IQxx7brRWJM65yvz1Iim0TqugnYM/xtgAt1N6zAy+43B/iU5gxR54LLDFm51izL0RaeOmocWZyJzP
	gCrtgUvbpJIt3TN6q3o0ujHpVSKOeyqQjsODhYmKdMXX2qx5BkdJZ1A7SSco9Yv7jfsAsCR2lA+00
	sluqE9cvgiHyK/S5wN/acApHVPY8cmkQr91/PyW1T5iK39KyefqMzJV4GIkgdG5lqvZg4S7WwNZ2m
	+QZlyZqQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:58744)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1usTN4-000000004U3-2172;
	Sat, 30 Aug 2025 22:44:26 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1usTN2-000000005QQ-1VSx;
	Sat, 30 Aug 2025 22:44:24 +0100
Date: Sat, 30 Aug 2025 22:44:24 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Eric Dumazet <edumazet@google.com>,
	David Miller <davem@davemloft.net>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>
Subject: Re: [PATCH net-next 1/5] arm64: dts: ls1043a-qds: switch to new
 fixed-link binding
Message-ID: <aLNwuEqSqrUM3dW6@shell.armlinux.org.uk>
References: <a3c2f8d3-36e6-4411-9526-78abbc60e1da@gmail.com>
 <fe4c021d-c188-4fc2-8b2f-9c3c269056eb@gmail.com>
 <aLNst1V_OSlvpC3t@shell.armlinux.org.uk>
 <d2012185-0403-4bad-ad4a-e0468e11928d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d2012185-0403-4bad-ad4a-e0468e11928d@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_144436_813079_E1C84313 
X-CRM114-Status: GOOD (  13.19  )
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

On Sat, Aug 30, 2025 at 11:39:58PM +0200, Heiner Kallweit wrote:
> On 8/30/2025 11:27 PM, Russell King (Oracle) wrote:
> > On Sat, Aug 30, 2025 at 12:27:23PM +0200, Heiner Kallweit wrote:
> >> The old array-type fixed-link binding has been deprecated
> >> for more than 10 yrs. Switch to the new binding.
> > 
> > ... and the fact we have device trees that use it today means that we
> > can't remove support for it from the kernel.
> > 
> After this series there is no in-tree user of the old binding any longer.

Doesn't matter. Please read Documentation/devicetree/bindings/ABI.rst
particularly the but about "newer kernel will not break on an older
device tree".

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

