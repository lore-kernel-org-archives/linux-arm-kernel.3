Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0E5AC282C5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 21:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CPBdnP0zcKzlGKOrJ1egNWnmyP1JOxp0++RELTJvgvw=; b=UQCVeBVp7bRWYChzxiW6SGKTHY
	v3FJSvBk2weiEZSam7Frh0VLWX9PP6cXcsqAJEQs2JYP0frM02lDK57kIii0EEeh/WhNovwJegqRp
	fY7a7gTCZQly03P6Tx2P/Iz1YBXX49ShxD+PbXnO3QmQgZtG78VhU56MK3wMHxpoK15lW1UztmVqc
	osIQYArqsD18BpXbdyt4EJci+a4x+kGPJklCmlF7fOEs3aIyV7Z+ET+RzQ/NI/xJAsigeGxjCac+c
	8Yia495iArZyeKjp0Axm4KTARnZoAYtVij+yDpo8LYtUns23SCP/fEThkGhA+dEko+ehv+R6P3ooM
	tOhIb3Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to8Jl-0000000CmkL-1oAJ;
	Fri, 28 Feb 2025 21:54:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to8DW-0000000Cli2-46mq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 21:48:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C979E6114A;
	Fri, 28 Feb 2025 21:48:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF0D9C4CED6;
	Fri, 28 Feb 2025 21:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740779302;
	bh=ad68wow/kheHGqDYDcGvEp6n8B8FfKsoY8kEt3PnkdI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cDo+kLJyacmZWp2zwhJpiTFN/LdjkUyb8HgjzvDmeZ68DuFT48fs6TITSR3JtA5oq
	 loqQODCiovoWGh+QbRsewzml3djG8uydJGJHW6fofHFFdwcZdt94y68YMa31jlL8aT
	 2zrvw95S/BaIJqnOHmbXB2mV4cT2E/OurfClijjj/0hAYOx1rtAcInC1DCExns15bJ
	 dv3/LAwkY1uVYELiycPCHybFPgWSqUk41t369+pN74xeE3d5nbz7LQhAtMRzpsX/Yh
	 uZLuY10Mk4eZmthk/N3gWbcuAMryzrZEBTKrxseAWaPUEmzx9K1K8IiBIbrB6FMT8Y
	 8ZCPX48vKA4Xg==
Date: Fri, 28 Feb 2025 15:48:20 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Conor Dooley <conor+dt@kernel.org>, linux-sunxi@lists.linux.dev,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-gpio@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 6/8] dt-bindings: pinctrl: add compatible for
 Allwinner A523/T527
Message-ID: <174077929550.3754157.15994123507055894807.robh@kernel.org>
References: <20250227231447.20161-1-andre.przywara@arm.com>
 <20250227231447.20161-7-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227231447.20161-7-andre.przywara@arm.com>
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


On Thu, 27 Feb 2025 23:14:45 +0000, Andre Przywara wrote:
> The A523 contains a pin controller similar to previous SoCs, although
> using 10 GPIO banks (PortB-PortK), all of them being IRQ capable.
> With this SoC we introduce a new style of binding, where the pinmux values
> for each pin group are stored in the new "allwinner,pinmux" property in
> the DT node, instead of requiring every driver to store a mapping between
> the function names and the required pinmux.
> 
> Add a new binding file, since all the different variants of the old
> binding are making the file a bit unwieldy to handle already, and the new
> property would make the situation worse.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  .../allwinner,sun55i-a523-pinctrl.yaml        | 175 ++++++++++++++++++
>  1 file changed, 175 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


