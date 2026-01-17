Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C0B8C98316
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Jan 2026 15:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0mBxI9aIz+3R0JRKzaZEq+nxJIFr2t+OaDEqZ+gvIxk=; b=V39ZVNNNuhXkTCctRLBnBfIWS7
	JZAhovomJ2OAsQWOvVzziqbNHK0gsSUZf45l6Sx93H3HiRF2XWoeULOgVvGkOO4s7L7INhV82YKYq
	1fEVPFHnpY3ZoniWH3cluL4t4c+fYzElMWig4m0e0+FAMEDLNQEizZ5e1va/59x3+VHcctAh07iZT
	7uCsT2YjoErgSMLDRKGwJha2A2sE6nv5ocVwJ/nlHx8hN2GMEzonE0QTpkIBNQU1UyMdgMeKbYEMc
	qRdGCeVFqT4uC6NvuBdDvtRYFi/wCaldiXv5qa7SNcUDfxemtai1M1QCpqj4RT5EEqZVAIhxhCIUF
	im4ic6gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vh89N-0000000FciH-2tjJ;
	Sat, 17 Jan 2026 15:23:41 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vh89L-0000000FchY-03Qn
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Jan 2026 15:23:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=0mBxI9aIz+3R0JRKzaZEq+nxJIFr2t+OaDEqZ+gvIxk=; b=ah4ykgAdIIK79zCcIQJbdM2aOJ
	tePiTgFGApdW0Nsy3G2R6mcTarWqh90tpWya2uswpGJVS/7YJz17ku6vGZgB3UZLSW/J/IWwulgiz
	hVbDlGW2qzyGeSCn8kmC287xaP1is0utSdnbz+Dvg6uNckRApwIGJ1Rcj4zEbqXmPhgI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vh89D-003DWR-KH; Sat, 17 Jan 2026 16:23:31 +0100
Date: Sat, 17 Jan 2026 16:23:31 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Mark Brown <broonie@kernel.org>, Michal Simek <michal.simek@amd.com>,
	linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/3] spi: dt-bindings: xilinx: make interrupts optional
Message-ID: <f48aea5e-b600-4546-9bc6-82751cf4fe97@lunn.ch>
References: <20260117012136.265220-1-abdurrahman@nexthop.ai>
 <20260117012136.265220-4-abdurrahman@nexthop.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260117012136.265220-4-abdurrahman@nexthop.ai>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260117_072339_071515_99186A9D 
X-CRM114-Status: UNSURE (   9.71  )
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

On Sat, Jan 17, 2026 at 01:21:36AM +0000, Abdurrahman Hussain wrote:
> This makes the driver work on platforms where interrupts are either not
> provided or broken.

In addition to Krzysztof comment, please do try to read all the links
to documents i sent you.

Point 5 of the binding document says:

    The Documentation/ portion of the patch should come in the series
    before the code implementing the binding.

This might sound nit picky, but there is a huge volume of patches
which need reviewing, and in order to make that possible we have
processes to make it simpler to do. Please keep to the processes,
particularly if you plan to stick around and become a regular
contributor.

    Andrew

---
pw-bot: cr

