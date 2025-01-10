Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ED25E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 14:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7HjnwD9AZ9bpagwc/lNQ4PWx4QhMbmgXIuOqNi1NcM4=; b=KtmGUC4ReiR51yyXvKJGNLDUSr
	rcaybdnnkpSMw592Szh1kYFIaWkkKZdkx7JKnJWdGiq6U8/C8OpeizRrLs6q46eAhgGUqixzwd2MD
	asK1XMdZ6b6FQ8Es7xM5ExErtM1aZoxg4siFMepqr0891dMcYDjTaJumVP1fe2VYR6S4E3sPz5Tzs
	GMHlfTj9FCIZIIuQeY4mxze4KSDfgZNjb2ADE4Ozcy6UM3zi4jJN2UG+aepr9hwuI4gcmSxr8e3dt
	En7Oc/yDAfPVUJvcI5FrWGT4hz3SgkGOj6wykIMfm7LZlKjCmV6gAjoVFA0ROAFVx8lxFrM7WHz67
	vb+AiRlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWFga-0000000FaYp-1ICy;
	Fri, 10 Jan 2025 14:08:28 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWFcj-0000000FZbU-0JxO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 14:04:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=7HjnwD9AZ9bpagwc/lNQ4PWx4QhMbmgXIuOqNi1NcM4=; b=zMvidE4VIvrovRs9QONvhitB+e
	kR5gnG6ymO+glm9en1J1Nlb08FgSGdcAS+0mGVXiKMTo+P9EkwKryA4kVyfERm1Ro9LhQYslrd09E
	sm6f5XyNdv5meaPSUYbpk7Qr0SMHYYNNELxgiDRGuNUJX1sksmTlMQI8AiClUojT3jeQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tWFcM-003FJ8-1r; Fri, 10 Jan 2025 15:04:06 +0100
Date: Fri, 10 Jan 2025 15:04:06 +0100
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
Subject: Re: =?utf-8?B?5Zue6KaGOiDlm57opoY6IFtQQVRD?= =?utf-8?Q?H?= v2 05/10]
 ARM: dts: aspeed: system1: Add RGMII support
Message-ID: <9fbc6f4c-7263-4783-8d41-ac2abe27ba95@lunn.ch>
References: <SEYPR06MB5134CC0EBA73420A4B394A009D122@SEYPR06MB5134.apcprd06.prod.outlook.com>
 <0c42bbd8-c09d-407b-8400-d69a82f7b248@lunn.ch>
 <b2aec97b-63bc-44ed-9f6b-5052896bf350@linux.ibm.com>
 <59116067-0caa-4666-b8dc-9b3125a37e6f@lunn.ch>
 <SEYPR06MB51344BA59830265A083469489D132@SEYPR06MB5134.apcprd06.prod.outlook.com>
 <8042c67c-04d3-41c0-9e88-8ce99839f70b@lunn.ch>
 <c0b653ea-3fe0-4bdb-9681-bf4e3ef1364a@linux.ibm.com>
 <c05c0476-c8bd-42f4-81da-7fe96e8e503b@lunn.ch>
 <SEYPR06MB5134A63DBE28AA1305967A0C9D1C2@SEYPR06MB5134.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SEYPR06MB5134A63DBE28AA1305967A0C9D1C2@SEYPR06MB5134.apcprd06.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_060429_114932_531088C8 
X-CRM114-Status: GOOD (  19.60  )
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

> Agree. You are right. This part is used to create a gated clock.
> We will configure these RGMII delay in bootloader like U-boot.
> Therefore, here does not configure delay again.

> Because AST2600 MAC1/2 RGMII delay setting in scu region is combined to one 32-bit register, 
> MAC3/4 is also. I will also use 'aliase' to get MAC index to set delay in scu.
> 
> // aspeed-g6.dtsi
> aliases {
> 		..........
> 		mac0 = &mac0;
> 		mac1 = &mac1;
> 		mac2 = &mac2;
> 		mac4 = &mac3;
> 	};

I would avoid that, because they are under control of the DT
developer. You sometimes seen the order changed in the hope of
changing the interface names, rather than use a udev script, or
systemd naming scheme.

The physical address of each interface is well known and fixed? Are
they the same for all ASTxxxx devices? I would hard code them into the
driver to identify the instance.

But first we need to fix what is broken with the existing DT phy-modes
etc.

What is the reset default of these SCU registers? 0? So we can tell if
the bootloader has modified it and inserted a delay?

What i think you need to do is during probe of the MAC driver, compare
phy-mode and how the delays are configured in hardware. If the delays
in hardware are 0, assume phy-mode is correct and use it. If the
delays are not 0, compare them with phy-mode. If the delays and
phy-mode agree, use them. If they disagree, assume phy-mode is wrong,
issue a dev_warn() that the DT blob is out of date, and modify
phy-mode to match the delays in the hardware, including a good
explanation of what is going on in the commit message to help those
with out of tree DT files. And then patch all the in tree DT files to
use the correct phy-mode.

Please double check my logic, just to make sure it is correct. If i
have it correct, it should be backwards compatible. The one feature
you loose out on is when the bootloader sets the wrong delays and you
want phy-mode to actually override it.

When AST2700 comes along, you can skip all this, get it right from the
start and not need this workaround.

	Andrew

