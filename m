Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4019EC02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 14:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nl3Mw4Ndpe7aZrKhI8t+n+/czM8OaalquBI/xX0tQ8A=; b=K46YTGnLckaayzhpX8eZvh1rli
	5svhQuET1P1tbCHtlT85nG23qIQiQ6ojpl8zxD7gXK51q+U3dphZbEgQSAJr9gFqXmXG2wuipNYou
	OPW2tJvoIR8w+5IAIdRm7CQunTJ2iZDn61oLBKxUiX0AkqjNrBd7lPQt3Lld9kk530Nioycfgm8EH
	x6t6LKTwqZNDh7FAwa8PWy/gmkkjctJ4pV3TyLbpFB1NaksjDTlRCuxoWHquuYO6XoBBOK1385yob
	8Od9/fNDKyoDeqDnirSznaXmUVLWIhaH/qDX4nQgDp/B2Esg1W6hTRv4YsxG6mq3njOODSETbad2W
	OLP5Wiag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXLc1-00000005RST-1c0Z;
	Mon, 13 Jan 2025 14:40:17 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXLan-00000005REc-0q8m
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 14:39:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=nl3Mw4Ndpe7aZrKhI8t+n+/czM8OaalquBI/xX0tQ8A=; b=WIdE1Sba7ulUJLWZr8AlOw/rac
	EHP1Csl7Y7MCeFWZf2F2bLnlUf58zNncweVjALqPxuZdMOE9F9nJOEhwl8XZ1m/hmIAUGrkMibmBS
	ipxofbBoyf3Wr/Af3EFLDh+lR6mS8W4IJJZ+AF4BP2oQylV4ESKodQD12FO/K1fpDO5A=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tXLaV-0047S8-N4; Mon, 13 Jan 2025 15:38:43 +0100
Date: Mon, 13 Jan 2025 15:38:43 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Ninad Palsule <ninad@linux.ibm.com>
Cc: Jacky Chou <jacky_chou@aspeedtech.com>,
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
 =?utf-8?B?6KaGOiBbUEFUQw==?= =?utf-8?Q?H?= v2 05/10] ARM: dts: aspeed:
 system1: Add RGMII support
Message-ID: <26dec4b7-0c6d-4e8e-9df6-d644191e767f@lunn.ch>
References: <b2aec97b-63bc-44ed-9f6b-5052896bf350@linux.ibm.com>
 <59116067-0caa-4666-b8dc-9b3125a37e6f@lunn.ch>
 <SEYPR06MB51344BA59830265A083469489D132@SEYPR06MB5134.apcprd06.prod.outlook.com>
 <8042c67c-04d3-41c0-9e88-8ce99839f70b@lunn.ch>
 <c0b653ea-3fe0-4bdb-9681-bf4e3ef1364a@linux.ibm.com>
 <c05c0476-c8bd-42f4-81da-7fe96e8e503b@lunn.ch>
 <SEYPR06MB5134A63DBE28AA1305967A0C9D1C2@SEYPR06MB5134.apcprd06.prod.outlook.com>
 <d80f5916-4918-4849-bf4e-2ef608ece09d@linux.ibm.com>
 <SEYPR06MB51340579A53502150F67ADEC9D1F2@SEYPR06MB5134.apcprd06.prod.outlook.com>
 <bcebe5ed-6080-4642-b6a5-5007d97fac71@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bcebe5ed-6080-4642-b6a5-5007d97fac71@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_063901_235586_2275A713 
X-CRM114-Status: GOOD (  16.87  )
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

On Mon, Jan 13, 2025 at 08:26:08AM -0600, Ninad Palsule wrote:
> Hi Jacky,
> 
> On 1/13/25 00:22, Jacky Chou wrote:
> > Hi Ninad,
> > 
> > > Thanks. When are you planning to push this change? I might need to hold on to
> > > mac changes until then.
> > Yes. We have a plan to push the patch about RGMII delay configuration.
> > Currently, I try to align our SDK to kernel.
> 
> Thanks. What will be the "phy-mode" value after you make these changes?
> 
> Will it be "rgmii-id" for MAC1..4?

It should be.

> If that is the case then I can test it with current configuration which may
> add extra delays in the RX from PHY side.

I would then expect traffic will not flow correctly, and your see CRC
errors, because of double delays. It is however a useful test, because
if it does somehow work, it probably means the PHY driver is also
broken with its handling of delays. I don't know what PHY driver you
are using, but those in mainline should be correct, it is something i
try to review carefully.

	Andrew

