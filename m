Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C4E1C3601A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 12:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m5oPUg4ARF8TnNRDBE3jh/Qug56RDVjQifVvp49cFpw=; b=11+9kfkY2mL+noSHhiqwuqxGZx
	GtfVDXlsWccBldusPzrcDmhalTrjOzp/8/TtRjaY6XopAZNPEbXJAtvsxLKtXS8dw+FBdRMmjRA/d
	mN71KD3g+3Iv90NQ/JI6V5sAx+Ii0EYko8y4Yt6ibYx3tayPR1cLjhEz5ljPUqRRYsymocd9oa8kN
	21LJhRpyt4DIZv1WSyexv8JaVMKg3eKmqMSlhnsJPCvd7ZqoHlgIzsqcGrLtMbDYDE4myWJRIj+Vl
	73nHF3Mc3STp3aQLDypvKQAdujJlU073OOEKgZBRjd/6wvYe+4pqFB+vl3NnY4ibyvNNF7RvshJcC
	Tir9osUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzxA4-000000064HU-291U;
	Wed, 02 Apr 2025 12:25:40 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzx7g-000000063wE-0hwf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 12:23:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=m5oPUg4ARF8TnNRDBE3jh/Qug56RDVjQifVvp49cFpw=; b=bLpZ6hHr1wVANQ2fF9WBWqeuN5
	HVjQWpQ1OlZggMUP4tufjE3uKqSb0br7f/rT6FWm8LhBf6MhyCRlxMQs6R1eqCC9lnu1A6+Eobou1
	m1u67bO/yEmqZ75JIdUdL/wSSunPuHVf26lfRw+VeWvfOXSXW13frBpp8eGw8qPszd/w=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tzx7O-007mpD-0W; Wed, 02 Apr 2025 14:22:54 +0200
Date: Wed, 2 Apr 2025 14:22:53 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Lukasz Majewski <lukma@denx.de>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 2/4] ARM: dts: nxp: mxs: Adjust the imx28.dtsi L2
 switch description
Message-ID: <82fde123-4783-4d4c-a061-e07731ae7bfd@lunn.ch>
References: <20250331103116.2223899-1-lukma@denx.de>
 <20250331103116.2223899-3-lukma@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250331103116.2223899-3-lukma@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_052312_204625_BD0490F2 
X-CRM114-Status: GOOD (  11.29  )
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

On Mon, Mar 31, 2025 at 12:31:14PM +0200, Lukasz Majewski wrote:
> The current range of 'reg' property is too small to allow full control
> of the L2 switch on imx287.
> 
> As this IP block also uses ENET-MAC blocks for its operation, the address
> range for it must be included as well.
> 
> Moreover, some SoC common properties (like compatible, clocks, interrupts
> numbers) have been moved to this node.
> 
> Signed-off-by: Lukasz Majewski <lukma@denx.de>

Assuming it passed the DT checking:

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

