Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CE44C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 08:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U6YMzP+2dWgWiUnFlZiTb7wmZcswaZFKOx7Tx9ijr9I=; b=HhxrtUygEKG8aetd+BlXRTvP9p
	pVkidSVX5XfEO+I7I8hUAX0cmyyXZDNB2utfb1PjsLWJDTkagHKMd8J7Pfj3qMiB7LYh5rapUqY85
	fi3RKmtkjLm37e+xRUqTN/rbNQDcCrc86blX/zFmusDbaOd06nCxxnjZKIoOf/bjATNiHhrzAUyB6
	qQR3vpYxlTs2k1+LlI7Wc5ADyVfuJB6tbHbuUPr89i+6+out6NifIlP3nN/hukSMigRidjvK6/yXy
	XjTrCI8EK1BxNfbdgQRVC18uhILTzaPag0Z3FYqtmAgAZVUZB8ox/SEy9hIOLl5IWD2Nqlg0dQUDl
	0yfgKg5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue8gX-00000001sxj-3uM1;
	Tue, 22 Jul 2025 08:49:17 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue7Ur-00000001fhl-1BAP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 07:33:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=U6YMzP+2dWgWiUnFlZiTb7wmZcswaZFKOx7Tx9ijr9I=; b=qChRxj60ECKPufnRYt+Lj+Pjgw
	4TtJYFrn2SbRTyUb9OZTtSuALjGdYgGwFaZsBPTCeKc1UhF8PGXaNXFgQpMNfJehBOL2TsAL/JghM
	ztZwOoy8KrecDxpV68upEIUo/CEEl2t3T3hj/P9Q6T4EzawJgEcd0UDh8/jZ6Sr0C9lVlg3a4H6Gb
	d9LwXuv/9y/bt/y3NF0gTq7tbVSCwErt4++t9G4cxQcUsiMzltqJu/i3KBZewhechX+QwOdB2XPdk
	drEU2x4ZHNlUpT4+y0OW3BJtZth18KWYGfy35nNbllatWoDjzItAg3AMxi8bq0F1wKCK3SjGRVvm6
	v4O4NA0w==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:50216)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1ue7UX-0007zl-2z;
	Tue, 22 Jul 2025 08:32:49 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1ue7UT-0006y6-1K;
	Tue, 22 Jul 2025 08:32:45 +0100
Date: Tue, 22 Jul 2025 08:32:45 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Krzysztof Kozlowski <krzk@kernel.org>,
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
Message-ID: <aH8-nQtNVuewNuwU@shell.armlinux.org.uk>
References: <20250721-wol-smsc-phy-v1-0-89d262812dba@foss.st.com>
 <20250721-wol-smsc-phy-v1-1-89d262812dba@foss.st.com>
 <faea23d5-9d5d-4fbb-9c6a-a7bc38c04866@kernel.org>
 <f5c4bb6d-4ff1-4dc1-9d27-3bb1e26437e3@foss.st.com>
 <e3c99bdb-649a-4652-9f34-19b902ba34c1@lunn.ch>
 <38278e2a-5a1b-4908-907e-7d45a08ea3b7@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <38278e2a-5a1b-4908-907e-7d45a08ea3b7@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_003309_322662_A6E98B5C 
X-CRM114-Status: GOOD (  12.86  )
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

On Mon, Jul 21, 2025 at 05:56:17PM +0200, Gatien CHEVALLIER wrote:
> Here's an extract from the Microchip datasheet for the LAN8742A PHY:
> 
> "In addition to the main interrupts described in this section, an nPME
> pin is provided exclusively for WoL specific interrupts."

So the pin on the PHY for WoL is called nPME? If this pin isn't wired
to an interrupt controller, then the PHY doesn't support WoL. If it is
wired, then could it be inferred that WoL is supported?

If so, then it seems to me the simple solution here is for the PHY
driver to say "if the nPME pin is connected to an interrupt controller,
then PHY-side WoL is supported, otherwise PHY-side WoL is not
supported".

Then, I wonder if the detection of the WoL capabilities of the PHY
in stmmac_init_phy() could be used to determine whether PHY WoL
should be used or not.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

