Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC0E1C61DC2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 12:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oN1uBNEZB9zCmyVRxDlBtR7tHE5jA4bpzOHI8/B57Gw=; b=IIUi2H4XDzDO00FzXrmXX2DdBr
	PlS/XoiDlUDHU2mt+ZzWC2i/axiBYHyMjoOtyO27ljB3siuAvLXizAOHKPrUTF854p+srQU0IvqNc
	5Szr5X7dECHNEd7EGYVXEnopqRue9DHWqLDaNNjcfseavb7SK4j8IyJ5+qcwGsAo2kRBiLmQy9mLr
	XcCa+bZYMpnz9prAMBHjTHgIWjQbjsQ3vlMsDw8RZy71Hxjb8nEbbhUkmyNQnJwyzO6u0yMt2SBOF
	+tL4LJRjQfYDBVfAwv2nvABcoyKKrxurd+Oasn7dJwhvzH2uwOurHZCKMUYop4pTk2ikp4oKnEm2o
	st61zCbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzYyD-00000003wBN-3ARC;
	Thu, 27 Aug 2026 12:12:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzYyB-00000003wB2-1mXF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 12:12:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DD7CA42D71;
	Thu, 27 Aug 2026 12:12:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7B391F000E9;
	Thu, 27 Aug 2026 12:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787832754;
	bh=oN1uBNEZB9zCmyVRxDlBtR7tHE5jA4bpzOHI8/B57Gw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HXcgLl0PLqP5ixOEzoOZ638HhU1mGkyHmnZoq/qZDaBBA/zQGfmcV3r+3u7k4VoJF
	 7P+7c4BxJVN63wedE5ZHFzUNXjBASY2z8g2zYUjtxy+5isxC2mRIcIKreyWoh8Vls7
	 h9KJkhXWfCJUgXcXqd8YoHcizZzozp+dTvW/V224LV89OjEMwgL2Uz7xhvXKYEBc0i
	 0lFixYKHToNC6CC5rA5a4YZ6+AZaq3gxNXkpkNA7QPTI65kxx/B0/FHTkB/JavZvh/
	 UsJvHfQzToJqGKOcxDxOmSA1F04ie9+sHn83u5MR0nJrPVl8aMqi00cGT7DxjnGEZ1
	 V+cabfdJ3oH0Q==
Date: Thu, 27 Aug 2026 14:12:31 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Aiden Isik <aidenisik@member.fsf.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v4 2/2] watchdog: s3c2410_wdt: Add exynos5515-wdt
 compatible data
Message-ID: <20260827-energetic-nifty-anaconda-6de11a@quoll>
References: <20260821-for-next-lucky7-watchdog-v4-0-d070cee5009f@member.fsf.org>
 <20260821-for-next-lucky7-watchdog-v4-2-d070cee5009f@member.fsf.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260821-for-next-lucky7-watchdog-v4-2-d070cee5009f@member.fsf.org>
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

On Fri, Aug 21, 2026 at 04:14:50PM +0100, Aiden Isik wrote:
> Add driver data for the Exynos5515 SoC's watchdog timer.
> 
> Unlike similar SoCs such as GS101 or Exynos990, Exynos5515's PMU does
> not require explicit counter enablement for the watchdog to tick.
> 
> Signed-off-by: Aiden Isik <aidenisik@member.fsf.org>
> ---
>  drivers/watchdog/s3c2410_wdt.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


