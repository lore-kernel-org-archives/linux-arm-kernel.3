Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AF3EC02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 10:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TLv288ZHb++xI+iSErFpdKYD1EGtXyLrluariFnflYU=; b=PVTmMgdMERIi2lzZWZXycGl2Q3
	qvxLjMOipxwFvmEu6JxQev+htV19/WTvfNIvbdoPfAzxa5vkqy2MNFChAf9kkvE3lVAdA91EerbVY
	9Vm2KBkUMx252DMRhY/zOB1WyR5RL19Pqpv3JVfmX45FZTRSVo9DAGziMUVKmqpeH4lm1Uqvjj0JZ
	sjMVinEJIbPjZ81hpRAuGbwpjEXl4VIJ1xB28utr7JxisyFwK4zVHObcREtim2cyzkiV2ChETp7A7
	PiGjmEZZRV6vgvNodf2x/FzzK5IHcAYxa9z1ZOxhyngp9GUCg3YUdqYDpXX6hCuvaJP6n6YC6Lf7z
	53KOMC5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkLGt-00000007qbI-2jim;
	Tue, 18 Feb 2025 10:56:11 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkLFQ-00000007qUv-1yfM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 10:54:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3D970A41DB1;
	Tue, 18 Feb 2025 10:52:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DED8EC4CEE2;
	Tue, 18 Feb 2025 10:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739876078;
	bh=RdaxUeKvZh5sL0uJ9BtFySXbqU59fk3zLkq47gAsBp0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NGdJ0xWorHM+qXxP6z1rSeaxtuPdGwDGjNbPbIrWqn2LZYrgAwf7tfZPrZJfTUp2k
	 HAQMk4W5ei9khWJkMH+utPXmDd1oRqzwdKNh9yBkDxqo1Kwqm7JawToKHk8S3bNLF5
	 QMihBcdYKQBetKQdUBAtsQ1mDQE0HTxkQv5d2v8ZgI2LSYNRcy31utnMKWhBXPPncG
	 ypCuFYUO6ZlKV2AfP3Yxt9Fl9YLBOWK9PtChtQ2AxuKkBcc6dZu/LME9uclFbq9nbh
	 a0BqbTtPB8mlohh/4vGAClo6rDyAh9d1d6UUrjKeY+V9JAqdWuFSvfb13pdTSf+qOJ
	 NQ9zKlK53hOGw==
Date: Tue, 18 Feb 2025 16:24:35 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Michal Simek <michal.simek@amd.com>
Subject: Re: [PATCH 2/2] dt-bindings: xilinx: Deprecate header with firmware
 constants
Message-ID: <Z7Rm6/DYM67QbXvT@vaman>
References: <cover.1738600745.git.michal.simek@amd.com>
 <2a6f0229522327939e6893565e540b75f854a37b.1738600745.git.michal.simek@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2a6f0229522327939e6893565e540b75f854a37b.1738600745.git.michal.simek@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_025440_574350_F8F1E213 
X-CRM114-Status: GOOD (  12.00  )
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
Cc: "open list:XILINX AMS DRIVER" <linux-iio@vger.kernel.org>, Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, Niklas Cassel <cassel@kernel.org>, Eric Dumazet <edumazet@google.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, Shyam Pandey <radhey.shyam.pandey@amd.com>, Michael Tretter <m.tretter@pengutronix.de>, Rob Herring <robh@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, michal.simek@xilinx.com, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Conor Dooley <conor+dt@kernel.org>, Anand Ashok Dumbre <anand.ashok.dumbre@xilinx.com>, Mark Brown <broonie@kernel.org>, git@xilinx.com, "moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Harini Katakam <harini.katakam@amd.com>, monstr@monstr.eu, "open list:LIBATA SUBSYSTEM \(Serial and Parallel ATA drivers\)" <linux-ide@vger.kernel.org>, Stephen Boyd <sboyd@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>, "open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, Damien Le Moal <dlemoal@kernel.org>, "open list:NETWORKING DRIVERS" <netdev@vger.kernel.org>, "open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM" <dmaengine@vger.kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "David S. Miller" <davem@davemloft.net>, Jonathan Cameron <jic23@kernel.org>, Mubin Sayyed <mubin.sayyed@amd.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 03-02-25, 17:39, Michal Simek wrote:
> Firmware contants do not fit the purpose of bindings because they are not
> independent IDs for abstractions. They are more or less just contants which
> better to wire via header with DT which is using it.
> That's why add deprecated message to dt binding header and also update
> existing dt bindings not to use macros from the header  and replace them by
> it's value. Actually value is not relevant because it is only example.
> 
> The similar changes have been done by commit 9d9292576810 ("dt-bindings:
> pinctrl: samsung: deprecate header with register constants").
> 
> Signed-off-by: Michal Simek <michal.simek@amd.com>
> ---
> 
>  Documentation/devicetree/bindings/ata/ceva,ahci-1v84.yaml  | 4 +---
>  .../bindings/dma/xilinx/xlnx,zynqmp-dma-1.0.yaml           | 3 +--

Acked-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod

