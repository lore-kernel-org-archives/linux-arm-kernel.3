Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFA96C36005
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 09:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HaNaLOlEN9tI/odbj0vb6ACgDUEpGbt2gTzCGVsVFV4=; b=fcUvzjI6kEg+KyVPkGi5YJqpFE
	klU31NWachBNfyZT8VQqpFefTPD0BXdDjrDqspsZD+JuRgdh5DVjOjPs3TLzaNZ8jb1tqF6eBm9Vx
	ViLbaecYhgil8kEwPdluerE0duTzFkgwgYnKgXzxmKGvr4RkLk/wSrCs2V6LxrbApnb2fZTGoYVSK
	a5ZyDTczJxqDxQf/TTpo8G+YThaNr1l4BK9s7q3EyCUJa/mOv1l3+39QgkJHLqphQqu4WX3ELmTUU
	Ur7SQvpQL6JIt7nPDacHiTTdlIdwY5yWB10HGuUBEJcbunp5uVMO3aMpiZSOMXbcjcPW/Ix2AE1SY
	Ne123zMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9KwH-00000005fqB-2FMc;
	Mon, 28 Apr 2025 09:38:13 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9KcG-00000005ZL8-3Ko2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 09:17:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 015F9A4AA9C;
	Mon, 28 Apr 2025 09:12:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FCEEC4CEEC;
	Mon, 28 Apr 2025 09:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745831851;
	bh=rVoSXr4jghjdCMyJc/6II40yfja/uHfb4SXOJ3XhWyQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qa6umChSdPLZ3KSNEbFHIbUpDSPBvEFVU8GSDUKva7coZw7Mt3E2w0lFkx5XwSHXl
	 1rn42r/+Tm5M1vMlImdr9YrdJleJp5+H6gr+cBuQlbjR2OsgGr5JnannNkj3geC5sB
	 gV7eLE4rj0CZoYLQNcDl8K4tfSPtJyUBX99xxhLuOqcb18ri+MjYgtzIVMzzC7Or26
	 jeM1wxFq5fUfNQKOcyuhyzmuVQ0ggliAP+tTtXBenKw5m7ZK3loHNE+RpsposFsTqw
	 z26aJqqq6GxXmYanrQfJmUpbN+slofEEynpUM4o2YUvZKdPGmYuqqp2FJy337fBwGR
	 ZrYm1kPWBDfrA==
Date: Mon, 28 Apr 2025 11:17:29 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-amarula@amarulasolutions.com, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 4/8] clk: stm32h7: rename USART{7,8}_CK to UART{7,8}_CK
Message-ID: <20250428-hysterical-smoky-mongoose-f6dde6@kuoka>
References: <20250427074404.3278732-1-dario.binacchi@amarulasolutions.com>
 <20250427074404.3278732-5-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250427074404.3278732-5-dario.binacchi@amarulasolutions.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_021732_922030_9D6C5411 
X-CRM114-Status: UNSURE (   9.57  )
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

On Sun, Apr 27, 2025 at 09:43:23AM GMT, Dario Binacchi wrote:
> As stated in the reference manual RM0433, the STM32H743 MCU has
> USART1/2/3/6, UART4/5/7/8, and LPUART1. The patches make all the clock
> macros for the serial ports consistent with the documentation.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
> 
>  include/dt-bindings/clock/stm32h7-clks.h | 4 ++--

dt-bindings subject prefix

Please use subject prefixes matching the subsystem. You can get them for
example with 'git log --oneline -- DIRECTORY_OR_FILE' on the directory
your patch is touching. For bindings, the preferred subjects are
explained here:
https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


