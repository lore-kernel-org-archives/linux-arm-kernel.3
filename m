Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17FAEC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 23:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d/poosDl02VTyF1thf2qByZgi48F1nyCwyEc1YHYIsg=; b=R9W7YkbAieYRaNptQbwC/BmSoC
	UouUzLJqOriXjhMnNwTMrVkknAaFrYlTiJHKTNCEcv1XHixx3DrllFc4EEQNGjTRO7hfyEMjVyE9H
	Z/f4cCyjkZ/ffGIViyKbWWAvtAYqu6S4xC/5FqT+eda1bk4VFXBjZyt+qiWyzHQ89Y9CWC8mXOcOB
	28FuKfseL+IGh4VOFA1uXFlzppJOUmkbvQhgFYygDjHN/tSHloVIxw3ynw43vhtLqXY+xsN3uLmrC
	ywIdK4c/v9sKSyjyQ1ZY7t873XH6vm7deeimCO+QBF1kxV5q4s+i1je+YtnXDqs6eJ/xLFsl1hiHC
	EJ7Hb+UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkt62-0000000FaNx-0V8A;
	Wed, 19 Feb 2025 23:03:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkt25-0000000FZNR-1mEe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 22:59:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 935935C547E;
	Wed, 19 Feb 2025 22:58:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3840AC4CED1;
	Wed, 19 Feb 2025 22:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740005948;
	bh=r+7eAlT4+3FG2hpqxWqAqIl6I74a1KunJgrKRdfmESE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rozmEAw83f9qN1WR6N37zTgAhFm06zr7zVBHVZ7y+or4MmkdruMiEWiuOzrMOpRuV
	 l4AMrvBcoyVM93kJc9rGPJtsdrHxCpojBD5ch5SLtWxz+OC7wLcLsRaZexRhwZGnMc
	 hcjxny1MR9SNU+Oak7xcIdtLyOKigmefhVZ7ZxdTdYLTM0LycMZY76nwbFPb77GLGW
	 ydGe3l4iSRZfvhiya2KxtCXdWFprFX6k9PAdHT5mMI9eRg+5Ij17VvrAVGgMuN+kwO
	 WpTSMJswJRTBhExSmW0eEAIr1XEjGKYAZUb4g44v43pzKF1FHtVMnTxNoFmAs9q03w
	 5m/tbrgRvSw2Q==
Date: Wed, 19 Feb 2025 16:59:07 -0600
From: Rob Herring <robh@kernel.org>
To: Ryan.Wanner@microchip.com
Subject: Re: [PATCH 1/8] dt-bindings: atmel-sysreg: Add SAMA7D65 Chip ID
Message-ID: <20250219225907.GA3124757-robh@kernel.org>
References: <cover.1739555984.git.Ryan.Wanner@microchip.com>
 <008e4e49c9fd315cc96a185662b31eca1a64a614.1739555984.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <008e4e49c9fd315cc96a185662b31eca1a64a614.1739555984.git.Ryan.Wanner@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_145909_503140_26D9140F 
X-CRM114-Status: UNSURE (   9.56  )
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-watchdog@vger.kernel.org, alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, claudiu.beznea@tuxon.dev, vkoul@kernel.org, linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org, krzk+dt@kernel.org, wim@linux-watchdog.org, linux@roeck-us.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Feb 14, 2025 at 11:08:14AM -0700, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Add compatible string for SAMA7D65 SoC ChipID dt-bindings.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  Documentation/devicetree/bindings/arm/atmel-sysregs.txt | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Rob Herring (Arm) <robh@kernel.org>

But please convert this to schema.

Rob

