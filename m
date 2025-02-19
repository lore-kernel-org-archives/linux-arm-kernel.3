Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D837C021AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 08:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G6yvQqQyuU69FORd2aAgJeFKBFQbI2OMWER8azk8GDg=; b=Bc7bAOTas4aFJTVKb3eiEWM9/p
	uJ3+QT37YHV8JUMfrKcq57JbOiIxlIx6FY6xJDFBg14h5SdGWo2+lM6w+v6//bkHQOgqLr2B8PDJe
	jb+aCyd6rQgM/twaVn3cTj1g6xJ3aNs7S7Rkjuv+FZY/x+pzZ//wIYNxT9ie/bS5bUiUaAmDsBa82
	OLIsMJryv7n0qYsTRITYqrGiUxLkkNXPBeOUrRvvDPl1DjBaS5rxgsG5D1wGo98xhBS4mn+SO5w/L
	/xa0B4rlTXPsyH0pIje/EIQU4v8Uv2l6Eu9tZaopxkwAqVV/9Y8nEJ0xg8RyuZSMbov99FEOqz9YZ
	ro017vWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkfk7-0000000Bd4T-0yrv;
	Wed, 19 Feb 2025 08:47:43 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkfJL-0000000BTXq-3HpP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 08:20:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 48AA0A41F3A;
	Wed, 19 Feb 2025 08:18:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B645C4CED1;
	Wed, 19 Feb 2025 08:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739953202;
	bh=f9iAeR1IOQP8kmg5+b4WgQh9Utss7fF0baQU25zQRh4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WvrZMDgjSl0CSSQCGL3t0GjL5zUupEtWr9dK6c23NVo/rvVZCUVL30qNdCqASRZa7
	 aE1WBn3Y4r9MWNRoufWG+X/u9Sh/F7jhuLG7B2jCFwAUoWTB99hXiHJWxAasKgIjef
	 ka30iRBL9WlsjV0NjiuA1sZQCrJvTZU5K3Y9YOX4Fk2aQbP69eBAy3wJpcmCdoo61B
	 xtGds4u6BQ5A5cvTVXkvQ4UwDTGxgv20yilzkbOUAnMWg5h3SRBiPoe1f1JGZA7W+W
	 CtMf7LPQNKV309/0Ifr7hzZGx2atLRAuilBn/VNVER91PRi+FvAeNZpQjgC0c7GI8F
	 ZeDx+f09/wUdw==
Date: Wed, 19 Feb 2025 09:19:59 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Balakrishnan Sambath <balakrishnan.s@microchip.com>
Subject: Re: [PATCH v3] ASoC: dt-bindings: atmel-at91sam9g20ek: convert to
 json-schema
Message-ID: <20250219-strange-quizzical-peacock-eb077b@krzk-bin>
References: <20250219-sound-atmel-at91sam9g20ek-v3-1-d7c082af4e14@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250219-sound-atmel-at91sam9g20ek-v3-1-d7c082af4e14@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_002003_884523_BD3DC486 
X-CRM114-Status: GOOD (  10.40  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Andrei Simion <andrei.simion@microchip.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Feb 19, 2025 at 11:22:27AM +0530, Balakrishnan Sambath wrote:
> Convert atmel-at91sam9g20ek-wm8731-audio DT binding to yaml
> based json-schema.Change file name to match json-scheme naming.
> 
> Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
> ---
> Changes in v3:
> - Add recommended minItems and maxItems.
> - Fix commit subject and a typo in example.
> - Link to v2: https://lore.kernel.org/r/20241211-sound-atmel-at91sam9g20ek-v2-1-86a0e31e6af9@microchip.com

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


