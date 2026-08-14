Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 085D6C5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 08:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=64zJfBFVLsa/r/hTy+ZXMCvUd6FMvrCGvORICSfFTTI=; b=CEXFS9sQ3kFOfLMSxMghEwvcS4
	s3s18jKhikTsmel9W/V308GYdnkrZctZ8Gid85lV3b1fkRMi82zouU3ccuSRnMPmE0lOVKVeHnfr6
	vxnUfhFNLZUNcGNrkoWEUEhy3vPUfuTzU+cT2JHC7kJmvTfx5t3A8AAmFQPDsVBNm1oqXkW16JsQP
	3WpiEsP7nkXtolAY/ck9GbcHQhcTdpTiFcHnjBKkF2fBtSiE53dtlF0azTKMnc/3XqbxUf8HIsax1
	x840YyWceev5dnTT6wGl3+9gOg5BWa7GbnoAP+pVlZY43pB1xt8v8fawtnkCFpaxpcnlqttEHBMBf
	nZcjDVnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wunl3-00000002KnQ-1qt5;
	Fri, 14 Aug 2026 08:59:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wunl2-00000002KnK-1T1f
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 08:59:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 148A043988;
	Fri, 14 Aug 2026 08:59:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CF7B1F00A3A;
	Fri, 14 Aug 2026 08:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786697960;
	bh=64zJfBFVLsa/r/hTy+ZXMCvUd6FMvrCGvORICSfFTTI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lDefZm4xUhCy9ejdkmsluExNgWKYDYzlhpqB49+oJNzwu6KULQR4CC/u+dJ9Q0nUt
	 h1/cGA217YAC+i22n7oYGt1SfzGAciNP+zlpncOv7KWdY555a13t60+D4jVAijvNkb
	 00WxGVThrlKmqLg422hRdEGUl0UQ2c2Ghm1PadWFLPQJfdV8TKDlybCtzzUdczWVkJ
	 dpcB50dMtQzyUG32vSkHvhhOSSf2qVsFsc/uDouFnF7O0Kl3/V1kfHcLIExNW3QIsM
	 vkQvvrON+FI+9xkMuh18hfIEULJUgfjdY9ubP63L9zNB/rX6+eKOF6P8M/XrBF8uSK
	 466zDanAjOk3A==
Date: Fri, 14 Aug 2026 10:59:13 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Long Zhao <longzhao@ambarella.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] gpio: pl061: add Ambarella CV75 register layout
 variant
Message-ID: <20260814-nondescript-quartz-shrimp-3ce74d@quoll>
References: <20260813-cv75-v3-b-v3-0-1d82e18da09b@ambarella.com>
 <20260813-cv75-v3-b-v3-2-1d82e18da09b@ambarella.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260813-cv75-v3-b-v3-2-1d82e18da09b@ambarella.com>
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

On Thu, Aug 13, 2026 at 06:19:37PM +0800, Long Zhao wrote:
> Extend gpio-pl061 with a per-variant register layout so the Ambarella
> CV75 GPIO banks can reuse the PL061 driver instead of a duplicate.
> 
> Signed-off-by: Long Zhao <longzhao@ambarella.com>
> ---
>  .../devicetree/bindings/gpio/pl061-gpio.yaml       |  35 ++-
>  drivers/gpio/gpio-pl061.c                          | 280 ++++++++++++++++-----

And what does the checkpatch say?

Best regards,
Krzysztof


