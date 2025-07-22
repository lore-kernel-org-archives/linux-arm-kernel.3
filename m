Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF466C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 21:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eVLbWCzQczw2dFn7K3G8G8HQYlWdsk18wtghWYXLXEs=; b=EsMSz+3pbERPeboMqwdk/O0ju0
	oyrOGF9FKB9XrcN2w7iDKWasKRi0Bcey7TUx7YCQwroDvd6GiGGadY+UXXXC746rXv9JgfcyZe1Bm
	N3ywBHx8lm7W5dhgX50XO9nYhdcEsNvfJ7k2S/Vix4dfI8DRtEi7DPzFkjRJ6/+gGgonTMLWGwqCg
	1oehUxCPGwzJdvTGGElpmzAvM+mn+0JoK0Ncx6dWgs3pdWU31LwmWvaASco7RbNlNNWbI40IxSLG8
	dkUNQAR1zP4nO28xE5G2K4yQd/s2+8InXZaiAHnsRRpSoeH00WDLCSYOY8QudGTa2hWyA/c+tYmpq
	vcwODdDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueKCe-00000003UTh-3aoY;
	Tue, 22 Jul 2025 21:07:12 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueK5q-00000003TjX-4A8E
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 21:00:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=eVLbWCzQczw2dFn7K3G8G8HQYlWdsk18wtghWYXLXEs=; b=DMD8TWmYpjGyDAzTKybNamT+9v
	SMMohcfkCxMGht1XfGZKiyP/Qib/NSMjLLos+LeLQa96Y4GQGSFrjFFwqk/pQ5VgZmgaYiqNsVZi9
	5T9ER95fROMwNnkI03V/xl204eX2geij4sBPIBBSPkjVK3onQrXq4cPe4MPu/8yU1NOM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1ueK5X-002VRl-Bv; Tue, 22 Jul 2025 22:59:51 +0200
Date: Tue, 22 Jul 2025 22:59:51 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Simon Horman <horms@kernel.org>,
	Tristram Ha <Tristram.Ha@microchip.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 1/4] dt-bindings: net: document st,phy-wol
 property
Message-ID: <ae31d10f-45cf-47c8-a717-bb27ba9b7fbe@lunn.ch>
References: <20250721-wol-smsc-phy-v1-0-89d262812dba@foss.st.com>
 <20250721-wol-smsc-phy-v1-1-89d262812dba@foss.st.com>
 <faea23d5-9d5d-4fbb-9c6a-a7bc38c04866@kernel.org>
 <f5c4bb6d-4ff1-4dc1-9d27-3bb1e26437e3@foss.st.com>
 <e3c99bdb-649a-4652-9f34-19b902ba34c1@lunn.ch>
 <38278e2a-5a1b-4908-907e-7d45a08ea3b7@foss.st.com>
 <5b8608cb-1369-4638-9cda-1cf90412fc0f@lunn.ch>
 <383299bb-883c-43bf-a52a-64d7fda71064@foss.st.com>
 <2563a389-4e7c-4536-b956-476f98e24b37@lunn.ch>
 <aH_yiKJURZ80gFEv@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aH_yiKJURZ80gFEv@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_140011_037398_2982B7CA 
X-CRM114-Status: UNSURE (   8.34  )
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

>         if (!priv->plat->pmt) {

Let me start with maybe a dumb question. What does pmt mean? Why would
it be true?

>                 struct ethtool_wolinfo wol = { .cmd = ETHTOOL_GWOL };
> 
>                 phylink_ethtool_get_wol(priv->phylink, &wol);
>                 device_set_wakeup_capable(priv->device, !!wol.supported);
>                 device_set_wakeup_enable(priv->device, !!wol.wolopts);

Without knowing what pmt means, this is pure speculation....  Maybe it
means the WoL output from the PHY is connected to a pin of the stmmac.
It thus needs stmmac to perform the actual wakeup of the system, as a
proxy for the PHY?

	Andrew


