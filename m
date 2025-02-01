Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1AEDC0218A
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Feb 2025 19:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Cc
	:From:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BfG3HrCxqbeW5d3xVI8UwlzmsQZXhlzTGj9IMuqNOT0=; b=YYE3ON15Q21RtzP1N089lsRAHF
	XfJzReH6s/EoE5DK3fnh8NrqKtJnfLWaw26AeOzKOU9ayYOV1oPnngLEpx/Tcv6gdMgEFoVcmj6nI
	cUpOHvRbWneMvrcg3WO2ks87+kAZPYLzyqo7ooHEgNSruep1bXJR++ZknupMPEgMmiKSjxr782GaZ
	Ui6zQSZ1WjK44NftEna7zTD8Uvvi3L1fCkiTRmZbUXhnlQ1leUi8EVonL3yTJqAOjn7ffnLYoAxEf
	aD7auibnANYYIF4sLGKxVkWg+hyL5E96WQ0402/m6e2vFesBKl0W+482Pn/vrAWF8MYaUC6fSdiwG
	9MH4GAPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teJIj-0000000D43e-1KoS;
	Sat, 01 Feb 2025 19:37:09 +0000
Received: from out-186.mta0.migadu.com ([2001:41d0:1004:224b::ba])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teJGU-0000000D3qU-1uxC
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Feb 2025 19:34:51 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1738438483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BfG3HrCxqbeW5d3xVI8UwlzmsQZXhlzTGj9IMuqNOT0=;
	b=qQ7llyaVhB2SxjVamAxxz57OJpCMdoc1XoqY7AqFyGnlmhKa5nxkzO9EYkQHqCUebYZw+l
	+t74MgRSaJHqcCP6CUSfDc1JZLug746pseESsF/C00HDMv2FCLLCoo2dL8p8wROnNGKHZP
	k7m1zrXwUmm3OcGxLeAYoXtoTlEz5Ov730JEGpA01JlUMnLIKUCjcDvabCH0UB+V1/JmyR
	7k4cjAAV/6fuxznNjXCBPzpPHV5EO4rWtdSIuaFsIDwTLVaQlafkmYLHh0kItGjZILBaaU
	Aw/x5eocbnHbN2C4cUEOlPMU59/mQ+mPr3tYEnis3TWXRJCtpDKNZYs30jm82Q==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 01 Feb 2025 19:33:56 +0000
Message-Id: <D7HCZSPU5TZH.MEWHEM6398EB@postmarketos.org>
Subject: Re: [PATCH 0/2] Add support for Xiaomi Mi TV Stick
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Ferass El Hafidi" <funderscore@postmarketos.org>
Cc: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <~postmarketos/upstreaming@lists.sr.ht>,
 "Artur Weber" <aweber.kernel@gmail.com>, "Karl Chan"
 <exxxxkc@getgoogleoff.me>
To: "Ferass El Hafidi" <funderscore@postmarketos.org>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Kevin Hilman" <khilman@baylibre.com>, "Jerome
 Brunet" <jbrunet@baylibre.com>, "Martin Blumenstingl"
 <martin.blumenstingl@googlemail.com>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, <linux-amlogic@lists.infradead.org>
References: <20250131200319.19996-1-funderscore@postmarketos.org>
In-Reply-To: <20250131200319.19996-1-funderscore@postmarketos.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250201_113450_632884_F68ACAFB 
X-CRM114-Status: GOOD (  17.92  )
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

Hi,

On Fri Jan 31, 2025 at 8:03 PM UTC, Ferass El Hafidi wrote:
> From: Ferass El=C2=A0Hafidi <funderscore@postmarketos.org>
>
> This patch series aims to add initial support for the Xiaomi Mi TV
> Stick.
>
> Xiaomi Mi TV Stick is a small Amlogic-based Android TV stick released in=
=20
> 2020, and known as `xiaomi-aquaman` internally (in the downstream kernel,
> u-boot, ...)
> Its specifications are as follows:
>  * Amlogic S805Y SoC (believed to be mostly identical to S805X)
>  * 8 GB eMMC
>  * 1 GB of RAM
>  * Android TV 9, upgradable to Android TV 10
>
> There are multiple variants:
>  * 1. Green PCB, manufactured in 2020, known UART pinout (helpfully=20
>    labeled on the board)
>  * 2. Blue PCB, not much documentation about it, presumably manufactured
>    between 2021 and 2023
>  * 3. Green PCB, manufactured in 2023, known UART pinout, some layout
>    changes compared to the 2020 variant
>
> Among these variants, there are many boards using multiple different
> Wi-Fi chips.  Supporting all of them is out of scope for this patch
> series.
>
> As of the time of writing this has only been tested on the 3rd variant.
> It is believed that software-wise all three work mostly the same (if we=
=20
> don't count Wi-Fi), but testing on the other variants would still be
> appreciated.
>
> The devicetree is based on the Amlogic P241 DTS.
>
> Ferass El=C2=A0Hafidi (2):
>   dt-bindings: arm: amlogic: add Xiaomi Mi TV Stick
>   arm64: dts: amlogic: add support for xiaomi-aquaman/Mi TV Stick
>
>  .../devicetree/bindings/arm/amlogic.yaml      |   1 +
>  arch/arm64/boot/dts/amlogic/Makefile          |   1 +
>  .../meson-gxl-s805y-xiaomi-aquaman.dts        | 311 ++++++++++++++++++
>  3 files changed, 313 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s805y-xiaomi-aq=
uaman.dts

Superseded by v2: https://lore.kernel.org/all/20250201193044.28856-1-funder=
score@postmarketos.org/

Cheers.

