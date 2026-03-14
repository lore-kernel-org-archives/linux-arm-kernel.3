Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1914A10706C4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 09:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BKHufdN7mMaF6UomLQj0yONMrYoIhlBFSxktO2F/yLg=; b=HHsUWtmq4LWVIaZWX3ed2lvMU0
	EatK9h58YcmiSqOZYihOGjjckni2DRKUlBsh208/tA7W8nnY6HrInRgi0kYeJljBGWQIacXle+xuk
	lWOUUrzWJXtoxUOk8KYyNjuoOYZdrWbgqPR4iq5ywf46V1ocCENw9Dej0iTAFlYQv4TJmkBUYHRBM
	20KtEoVe4+eibmKiSsTOVd8+l7oFLQ/reSq1TBKV65A0Cc3Qs/sFv4AvTB7QKrZySOnRpjUA2qCgz
	5eCr7jxBM2u/MsljGJopjWp8dZi9wYh3B7VLhTDvlmyfI5xpWwunWGqfrdWtrXC0MG5X5TFtkc92n
	oWpmNwJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1LkB-00000001ive-3UDT;
	Sat, 14 Mar 2026 09:57:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1LkA-00000001ivR-0vjx;
	Sat, 14 Mar 2026 09:57:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 95D0A6013A;
	Sat, 14 Mar 2026 09:57:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7CB7C116C6;
	Sat, 14 Mar 2026 09:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773482233;
	bh=09501woOjD4eRvQIVfFayJgg97/evg9zfkOZpWm9MNE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oVSSodaNypOctz3Mvmnd4m3SlYGxQE/t7pz2EmL+ekBbsI8GAUgRk/hRn3ByvAs5h
	 z96k502Vg26VrEEjdeLNXzFpsFaVtw+cPF/ee/0TB4DnKCBLzWsofCPZCQDocZjw2i
	 aAzw5IGMS31SQ/YpxVEWoBlNI2u/fi6bUfzd8JbDQC44gw8GQvkmEdRTTjFRbBOCOV
	 ROSCW8bRdrJFoQU63HvNxr9Fs/isKEgTtxuOS9iAgpkr987lhafcYjrM7N9gPtCu/y
	 FLDyZxl7iYBXOmUywr7KkkXsqAEFhVN8h4rVsuiAkq/61mdQvIMikddfjxx/4PkzKg
	 pbz9bDnElBTNQ==
Date: Sat, 14 Mar 2026 10:57:10 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jian Hu <jian.hu@amlogic.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Stephen Boyd <sboyd@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, robh+dt <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, 
	linux-amlogic <linux-amlogic@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Ronald Claveau <linux-kernel-dev@aliel.fr>, 
	Ferass El Hafidi <funderscore@postmarketos.org>
Subject: Re: [PATCH v2 2/3] dt-bindings: clock: amlogic: t7: Add missing
 mpll3 parent clock
Message-ID: <20260314-splendid-thoughtful-ostrich-c211dc@quoll>
References: <20260313070022.700437-1-jian.hu@amlogic.com>
 <20260313070022.700437-3-jian.hu@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260313070022.700437-3-jian.hu@amlogic.com>
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

On Fri, Mar 13, 2026 at 03:00:21PM +0800, Jian Hu wrote:
> The mpll3 clock is one parent clock of the sd_emmc and mipi_isp clocks
> on the Amlogic T7 SoC, but was missing from t7-peripherals-clkc.yaml
> bindings. Add the mpll3 clock source to the T7 peripherals clock
> controller input clock list, so that sd_emmc and mipi_isp can use it.
> 
> For logical consistency, place the required mpll3 entry before the
> optional entry.
> 
> This change breaks the ABI, but while the amlogic,t7-peripherals-clkc
> bindings have been merged upstream, the corresponding DT has not been
> merged yet. Thus, no real users or systems are affected.
> 
> Fixes: b4156204e0f5 ("dt-bindings: clock: add Amlogic T7 peripherals clock controller")
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> ---
>  .../bindings/clock/amlogic,t7-peripherals-clkc.yaml  | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)

This should go for current fixes cycle and your cover letter is silent
about it, while patchset combines fixes and non-fixes. You clearly don't
care about maintainers time for deciphering all this.

Well, not my problem.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


