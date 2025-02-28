Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BFE6C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 21:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wUdOWF50UnCLN/7LhkV9zeXV+rJ9kVxZq5USrqENckA=; b=juWCS86pyM0latOyDErLOCzQp1
	jCa8Xh07DKa7UL2KBzuPGjRsxgGioquFkiYpLftutIHmcpWUhyuIaC/irmcls/TytL2ovyh6p/pSF
	6b8iAWp7o9hcj2TKuu+LpgzIysafHUtf8x1B6NYPXxSv+XxNrJkk1dNgk31cqLvOTsWTinHUFMaM7
	taoPWt8aWETx+vMkEZNGKGauIrgZwjHMhk6Ni1ENQ8HnK8ALoRkG9Je9p8syXv/M4xikfEmYsnk5u
	8KanY0RKL3gjzEDcpFuelfbROFnKmEAM5zjMh7rduxRGvdynEmR0y+CEiLqYZd1pWwpynRsgbet3Q
	oxwVZy6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to7ka-0000000CiMo-3Xi6;
	Fri, 28 Feb 2025 21:18:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to7gf-0000000ChKK-1JQl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 21:14:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 27CC56114A;
	Fri, 28 Feb 2025 21:14:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F231AC4CED6;
	Fri, 28 Feb 2025 21:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740777264;
	bh=0/d4OULk9b8bh2/XYAQGNaFdkygRUUKBHCtphcPEouU=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=IDooDC2GnM+FW4Sd9a2yMSXvf3X3VfdVim4Id0vVn0lZzhyHJwyVwydMvzPLmCJXt
	 UvbpBAi7gHsuxgoh/rxiC7ubIW/dfAygFkk59espEY08Jmlwhzj4LU5pQLboX++SQo
	 WJKNTMQOwwSMmmRb6lRP0NPcidy/JpxMB5f5508fFcZQamzILX5vz5zdnEZd0nozNW
	 Bkm4M1jVbhBYDrcOhnDUiTVIhBneqVzPPte3sNu6U+zUI2yDgBc5zfrgoWKMx9Tz0v
	 1Z5kzfPnrhSbMg0nDbDMObkWQVEgIaXcCKXnjM4UbCI56CF/egLKhDLrV6Trg7BgrN
	 GBvatut05mWxQ==
Date: Fri, 28 Feb 2025 15:14:21 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-clk@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-samsung-soc@vger.kernel.org, 
 Chanwoo Choi <cw00.choi@samsung.com>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
In-Reply-To: <20250301-exynos7870-pmu-clocks-v4-1-0f3e73b10db7@disroot.org>
References: <20250301-exynos7870-pmu-clocks-v4-0-0f3e73b10db7@disroot.org>
 <20250301-exynos7870-pmu-clocks-v4-1-0f3e73b10db7@disroot.org>
Message-Id: <174077726185.3730179.16075411217823279787.robh@kernel.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: clock: add clock definitions and
 documentation for exynos7870 CMU
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


On Sat, 01 Mar 2025 01:08:15 +0530, Kaustabh Chakraborty wrote:
> Add unique identifiers for exynos7870 clocks for every bank. It adds all
> clocks of CMU_MIF, CMU_DISPAUD, CMU_G3D, CMU_ISP, CMU_MFCMSCL, and
> CMU_PERI. Document the devicetree bindings as well.
> 
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  .../bindings/clock/samsung,exynos7870-cmu.yaml     | 227 +++++++++++++++
>  include/dt-bindings/clock/samsung,exynos7870-cmu.h | 324 +++++++++++++++++++++
>  2 files changed, 551 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/samsung,exynos7870-cmu.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
 	 $id: http://devicetree.org/schemas/clock/samsung,exynos7870-clock.yaml
 	file: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/samsung,exynos7870-cmu.yaml
Documentation/devicetree/bindings/clock/samsung,exynos7870-cmu.example.dts:18:18: fatal error: dt-bindings/clock/exynos7870.h: No such file or directory
   18 |         #include <dt-bindings/clock/exynos7870.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[2]: *** [scripts/Makefile.dtbs:131: Documentation/devicetree/bindings/clock/samsung,exynos7870-cmu.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1511: dt_binding_check] Error 2
make: *** [Makefile:251: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250301-exynos7870-pmu-clocks-v4-1-0f3e73b10db7@disroot.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


