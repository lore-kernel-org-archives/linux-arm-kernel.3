Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B13D2C83F25
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 14:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Iu0MZizAD+mX37RbvQ2AbUD5OXOvKekOBhPm5ibu4+A=; b=x5nkTbrsqx9U1cDz12BdyFFMZI
	CmuB8OXUF2VhDtM5Vth+BEbCpZYMN4UmCx75lJvmG4TPEw/f5E8ISb7e9r+gxN60TdnV3XItu4V9c
	lB8i5Ph5Na4T1MFniMHNo7Z7JUUj4WDFwKAsK5x9NFXDuxS5e3e3EOT+qrjVatRnTOOLSO0PdLGRr
	2RUU3a3O5Xu8vcbUdkalgypwVPu4C0sJmqnvsNlVnJ2PSVVXw5dO5bxFeuiVh5jNEOqUESbjajPpl
	CoigKpRSGrBaTT65Hf/PgS1S3QkZrfB8QeM0v/23hx4wbZivz6yX3Cv5yqlZwzh/hgQrjZRrwbOxm
	LSiJ/6tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udrh0-0000000HZ4m-2LbK;
	Mon, 21 Jul 2025 14:40:38 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udqPW-0000000HN0l-09lM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 13:18:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Iu0MZizAD+mX37RbvQ2AbUD5OXOvKekOBhPm5ibu4+A=; b=nrdI+M3aQ0sLQJfdpr69XSIBWD
	hNljtDEm6EPT99GX7RmDm3zSlfR4wecZ0JMyDVhN+w7YICvUdQwd9lL6Y8j27Mp2db5FIyTRf0lE4
	86PFmxDKMDn9j+/26bSHkQNE8VCK223nPbCJLnK2AW2U50SOD8EgjR7M26tXt8XyffXE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1udqPI-002MGi-2j; Mon, 21 Jul 2025 15:18:16 +0200
Date: Mon, 21 Jul 2025 15:18:16 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
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
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	Tristram Ha <Tristram.Ha@microchip.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 1/4] dt-bindings: net: document st,phy-wol
 property
Message-ID: <e3c99bdb-649a-4652-9f34-19b902ba34c1@lunn.ch>
References: <20250721-wol-smsc-phy-v1-0-89d262812dba@foss.st.com>
 <20250721-wol-smsc-phy-v1-1-89d262812dba@foss.st.com>
 <faea23d5-9d5d-4fbb-9c6a-a7bc38c04866@kernel.org>
 <f5c4bb6d-4ff1-4dc1-9d27-3bb1e26437e3@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f5c4bb6d-4ff1-4dc1-9d27-3bb1e26437e3@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_061830_072252_C6F406D5 
X-CRM114-Status: GOOD (  17.72  )
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

On Mon, Jul 21, 2025 at 02:10:48PM +0200, Gatien CHEVALLIER wrote:
> Hello Krzysztof,
> 
> On 7/21/25 13:30, Krzysztof Kozlowski wrote:
> > On 21/07/2025 13:14, Gatien Chevallier wrote:
> > > The "st,phy-wol" property can be set to use the wakeup capability of
> > > the PHY instead of the MAC.
> > 
> > 
> > And why would that be property of a SoC or board? Word "can" suggests
> > you are documenting something which exists, but this does not exist.
> Can you elaborate a bit more on the "not existing" part please?
> 
> For the WoL from PHY to be supported, the PHY line that is raised
> (On nPME pin for this case) when receiving a wake up event has to be
> wired to a wakeup event input of the Extended interrupt and event
> controller(EXTI), and that's implementation dependent.

How does this differ from normal interrupts from the PHY? Isn't the
presence of an interrupt in DT sufficient to indicate the PHY can wake
the system?

	Andrew

