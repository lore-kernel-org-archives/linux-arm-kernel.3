Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CF76C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 13:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Jxfu41iCy3/Xl/2SlMHlq/E6+bEJVMK0dEbie6RGZA=; b=xF1A5RwFHZ+4m7BvulTjSo/7eY
	DInk9tHvuanN4vxAqZIFjc2BYQB9dA1fNruDLI5WGpgtt2CNlrq8MQB89jWBV7wv+BwDnaCQffgI6
	1+onnjLy8+PF5w9qW+rhv45uuIkcTKZ73Qvm44GZ7g9kSHgzwZ1TMBuCzSMBRGoYSrtZ7gt57RSKZ
	KFNfZYektrtXw8jcyu3bGehoCC+yAhJAoj79S5Mb9ypLXHu/xjfWIrpB+mjrBQAGiaBTLz9HBuevM
	xwNOh1PrVOx6T5ced8obzDAz4mKmUCRPIk2OpsphsrcR4NNu1O3ip8B6WMCRG4KU31i+/VePVjvHJ
	2FoY14iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY3Vn-0000000Bz9x-34vu;
	Wed, 15 Jan 2025 13:32:47 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY3TT-0000000Bygz-1mp5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 13:30:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=7Jxfu41iCy3/Xl/2SlMHlq/E6+bEJVMK0dEbie6RGZA=; b=Ij3Sj/Txb2dxOJgo3P6GgArB+/
	dEwiCa+37ZNiUwU0vMWkSRkhXvTogV3InoFtWWh2wqagd9Zjs5v4p5SaaJBMjx4HbDjyeWCYxm17j
	gkhD2tSn1E2sWqOKsblQoPD7u3iP/onq5igWETBEd8eJ9Cp0Wr9GQFrhWHjEi4xkdokI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tY3TA-004nPe-5A; Wed, 15 Jan 2025 14:30:04 +0100
Date: Wed, 15 Jan 2025 14:30:04 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: Ninad Palsule <ninad@linux.ibm.com>,
	"andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"eajames@linux.ibm.com" <eajames@linux.ibm.com>,
	"edumazet@google.com" <edumazet@google.com>,
	"joel@jms.id.au" <joel@jms.id.au>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"minyard@acm.org" <minyard@acm.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"openipmi-developer@lists.sourceforge.net" <openipmi-developer@lists.sourceforge.net>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	"ratbert@faraday-tech.com" <ratbert@faraday-tech.com>,
	"robh@kernel.org" <robh@kernel.org>
Subject: Re: =?utf-8?B?5Zue6KaGOiDlm57opoY6IOWbng==?=
 =?utf-8?B?6KaGOiDlm57opoY6IOWbnuimhjogW1BBVEM=?= =?utf-8?Q?H?= v2 05/10]
 ARM: dts: aspeed: system1: Add RGMII support
Message-ID: <f28736b5-f4e4-488e-8c9b-55afc7316c5e@lunn.ch>
References: <c0b653ea-3fe0-4bdb-9681-bf4e3ef1364a@linux.ibm.com>
 <c05c0476-c8bd-42f4-81da-7fe96e8e503b@lunn.ch>
 <SEYPR06MB5134A63DBE28AA1305967A0C9D1C2@SEYPR06MB5134.apcprd06.prod.outlook.com>
 <d80f5916-4918-4849-bf4e-2ef608ece09d@linux.ibm.com>
 <SEYPR06MB51340579A53502150F67ADEC9D1F2@SEYPR06MB5134.apcprd06.prod.outlook.com>
 <bcebe5ed-6080-4642-b6a5-5007d97fac71@linux.ibm.com>
 <26dec4b7-0c6d-4e8e-9df6-d644191e767f@lunn.ch>
 <SEYPR06MB5134DD6F514225EA8607DC979D192@SEYPR06MB5134.apcprd06.prod.outlook.com>
 <e5178acd-0b6f-4580-9892-0cca48b6898a@lunn.ch>
 <SEYPR06MB513402FD4735C602C5531F499D192@SEYPR06MB5134.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SEYPR06MB513402FD4735C602C5531F499D192@SEYPR06MB5134.apcprd06.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_053023_460836_67A05748 
X-CRM114-Status: GOOD (  12.02  )
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

> > I already explain how this works once. Please read this thread again.... The
> > MAC can apply the delays, but it must mask the phy-mode it passes to the PHY.
> 
> Yes. I have read these mails.
> 
> I understand what you mean.
> "rgmii": delay on PCB, not MAC or PHY.
> "rgmii-id": delay on MAC or PHY, not PCB.
> 
> ftgmac100 driver gets phy driver handle from of_phy_get_and_connect(), it will pass the phy-mode to
> phy driver from the node of mac dts.
> Therefore, I use "rgmii-id" and the phy will enable tx/rx internal delay.
> If I use "rgmii-id" and configure the RGMII delay in ftgmac100 driver, I cannot pass the phy-mode to 
> phy driver.

Quoting myself, yet again:

> > MAC can apply the delays, but it must mask the phy-mode it passes to the PHY.

If you decide the MAC does the RX clock delay, it needs to mask that
from the phy-mode, otherwise the PHY will also do it. If you decide
the MAC does the TX clock delay, its needs to mask that from the
phy-mode.

	Andrew

