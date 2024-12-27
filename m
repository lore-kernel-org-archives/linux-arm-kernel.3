Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71D1FE7718F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 13:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7oJjYH7bgS+QFow4qMLvNMV6zoSmn6Juy4ntLS2AaGU=; b=375MSNB9xATQxwNywV3LgxXd2K
	lJi+4KPYVjb7X4iV3UTAEkSJiFf5DxwmRu3xp0NHII15GKgh0Qv1hhrhMT5KK+7vb+X+fXaKQHC6f
	RbPogId8IgdrwlA9Bg5bq18vypYZ2BBX7ff64dEySealt9JA2/ELiShZfHaO7JXSd6EfdzMHRj29z
	ZP7uZx8nXRdgLJ5xXfaEZOLOaU1H1uhzLX+ACfBQh8zMOW3OFqRk++IuhLM7P8qlg2tuXsb1kAEqP
	FNKlKWK9x0LIAPGNhHFqmiFsyPJOHR98lFn1u2SeR+xHoSDxGlErj/p425Idl4j0cVp1LPEz3gK39
	IowHZqgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRAj4-00000000KAb-3Jqu;
	Fri, 27 Dec 2024 13:50:02 +0000
Received: from mail.manjaro.org ([2a01:4f8:c0c:51f3::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRAht-00000000K6F-3IFg;
	Fri, 27 Dec 2024 13:48:51 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1735307325;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7oJjYH7bgS+QFow4qMLvNMV6zoSmn6Juy4ntLS2AaGU=;
	b=TPadfI18X03zvThxxk2iB4DyrpTdEaBg8yab/MqORphm0PBfbP5LNbrgwzZq3W9smGa7rf
	RENZKNlbGlu35FjM4t3CBzkKN6+bTW+gblbUdVkWVlZyBzFJPb+r/hO9uMaTrTgNa94KaH
	lRpv/2CK4Maw+gttMyGylXCUngpq30+bgIvek6PjurMmK2MKcsPLD3CtLgb37BTSg+z6UG
	tqRJkpFuLO8JFFcTPs1wMBezdn3n33tu7wLSEVMRgZCeG0DtpklQFtNWiqKCZmDFk9Eebj
	LzmKFFasFoZ6djY8Ciftjq1fL6dQJs1CMlji8ZIE5pRp0EePGN6Pj6Jf1BLsNg==
Date: Fri, 27 Dec 2024 14:48:44 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: Jagan Teki <jagan@edgeble.ai>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/4] arm64: dts: rockchip: Add Rockchip RK3588M
In-Reply-To: <20241227133420.169714-1-jagan@edgeble.ai>
References: <20241227133420.169714-1-jagan@edgeble.ai>
Message-ID: <8f40821508fde291aab01674618c0a2c@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_054849_988014_2D3A5EBA 
X-CRM114-Status: GOOD (  16.36  )
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

Hello Jagan,

Please see a comment below.

On 2024-12-27 14:34, Jagan Teki wrote:
> Rockchip RK3588M is the automotive-grade version of RK3588 SoC and
> is operated with -40 °C to +85 °C temparature.
> 
> Add rk3588m specific dtsi for adding rk3588m specific operating points
> and other changes to be add in future.
> 
> Signed-off-by: Jagan Teki <jagan@edgeble.ai>
> ---
>  arch/arm64/boot/dts/rockchip/rk3588m.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3588m.dtsi
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588m.dtsi
> b/arch/arm64/boot/dts/rockchip/rk3588m.dtsi
> new file mode 100644
> index 000000000000..0bbeee399a63
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3588m.dtsi
> @@ -0,0 +1,7 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2022 Rockchip Electronics Co., Ltd.
> + *
> + */
> +
> +#include "rk3588-extra.dtsi"

I don't think we need or want a separate rk3588m.dtsi file for this
purpose, unless the RK3588M variant actually differs from the regular
RK3588 variant from the software standpoint.  The latter is already
described in rk3588.dtsi, so it should just be included in the new
board dts(i) file.

