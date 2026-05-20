Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EFFECD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 16:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lcFr4GXWcFgpdMsR0YpSiDmQfe7WFM8ih6yZ4Ym8toU=; b=txV/TNl7TeXXI+MoxTPh8lAtcx
	QbZEnolt5MeCUoS10sDz+tO7fld7VLdkDHzdRj4fKtguxlne857zWHr4mvc8q8QSbR4wqVeU1+HPf
	kU/oJJjw95vkkVOcfMgBnGjZcj5qQmyuSstj61/YMOHmOD/qpCKWMBKLTXZw9U3zxscbhj0BVdBnq
	LVY14eQ2kmILVfGTce3zBQ+dE6fbp2wAwUM4SXuOqHutN7lfUR+60AxkQuXcsWhYyVGj8swHhOiAv
	o9rEJknOdlhsyEo2ESz7sCfu4JUN6YYJo+GmuQumxZGWEEsGloMhks2jb+RUxzAtnSP3W5f1/M3mb
	eQZZwz6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPje7-0000000593w-1yms;
	Wed, 20 May 2026 16:19:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPje5-0000000593H-1mkF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 16:19:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D16B640D73;
	Wed, 20 May 2026 16:19:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 028501F000E9;
	Wed, 20 May 2026 16:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779293984;
	bh=lcFr4GXWcFgpdMsR0YpSiDmQfe7WFM8ih6yZ4Ym8toU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=UAbLHAkMzuHKyLBGmWUbQOs1aRHHDL4buL7lBKmWTcjjvxVBgQPLHprxAqsF0xcVC
	 bGKFfJBqOhqCGgDyy+ZeE7Cvs3/zqfwhfMtvgQBpaYOLpMsWhSUkr+inXRso39D2HH
	 35afQ8qh3ik7eBX1qIVmbWCfUOycl8BqgtCseG9AZXKUZsSnFUUAkYlal+px4JYbNB
	 yzc2vR7biGKHAB8QCHN1Egl9918+SWHhSvHDg/HFiIQFrkABXa22NhBJvwkquF8R7h
	 N1BGOkdt9V5etiW5CXhwg2li86PjrDc9/rsXD8e+8gggRh/MA2+WG9weLIL+uonrdH
	 bn3+qSLtmsw0Q==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Ryan Chen <ryan_chen@aspeedtech.com>, 
 Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, 
 linux-gpio@vger.kernel.org, linux-clk@vger.kernel.org
In-Reply-To: <20260506-upstream_pinctrl-v9-2-0636e22343ad@aspeedtech.com>
References: <20260506-upstream_pinctrl-v9-2-0636e22343ad@aspeedtech.com>
Subject: Re: (subset) [PATCH v9 2/3] dt-bindings: mfd: aspeed,ast2x00-scu:
 Describe AST2700 SCU0
Message-Id: <177929398073.2887671.10050314935691000480.b4-ty@b4>
Date: Wed, 20 May 2026 17:19:40 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_091945_483320_BFD3685B 
X-CRM114-Status: UNSURE (   6.29  )
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

On Wed, 06 May 2026 16:06:19 +0800, Billy Tsai wrote:
> AST2700 consists of two interconnected SoC instances, each with its own
> System Control Unit (SCU). The SCU0 provides pin control, interrupt
> controllers, clocks, resets, and address-space mappings for the
> Secondary and Tertiary Service Processors (SSP and TSP).
> 
> Describe the SSP/TSP address mappings using the standard
> memory-region and memory-region-names properties.
> 
> [...]

Applied, thanks!

[2/3] dt-bindings: mfd: aspeed,ast2x00-scu: Describe AST2700 SCU0
      commit: 0aac47aa41a1f73752fe3993526494c6df013eac

--
Lee Jones [李琼斯]


