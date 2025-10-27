Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13525CCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 12:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iA7t2Iu5WmijCKzI4GOFbP1+sQVyXkrlu3SiinRY5fE=; b=ciRlNICx4uabjSkyR6knd4iSIR
	NnEClYET/ZuYbRjofFQbG1lbpZ9UOu+RVoUfJjE5EsrSoVcq1PGkmgTEpwfdomJiKdVEZiWaeYsUb
	cePIlw2GboBB3GzDvNXo+Mz4UedBJ4vQbZYJxz98y98g84AgbC1KkmW7L9IaRFXVse9opt2LbuPEX
	cY/YErw7ZCru9zly3V8opYSQQ5Bkd+HfO4L/U3TJ5kk7IQtk+WNBaOIx5Kc2ifF6dyatzqO7Sp5uU
	nDhJlR1RdDFfMfQhPidmgXYOtt+RFVEAx0y5dujscys7zHwSgIt3MMiWT3gT/2udxjpEH2wIHqBUv
	fwSnbFJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDMRC-0000000Du8M-3mu3;
	Mon, 27 Oct 2025 12:35:02 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDMR9-0000000Du7f-40CT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 12:35:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=iA7t2Iu5WmijCKzI4GOFbP1+sQVyXkrlu3SiinRY5fE=; b=xOHj51J/BGH7TW8B1tue9x+1cZ
	ciRjmO0LOkcfCgqKGjCBlhej8qpS2adZBtz83L4kTWr2SWApaY5YfMZ2y2Ezd/LwY8+ytZgOHpVEC
	5g2JJQlARRG/mEHbQFcddVjttfvRkuIDkru5t5BQhF1yh4cYwCY8enA2+QPSZI+5AZyY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vDMQs-00CBov-Nc; Mon, 27 Oct 2025 13:34:42 +0100
Date: Mon, 27 Oct 2025 13:34:42 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: BMC-SW <BMC-SW@aspeedtech.com>, Arnd Bergmann <arnd@arndb.de>,
	"andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"edumazet@google.com" <edumazet@google.com>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"joel@jms.id.au" <joel@jms.id.au>,
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
	"hkallweit1@gmail.com" <hkallweit1@gmail.com>,
	"linux@armlinux.org.uk" <linux@armlinux.org.uk>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: =?utf-8?B?5Zue6KaG?= =?utf-8?Q?=3A?= [net-next 0/3] Add Aspeed
 G7 MDIO support
Message-ID: <ad12992b-2ddf-406f-a024-dd402f8a3f0c@lunn.ch>
References: <20241118104735.3741749-1-jacky_chou@aspeedtech.com>
 <7368c77e-08fe-4130-9b62-f1008cb5a0dc@lunn.ch>
 <SEYPR06MB513478C462915513DE7BE1AE9DFCA@SEYPR06MB5134.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SEYPR06MB513478C462915513DE7BE1AE9DFCA@SEYPR06MB5134.apcprd06.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_053459_999094_481F6C88 
X-CRM114-Status: GOOD (  19.11  )
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

On Mon, Oct 27, 2025 at 02:44:23AM +0000, Jacky Chou wrote:
> Hi Andrew,
> 
> This is Jacky from ASPEED.
> Last year, I submitted a series of patches to add a new compatible string
> "aspeed,ast2700-mdio". At that time, the feedback I received was that if there
> were no functional changes, a new compatible string would not be necessary.
> Recently, we are submitting the AST2700 platform support to the Linux kernel.
> In the following discussion thread, it appears that the MDIO driver might need
> a new compatible string for the AST2700 platform:
> https://lore.kernel.org/all/b048afc1-a143-4fd0-94c9-3677339d7f56@lunn.ch/
> I would like to confirm whether this case should be submitted separately to
> net-next, and in general, if there are no hardware or design changes, is it
> still required to introduce a new compatible string?

Are you sure it is identical? And are you sure there are no bugs in
the driver which would require breaking backwards compatibility, like
you are going to be doing for the MAC driver?

Take the reset handling for example. It looks like it was added after
basic support for the 2600 has added, so it had to be optional, to not
break backwards compatibility with older DT blobs. But since there is
no support for the 2700 yet, you could make the reset mandatory,
without breaking anything.

How is the clock handled on this hardware? The MDC is currently
ticking at 2.5MHz. However many PHYs and MDIO based Ethernet switches
will happy run at a faster speed. So you could implemented
'clock-frequency'. But for that, do you need a clock listed? Should
that clock be listed now, as a mandatory property for the 2700?

Having a specific compatible and a fallback costs nothing, so i would
do it. 

	Andrew

