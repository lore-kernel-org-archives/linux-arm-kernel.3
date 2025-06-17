Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ED88C71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 08:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lNCQl7rcuff3KZPCZ9rhA0Ol0h+pXTYbt/EeOCFpQ8A=; b=P1zd4gNpb8dkx5a/TTcML1qMrA
	40DJAGJVeazX2zq25PCKJ2Yh6Qkjm+RC+4p7eq+AKuX1rYKRPzQDM9i/Y43LihkZBUJAPD6QHVMkM
	6nvRRs2XA5wn97VqvTgM/jlDxRUglJmkB+itwdbgOh0hKkLMPnBIQIb2D608eUFebeTQLw46QCzPW
	e0OPACtN5sU2Lwr1J2A4YFfOu0HQgb1YLTxEsYeb3walhKQ+nnRmopfdRFlk8MY6TRZdz4Sskqz9Z
	BFGoaTUTzJ7/5X/x1AVJRsjjKh3NUTHQM8efUK9oCDJHSd3Pl2bBLxU6+qXjLG3Hr1sINNCaqHV/E
	YHLtMKng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRRYE-00000006Zva-1GBV;
	Tue, 17 Jun 2025 08:20:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRRU1-00000006ZL6-3ka5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 08:15:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 54AD8614B1;
	Tue, 17 Jun 2025 08:15:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C0BEC4CEE3;
	Tue, 17 Jun 2025 08:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750148153;
	bh=fk7f/dwAlQZgX1NDAdsyqWiKhDe3Ny7ZLAxMuT9Ey1U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qcBYmil9r5O3EBpoJ0BbQRjvlMSqAA5PHa5Y+GYe0aRbvCiXSCPO6owyXOPrccGs5
	 VIkwFIqZ55cM1NZJ5xLZYgXDxGu3ZqXG5PGYhaeC6LW0cK6kvD+Qoa75RXddYQfqIm
	 +hdGavwnArcWcrwwrfPrzNW6djgn7BjYZyoFBWn05WbXiDcrMkEpFeMgR0BwO+rzwz
	 OZp+mvnVEKB7CrWw8PNFZ2euCjEOao2ZL7imO+gwOis+2ImQhQuqB6jGhnvfIHtZ7e
	 /Of9iN5HSskErlb3m5rrkopt3VCletE4ojlET9r9s8A10ISlHBwgKbg8/04nQq3XdS
	 DhOqBiulVt5ow==
Date: Tue, 17 Jun 2025 10:15:48 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vladimir Zapolskiy <vz@mleia.com>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
	Roland Stigge <stigge@antcom.de>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:ARM/LPC32XX SOC SUPPORT" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH v2 1/1] dt-bindings: arm: lpc: add missed lpc43xx board
Message-ID: <20250617-hound-of-improbable-intensity-e7c3c9@kuoka>
References: <20250606164012.1363896-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250606164012.1363896-1-Frank.Li@nxp.com>
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

On Fri, Jun 06, 2025 at 12:40:11PM GMT, Frank Li wrote:
> Add missed legancy lpc43xx board compatible string to fix below CHECK_DTB
> warnings:
> arch/arm/boot/dts/nxp/lpc/lpc4337-ciaa.dtb: /: failed to match any schema with compatible: ['ciaa,lpc4337', 'nxp,lpc4337', 'nxp,lpc4350']
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v2
> - move to nxp lpc32xx.yaml
> - fix ea,lpc4357-developers-kit include lpc4337
> ---
>  .../devicetree/bindings/arm/nxp/lpc32xx.yaml  | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


