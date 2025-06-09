Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05833C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 20:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ye5wQq/17F3f3Ad7df566VpkbCoCxX5baHaNJBzH+k8=; b=cHrNZLvvY84IAXuly2oZwzkax8
	AFCCHtsFq9vTbtD9UyIzhAT9GS1xwjc/dGDl7elM2eqcxEa/DBWASXayOQNgj+Xm+RCNhv4zDPYNd
	cLV9AyJQd8cvbamseAn96blZQ9iEt5KClbPv9ZXi++Ks1bcVoDEgmFOJzvmSZ9OQCrAoveEZpeYph
	DHZUvmrroqhyO2ie/zvOu/erb5fwGmfGLZQu+erCa+26iwoT1feETLXWTAZsGnRYi5jzbZkoqIB93
	aSNGebceRKnEPPu5fzTmUfk/DGVtBDEOz4U5kYXVT4mdXyooMehFGhnDoe5/rL8cYL388XxQSXuEP
	cdT3j6lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOipL-000000058Bv-27jQ;
	Mon, 09 Jun 2025 20:10:39 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOinC-000000057rm-2wqZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 20:08:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=Ye5wQq/17F3f3Ad7df566VpkbCoCxX5baHaNJBzH+k8=; b=sX454X3bGLYVmDpUq9WP/jZM9w
	vyuwNPHZ0rObBf78uOjcS0m9EHGJe2PL6UsbQgQXW2bqOUVTOXVX5QCnRXwikjEcUH7ci17fFTfYq
	hkvc8KyIxlzBkcVKq+uWr7f1zOiu7rpIz7Iqze4x0snHkD48+WMgmWgv36Zrw+AnW41tviibuWzJ4
	MsBQ7vIfB8YtK4aWc4hX9Uhth4oNidMlEZwLO6ywkijr6hPb2XN8d7R6EBBUwiUfezCjM8rwoMfGG
	xViMHFrLJaJfgXPjCAhOzckKCfZ4J+WGh0mKAndOJDtTaPVdHF8a9uZQHET5shOTJ3Zj4rdnnBXa9
	p/glL+SA==;
Date: Mon, 9 Jun 2025 22:08:09 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, Kevin Hilman
 <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, Russell King
 <linux@armlinux.org.uk>, Bajjuri Praneeth <praneeth@ti.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, linux-omap@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/5] arm: dts: omap: Remove incorrect compatible
 strings from device trees
Message-ID: <20250609220809.3a488972@akair>
In-Reply-To: <20250609-bbg-v2-1-5278026b7498@bootlin.com>
References: <20250609-bbg-v2-0-5278026b7498@bootlin.com>
	<20250609-bbg-v2-1-5278026b7498@bootlin.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_130826_741915_E21E62D9 
X-CRM114-Status: GOOD (  15.63  )
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

Am Mon, 09 Jun 2025 17:43:51 +0200
schrieb Kory Maincent <kory.maincent@bootlin.com>:

> Several device trees incorrectly included ti,am335x-bone-black or
> ti,am335x-bone in their compatible lists without including the
> corresponding bone-black-common or bone-common device tree files.
> Remove these incompatible strings to fix the inconsistency.
> 
thanks for cleaning up some mess.

> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> ---
> 
> Change in v2:
> - New patch
> ---
>  arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dts | 2 +-
>  arch/arm/boot/dts/ti/omap/am335x-bonegreen.dts          | 2 +-
>  arch/arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dts     | 2 +-
>  arch/arm/boot/dts/ti/omap/am335x-pocketbeagle.dts       | 2 +-
>  arch/arm/boot/dts/ti/omap/am335x-shc.dts                | 2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dts b/arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dts
> index a4f5b5262645..fb88eebb8c5d 100644
> --- a/arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dts
> +++ b/arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dts
> @@ -11,7 +11,7 @@
>  
>  / {
>  	model = "TI AM335x BeagleBone Green Wireless";
> -	compatible = "ti,am335x-bone-green-wireless", "ti,am335x-bone-green", "ti,am335x-bone-black", "ti,am335x-bone", "ti,am33xx";
> +	compatible = "ti,am335x-bone-green-wireless", "ti,am335x-bone", "ti,am33xx";
>  
this looks like too much cleanup, also according your omap.yaml stuff,
ti,am335x-bone-green should still be included.

Regards,
Andreas

