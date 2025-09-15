Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F33BCAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 13:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vzDc0ULyBDh5Qx7Lyn1+0nLb8/OrW6d4SR1qIKvzoMw=; b=mHUuZPifWyhEvsShMM+6EleWOH
	6rqP8Hs5ZKQqKRh9aI5W0ZfqDYLmzVujn0GsXh+2l8kJ3fA/nemjmk3s+ZiqULU/vpxYPxEhsEtKa
	CAEorX7rLAZ76oo19v8rs8n5g0gslqmjjJvjU9b59DbIqY2XgtpVX+lZVpdZdPWElCOJbQXlKCOqh
	NiN0ygPHOIF0PoOokyvHAM+FhUyqOxBAccmIeDdpPSEFNj8bFSv4T3yJfwkMYcmGi4dZjYr6f4Ku9
	R05hhoBqC02n/tLbHjDA68iLkTg6Jl30fv795cbZ+A8q6QoU17l46gskgPxkttmuwZ1cZYLbVGybL
	xUhsDj7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy99g-00000004IRM-2ZDi;
	Mon, 15 Sep 2025 13:22:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy99f-00000004IR4-2SRf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 13:22:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EC91C60244;
	Mon, 15 Sep 2025 13:22:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F0F2C4CEFB;
	Mon, 15 Sep 2025 13:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757942522;
	bh=omVHC2lwXuWYfBEc6TmKSITT2zhlG65jkMcTKudJYvA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=ElBQQ9KcNgtwr4NhGGUvtU3fqMuyETn+BzUs1uBvHuhGbf91zVGX1KOdeiYC21l2u
	 737981xXKNHJIsCD5pBgdyC4MTZ/YUTmLJYIqSu8hI9FJHNTQxO/D4cZreo+pDxQTC
	 0byr7EXAa+rYpJltKcE0f8ESi0hpZin/CoapjFC0c6MPY9JsDr+E4dVn5SzNzn4eI+
	 SJC1LIIGN6JpQhlmOaLXWV4Tx1LmFEyozXaO1oRe88rlMSggIPq3Jr55kjJBMf0786
	 FlLSd7gyRM3Aq14AHMFBLLfuV3/KS/D1J0gKbl7jvX4Ql4OpL2bKAnk381TswC26Rh
	 HHJ7oVKE1knLw==
Date: Mon, 15 Sep 2025 08:22:01 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandru Chimac <alexchimac@protonmail.com>, 
 Stephen Boyd <sboyd@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, 
 devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-samsung-soc@vger.kernel.org, 
 Michael Turquette <mturquette@baylibre.com>
To: Alexandru Chimac <alex@chimac.ro>
In-Reply-To: <20250915-exynos9610-clocks-v1-1-3f615022b178@chimac.ro>
References: <20250915-exynos9610-clocks-v1-0-3f615022b178@chimac.ro>
 <20250915-exynos9610-clocks-v1-1-3f615022b178@chimac.ro>
Message-Id: <175794237115.2496914.9134109163312001999.robh@kernel.org>
Subject: Re: [PATCH 1/8] dt-bindings: clock: samsung: Add Exynos9610 CMU
 bindings
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


On Sun, 14 Sep 2025 21:19:19 +0000, Alexandru Chimac wrote:
> This clock management unit has a topmost block (CMU_TOP)
> that generates top clocks for other blocks, alongside 20
> other blocks, out of which 11 are currently implemented.
> 
> Signed-off-by: Alexandru Chimac <alex@chimac.ro>
> ---
>  .../bindings/clock/samsung,exynos9610-clock.yaml   | 344 ++++++++++
>  include/dt-bindings/clock/samsung,exynos9610.h     | 720 +++++++++++++++++++++
>  2 files changed, 1064 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml:250:13: [warning] wrong indentation: expected 14 but found 12 (indentation)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/samsung,exynos9610-clock.yaml: $id: 'http://devicetree.org/schemas/clock/samsung,exynos9610-clock.yaml' does not match 'http://devicetree.org/schemas(/[^/ ]+)+\\.yaml#'
	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
Error: Documentation/devicetree/bindings/clock/samsung,exynos9610-clock.example.dts:25.13-14 syntax error
FATAL ERROR: Unable to parse input tree
make[2]: *** [scripts/Makefile.dtbs:131: Documentation/devicetree/bindings/clock/samsung,exynos9610-clock.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1527: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250915-exynos9610-clocks-v1-1-3f615022b178@chimac.ro

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


