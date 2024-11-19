Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A996DD60D03
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 01:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xySWq+GoYzDun91uVlEVQ1i2/eAkfhtKbJiC0a+d9TQ=; b=pM/u5ZrRSmVazYwrScHcfKMd3O
	Im7RC4nD6lwe09Wfh2ckXgro51dlsuuNrfSzFCSBIl549C3iXo5vRDems2M8RC6OcVnIqSW/kgmXz
	LCZZeDKBFzDunClCwQN6MZvDDlPtyKI84HsN4fI6IL6ov92F0yFSMfVJCOTkqvuOA1LlNH4BRKiWI
	61pz4Kdn1+bdiip75goNkcumV+ur7tLPKAE0NxuynKKxB0XX/C7VAh8NpogEU9fPJsxAl9YU8uwEN
	kZLsghf/ngcrDH8AN7YXPXfeeCCjaLBEPlN07O5mxrjpy7k138fJUVmzjBKZSNWaMuORlTxlyZENa
	9TALT4tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDCc6-0000000Aztj-3XwL;
	Tue, 19 Nov 2024 01:01:06 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDCbB-0000000AzlU-1HBg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 01:00:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=xySWq+GoYzDun91uVlEVQ1i2/eAkfhtKbJiC0a+d9TQ=; b=3jM89Q1rX/g8rqO/mJtBMQQbFE
	qesK0GQlBUhRCDTUfHew7ib3HHikAuepx1ogjBbsOJKdswtGDsjLij3ePm8KwIXY86B4h7wazvUDj
	r4o2jwdNDte2bw6qsCsDIyr94idpPNTvJMP6X7vHFkjMx5+x0yg/arxqHuLjQIFlZKaU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tDCaw-00Dj0f-SL; Tue, 19 Nov 2024 01:59:54 +0100
Date: Tue, 19 Nov 2024 01:59:54 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: UNGLinuxDriver@microchip.com, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Lars Povlsen <lars.povlsen@microchip.com>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Russell King <linux@armlinux.org.uk>, jacob.e.keller@intel.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next v2 8/8] dt-bindings: net: sparx5: document RGMII
 MAC delays
Message-ID: <5b9d79f1-ccdd-47c3-a02a-5ff0b12c1fb8@lunn.ch>
References: <20241113-sparx5-lan969x-switch-driver-4-v2-0-0db98ac096d1@microchip.com>
 <20241113-sparx5-lan969x-switch-driver-4-v2-8-0db98ac096d1@microchip.com>
 <29ddbe38-3aac-4518-b9f3-4d228de08360@lunn.ch>
 <20241115092237.gzpat4x6kjipb2x7@DEN-DL-M70577>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241115092237.gzpat4x6kjipb2x7@DEN-DL-M70577>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_170009_343784_0CE53A8E 
X-CRM114-Status: GOOD (  18.60  )
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

On Fri, Nov 15, 2024 at 09:22:37AM +0000, Daniel Machon wrote:
> Hi Andrew,
> 
> > > The lan969x switch device supports two RGMII port interfaces that can be
> > > configured for MAC level rx and tx delays.
> > >
> > > Document two new properties {rx,tx}-internal-delay-ps. Make them
> > > required properties, if the phy-mode is one of: rgmii, rgmii_id,
> > > rgmii-rxid or rgmii-txid. Also specify accepted values.
> > 
> > This is unusual if you look at other uses of {rt}x-internal-delay-ps.
> > It is generally an optional parameter, and states it defaults to 0 if
> > missing, and is ignored by the driver if phy-mode is not an rgmii
> > variant.
> 
> Is unusual bad? :-)

Depends. Having a uniform usage is good, it causes less confusion. But
strict enforcement also has its plus side.

> I thought that requiring the properties would make
> misconfigurations (mismatching phy-modes and MAC delays) more obvious,
> as you were forced to specify exactly what combination you want in the
> DT.  Maybe not. I can change it,  no problem.

Do these ports only support RGMII? The general pattern is that ports
supporting RGMII also support other modes, GMII, MII, rev-GMII,
rev-MII etc. For these other modes RGMII delays are meaningless. The
general pattern is that they are allowed in DT, but are just ignored.

If the LAN969x ports only support RGMII, and you are enforcing the
four RGMII modes in DT, you could also enforce the delays are present
and only have all allowed values. But i would not have the enforcement
any more strict than the other ports. Do you enforce the phy-modes for
the ports with a PCS?

	Andrew

