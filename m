Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91A6DE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 16:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IK7+4DV+nvb8YijaHZDnK1rACwbiWwzRILhSghGDSfs=; b=JHSJS2gLZ2g4jrbvlBUIpvy+Cq
	fz0f7z4ZtwoKXdYwNV7UmN1V/0yN3vefWC0Ln/6BPbn09m+ER0f7gt4KV2sTkUl5qCvD9//UYcFlJ
	H+EBhhN/KTQ44qKyl41s1EgFp+aHMv28EUMy1wn4NY7lG1l7YbGc9WjKOD0KcHCykQqHhaPUyUpuh
	T2gzYuldb1wYhX0dfqJtZ68cJOEAXs3Fcu3B/KmUMEXGkdaEKw0i8vJ46jj3dufynXWh1UYozVEFc
	NoXuqAurK0TH3kUm1mcYes5FlO0iCoy4t+MX8y+Lh3lhFBGqfjszVpwwoBbC3lUGHzjP3C86wMk8D
	GHZkCA+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLPOk-0000000FPzr-0tCD;
	Wed, 11 Dec 2024 16:17:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLPNg-0000000FPqL-2COk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 16:16:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5EC585C54E1;
	Wed, 11 Dec 2024 16:15:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42C55C4CED4;
	Wed, 11 Dec 2024 16:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733933767;
	bh=oKBNSq3mc2lrPbEFRIMyv15AXFDjsWHNQwb9AyrvQDc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iMUHue++r6KT0HH4KJSJE6Lofit49dMv2k3Ulo86AA3BGcy02NKU6uZkZbfvs7UeC
	 KdK7D7C+hntWMNDumN0PiyrTFISDGveYwtjllhVu0dlo72zKiAexCw2bJIAUAg+SXN
	 WYzGqqvhz1R6BzGj9UvwjHrkwX9LosVPIsL+Nbjlfhlh4AJqSnrWI0Tit6GQi/1WxW
	 kd10hVlNNGdy3gEHN4qFD65rfZxeHLBYzZ60FIM7GWSyNNYBYaN5zz2Y8Tndd8yewK
	 +7m+ALcEzwxLVKv47zl6VI3btLjovpVKif3MAwBuO2sQJXn1JVxtPF5bEINRNlLd3W
	 GO9e0EXcr0GVg==
Date: Wed, 11 Dec 2024 10:16:05 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ryan.Wanner@microchip.com
Subject: Re: [PATCH v3 03/13] dt-bindings: atmel-sysreg: add sama7d65 RAM and
 PIT
Message-ID: <173393376441.3234883.1609232326529788470.robh@kernel.org>
References: <cover.1733505542.git.Ryan.Wanner@microchip.com>
 <96e64f01eee264ad0ac4c720a7a1cab4f95c206b.1733505542.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <96e64f01eee264ad0ac4c720a7a1cab4f95c206b.1733505542.git.Ryan.Wanner@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_081608_602598_66CA90C1 
X-CRM114-Status: UNSURE (   7.91  )
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
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, alexandre.belloni@bootlin.com, arnd@arndb.de, sboyd@kernel.org, linux-kernel@vger.kernel.org, mturquette@baylibre.com, claudiu.beznea@tuxon.dev, romain.sioen@microchip.com, mihai.sain@microchip.com, linux-gpio@vger.kernel.org, dharma.b@microchip.com, linux-serial@vger.kernel.org, varshini.rajendran@microchip.com, krzk+dt@kernel.org, linux-spi@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


On Fri, 06 Dec 2024 12:59:48 -0700, Ryan.Wanner@microchip.com wrote:
> From: Dharma Balasubiramani <dharma.b@microchip.com>
> 
> Add SAMA7D65 RAM controller, PIT64 DT bindings.
> 
> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  .../devicetree/bindings/arm/atmel-sysregs.txt      | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


