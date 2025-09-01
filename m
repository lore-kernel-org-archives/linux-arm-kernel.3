Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B668CA1002
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 00:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8FEJqcS/meUq3Ag7foIbYiCrGgUgEOAYSTRYuW2eS88=; b=r9ervmlUp0fwBpbHCAKPY8FSDe
	Av+rCHxhvWwA9rWzo3uYEWGcSUE3iLtTdNPdesfUW7Prb9+8VuYNbff3BraKVsylgJCzoPa4F1oLi
	E1D4FJcquNeBR5aS9Fzen4YfCq/0RYrD7mQ3CBXPbs3FR8YrP5SsFNR1A6kdHdjrP5SRUbtn4vStN
	N4MaOkthNNIWtwoVzg4U7ehxDy6CFaTnutLxLPnq8r34TVhi8cCjTtoMeFM5Wj11jSKcUp8tHxB9+
	XhYsWf8YPeDbxdMT+uPbGu3qzLdRl4b3LvDy6X5zfVCbJv6E223N9M71/qHvLFnhBJ+TzRb9C0wWB
	QKzz3Vtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utFG9-0000000EYJT-2Zcd;
	Tue, 02 Sep 2025 00:52:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utAtx-0000000DkZj-1HdY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 20:13:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2459444ADE;
	Mon,  1 Sep 2025 20:13:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75F58C4CEF0;
	Mon,  1 Sep 2025 20:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756757596;
	bh=h5AbjiFUdzaBGXkC/aYLxuY1L3PZiTGgFQvMvER9rQo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AihmJg3lsTCEBkSxMfHKhh+P6mwwk0am25MaHURkDsLk8GGB9uDPiOGpgqNxeU1sO
	 wZ3Unga3Rv4j6Kr3xmTSaHK+vbalvqaPskUbFyc5RrVizYYDia4GlTtlqE640hQuzO
	 5OrSHvklJzETgpdUb0GYBL1f+kko8wH1aBcrQwWoT5W9OjhT8h/GkwLJlQPdRrFCrS
	 lklnbsOoEomgoDYKvStsTX92LymTL/rRFPr3xgkBbRlambEl8tm3jtdRsI9gPl1mwA
	 INOEgQK2T0/gXsVM8GmTzyjFQ3g/OENO+YBtj9+o+hBQK9EF3tdAfEaQwkoDzpq5MP
	 bYPRKr7d0jYcQ==
Date: Mon, 1 Sep 2025 15:13:05 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-samsung-soc@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 4/4] dt-bindings: watchdog: samsung-wdt: Split if:then:
 and constrain more
Message-ID: <175675758490.265131.17956569668520199935.robh@kernel.org>
References: <20250830-watchdog-s3c-cleanup-v1-0-837ae94a21b5@linaro.org>
 <20250830-watchdog-s3c-cleanup-v1-4-837ae94a21b5@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250830-watchdog-s3c-cleanup-v1-4-837ae94a21b5@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_131317_361712_B093486F 
X-CRM114-Status: GOOD (  13.72  )
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


On Sat, 30 Aug 2025 12:19:00 +0200, Krzysztof Kozlowski wrote:
> Binding defined two if:then: blocks covering different conditions but
> not fully constraining the properties per each variant:
> 1. "if:" to require samsung,syscon-phandle,
> 2. "if:" with "else:" to narrow number of clocks and require or disallow
>    samsung,cluster-index.
> 
> This still did not cover following cases:
> 1. Disallow samsung,syscon-phandle when not applicable,
> 2. Narrow samsung,cluster-index to [0, 1], for SoCs with only two
>    clusters.
> 
> Solving this in current format would lead to spaghetti code, so re-write
> entire "if:then:" approach into mutually exclusive cases so each SoC
> appears only in one "if:" block.  This allows to forbid
> samsung,syscon-phandle for S3C6410, and narrow samsung,cluster-index
> to [0, 1].
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/watchdog/samsung-wdt.yaml  | 70 ++++++++++++++++------
>  1 file changed, 52 insertions(+), 18 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


