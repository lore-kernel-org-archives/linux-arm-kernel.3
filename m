Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32572CD8C92
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 08:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FQb6bDWfmdaPHwTtE1rATxeYREPUBuPE+e9MX/QLv7U=; b=XLxMTxlQVgr5DTM6xOYpMYkAiN
	0+sfAUgYH3tIpiCsxJFUnuBsOkaObxL/dbn4rGcze1WoVk0DMLUH91hYKyEuZOoupO7JEcpVE+FZP
	aOKIGfOL6hQ+3TpWnmB5R7RvRBbtuzA3W4XGQjxMCrIjpwm1QvPANh4RQPVjF6RbRCgIFHqT21Mg2
	gh6PMFmYpY8jlL3g+QXx/s5JBAwJASGFQO4XKCwMmP6fQQbFUtzKOa68EvCMlrOAk7f2UIHe0Gza1
	uacnmgRNcNmCuVpejoFOrx3djw3tAli4bUqAMLCOhJpHFmxuCjQqcKhNyS5F91fWeWxt+Z/HazD15
	MBbutpBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWUwA-000000031qt-3LVv;
	Mon, 08 Jun 2026 08:02:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWUw9-000000031qj-1fIp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 08:02:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 791726001D;
	Mon,  8 Jun 2026 08:02:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64E831F00893;
	Mon,  8 Jun 2026 08:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780905740;
	bh=FQb6bDWfmdaPHwTtE1rATxeYREPUBuPE+e9MX/QLv7U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QxafCn2zVadEMA2cQMxBU+mcAITO4xYSagCccGUk0EAoDIXUdM21Y6TuGrl5HttOo
	 LloRY2bu2pPdx3pdHc258nCMAQ6aXX3drcbO3WIKwXMNTOLTWTHdluO84LXO44LWDT
	 6zi4dwWEYnSSqwtiaeuCfpGfj728d/DpJ7Z+0MOMrKjxeWd+colgIzSaXndDp/VhQu
	 iY6S+i3h7vqjAHVx7cLUgxQc87H8nHIbvlccxkQCPzmciRl/BpI7ymz9PcltbSwQes
	 ufaTyThR+rtUiGaQywq/sbHd/O7fHrL4lKSeXaKY2PnQ3MJLIylWmhvyUTVmzIa972
	 LhNznRmEGJszQ==
Date: Mon, 8 Jun 2026 10:02:16 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Joey Lu <a0987203069@gmail.com>
Cc: zhengxingda@iscas.ac.cn, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, ychuang3@nuvoton.com, 
	schung@nuvoton.com, yclu4@nuvoton.com, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/5] dt-bindings: display: verisilicon,dc: generalize
 for single-output variants
Message-ID: <20260608-baboon-of-theoretical-stamina-6db63f@quoll>
References: <20260608023237.305036-1-a0987203069@gmail.com>
 <20260608023237.305036-2-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260608023237.305036-2-a0987203069@gmail.com>
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

On Mon, Jun 08, 2026 at 10:32:33AM +0800, Joey Lu wrote:
> The existing schema hard-codes the five-clock/three-reset/dual-port
> topology of the DC8200 IP block, preventing reuse for single-output
> variants such as the Verisilicon DCUltraLite used in the Nuvoton MA35D1
> SoC.
> 
> Rework the schema so that variant-specific constraints are expressed via
> allOf/if blocks:
> 
> - Add nuvoton,ma35d1-dcu to the SoC-specific compatible enum.  The
>   generic verisilicon,dc fallback remains the driver-binding string.
> - Relax the top-level clocks/resets definitions to minItems ranges so
>   the base schema accepts both variants.
> - Keep ports in the global required list and keep additionalProperties
>   tightened to unevaluatedProperties.
> - Add an allOf/if block for thead,th1520-dc8200: five-clock (core, axi,
>   ahb, pix0, pix1), three-reset (core, axi, ahb).
> - Add an allOf/if block for nuvoton,ma35d1-dcu: two-clock (core, pix0),
>   one-reset (core).
> - Fix a stray space in the port@0 description.
> - Add a DT example for the Nuvoton MA35D1 DCU Lite using ports/port@0.

Difference in clocks and resets does not need a new new example.

Best regards,
Krzysztof


