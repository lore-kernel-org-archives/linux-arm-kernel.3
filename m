Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EC42C02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 11:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QDt7G7gOuUNyLCqEejR8qfOIVWZF+V9T6WAWyoEhZIk=; b=BILyOagYyeruHQyITeGBbpGlVb
	trIqACreSbt/yyRI8iLMqVVLRbn5hbOLmFKUujKq9WKgDGRjdboeyYwksDdKfHrgrpY1fptsJ634d
	vCTA0V1HpsgE++ZiOpht6SBSpojZB2rXgXdELjkAo7AoxkRzbTkxXDNz4Y/6PK52U9nkRDe9wMU7k
	KkO58uSGmCEXQJ4nE5eou02s8ltqiO94J6lsZw28RWZ23zemkoGu0Zoprfs+KGtREoVfPA3f+0GCf
	3E0qDq8FtLJbmeQ0R/un2zukUyJylp6tMxwJ6A//YIswRrd/b5O+FMTHYR0MW13Szn8BEijkhfxGr
	s3UuNakg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfdnp-000000035Z8-1dFz;
	Wed, 05 Feb 2025 11:42:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfdlW-00000003520-3IBp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 11:40:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 653665C5CE8;
	Wed,  5 Feb 2025 11:39:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1213BC4CED1;
	Wed,  5 Feb 2025 11:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738755621;
	bh=QDt7G7gOuUNyLCqEejR8qfOIVWZF+V9T6WAWyoEhZIk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rg4UJO5yReXufNdwnRYqDQ37/CLIMB5yRoJsoZKrJXcnRnQunnnRJHGmJ4RsSmmwp
	 6cZ/V45OSSVdxZCrRaRdG7T8MPuKv6rZ2k6U7LG0vOOKqTFdtWEkAM4BXWQtBwq8fU
	 lb97ybVNng/MdPiHYsB6GxwBGz9xpN4Rdk5CdsUEz24ufcuIbexlDrRAqzaeQTkyf5
	 IyjaX770PqlUYrPwPx+QxmgZLgzg+0vadmP3MusrCpcsMzS4aIS3btWMmgK58XH39E
	 H/ihbdfBCjFfE9H5Rvftadq3SMAQWx0iVHo+qc8rNFJgUh8KjIgSTGXPW48gr0Hhxk
	 LIiVPT497+57w==
Date: Wed, 5 Feb 2025 12:40:17 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dharma Balasubiramani <dharma.b@microchip.com>
Subject: Re: [PATCH 2/2] dt-bindings: dma: at_xdmac: document dma-channels
 property
Message-ID: <20250205-dynamic-scorpion-of-climate-9e7b7b@krzk-bin>
References: <20250205-mchp-dma-v1-0-124b639d5afe@microchip.com>
 <20250205-mchp-dma-v1-2-124b639d5afe@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250205-mchp-dma-v1-2-124b639d5afe@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_034022_864058_53628C0B 
X-CRM114-Status: UNSURE (   7.94  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Tony Han <tony.han@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, Charan Pedumuru <charan.pedumuru@microchip.com>, Ludovic Desroches <ludovic.desroches@microchip.com>, Cristian Birsan <cristian.birsan@microchip.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, dmaengine@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Feb 05, 2025 at 11:17:03AM +0530, Dharma Balasubiramani wrote:
> Add document for the property "dma-channels" for XDMA controller.

I don't understand why. You are duplicating dma schema.

The same as with other patch - your commit msg is redundant. You say
what we see the diff but you never explain why you are doing these
changes. And in both cases this is really non-obvious.

Apply this feedback to all future contributions - say why you are doing
changes instead of repeating what subject and diff are already saying.

Best regards,
Krzysztof


