Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C05BCAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 14:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FFLORDihYCicM5VZt7vNB80L4AErinlH5+UxIfqQxVw=; b=P9RYCjnIk00AZZkbXYiXuTr2KV
	L1xqYqDyN+Ew5gDaurspfLiSq9qezrrZ7fIUBfNIRaqzpxHW5ba2B+wBG68gIsvyrCfyKTDFQCCJr
	bu/s8w+en5at96mERN3/h3M6YbxGfQKfQf9ZTzP3xoIJztAblHCz3B/Ob4wqAJumWBnPJplRqanhb
	ikjaWx+fcN5AsZhFQk7HMHm3bfNPmTP+ws1RWHAFrztzXmdThTfZGYxjCsOadLaF1Su+MQyBxjgli
	qaXpq11GxC32x/GDmSStQyHGbwbAr3q5JyIQ4IS4CJ+wr5m2ae8Jcu69HHfJ9uKDIpKT8awjHZSnN
	mmjgS+qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzFKp-000000003Q1-1hVl;
	Thu, 18 Sep 2025 14:10:07 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzFKm-000000003My-0K4N
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 14:10:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=FFLORDihYCicM5VZt7vNB80L4AErinlH5+UxIfqQxVw=; b=FhpXnzrZcb6mjDFRd2NdWQ823k
	R1B/DN7Ol8sQnnusRoRVLVERXTDVPwq1oVqpGj/rKM/9/Z6+AG7R2cKBc/su7lPAwG4hsTsFPsI7e
	yUg2SmC1Fb4dXcWWQwxNoOuGivGonRXsPgGFp6WWOJjmVD3NUrCfzObSrDiF1HqBRLgs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uzFKa-008pbw-Bz; Thu, 18 Sep 2025 16:09:52 +0200
Date: Thu, 18 Sep 2025 16:09:52 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Josua Mayer <josua@solid-run.com>
Cc: Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Wunderlich <frank-w@public-files.de>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH v2 3/4] arm64: dts: marvell: cn9132-clearfog: fix
 multi-lane pci x2 and x4 ports
Message-ID: <dedd4222-b2ba-4247-98b4-504b5c032f69@lunn.ch>
References: <20250911-cn913x-sr-fix-sata-v2-0-0d79319105f8@solid-run.com>
 <20250911-cn913x-sr-fix-sata-v2-3-0d79319105f8@solid-run.com>
 <9272b233-b710-4e57-b3ff-735f45c03c74@lunn.ch>
 <dbb10e82-ae10-4987-900b-17d4f4b62099@solid-run.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dbb10e82-ae10-4987-900b-17d4f4b62099@solid-run.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_071004_116035_F0AB8813 
X-CRM114-Status: GOOD (  19.10  )
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

On Thu, Sep 18, 2025 at 10:46:03AM +0000, Josua Mayer wrote:
> Am 12.09.25 um 00:12 schrieb Andrew Lunn:
> > On Thu, Sep 11, 2025 at 08:28:06PM +0200, Josua Mayer wrote:
> >> The mvebu-comphy driver does not currently know how to pass correct
> >> lane-count to ATF while configuring the serdes lanes.
> >>
> >> This causes the system to hard reset during reconfiguration, if a pci
> >> card is present and has established a link during bootloader.
> >>
> >> Remove the comphy handles from the respective pci nodes to avoid runtime
> >> reconfiguration, relying solely on bootloader configuration - while
> >> avoiding the hard reset.
> >>
> >> When bootloader has configured the lanes correctly, the pci ports are
> >> functional under Linux.
> > Does this require a specific bootloader? Can i use mainline grub or
> > bareboot?
> 
> In this case it means U-Boot, i.e. before one would start grub.
> 
> I am never quite sure if in this situation I should say "firmware" instead ...

What you failed to answer is my question about 'mainline'? Do i need a
specific vendor u-boot, or can i just use mainline u-boot, or mainline
bareboot.

I personally like to replace the bootloader, because the one shipped
with the board often has useful features disabled, or is old. If i do
that, will the board work? I would much prefer the kernel makes no
assumptions about the bootloader. You said:

> The mvebu-comphy driver does not currently know how to pass correct
> lane-count to ATF while configuring the serdes lanes.

Why not just teach mvebu-comphy to pass the correct line-count? That
sounds like the proper fix, and that makes the kernel independent of
the bootloader.

	Andrew

