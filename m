Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CFA1C83030
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 23:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K5uaRU4sb1I+btvNk+x/akU/n6Qxl6B80UWNxfF65jc=; b=fbiePLjDK2cJX63qhOeJgtAmav
	vG14u7kHgVW3N+YWDRI4wWUoNo8q2SUzSjUSAd0NuGe48tNSSTn9oCuLa3lNeXFto/lpQi7JGUmLq
	UPWi3j0kSJ6ZSqdoFObZmrwGpQ3+0yYagxJs1GX/aVH/Z9qhgZa06q6Ml65w3tYilo/Ce1U/aL/qy
	NpcmD1DBykuXzBJx0twE3WSdPAfBxg9BwlJd+sLhIkqTR1IjZhrDtPbkqETnCvy/kBSXyLOwYbjS7
	G4G73kMmiURE/sbZtrw6uMbreYt93XceyU/EXGKjzaH4lwdIchewaNSguc+5p4CTFXVQkR8tdPssv
	o8brgjOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYva0-00000003o0U-3f5q;
	Mon, 07 Jul 2025 23:49:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYvXg-00000003nff-1Xxv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 23:46:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E51BA1595;
	Mon,  7 Jul 2025 16:46:20 -0700 (PDT)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8E53B3F66E;
	Mon,  7 Jul 2025 16:46:31 -0700 (PDT)
Date: Tue, 8 Jul 2025 00:44:58 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: iuncuim <iuncuim@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] arm64: sunxi: a523: Enable Mali GPU
Message-ID: <20250708004458.15a2feae@minigeek.lan>
In-Reply-To: <20250706025625.2707073-1-iuncuim@gmail.com>
References: <20250706025625.2707073-1-iuncuim@gmail.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_164636_457654_E54A8EBB 
X-CRM114-Status: GOOD (  14.84  )
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

On Sun,  6 Jul 2025 10:56:21 +0800
iuncuim <iuncuim@gmail.com> wrote:

> From: Mikhail Kalashnikov <iuncuim@gmail.com>
> 
> This patch adds gpu support on devices with a523 processor. Since there is
> no support for image output yet, the gpu is disabled after boot up.
> 
> $ dmesg | grep panfrost
> [    3.826968] panfrost 1800000.gpu: clock rate = 432000000
> [    3.832305] panfrost 1800000.gpu: bus_clock rate = 200000000
> [    3.838353] panfrost 1800000.gpu: mali-g57 id 0x9091 major 0x0 minor 0x1
>                status 0x0
> [    3.846050] panfrost 1800000.gpu: features: 00000000,000019f7, issues:
>                00000001,80000400
> [    3.854134] panfrost 1800000.gpu: Features: L2:0x07110206 Shader:0x00000000
>                Tiler:0x00000809 Mem:0x1 MMU:0x00002830 AS:0xff JS:0x7
> [    3.866011] panfrost 1800000.gpu: shader_present=0x1 l2_present=0x1
> [    3.874108] [drm] Initialized panfrost 1.3.0 for 1800000.gpu on minor 0

So what confidence do we have that this really works, apart from these
successful initialisation messages? Has this been shown to work with
some (yet-out-of-tree) DRM patches, to produce 3D rendered output? I
wonder if we should wait with upstreaming until we can really test this
on some kind of screen.

Cheers,
Andre

> 
> Tested on x96qproplus and walnutpi 2b devices.
> 
> Based on v6.16-rc4 with patches:
> https://lore.kernel.org/all/20250628054438.2864220-1-wens@kernel.org
> https://lore.kernel.org/linux-sunxi/20250628161608.3072968-1-wens@kernel.org
> https://lore.kernel.org/linux-sunxi/20250627152918.2606728-1-wens@kernel.org/
> 
> 
> iuncuim (2):
>   arm64: dts: allwinner: a523: add Mali GPU node
>   arm64: dts: allwinner: a523: enable Mali GPU for all boards
> 
>  arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi    | 15 +++++++++++++++
>  .../boot/dts/allwinner/sun55i-a527-cubie-a5e.dts  |  5 +++++
>  .../boot/dts/allwinner/sun55i-h728-x96qpro+.dts   |  5 +++++
>  .../boot/dts/allwinner/sun55i-t527-avaota-a1.dts  |  5 +++++
>  .../dts/allwinner/sun55i-t527-orangepi-4a.dts     |  5 +++++
>  5 files changed, 35 insertions(+)
> 


