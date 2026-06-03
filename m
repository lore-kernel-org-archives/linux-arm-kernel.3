Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C63C1CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 14:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0MVJMXi2QyaRCfUW1Qmmea847UYJlY9Zkjowh9hCULk=; b=HvIcZaG4HBUXwLzuSDf9j4rsnE
	BPDYjQ3wtVvTQGJEFclGOO/CoQqqeRHtl1CWefwTeeRvUrsgMzFkOJGTLaLnRReBp2ebKJSGUjLI9
	Avt9RH7TXDAHfkgTFx9OEXVbPH44QMGiiovaUuImIKzuu9Mo2+BG1FVGL1XPREfFOLuEwwwPM1cgT
	IUjDiSZQpu0n1Poe3QE3RRukZf384waYSZLyZGPiZdNFozwYODmxf0kNvDvItsRh+/FYCny/gVd9d
	OEcJK+HV5Qvr1Ro/ql0TKZ+EIjLotxHu0/LVsB7uhj/m2tc+XRu5tvxAwm9u/ZNaMVNlwBrc9Gtk+
	XihAQmYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUmcO-0000000FFm9-2LMx;
	Wed, 03 Jun 2026 14:30:52 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUmcI-0000000FFkq-3V02
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 14:30:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=0MVJMXi2QyaRCfUW1Qmmea847UYJlY9Zkjowh9hCULk=; b=Y/
	8LGKNGbG3UsqrQliqHZ+ijnkvui8eEQxiei6BrUGnxP7nAuEWbbyTPCjFHr655ZhzkHCfvUlUDIKk
	ewaoILwGh6IQzK0ApJoPwAJRDC1HQWHxTIpROJKtIB0PJUZHPcTQe6UR6vYQThNeo+EtpmB3vBAS6
	ClkP1SC3b46tan4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wUmbv-005tKC-1C; Wed, 03 Jun 2026 16:30:23 +0200
Date: Wed, 3 Jun 2026 16:30:23 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: =?iso-8859-1?Q?Gr=E9goire?= Layet <gregoire.layet@9elements.com>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, jacky_chou@aspeedtech.com,
	yh_chung@aspeedtech.com, ninad@linux.ibm.com,
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] soc: aspeed: add host-side PCIe BMC device driver
Message-ID: <77464543-f793-4441-9fce-8666ba1c3d66@lunn.ch>
References: <cover.1780409151.git.gregoire.layet@9elements.com>
 <a8e1396af1b6db38bab13383c6ba303e8427aefc.1780409151.git.gregoire.layet@9elements.com>
 <ecc3bd49-829f-49b8-b3b1-4f16363ea5b9@lunn.ch>
 <CAFi2wKY7ECbxSbtsO1W9KEKFET67yKg+C64jtQHFY05DRzhfKg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFi2wKY7ECbxSbtsO1W9KEKFET67yKg+C64jtQHFY05DRzhfKg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_073046_869956_51C90493 
X-CRM114-Status: GOOD (  16.25  )
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

On Wed, Jun 03, 2026 at 03:43:36PM +0200, Grégoire Layet wrote:
> > How virtual is this? Is this directly accessing the hardware via
> > shared memory? Or is there software on the BMC which traps these
> > reads/writes and responds?
> 
> The VUART is virtual because there is no physical UART link between
> the host and the BMC.
> Instead, the AST2600 exposes a 16550-compatible register set on both
> sides (BMC APB and PCIe host MMIO).
> The data flows using an internal 16 byte FIFO shared between the two
> register views.
> So it's hardware emulated and there is no software in the data path.
> 
> The AST2600 has four VUARTs, two of which are accessible via PCIe MMIO.
> This is based on the following section of the AST2600 datasheet:
> III.48 VUART and III.64 PCI2VUART.
> 
> Because the silicon presents a standard 16550A interface in hardware,
> the existing 8250 driver works without modification.

So tell us about security.

Is only this UART exposed in the shared memory? So the memory window
is 8 bytes wide? Or are there other peripherals also exposed? How do
we know the aspeed is not using the UART itself? If two drivers are
using it, are we going to crash one or the other system?

https://en.wikipedia.org/wiki/Core_War

The advantage of rpmsg is that the aspeed would advertise what
services it is willing to expose. The security issues are different,
implementation bugs vs exposing bits of hardware to an attacker.

    Andrew

