Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42B4FCAC597
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 00:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wJr+506HYavhLyAPNE14fMgJgbHbAikFhnzPhM0kVTM=; b=RLSQq1nuhXHPZ0bPPrX/NJRlNK
	Ra9GQ4TAocDpgnLnkvQcEeM0ZkFxVJA2YweGOUKQsClqmehI+YIwdBJz++dXxgcAUIBH1rUUDTvQd
	iB55b2ekJxpK/b3OPDHfI9sv9sDp1Mrvf/rMvOsNH3ehrzhZXmcSbfs/Fqbk3QI0W2/avKbB6pEha
	urRVapdtJfUKXQ4nUEzvTmDBYWa7PHnG9twjovaujbUk7bnijvrHJ2feODbyHnnDLsy+va4z5ZHhR
	Nc+2dwn4PwyXmxyJlMO1/1Bn/poqU3KgHpkunOby1yHp9TRv9sFOSZkq3kKAnQXI3L1TiH6WxxNob
	3abQ3G4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyJhA-000000062t1-31hi;
	Tue, 16 Sep 2025 00:37:20 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyJh8-000000062sT-27vi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 00:37:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=wJr+506HYavhLyAPNE14fMgJgbHbAikFhnzPhM0kVTM=; b=E2LjKSHHRSkxB/9Njm9q50MF83
	5VIRQcjknoMGoSETEPmq1ef9Bm/AV5jPSVpEYvzAaLcUJXhg10I9yN6duT7TuNjN+S7adLuZLbRLy
	tEvYLVQ0qxx+nfDYqjXvQHhOjUC17HFMHdR6O5up+6uOgNsk857c0y41t4QQwibbvQQA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uyJgs-008V93-Hj; Tue, 16 Sep 2025 02:37:02 +0200
Date: Tue, 16 Sep 2025 02:37:02 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Rebecca Cran <rebecca@bsdio.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ARM: dts: aspeed: add device tree for ASRock Rack
 ALTRAD8 BMC
Message-ID: <74e68c53-2696-4f86-97d3-c0b0a74d4669@lunn.ch>
References: <20250911051009.4044609-1-rebecca@bsdio.com>
 <20250911051009.4044609-3-rebecca@bsdio.com>
 <58a092c5-5dd0-4718-831a-e25ecb184087@lunn.ch>
 <5ccc4945-87f6-4325-b034-ca3f2f90257a@bsdio.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5ccc4945-87f6-4325-b034-ca3f2f90257a@bsdio.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_173718_542567_66D5D14C 
X-CRM114-Status: GOOD (  12.26  )
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

On Mon, Sep 15, 2025 at 06:26:04PM -0600, Rebecca Cran wrote:
> On 9/11/25 08:09, Andrew Lunn wrote:
> > There is no phy-handle here, and no mdio node in this file. What is
> > the MAC connected to? Does it connect to the hosts Ethernet interface?
> 
> Yes, it's connected to one of the host's 10Gb Ethernet interfaces.

O.K. Maybe add a comment please.

> > RGMII pinctrl is referenced here. This opens up the question about
> > RGMII delays. What is this MAC connected to?
> 
> It's the AST2500 MAC2, connected to the management LAN ethernet port.

And does it have a PHY? On an MDIO bus? Unless i'm mistaken, you don't
describe the PHY, a phy-handle pointing to the PHY, and don't have
phy-mode = 'rgmii-id'.

	Andrew

