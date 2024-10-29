Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5C23D339A3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 07:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y5QVV6r4f4cWcDybnxH4C6gWfqeQHZo9uLDQgGQaAWM=; b=tukZt3VLUAud1zC8AIsCL/P+0W
	VFIbhvbZcxyd/gTpT9CbtTw6iZICgTJzy+0mFL5P5lSrlf2CX13phBTrffMEb7gxPgsSGuRXzDl27
	TeshqwTQG0Ro59Sm9UaW5ofnlgJEVVuL8SZyBlkHouqlNkyRjgX1fBBMnrlEtAedvBKmOyJOJtK1/
	IvbdruP5Wll8MejZ7nybNCk8HUe1bi19s66EAjSaJH8wnWWcZirms+84gdnikKCW+CKFBlpv/tolN
	xTnspnn2csX3DuFLvwuQstcRdqadK01LC5Je4znjWMWM3vRiiB1hCOQNr49BKrkxSqqc7VonD9XeO
	D+vwJeiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5gu0-0000000DYW7-2UgM;
	Tue, 29 Oct 2024 07:44:32 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5goh-0000000DX76-0j1P
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 07:39:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 349DBA40B2A;
	Tue, 29 Oct 2024 07:37:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EDCFC4CECD;
	Tue, 29 Oct 2024 07:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730187541;
	bh=lvRF6OQNxK4XvjtKLyh5uUXjztm7duAnqUDnMK2nn3s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CGswHJokD3l5cEDdtfhJaBrDXZfvGMq4lXn5lpOOf4IhN4VbvXt95/NWrBGxJ8nNx
	 tmAfKWtNKpRAA0Z8cABsKXY/XpAWqQWIFQ0ZitZYPNPwJPukqgpevj77gwwib5zOOx
	 igXipatVXqw8D/dYnfYT8RIVFdE6lRtGYHKktmAU6j2q7nDwYBlc6X7Dop52uowtm3
	 ZLfbdiJxwog/45x92BLzPRKN3l5fIGW6wIg609PsP+uimLfJMw3csS8q4bWhbE8qVU
	 sUO15H0XKWNMXqr72QqDtbZAWN1JN1uqmbsaVaH8KJ2qSGWKbq6wT+bUZbsTp8e0jT
	 52lra3wFltg6w==
Date: Tue, 29 Oct 2024 08:38:58 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: shawnguo@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH] dt-bindings: power: fsl,imx-gpc: Document fsl,imx6sll-gpc
Message-ID: <fc5wzr4uzoutpxwc6itabcdtbn72ele3mki7or6luomhtg4muw@4merpns2rwrq>
References: <20241028124518.72576-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241028124518.72576-1-festevam@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_003903_293386_99A3508A 
X-CRM114-Status: UNSURE (   9.48  )
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

On Mon, Oct 28, 2024 at 09:45:18AM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> Document the existing fsl,imx6sll-gpc compatible used with fsl,imx6q-gpc
> fallback.
> 
> This fixes the following dt-schema warning:
> 
> ['fsl,imx6sll-gpc', 'fsl,imx6q-gpc'] is too long
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


