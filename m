Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC783E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Dec 2024 08:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SCXCZhEYKS9tgMBLW0glH53RCjGlj1ViB+oUG6A/IFA=; b=glZG+845TV2ou2uK3OM6LSqqiE
	n8X/fi0kJdhr0TL9bgJL53c6ZMSnRGUtuCVMA2pToJaYFv1RAF5F6YuWF0sZ6tzgT00uWYBw8txLr
	r4fRXQ0/lKuDjFvvEg7cNESH5fgBJVAahtBA/JYW7BsdCs8GdWt2TZfFF482h9oSWnc96SR72x4D6
	eFrc4exezUBQzFzXxeCbuZmmqxcXbuDY5iYf54h2YS96MjzgCNmY7aSFFz3NnZH/VfzTUM/8XGLwL
	WClPCV08PY6cSXKyCZRD0msN5ohIKbSPU5UQ9QoyKjb9Ux/vCoQyOgYQFGvevCB9ASoaPdzjLIwKT
	lJg47ocg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSXrG-00000006qWa-0Kgv;
	Tue, 31 Dec 2024 08:44:10 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSXq7-00000006qQ5-1Hpu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Dec 2024 08:43:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 15158A40117;
	Tue, 31 Dec 2024 08:41:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74C0BC4CED6;
	Tue, 31 Dec 2024 08:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735634578;
	bh=sEVwsEUE+NBGeWQW5kfxfUmeuQ0OvQKO90sgRc/dEtw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OfDVkJpomnmEJ8oDf9sOP5VICaSs2vALcrI6QlE9SEAEPvdMkgIgY+6PnOmzjxmO6
	 G8VAZtJwMihHusD37VZfN/J5UbVfTJHgI7YxdGr9ctQT5jcO9ASjgC12ILNjmvjn6c
	 XpcMIavXHuGTZdhllDPRSv0vke5hOnSzZX5HiZ/U2JJVHbuEEKaxXlkdZYlVtposNJ
	 fLlBWH/0xkAeoc6PdQ1KHnwNIcDQlB+fCXrSZvHV7SbaKkFV/adjRwTqbObYBCNm5Z
	 BrvG0SAYr65cRz0g/e5AMvGZ6uHwDqv0zcnDY6HAw5Odkew+Uubi0LesI3mPF6yRtR
	 brPb4wksCLDVA==
Date: Tue, 31 Dec 2024 09:42:54 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh@kernel.org>, 
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-can@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH] dt-bindings: can: st,stm32-bxcan: fix st,gcan property
 type
Message-ID: <mqkkf4vgd25mq3xvial2unlyumtsbrei7ajkouvrsvkn7pc66y@j5do2qzlgysc>
References: <20241228150043.3926696-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241228150043.3926696-1-dario.binacchi@amarulasolutions.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241231_004259_407382_78865176 
X-CRM114-Status: UNSURE (   7.44  )
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

On Sat, Dec 28, 2024 at 04:00:30PM +0100, Dario Binacchi wrote:
> The SRAM memory shared pointed to by the st,gcan property is unique, so
> we don't need an array of phandles.
> 

You should mention also that Linux implementation does not expect any
argument.

> Fixes: e43250c0ac81 ("dt-bindings: net: can: add STM32 bxcan DT bindings")
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


