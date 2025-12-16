Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD648D5C0C0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 06:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ar6ZbYjU+Clzk42U+DYHSkbYscRmfPz5K5LXkuPLMvg=; b=udBs8xB9+Z2kqNVwTqhALpTufe
	EJ7Ki2CRmDiUL9vXCQX3keQRyyjlA4zYRHnWsgRzXbQzOQDxH9yA8biqVt0kG0D0c5EYdwJrykY+7
	Zj6HZybdVYv4Nll8Jhj64TjYkUJQPC3Db0UvJrUFipghqhobHKDSKaoPV9UDCdQR7TyG/Ndr2e+tL
	MbuApEqV7a1/OGKmy/rurulEdGHMV3bupIUdoaW0UkXXffcQC5XAWWJboehQ9llPKnBHEv3udRgSL
	N7fhYlSTNuU3/7b8o38YHnPLZUFBamMoJ1i2UkGN0oSxERW0ZmEPW3+R1ncDULlPSq63CqiTvM02w
	Q3UKTGDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVOx1-00000004o7T-3qbn;
	Tue, 16 Dec 2025 06:54:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVOwz-00000004o6a-377I
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 06:54:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B35FA40826;
	Tue, 16 Dec 2025 06:54:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EECCEC113D0;
	Tue, 16 Dec 2025 06:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765868064;
	bh=XpYWfPplmJQJwAk7kwKwmfbEmyeewuLRRvdBKshW+Fw=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=K1JuGzNA5t714dUQEsYyxlVzQENbSsjRgPR7mtzZdaVHav6MJnEfG67Fc2Lw/aNha
	 Q8xEacMMajNvcKkqGmHuy1IOLGDEMBM3Dc+kMABxwNSmarvg32rm/RGp9FLQYxPjOb
	 IjxL3B3l1WtA/oHYJortdCPiCkE044aFbGmM19kjpOwlbIQQFe5zPy9Tgugim3y9KU
	 wh4V+fRPHlFBetqX3aQI4BWIV8Rf4cVXD5SzVtrWCdyPfGOPI48iZFE+qbsJysTwoA
	 F91gc2SFJhNxhpA+tNui6p4lK9euU+VxlvvLKvg3lTxWYkS9RMYYS6CsC85cG8nWBg
	 0qtlMG3ZDGBPA==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20251022133616.74492-2-krzysztof.kozlowski@linaro.org>
References: <20251022133616.74492-2-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] arm64: dts: toshiba: tmpv7708: Align node names with
 DT bindings
Message-Id: <176586806270.20531.3411870761974576435.b4-ty@kernel.org>
Date: Tue, 16 Dec 2025 07:54:22 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_225425_806520_0F51FB10 
X-CRM114-Status: UNSURE (   6.65  )
X-CRM114-Notice: Please train this message.
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


On Wed, 22 Oct 2025 15:36:17 +0200, Krzysztof Kozlowski wrote:
> DT bindings expect node names to follow certain pattern, dtbs_check
> warnings:
> 
>   tmpv7708-rm-mbrc.dtb: pmux@24190000 (toshiba,tmpv7708-pinctrl):
>     'pwm_mux' does not match any of the regexes: '-pins$', '^pinctrl-[0-9]+$'
>   tmpv7708-rm-mbrc.dtb pmux@24190000 (toshiba,tmpv7708-pinctrl):
>     $nodename:0: 'pmux@24190000' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
>   tmpv7708-rm-mbrc.dtb: wdt@28330000 (toshiba,visconti-wdt):
>     $nodename:0: 'wdt@28330000' does not match '^(timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: toshiba: tmpv7708: Align node names with DT bindings
      https://git.kernel.org/krzk/linux-dt/c/af8dbb88188784cfcdc215487e0173a6f62caf52

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


