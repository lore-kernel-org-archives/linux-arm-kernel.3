Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A303CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 15:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c8rhx9sLUwe7GJ//MVfib66PmIFyPDMc5Lp9jdquzjs=; b=sv34/9cPXBwtJcZmhtPws4jpY7
	MTh3PvtMGFfqQmqAwWwrcscI4NGSdFGSWuyMLrypLsJ6fFOKbWGd12hy7Y31n1aKmqEjPL0pq2AlP
	SsMs8wgqjMkOj1sH/hENGyxriUJH1hPY/U1OWwPkTF15b5txMZ6zupocCTAe9CoCsFuIoSU4E98Vt
	CSaMVd9pThkmHGBF2PVA8Jz6b5Z6xQ9zWmckO/ZBUMvoW8l2eVLkXQ9EYLO98GfZCoMrl5rtTK0V9
	PmTMSNVIxcdkjdDA9myI19gnuOA9rphLEUyrM3TKCgF96n4PkqpXNVV5i2Zmk9crZ/LnzujNA7vBT
	L9FjFlOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGla-00000000SRk-2umr;
	Thu, 18 Sep 2025 15:41:50 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGlY-00000000SRF-1nOS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 15:41:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=c8rhx9sLUwe7GJ//MVfib66PmIFyPDMc5Lp9jdquzjs=; b=hDSt9EL/Z8uINZFYoPQPSYiXRR
	+Am5vfBof0zN3CeKZY8cqXMJArisUz9QeKqGE+wfriBlxiLAtQ/fnI4XxNWu2cX//OjWczw0GDCoP
	qADylRn8F6Z4YnvtIcT4xTrADIxKxJg06Pqi5nVDDYfN/5g4kydC3kBiHrcJ+3hiF3ec=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uzGlT-008qVe-BO; Thu, 18 Sep 2025 17:41:43 +0200
Date: Thu, 18 Sep 2025 17:41:43 +0200
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
Message-ID: <2589d2df-8482-4648-b63c-5a4a86f01fbb@lunn.ch>
References: <20250911-cn913x-sr-fix-sata-v2-0-0d79319105f8@solid-run.com>
 <20250911-cn913x-sr-fix-sata-v2-3-0d79319105f8@solid-run.com>
 <9272b233-b710-4e57-b3ff-735f45c03c74@lunn.ch>
 <dbb10e82-ae10-4987-900b-17d4f4b62099@solid-run.com>
 <dedd4222-b2ba-4247-98b4-504b5c032f69@lunn.ch>
 <eab0cc63-de1b-4b41-bcce-7a2308d4f446@solid-run.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eab0cc63-de1b-4b41-bcce-7a2308d4f446@solid-run.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_084148_465711_655F673A 
X-CRM114-Status: GOOD (  15.19  )
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

> >> The mvebu-comphy driver does not currently know how to pass correct
> >> lane-count to ATF while configuring the serdes lanes.
> > Why not just teach mvebu-comphy to pass the correct line-count? That
> > sounds like the proper fix, and that makes the kernel independent of
> > the bootloader.

> That would be a feature on the comphy driver, not a bug-fix backported
> to stable. The core goal was to fix bugs found in Debian 13.

It is not so simple.

https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

  It must either fix a real bug that bothers people or just add a device ID

Crashing at boot would be a real bug that bothers people, not just a
new feature.

Lets see how big the patch is. If its 1000 lines of hard to understand
code, it will probably be rejected for stable. If its 100 lines or
less, it will likely be accepted.

It is also hard to argue the DT is wrong. It just describes the
hardware. I assume the description is actually correct? The issue is
the driver, not the description. Also, i assume this affects all
boards using this SoC? Removing the nodes in one board 'fixes' one
board. Fixing the driver fixes all boards...

    Andrew

