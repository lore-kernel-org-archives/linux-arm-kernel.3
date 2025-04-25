Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF0A8C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 14:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nCEyDT0nGnZmgHn2zf2dWe+DqNKcKS+VLDZKV6s8w9k=; b=0CwLLjVpkY6EGrh7cJLiMIymxu
	gfzKLk189o5/LcirU56v9n6DuBOGuYeJyYIVfzAzgD/hC9xr815xFiV++OF+IMSOqM/mxe1fSWeFT
	bi9sWrQskOUgng8RwgxXxGbO/a7zXiUYkDxec/3p4yTio2+N2bcr51bFRGgSkIQCFnswpaTMnlIu/
	hISI5zkzObwD3YUSdDK5vVbracOBUPEVSgWPM4ESl65HFZLw8wRLq6AKfOoA6A/gf3aJNPfhdWMSc
	VYoZQa7/8bdsbLlQwiXjKJqdPOBTnIBxWnxSNSLw2vE1kAXHrnWJPBjrwEG3FhGGmurWIRdbWkkxX
	1yr9YplQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Jo3-0000000HOcG-05rI;
	Fri, 25 Apr 2025 14:13:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8J15-0000000HGUM-2ewb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 13:22:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 82A88106F;
	Fri, 25 Apr 2025 06:22:49 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 67B103F59E;
	Fri, 25 Apr 2025 06:22:52 -0700 (PDT)
Date: Fri, 25 Apr 2025 14:22:50 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>, Yixun Lan
 <dlan@gentoo.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai
 <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Maxime Ripard
 <mripard@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, clabbe.montjoie@gmail.com
Subject: Re: [PATCH 4/5] arm64: dts: allwinner: a527: add EMAC0 to Radxa A5E
 board
Message-ID: <20250425142250.006a029d@donnerap.manchester.arm.com>
In-Reply-To: <3681181a-0fbb-4979-9a7e-b8fe5c1b7c3c@lunn.ch>
References: <20250423-01-sun55i-emac0-v1-0-46ee4c855e0a@gentoo.org>
	<4ba3e7b8-e680-40fa-b159-5146a16a9415@lunn.ch>
	<20250424150037.0f09a867@donnerap.manchester.arm.com>
	<4643958.LvFx2qVVIh@jernej-laptop>
	<20250424235658.0c662e67@minigeek.lan>
	<3681181a-0fbb-4979-9a7e-b8fe5c1b7c3c@lunn.ch>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_062255_722191_55739331 
X-CRM114-Status: GOOD (  20.80  )
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

On Fri, 25 Apr 2025 04:01:30 +0200
Andrew Lunn <andrew@lunn.ch> wrote:

> > Ah, right, I dimly remembered there was some hardware setting, but your
> > mentioning of those strap resistors now tickled my memory!
> > 
> > So according to the Radxa board schematic, RGMII0-RXD0/RXDLY is pulled
> > up to VCCIO via 4.7K, while RGMII0-RXD1/TXDLY is pulled to GND (also via
> > 4K7). According to the Motorcom YT8531 datasheet this means that RX
> > delay is enabled, but TX delay is not.
> > The Avaota board uses the same setup, albeit with an RTL8211F-CG PHY,
> > but its datasheet confirms it uses the same logic.
> > 
> > So does this mean we should say rgmii-rxid, so that the MAC adds the TX
> > delay? Does the stmmac driver actually support this? I couldn't find
> > this part by quickly checking the code.  
> 
> No. It is what the PCB provides which matters. A very small number of
> PCB have extra long clock lines to add the 2ns delay. Those boards
> should use 'rgmii'. All other boards should use rgmii-id, meaning the
> delays need to be provided somewhere else. Typically it is the PHY
> which adds the delays.
> 
> The strapping should not matter, the PHY driver will override that. So
> 'rgmii-id' should result in the PHY doing the basis 2ns in both
> directions. The MAC DT properties then add additional delays, which i
> consider fine tuning. Most systems don't actually need fine tuning,
> but the YT8531 is funky, it often does need it for some reason.

Ah, many thanks for the explanation, that clears that up! I read something
about the MAC adding delays, which confused me, but what you say now makes
sense.

Thanks!
Andre.

