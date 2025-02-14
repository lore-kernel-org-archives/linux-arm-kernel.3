Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D50D9C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 01:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7hExy0FLliF7/5KpbnNvgZT3zJtje/RlrmBG0QuhAfE=; b=XhtRAImZHTGIgHUohe+pnQWLzy
	djY6KlSs01/vqYErc4O/iROyfy3boVKlqN9zLJJcpV83w5wdOwEYOtwfhu3OoaNkZ9TOJkjB8dT7s
	SEeK+YSWE0ryq4d6Q9kQ4PcZEgThxyn3Eb/wse5kpwCudLLeXvwVQrv51nPIXhYXzAeHANWq3yFeR
	ms7RyMmU3FbHoiPKczi6RzBAeBXyLx75TdCxEwAueV5l1ABybpzwymPdUCvW82nB5+593BtGUkUkH
	IizDvozUKt8HZGzgWAb2shQ6jYV4TCFaA2dRbP/c6CVBNNH3AB5E55mlqxItgAhB3BwN1Y/OKuUTx
	340W3qQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tikOO-0000000DAq7-1VeK;
	Fri, 14 Feb 2025 01:21:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tikMx-0000000DAfP-2CdQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 01:19:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DEACF5C5CEF;
	Fri, 14 Feb 2025 01:19:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBC4EC4CED1;
	Fri, 14 Feb 2025 01:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739495990;
	bh=sfaPPZ9gP5kgndwhB/ECTbbp0IEu/QeHTgJVNdmuwy0=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=XiSQLD906pcu2WDC2EPROMCXXWeS6auijB21WC1/0APPV98P5nxNnepP2GpHUYEqM
	 nLtVUv3yqX9KjfSqpqyPfGJcmj4/pvaUMw4yj6uO4rS7pdtXBc2Uau8q14OTtrshAa
	 12MV0IwP/2ZdGYhbdIpHSiIIeQuv24gd2B8FKNklG97FBHf84pIvHRBhvFN6BLH6Ap
	 fsdeaHGb7rDR1qhVMoOwHbqH7IAZ84OtOlqUKaDlC8hDCJuV/64GnZvKhrGtFyPCUO
	 p88qN0HJ69LTcXjyAw9xvVP6lbdTLQGR5ZsHlo1N8bcuoKiuNkBrEBlZsl0x6SFD0E
	 UxlOKeUATTtHQ==
Date: Thu, 13 Feb 2025 19:19:48 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 Chen-Yu Tsai <wens@csie.org>, Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Samuel Holland <samuel@sholland.org>
To: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20250214003734.14944-7-andre.przywara@arm.com>
References: <20250214003734.14944-1-andre.przywara@arm.com>
 <20250214003734.14944-7-andre.przywara@arm.com>
Message-Id: <173949598874.895319.6861900349653451498.robh@kernel.org>
Subject: Re: [PATCH v2 6/8] dt-bindings: pinctrl: add compatible for
 Allwinner A523/T527
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_171951_707538_C5BF60D4 
X-CRM114-Status: GOOD (  16.38  )
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


On Fri, 14 Feb 2025 00:37:32 +0000, Andre Przywara wrote:
> The A523 contains a pin controller similar to previous SoCs, although
> using 10 GPIO banks (PortB-PortK), all of them being IRQ capable.
> With this SoC we introduce a new style of binding, where the pinmux values
> for each pin group are stored in the new "allwinner,pinmux" property in
> the DT node, instead of requiring every driver to store a mapping between
> the function names and the required pinmux.
> 
> Add a new binding file, since all the different variants of the old
> binding are making the file a bit unwieldy to handle already, and the new
> property would make the situation worse.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  .../allwinner,sun55i-a523-pinctrl.yaml        | 177 ++++++++++++++++++
>  1 file changed, 177 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.example.dts:24:18: fatal error: dt-bindings/clock/sun55i-a523-r-ccu.h: No such file or directory
   24 |         #include <dt-bindings/clock/sun55i-a523-r-ccu.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[2]: *** [scripts/Makefile.dtbs:131: Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1511: dt_binding_check] Error 2
make: *** [Makefile:251: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250214003734.14944-7-andre.przywara@arm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


