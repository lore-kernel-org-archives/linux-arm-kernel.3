Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1878C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 00:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Z01g9mp1eyyFtluc5GyteUbLs/S90EnYtjJKxUTeL4=; b=qXOUJ2J5pRvQxopcI3fMqDThqD
	kEDc4wetd4c171tdiYYFFyQsnOzkpNI4uvBe6Ha9u9wkfX6TxIabicWzAIEHOb5Z9yQl9+a48dYBe
	r5FKh7ryc9LItl/IaFTuwahjfY3IfP0XJKUBiiFr9Gc5uAjSR9fPC1e2GS9G+cadd+PCve+DEkXFw
	ZFV41C9hVoSVechw1D/t9t/eFg1YnhYqUZym7pYIzE8/j4TqNngGTAAsc23ysbg1kBMJLLtcce6cn
	hwuMTvGmI/RTD09nEaiLcd1bUlxPZuRL7jHZ8ZYogoUecAmAAybadzU2JOY0KsfLQ0JLGpHSllXo9
	bUEWxVQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7kvB-0000000CSQb-36Rs;
	Thu, 24 Apr 2025 00:58:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7kgx-0000000CQVm-2NpK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 00:43:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 073311063;
	Wed, 23 Apr 2025 17:43:43 -0700 (PDT)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 812703F59E;
	Wed, 23 Apr 2025 17:43:45 -0700 (PDT)
Date: Thu, 24 Apr 2025 01:42:41 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Yixun Lan <dlan@gentoo.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu
 Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, Andrew
 Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH 4/5] arm64: dts: allwinner: a527: add EMAC0 to Radxa A5E
 board
Message-ID: <20250424014120.0d66bd85@minigeek.lan>
In-Reply-To: <aa38baed-f528-4650-9e06-e7a76c25ec89@lunn.ch>
References: <20250423-01-sun55i-emac0-v1-0-46ee4c855e0a@gentoo.org>
	<20250423-01-sun55i-emac0-v1-4-46ee4c855e0a@gentoo.org>
	<aa38baed-f528-4650-9e06-e7a76c25ec89@lunn.ch>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_174351_651889_1EA3EAD8 
X-CRM114-Status: GOOD (  12.89  )
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

On Wed, 23 Apr 2025 18:58:37 +0200
Andrew Lunn <andrew@lunn.ch> wrote:

Hi,

> > +&emac0 {
> > +	phy-mode = "rgmii";  
> 
> Does the PCB have extra long clock lines in order to provide the
> needed 2ns delay? I guess not, so this should be rgmii-id.

That's a good point, and it probably true.

> 
> > +	phy-handle = <&ext_rgmii_phy>;
> > +
> > +	allwinner,tx-delay-ps = <300>;
> > +	allwinner,rx-delay-ps = <400>;  
> 
> These are rather low delays, since the standard requires 2ns. Anyway,
> once you change phy-mode, you probably don't need these.

Those go on top of the main 2ns delay, I guess to accommodate some skew
between the RX and TX lines, or to account for extra some PCB delay
between clock and data? The vendor BSP kernels/DTs program those board
specific values, so we have been following suit for a while, for the
previous SoCs as well.
I just tried, it also works with some variations of those values, but
setting tx-delay to 0 stops communication.

Cheers,
Andre

