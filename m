Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3891105F79E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 09:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4ZLE6MXsmBgPA5z2EWzrKDVh/VaIo/g3gqPs8mZAi3Q=; b=XKSXQ7sYR+/bdwvLJNpN4X1XQW
	gc65hQ8z2jHZZrB8LXtA5cuqZuLWiG5zYhwgbB8fi3B89CLB00tXm802on4lyhEbtAibQB6EvMqLp
	dm2YwNx0rngg3W6qoN/xE+tjK7mftF9HC1GwA6UXJaM09jOvjpuIPg5b7/yqE1U6tLXz5IRzIGYvu
	KxFNaGR21JAnkGKka6m8xtAhwWCWMpwJwsXtCQUnJLnb43//jkizJndEN+Ke9HkXAfZc3MH9ux/1N
	2Z0wihy2TjYAWsQ6WQBebrU9BdF9MsnGwc0Zjp9EcmzfsICxSuk7Kn1d+8waSuJSXTY/5yJuxYo3i
	ZjjO79gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1L7B-00000001fEh-3ha9;
	Sat, 14 Mar 2026 09:16:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1L7A-00000001fEK-32Vz;
	Sat, 14 Mar 2026 09:16:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A9C5C60008;
	Sat, 14 Mar 2026 09:16:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93AEEC116C6;
	Sat, 14 Mar 2026 09:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773479814;
	bh=MfVQas0gCiKFS/zlSycX8J2HuTRWGxZqHMSgUvBEb8Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lPM+6IBKxNwbUxmav30nSkqJywJRYZv8V2Rl211p0UlXMRTQM4F3GIhYHDkMOajT7
	 BUYhgeUWorLmRIDcTIEZIL85QVQD4HogCq487uuYyAzHEiKeDhU5ORky6HDXixl0xz
	 QwvSBIWYUPpSVYz2ByTuqu/FX21LkW0xoRoHu6YcoHAk7HESrAgkqa04q6cqcDkIkM
	 wodlHcEWq2yiHt8n8RJxiooJ58TvHi2AJGL221X5v0PSbWRui6S8DEPOdVX1ASwtju
	 zyh8LFLOhAubAdIhXuIH2g++sTy7ypBdvJ0Af6eVlTsShvNxdf05DEw2kJQjf1d0Fh
	 0efnjaHMKlfUA==
Date: Sat, 14 Mar 2026 10:16:50 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de, cylee12@realtek.com, 
	afaerber@suse.com, jyanchou@realtek.com, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-realtek-soc@lists.infradead.org, james.tai@realtek.com, 
	cy.huang@realtek.com, stanley_chang@realtek.com
Subject: Re: [PATCH v4 01/10] dt-bindings: clock: Add Realtek RTD1625 Clock &
 Reset Controller
Message-ID: <20260314-orange-foxhound-of-felicity-997667@quoll>
References: <20260313081100.596224-1-eleanor.lin@realtek.com>
 <20260313081100.596224-2-eleanor.lin@realtek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260313081100.596224-2-eleanor.lin@realtek.com>
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

On Fri, Mar 13, 2026 at 04:10:51PM +0800, Yu-Chun Lin wrote:
> +#endif /* __DT_BINDINGS_RTK_CLOCK_RTD1625_H */
> diff --git a/include/dt-bindings/reset/realtek,rtd1625.h b/include/dt-bindings/reset/realtek,rtd1625.h
> new file mode 100644
> index 000000000000..e69b5ee14cc6
> --- /dev/null
> +++ b/include/dt-bindings/reset/realtek,rtd1625.h
> @@ -0,0 +1,195 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (C) 2025 Realtek Semiconductor Corp.
> + */
> +#ifndef __DT_BINDINGS_RTK_RESET_RTD1625_H
> +#define __DT_BINDINGS_RTK_RESET_RTD1625_H
> +
> +#define RTD1625_RSTN_REG_ID_SOFT_RESET1     0
> +#define RTD1625_RSTN_REG_ID_SOFT_RESET2     1
> +#define RTD1625_RSTN_REG_ID_SOFT_RESET3     2
> +#define RTD1625_RSTN_REG_ID_SOFT_RESET4     3
> +#define RTD1625_RSTN_REG_ID_SOFT_RESET7     4
> +#define RTD1625_RSTN_REG_ID_SOFT_RESET9     5
> +#define RTD1625_RSTN_REG_ID_SOFT_RESET_BIST 6
> +#define RTD1625_RSTN_REG_ID_DUMMY0          7
> +#define RTD1625_RSTN_REG_ID_DUMMY1          8
> +#define RTD1625_RSTN_REG_ID_DUMMY4          9
> +#define RTD1625_RSTN_REG_ID_SOFT_RESET11    10
> +#define RTD1625_RSTN_REG_ID_SOFT_RESET12    11
> +
> +#define _REG_ID(n) ((RTD1625_RSTN_REG_ID_ ## n) << 5)
> +

Not a binding.

> +#define RTD1625_CRT_RSTN_MISC      (_REG_ID(SOFT_RESET1) | 0)
> +#define RTD1625_CRT_RSTN_DIP       (_REG_ID(SOFT_RESET1) | 2)
> +#define RTD1625_CRT_RSTN_GSPI      (_REG_ID(SOFT_RESET1) | 4)

None of these are really bindings. Register offsets is hardware data,
not a binding.

Drop all of this above and further - actually nothing in this header
look like a binding, since you called these "REG".

Best regards,
Krzysztof


