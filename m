Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 640B4C5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 08:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tkC6HVmDPjjaLSUPhvnHZ12ScYjFHLpMMtz6JvBKuRw=; b=KPSm0M9OwFo91+U36lsPPEIBRv
	sHoEW3X2aYfippz+o1aCC7KB4jAbCoPxOue23Tf1A6x+CoBqmF9XFlhyz9gmQ2zX+4Y3HC4aUN49h
	OTD/l2LUXGoZp16IeAVh17dx/bVP9lD46SFedPJo5IoPFc2RmI3r+3dAQOdiUK4NmF9UEM5Yx8Dw2
	ynlfupOqyx6N+qsCmSbpO3BGbsBgQUeBLoUZuz5kgoq/18vWuQwxuaLa21suvcxq/W/7erAsRoHU8
	TmbrLOI5HSPnhV1Ww9pC7bD2mintNL7kPabI+dDvrNk2yp1dGdn0DvV2QjxG1uNv5aFAw45iF7az5
	dIU0K97Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wunk7-00000002Kea-1CnI;
	Fri, 14 Aug 2026 08:58:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wunk5-00000002KeB-3ZE8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 08:58:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1B99343BC3;
	Fri, 14 Aug 2026 08:58:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B5381F000E9;
	Fri, 14 Aug 2026 08:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786697901;
	bh=tkC6HVmDPjjaLSUPhvnHZ12ScYjFHLpMMtz6JvBKuRw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OibSJPvR6QtGKHgidzXjHAE7Sjm7A6aAbl1LgNrSdTVeXIIr/roU0gWL+a5IiBCGy
	 so4Yf04AwArg4Z2OWDCaXVvyfHTdoClrHtkrErRnCTEsiGFjrd/KuqML9uFhN5tOUz
	 DcJ3yLOXoSrUOwxS8Wx7aia62+Z2HM9/D4Gv733iu4rwfIAeCisUpjuafx468wHITR
	 IRSdBbnpjNgyQN+B6qV2H3YWmCI4grT3aV+NrcL4xLd66MTB+KoJKZBup5BwybMzNS
	 rDX08ZEs76nMnwWot8JTMH/Nesr7XEunr23ak3952T9VeSsvsYwK7++gwF3QWv4vwX
	 fTY31wogdmSig==
Date: Fri, 14 Aug 2026 10:58:12 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Long Zhao <longzhao@ambarella.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Linus Walleij <linusw@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	soc@lists.linux.dev
Subject: Re: [PATCH v3 3/6] dt-bindings: clock: add Ambarella CV75 RCT
Message-ID: <20260814-wise-caped-chameleon-ffbeea@quoll>
References: <20260813-cv75-v3-a-v3-0-cfdd20b1b4dd@ambarella.com>
 <20260813-cv75-v3-a-v3-3-cfdd20b1b4dd@ambarella.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260813-cv75-v3-a-v3-3-cfdd20b1b4dd@ambarella.com>
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

On Thu, Aug 13, 2026 at 05:56:14PM +0800, Long Zhao wrote:
> Document the CV75 RCT clock controller and the clock ID header used by
> DT consumers.
> 
> Signed-off-by: Long Zhao <longzhao@ambarella.com>
> ---

Same feedback from Sashiko which you did not address.

You got feedback, you never responded to it, never implemented and our
task is to triple check if you missed something or not? This leaves bad
impression.

Dropping everything from Patchwork.

Best regards,
Krzysztof


