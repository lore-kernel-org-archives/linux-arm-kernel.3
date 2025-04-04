Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45F46C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 16:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fyC+qgi3KB7I5nKzcuiFt+Veff/CcF58P8qCbDogTL4=; b=tZS3lHJ8vFUz5bMYrXswVJS4Ar
	H0L1ED6M1AHGymifrKx3oCHssHycg68v0wafi16kP4FUDHN5Hug5sG290GWBYVIzyGTHO4nsbbMU7
	0Ei23ChD8QkFhB5Fm3swsKK4s7ycCeeAyY8q69Nx/1hTcy2GqI3yH56FpfI9BwJtBxfAmCN2/Bdex
	ASMTaRttK21ixB8ZPlApMm9P5S+b4+9p8rbhQiZ6R2w9N3iKbyUszeBQdYBL9fU/bniUNYcwNl9of
	wDxR1AxYFNn4jZup6hBYK23rKUAKy8QjolVBCecdObEaF+ErxQFeLWTLWIKGjQDLw9EdU6sAwL9LM
	Efy2PU8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0jmc-0000000CHhw-0mFi;
	Fri, 04 Apr 2025 16:20:42 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0jeQ-0000000CGlX-13eI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 16:12:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BD8E7A478EF;
	Fri,  4 Apr 2025 16:06:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15AB9C4CEDD;
	Fri,  4 Apr 2025 16:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743783133;
	bh=fKdvnEi5tKN2kAqSfzeL2P8T16EASbCOVKXOoadOa48=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JJ2T88nE+N/4gXh74yoEu//aq/OHl8dvCdl0TPcxIbnWZJM9FRHSSVmaweRJxDDMV
	 T6EXwUrg6hzI3Pr1RhAfohxPtg8v37oME0WFOt0V45crZsI07MMiuGZKvPhHbLUOv/
	 IGpj9aw69Bf3A+FiGYKC4bFCXxdRdGrzZRx8Ghqw4QEAbLePIvZHkj+H0Aw3+TPqqF
	 3lYOzpZVCKoFz+pdWz+R0SXqyZXY+qjpmvR+rUETQckrr7oBxPAQOWaZd31XKBgoOI
	 eILRp22CLBhUUWmK6gZxSZvfOMb3z0O//AoyFub+cNPnioa3Ss6oykbYZYlGg8tdon
	 /1PjQiG1pRjUw==
Date: Fri, 4 Apr 2025 11:12:12 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Mubin Sayyed <mubin.sayyed@amd.com>
Cc: krzk+dt@kernel.org, linux-usb@vger.kernel.org,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	dlemoal@kernel.org, cassel@kernel.org, p.zabel@pengutronix.de,
	brgl@bgdev.pl, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, conor+dt@kernel.org,
	linus.walleij@linaro.org, radhey.shyam.pandey@amd.com,
	linux-ide@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	michal.simek@amd.com, git@amd.com
Subject: Re: [PATCH] dt-bindings: xilinx: Remove myself from maintainership
Message-ID: <174378313091.1531760.13963641881686821013.robh@kernel.org>
References: <20250403060836.2602361-1-mubin.sayyed@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403060836.2602361-1-mubin.sayyed@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_091214_353593_352F4B9B 
X-CRM114-Status: UNSURE (   8.19  )
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


On Thu, 03 Apr 2025 11:38:36 +0530, Mubin Sayyed wrote:
> As I am leaving AMD and will no longer be maintaining
> these platform drivers, so removing myself from maintainership.
> 
> Signed-off-by: Mubin Sayyed <mubin.sayyed@amd.com>
> ---
>  Documentation/devicetree/bindings/ata/ceva,ahci-1v84.yaml        | 1 -
>  .../devicetree/bindings/gpio/xlnx,zynqmp-gpio-modepin.yaml       | 1 -
>  Documentation/devicetree/bindings/reset/xlnx,zynqmp-reset.yaml   | 1 -
>  Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml           | 1 -
>  Documentation/devicetree/bindings/usb/microchip,usb5744.yaml     | 1 -
>  Documentation/devicetree/bindings/usb/xlnx,usb2.yaml             | 1 -
>  6 files changed, 6 deletions(-)
> 

Applied, thanks!


