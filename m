Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ABFDE77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 17:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oo0AFK2EzQ2OwrwFCMPNzHx8Ha8dYNYdRLxBsPZu2ig=; b=1ZuU9DJXNQ/3RG3E/SFOe9RBPk
	aaoaBUPhW3o/YOw571oLbnRhL0lK9T0ZYj060igZduFB3BHGqxN4QJsCTTbJgN1VqVYWMFPbvKi8Q
	yxsQ/Q3cLBlUNpdCwizT4whMtcTHu7fGtO/HDuWhSDCFQkD0RAle8O5t4/B5gx7q8uVpsXs5EUehe
	Uy9xJ88pH+niV8yRJGwKBoduaqns5ud354PoeCA57zUCqMxBfcPkAqyyeT1WJuNNF6vVUFTET7972
	vAhnE53vzHcEGniPWKSTrzA5Y3vlL7xqfC3axG79NypYNhxNsgK+kFjmiPmKre6/EJ5XzvClAZjhP
	dTTlJ9DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVDqO-00000005vyI-01v3;
	Tue, 07 Jan 2025 17:58:20 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVDp7-00000005vbu-40if
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 17:57:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Oo0AFK2EzQ2OwrwFCMPNzHx8Ha8dYNYdRLxBsPZu2ig=; b=lDjijOYiFo0Tz9rfv4QLoNScC0
	/JkEh2Mo1bfS+s9xB2kXiZjOCVfOmsb0kb/MldD/OOId8ryI3y3i5k3KSO/Ezz37/brQyD/+xfcS+
	dFHdn8AE+fz+mSohPFa0UZauCEaSUv+VEDUHILm4oD5Db38RdWxuP3sipBHCokrY7Bo4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tVDoW-002JeJ-Oh; Tue, 07 Jan 2025 18:56:24 +0100
Date: Tue, 7 Jan 2025 18:56:24 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Ninad Palsule <ninad@linux.ibm.com>
Cc: minyard@acm.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	ratbert@faraday-tech.com, openipmi-developer@lists.sourceforge.net,
	netdev@vger.kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au,
	devicetree@vger.kernel.org, eajames@linux.ibm.com,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 05/10] ARM: dts: aspeed: system1: Add RGMII support
Message-ID: <6d9ea6f5-4ff5-40ed-b470-e40c1f6a5982@lunn.ch>
References: <20250107162350.1281165-1-ninad@linux.ibm.com>
 <20250107162350.1281165-6-ninad@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107162350.1281165-6-ninad@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_095701_991865_9528A3E8 
X-CRM114-Status: UNSURE (   9.47  )
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

On Tue, Jan 07, 2025 at 10:23:42AM -0600, Ninad Palsule wrote:
> system1 has 2 transceiver connected through the RGMII interfaces. Added
> device tree entry to enable RGMII support.
> 
> ASPEED AST2600 documentation recommends using 'rgmii-rxid' as a
> 'phy-mode' for mac0 and mac1 to enable the RX interface delay from the
> PHY chip.

Why?

Does the mac0 TX clock have an extra long clock line on the PCB?

Does the mac1 TX and RX clocks have extra long clock lines on the PCB?

Anything but rgmii-id is in most cases wrong, so you need a really
good explanation why you need to use something else. Something that
shows you understand what is going on, and why what you have is
correct.

     Andrew

