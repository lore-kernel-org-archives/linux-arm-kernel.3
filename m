Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7D53C88E50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 10:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SRUSOiwe0L/larYPjqxFmRfsiCTKfw6OLlxz+WzrfBw=; b=0WpgOkRzeX61drd0dSpWU1lj7/
	GQhLIJbFa/nZ4fNca2uCb5pmWyRjL1HYky7iH/K3q4x+GwOoIqgCCR6Ss/CWEdfTxbwTORgo4cCHQ
	lg1eGtEv1WUBWdvuT4Dx83VU2mn4zMtAitsVc34ez8bbIGPX1yf5SMUbpURO/2UXMSOwQyQAiHp5C
	MANNUwBO0FThyCZGWqIZ/KPz3QUNVZP8/BpnRJF6lvy+lYSDwNg/4wA8aS64EAWWYofIFUGaDsINT
	3WoOSefRyss0dmFN87PzrQsczTHpShOLf2yZxgMs4jmVaYQV0PAvzHXdzzLQKVwWTzNKQIiz0uaGL
	SGk23vpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x63iB-000000034Rg-02Vx;
	Mon, 14 Sep 2026 10:14:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x63i8-000000034R8-2Wnf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 10:14:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CC91960142;
	Mon, 14 Sep 2026 10:14:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 570EE1F000FF;
	Mon, 14 Sep 2026 10:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789380891;
	bh=SRUSOiwe0L/larYPjqxFmRfsiCTKfw6OLlxz+WzrfBw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YS4of+THBrhzwlUaYoWEfqfVVWZ2jgZmXD+XvQbGoQe2mHSU+sr6rbVJFmnmAmPVh
	 uECaHAucYYJuoQ3d4WJUMHZDlWQIskMSeRGlaSWhZnL1dwuxBPjsFanxQFpcD54rUJ
	 AuqoAaIKp+TpCuJwsKJJthQyIGSlHhIc1P3PUNVwX2I2M3Te4TY8HXm7Hq5Cq4Troy
	 8X48d27Exa3KmNzi4YejVEIknRPWETwIz+1qIZLgcjvrKnGE+nDlwGl3Om7eEOIzbo
	 ZCrCHpGGVytewWJqKBtPIDeCo3VxwmxI1frrVRosaPC7O8ss6zWBunTtZNVrqAita0
	 nKqGBtwCT0wUA==
Date: Mon, 14 Sep 2026 12:14:46 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vincent Jardin <vjardin@free.fr>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 2/3] dt-bindings: arm: fsl: add Free Mobile Nodebox v3
 CPU Module
Message-ID: <20260914-private-psychedelic-scorpion-9c74ad@quoll>
References: <20260913-for-upstream-nbxv3-dts-v6-0-058566b93ba1@free.fr>
 <20260913-for-upstream-nbxv3-dts-v6-2-058566b93ba1@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260913-for-upstream-nbxv3-dts-v6-2-058566b93ba1@free.fr>
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

On Sun, Sep 13, 2026 at 02:35:25PM +0200, Vincent Jardin wrote:
> Add DT compatible string for the Free Mobile Nodebox v3 CPU Module, an
> NXP LX2160A based board.
> 
> Signed-off-by: Vincent Jardin <vjardin@free.fr>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


