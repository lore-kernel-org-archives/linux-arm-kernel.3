Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F687C369D3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 08:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n2ygI0DVqf0mNqlp6hFKN1KddKsbKu3YsFpZxDISmRc=; b=CT4iSNJltrhwyV5u6ogrlJrRb9
	imDbO25Lt/VD9IUvordRYX2D8FDeuR5Votkfnlt+aopgV2loB7pBfaHJlfY7o0KrXpqy4OrxdMloY
	zRHIlvjyQ6zYbDzTc//twRGTgYVtbVIYRNm5sQ+lMZMli0DjeBH+8OMNqjgc97rd4kazDpdu05s0v
	LG+w7mggnrii58CViSF3tp2dAbgmppDgai4TB4TtVzKk5ZWR1GSyTHZ2prQSAiSQ31VsDzTCD/CR3
	m6oCdzSQQlZDYx5JaKEfdvZDxhuYllFC3O+0Jd/flBo4XRqy6eeqp4w4TRZFk+nXf92za0RbZTMsp
	2r12KT/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9KDe-00000005WAP-4C4d;
	Mon, 28 Apr 2025 08:52:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9K0v-00000005UGF-1ZYn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 08:38:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 878245C5E6C;
	Mon, 28 Apr 2025 08:36:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA5BEC4CEE4;
	Mon, 28 Apr 2025 08:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745829536;
	bh=LZ8ENyCzktoqNokGHZMzWBrPs0WotFekQ7wV/XYpdUg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sFuy/fKuEuGT7+ypxv3qVz8CGh1a4EzkBT5DBwlnDKzPN+YXcTaZnZ5hpz7ZjKAlt
	 NygqnKH1qtRVdzGeEUGoMYaLfzGef73WwHTIzKqXs1aYwuGHpH8ezzSHUGEpaSvSIu
	 vSqKsPgCoYPREfAbwvOctLy9IE5QEmWqTnnjBdWm56QYpWB3w8cy/2awRe1PyhjYBV
	 jZ3jiK1ccK9QbzHzJQLG4jToOz9OeBYQxuS4Q4GVkLhuo32vZaQqRtG7155gQ1/Tgx
	 P0TNBvnl+lj5KM2GDzatRIGrJuh59OmgIOCvh20gBBwzKZ2ySxEE8JxB4b5+eC8IvK
	 Ya9Dn4SsNBPdg==
Date: Mon, 28 Apr 2025 10:38:53 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-amarula@amarulasolutions.com, 
	Amelie Delaunay <amelie.delaunay@foss.st.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Leonard =?utf-8?B?R8O2aHJz?= <l.goehrs@pengutronix.de>, 
	Marc Kleine-Budde <mkl@pengutronix.de>, Marek Vasut <marex@denx.de>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Oleksij Rempel <o.rempel@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 2/8] dt-bindings: arm: stm32: add compatible for
 stm32h747i-disco board
Message-ID: <20250428-hasty-fanatic-quokka-546887@kuoka>
References: <20250427074404.3278732-1-dario.binacchi@amarulasolutions.com>
 <20250427074404.3278732-3-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250427074404.3278732-3-dario.binacchi@amarulasolutions.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_013857_464781_E0AD9ED2 
X-CRM114-Status: GOOD (  10.90  )
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

On Sun, Apr 27, 2025 at 09:43:21AM GMT, Dario Binacchi wrote:
> The board includes an STM32H747XI SoC with the following resources:
>  - 2 Mbytes Flash
>  - 1 MByte SRAM
>  - LCD-TFT controller
>  - MIPI-DSI interface
>  - FD-CAN
>  - USB 2.0 high-speed/full-speed
>  - Ethernet MAC
>  - camera interface
> 
> Detailed information can be found at:
> https://www.st.com/en/evaluation-tools/stm32h747i-disco.html
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
> 
>  Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 4 ++++
>  1 file changed, 4 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


