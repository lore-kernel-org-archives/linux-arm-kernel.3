Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B106E77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 14:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YfjcKm0d4Vajn+h/jwMfdima+TwcpMUsitsmuyI+KwE=; b=xJCgCHFRolMCjHVfsfdFWnRtX8
	MJFrxysOH9NQ3JJ8p6EsiWWWg+pu6OtXdRIB+GfKPZrZ0pGaPRqRZsacjQ6RdBztDwAIdFUL/NzxO
	BiI2QMX2fqoKx6mK5ocZ90+uX+N60HTAxCcYocLAPRjkdMsJRAk9UuBT0XcvC9tDi+8mpI9z8xOBk
	xdTHcQLIBnMwBzeOJV3pXggRxoQInMef0pDqzgjHul+ZLnh/JchQRUhk53gzDFBBwUOmljTBnMTM7
	dcAOsdO2Sb+I5WDI3Ct5OqmFWR8482A7k0bG3cR0zXIWiks4d+vDIsaScZEcG5BW7i6juDruXohoc
	di1uiq7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVtqx-0000000CIs2-4AfJ;
	Thu, 09 Jan 2025 14:49:43 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVtpl-0000000CIZ2-0ERl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 14:48:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=YfjcKm0d4Vajn+h/jwMfdima+TwcpMUsitsmuyI+KwE=; b=mGzh0Iq+K5BiGQJKCYwFjh52FU
	8bznveg2/N0yjqFingSY3hMZhRhiI8vCLBYMpXXUpVkwspAxYT7Ot3r33BkECyz5qI+0WzMjqmqFc
	YzPlAj0bQp/V5Fg/nycCtFmwKyIZNH5f0qN5RcgXWY1eYQhNiuE/4nPdt9jR7lGytIio=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tVtpR-002v8k-IQ; Thu, 09 Jan 2025 15:48:09 +0100
Date: Thu, 9 Jan 2025 15:48:09 +0100
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
Subject: Re: [PATCH v2 05/10] ARM: dts: aspeed: system1: Add RGMII support
Message-ID: <8ae7c237-abcf-4079-a4ba-ce17e401917d@lunn.ch>
References: <SEYPR06MB5134CC0EBA73420A4B394A009D122@SEYPR06MB5134.apcprd06.prod.outlook.com>
 <0c42bbd8-c09d-407b-8400-d69a82f7b248@lunn.ch>
 <6ac77e5d-e931-494a-9777-6ed0bc4aa1e9@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6ac77e5d-e931-494a-9777-6ed0bc4aa1e9@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_064829_090665_24B5B6B0 
X-CRM114-Status: UNSURE (   7.06  )
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

> When does someone use rgmii-txid and rgmii-rxid?

When there is an extra long RX clock line on the PCB, but not the TX
clock line, you would use rgmii-txid. If there is an extra long TX
clock line, but not RX clock, you would use rgmii-rxid. You do not see
this very often, but it does exist:

arch/arm/boot/dts/nxp/ls/ls1021a-tsn.dts

/* RGMII delays added via PCB traces */
&enet2 {
        phy-mode = "rgmii";
        status = "okay";

	Andrew

