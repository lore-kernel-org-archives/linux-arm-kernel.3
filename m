Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC286C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 01:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zytxQHfS+2tu82gyPkJscSK0cWgTfHqjtFZo/dKNWss=; b=F0U6TgQyziDVupKKaEP6nletK0
	12yIsJhU6ZiGkMqtuz8r/24tfTjB0fpeuoMd78HpD80uQpwelza8VKk2+lG5J3kd0jSxjtwn3dksQ
	kLuGqDCEuoXfZuX2r4lJO4UEOGNh9gol941TTT3PHHFCHisdbF74hTh0BozROD1YvaN/Amcaferuz
	hrZK7r0s1KCm9ioAkqBFoa4aVJdJGr7lFKD+IxuJBQtIJGB+dZLAoiNogWf3Eij4dCylQtD1sqM8A
	sg5DX1DwXpThbQ9jrlxdgt1kMTlL4yXMVhXT2So4LicQibjQiHOe8J3iN+FCn5+EhUFe9sz5q6lo8
	1Z042eCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua2QM-0000000DQQs-0oRz;
	Fri, 11 Jul 2025 01:19:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZzhu-0000000D9bW-2A2v
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 22:25:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BAB445C5F57;
	Thu, 10 Jul 2025 22:25:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37DE4C4CEE3;
	Thu, 10 Jul 2025 22:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752186333;
	bh=Hr1PsSZpPnvJkfBE+S1YATXV95Q4Fi7cxOlliarndms=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=swKlbdv92NEPM4YCMOMscz+KSZut7oBWINT5QVkUh6EDB9LXodMhxiPLRALYWMbca
	 6Tn78YHH2I8zkh4mlFhpmctnMVM3FfCVIMPa9CvBN/vnK9wnwnu8PnzVQ9M2uM9Yk5
	 iO0FYXoo0pDf04oT+zlaJGu7kL1K2LhadRHp2De+TUQ5zYHPlKdekCpfSJIoQKrptj
	 4WZ63vpSFJlUQNe5rHVQ3GX/7jDO3NVLKtJUWqH3pTvJQCxG1E3d+lGQSy/CM+2n/k
	 0Kkc3TzGYxqE0HvtP6yLJZpsySCclAJP89kQlDydPPQbf81hzWFMuYV78tpGGqt2nI
	 gBhh9TkW+Ak6g==
Date: Thu, 10 Jul 2025 17:25:27 -0500
From: Rob Herring <robh@kernel.org>
To: Christophe Parant <c.parant@phytec.fr>
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	upstream@lists.phytec.de
Subject: Re: [PATCH v2 03/11] dt-bindings: arm: stm32: Modify STM32MP15x
 Phytec board items types
Message-ID: <20250710222527.GA4171977-robh@kernel.org>
References: <20250709151011.366537-1-c.parant@phytec.fr>
 <20250709151011.366537-4-c.parant@phytec.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250709151011.366537-4-c.parant@phytec.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_152534_595869_076498F6 
X-CRM114-Status: GOOD (  16.68  )
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

On Wed, Jul 09, 2025 at 05:10:03PM +0200, Christophe Parant wrote:
> As Phytec manages different SoM configurations with different STM32MP15
> SoC versions, modify the phyBOARD and SoM compatible items to "enum"
> instead of "const".
> The description concerns PHYTEC SoM equipped with STM32MP157
> ("st,stm32mp157" is "const").
> Also add comments in front of the enum items to be able to identify the
> compatible string with the phyBOARD/phyCORE names.

I don't understand the point of this patch.

> Signed-off-by: Christophe Parant <c.parant@phytec.fr>
> ---
>  Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
> index 408532504a24..fbd3d364c1f7 100644
> --- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
> +++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
> @@ -182,10 +182,12 @@ properties:
>            - const: seeed,stm32mp157c-odyssey-som
>            - const: st,stm32mp157
>  
> -      - description: Phytec STM32MP1 SoM based Boards
> +      - description: Phytec STM32MP157 SoM based Boards
>          items:
> -          - const: phytec,phycore-stm32mp1-3
> -          - const: phytec,phycore-stm32mp157c-som
> +          - enum:
> +              - phytec,phycore-stm32mp1-3 # phyBOARD-Sargas with phyCORE-STM32MP157C SoM
> +          - enum:
> +              - phytec,phycore-stm32mp157c-som # phyCORE-STM32MP157C SoM

Are you going to add more entries to the enums? Wouldn't those be a 
different SoC and a whole other 'items' list because it wouldn't be the 
157 SoC?

>            - const: st,stm32mp157
>  
>        - description: Ultratronik STM32MP1 SBC based Boards
> -- 
> 2.34.1
> 

