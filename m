Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35693FD9E0A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 21:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=btF8qW91mxsME8KrhWvG0+GhaJc7/V11Fp+VvD6+sOQ=; b=t4TITnPMlkCnRN5kAmubgAYZb4
	tDHia/EIWNmyqf7mKqMw1dWrwzsslAdyq+bw5KvkHd7mZ65GzjW6Ki2zNfm+2O7bFFzs7fCzO8LKT
	3x/Jc8QgKJhYwFTricgaXwRiooQ5KmYz0vndJxXpgg2Du1k/Tl1C9MWL6ENfWuhzqdIVdhm8INWeG
	9GTke0UHrroG24KFEe1+7r/sU69H6bT6yNOlrFCjDGXwBS8QxogtBjcKC8FGdHjdnH+S06Lkz3IlJ
	HnMa222wHnZeWG029zfaD5iYrX5gZlAGAbDAXMIaf4XFymjFS7+duAUCA7ffgTJgVKfvulye63kT5
	9LiV4REQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvifX-00000007CzR-1KO6;
	Thu, 26 Feb 2026 21:13:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvifW-00000007CzD-1fhB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 21:13:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 79FF6600AE;
	Thu, 26 Feb 2026 21:13:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFD08C19423;
	Thu, 26 Feb 2026 21:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772140389;
	bh=/rAVJCFfsQkvrRdgutCJT5HOojDDScsTy8KhEKFIjJ4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=vGXn5u/J304XW4PR0Lx/1Hf7o0M0kmHoP1R6/LShOXfbdH83FaLtbhauldgOIa8hP
	 hzdfGGLUw3KCXgi++LTqXcioxDKgLIu+vxwggoLItz/slZYUWPUdLjcdfkSiJo54Sa
	 6Rmgu3RK8OqpB/cm49jxQmUeatTKvm98TKnmGfpgsNNOspwWAWLobwSNFnJT2IjUW1
	 Tx9tK0s6NQdUCg1MLGvAiDuhzWESVh4VVL/A09NUSKyLFoP1wKlPr2vc34X5p+mebQ
	 6noDRAtYK3BG0hY+aklFAUGapUt0CHPHBlFg4siet0sXpLUYfpzAYpci+Rk+hTeOt/
	 4pSlcmsE7lnow==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Lukas Timmermann <linux@timmermann.space>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, Alexandre Marquet <tb@a-marquet.fr>, 
 Henrik Grimler <henrik@grimler.se>
In-Reply-To: <20260127-lat3st-staging-v4-0-797469aaaf9d@timmermann.space>
References: <20260127-lat3st-staging-v4-0-797469aaaf9d@timmermann.space>
Subject: Re: (subset) [PATCH v4 0/3] Add support for exynos5250-manta
 (Google Nexus 10)
Message-Id: <177214038655.341086.4114348823043257597.b4-ty@kernel.org>
Date: Thu, 26 Feb 2026 22:13:06 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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


On Tue, 27 Jan 2026 21:40:55 +0100, Lukas Timmermann wrote:
> This patch series adds initial support for the google-manta board, known
> as Google Nexus 10 to users. The device is powered by
> the Exynos 5250 SoC. The bindings for the notification led are already
> in the linux-next tree and can be found here:
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/leds/ams,as3668.yaml
> 
> The first two patches add the necessary device tree files and
> bindings, while the last patch makes a small modification to
> allow CPU1 to boot, as it requires a call to it's underlying firmware.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: ARM: samsung: Add Google Manta (Nexus 10)
      https://git.kernel.org/krzk/linux/c/1e7e6c6301d529fac07554fbdb215c70c8510f7b
[2/3] ARM: dts: exynos: Add Google Manta (Nexus 10)
      https://git.kernel.org/krzk/linux/c/16319efc63cb41abd29337dc0dcfbef723ec1dea

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


