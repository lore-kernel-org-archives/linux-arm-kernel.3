Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75076D2B925
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 13:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uaMAaeUX7GPGldmZ/Z+HSXMJX41XCquSboxMIngy9ic=; b=DvrK4pTAgDWpWCg5rYr4EtvZNF
	VaI7FhIhKXfeX6K6UQDzWzWk6KrtPAfaFd8T96eMSRluRzP4LpcwPOWfXXMrQ+2Sdd7Ip6ZGt9dFr
	1nlY4o/wG+LSC3463AhanKJJoelAz3nAX+7sOhl46kPalLhR5teirDbWciLN+J0quUjKdV/f4PX3a
	nzO8G/Z//0i9pQvF/zyNdh4UcH4rYq9xDNxAOZ+DBYzo9nSwjTKjZv88Ta39wbHWqZxPwQGSjTtlR
	sAJUVCwF9XwhyExkZsD8FXHMLmS8KEEJTADnq7r2mlr/WE+9lvHCVc3QXq5NFXePy6p6thtN5XXFf
	U1Z0L9Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Jk5-0000000H93Y-2Eko;
	Tue, 05 Nov 2024 13:37:09 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Jhl-0000000H8OO-06g0;
	Tue, 05 Nov 2024 13:34:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 989FAA43194;
	Tue,  5 Nov 2024 13:32:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D377C4CED3;
	Tue,  5 Nov 2024 13:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730813683;
	bh=f+dltnIbONF+ddlfH/eH4Kjbf7iN7W4LgqnVSQXYzsI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hCf9YKwZ3dWnonKa8ESMw8CHnRDs3pxRMAjKtIPiqn77AslCYcwJmM00f3GVr8AVj
	 D9csyB6lKmZRf5dE0m1YAN++ESgyUvF1Zvf6fjyDAKyifYM0ixsGLOHyFtmxiS0080
	 eiPqYQ4Rw5bvRhI6z/nP231kDs6eB36gDJADZZPHBhNJ8hXoyMHCJUjAs4wO/g0N7n
	 3n7dGzwUg7i7YUOoXlmrbTXpYWI75JU6fxL9ZRvQy3SLSIxWFyRoAdpT44jz4qTcYu
	 Ez8FCFNJT9Hfb3696Z9zXYEuX64LU/5shOuCxMDd1SApKgjPuDQcnkFS++E5jYbAOE
	 I2r3RQIh1W3mg==
Date: Tue, 5 Nov 2024 07:34:41 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Conor Dooley <conor+dt@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC v4 1/4] dt-bindings: pinctrl: Add support for Amlogic
 A4 SoCs
Message-ID: <173081368066.3086220.14112409084743616798.robh@kernel.org>
References: <20241101-a4_pinctrl-v4-0-efd98edc3ad4@amlogic.com>
 <20241101-a4_pinctrl-v4-1-efd98edc3ad4@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241101-a4_pinctrl-v4-1-efd98edc3ad4@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_053445_168052_F36AD69E 
X-CRM114-Status: UNSURE (   9.02  )
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


On Fri, 01 Nov 2024 16:27:17 +0800, Xianwei Zhao wrote:
> Add the new compatible name for Amlogic A4 pin controller, and add
> a new dt-binding header file which document the GPIO bank names of
> all Amlogic subsequent SoCs.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>  .../bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml |  2 +
>  include/dt-bindings/gpio/amlogic-gpio.h            | 50 ++++++++++++++++++++++
>  2 files changed, 52 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


