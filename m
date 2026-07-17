Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 131AEC44514
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 09:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lxc4smYQ3yP6Fc8P815CCY/s/RuhTXwEKwVYPnAr0bc=; b=X2DsrdfKKXTDG2qgeAMnexlpVX
	jMU51NMXIaiqkeq4MJX9uhTf04ESQTu10nAzid7+Q6zDiPmQP49hAb9wz385QFYSbiedQoR49SlTy
	r+QYxuuvprOCtrQm7UHMHMMJKrxeFDorjTDf4n7P03UxYww8E1tbdQS57nCG9GfIeN/Obj4BQoEnT
	i1Ey834P6miTb8p1pnygrJ7axcxwpOxhwhzlAWMWKofNa5BJ67W0PJFsCW1uZtF3pA46Cn9reSN3W
	B075YX2aOhRyh5zmotCC1KzEn8LpIMRj60eYb92Z080FNKr8mM8+DXPuhr2jthkgmc4oUd/1PyUan
	qtrnwHmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkegD-00000001o8c-3Dc7;
	Fri, 17 Jul 2026 09:16:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkegC-00000001o8A-23Yg;
	Fri, 17 Jul 2026 09:16:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CB5E660204;
	Fri, 17 Jul 2026 09:16:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51A4B1F00A3A;
	Fri, 17 Jul 2026 09:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784279783;
	bh=Lxc4smYQ3yP6Fc8P815CCY/s/RuhTXwEKwVYPnAr0bc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZRtaN053SigZymTfwMifByaVtj/ZW7uOX6Gc6gCUBr/fqYWJ7yRSRkaAehOyyXkb3
	 HfN9l8brnTD5zzWL3VlG8Lr+wh/HZIsbk1qeTKKnLL5/ooCstop+shFyATnq/pks7G
	 Nd7wvnbMk0piXNXNFJWZfWi9snM9bYEJZ9AJ7UuimoHhEmV/z3RjNZ2xHJTe/wlqjN
	 AK01pApq28KBu+Cg81DF3MdlS/4C0DI63+X+BHAVkgmGIhiM16yB3qrsmOHUPSv8V8
	 hsADYDEkuiNWApmW4Td2Vbah3Bn2w0QBJhKYPeElbWa0UUaYFK0oiC8hLMnMxFl8I4
	 mFTOv+PBguikw==
Date: Fri, 17 Jul 2026 11:16:19 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Akari Tsuyukusa <akkun11.open@gmail.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	"open list:WATCHDOG DEVICE DRIVERS" <linux-watchdog@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Roman Vivchar <rva333@protonmail.com>
Subject: Re: [PATCH 2/7] dt-bindings: watchdog: mediatek,mtk-wdt: add
 compatibles for all SoCs
Message-ID: <20260717-miraculous-bull-of-prowess-be08b9@quoll>
References: <20260716161923.266315-1-akkun11.open@gmail.com>
 <20260716161923.266315-3-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260716161923.266315-3-akkun11.open@gmail.com>
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

On Fri, Jul 17, 2026 at 01:19:18AM +0900, Akari Tsuyukusa wrote:
> The driver recognizes each SoC-specific compatible, update the binding
> to list them in the top-level enum alongside the existing ones. Keep
> the fallback items definition so that old DTS continue to validate.
> 
> Affected SoCs: mt2701, mt6572, mt6582, mt6797, mt7622, mt7623,
> mt7629, mt8173, mt8189, mt8365, mt8516.

I do not understand what and why you are doing. Just because driver
recognizes some compatible is not a reason to move compatibles around.

This completely lacks explanation (in terms of DTS, see writing
bindings).

Best regards,
Krzysztof


