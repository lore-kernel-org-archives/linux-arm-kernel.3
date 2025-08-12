Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E30ACA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 17:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QM/ExpRiQGiIvKcuq4d8ioQNq+y5f6GO8oNe3a6UauY=; b=NEwMhHEe62n+Y38N9LaIs9ro1a
	EG7Fu+27TrW/zSgc5eqUS8rAP5HIhXXDecRcshAS6CLCzK1jPc5G/zijPKQMkUO0tln/8xmZ0yt+V
	NlxzKnp7yeMPlxNEDRaj0+VF8NdIXwPBDB42G/PLiZL2Gp6JcIr3bXk320Cd4kSw6ZUKNY9A6IoOD
	FwQqUB/p29ET3te+nAL+WitCrKj5326xSh5kQfYqHy+l7jhDbzls5kHK47790oOXueQZkHxzLlPyY
	5YVwMzQUCLY4Nah42a2ZGIlIWWntR1c+B0dba65nQJP4jFvRD6zc0MeNovuAM3MXGBbCCkKX5uJOR
	p6Y/uSbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ultFp-0000000BetT-3U2D;
	Tue, 12 Aug 2025 17:57:45 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulq3S-0000000B4QM-3Q36
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 14:32:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0964CA57451;
	Tue, 12 Aug 2025 14:32:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8632BC4CEF0;
	Tue, 12 Aug 2025 14:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755009165;
	bh=fy2/TnxpQCa912cSSfOH0Jy+C/EZqNdGuJwRBGssE/M=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Aknfxh3m9XKnn6/bFwYil95p5Oh1ky5mRX2z9Y7vzkTKQ/AHKRCTvEQMHpmkXm+Tj
	 RVlRERrOzBPUqwUL+dGLwUyyrGgZbd9w4UcJkBgfk5a49SLvrgo4H0XliowoCGFGC6
	 DqFwhS0ArYrsVlaU+Q7LKT1LZIe9SqxuzePXerFg39PBZxbaxUayacfXEt2YotHuvP
	 zyUNCJ7tnCProE7MW2ExXNDMFfk/Wk33sz1iJ9srNdOuspXxEHc/XEZVMZfvInlCn4
	 Xzna/m5QVKMOsKJkfvT5T8PidCMkD8f/LXZaVBtG4cMl4TnVXcUbl+BSJ5LHxC7/EM
	 gnsNMKui+Xhew==
Date: Tue, 12 Aug 2025 09:32:44 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
 Qiang Zhao <qiang.zhao@nxp.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <0b56ef403a7c8d0f8305e847d68959a1037d365e.1754996033.git.christophe.leroy@csgroup.eu>
References: <cover.1754996033.git.christophe.leroy@csgroup.eu>
 <0b56ef403a7c8d0f8305e847d68959a1037d365e.1754996033.git.christophe.leroy@csgroup.eu>
Message-Id: <175500916432.3488674.1706766155168772227.robh@kernel.org>
Subject: Re: [PATCH 4/4] dt-bindings: soc: fsl: qe: Add an interrupt
 controller for QUICC Engine Ports
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_073246_980582_11DA735C 
X-CRM114-Status: GOOD (  14.83  )
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


On Tue, 12 Aug 2025 13:02:54 +0200, Christophe Leroy wrote:
> The QUICC Engine provides interrupts for a few I/O ports. This is
> handled via a separate interrupt ID and managed via a triplet of
> dedicated registers hosted by the SoC.
> 
> Implement an interrupt driver for it for that those IRQs can then
> be linked to the related GPIOs.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  .../soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml       | 63 +++++++++++++++++++
>  1 file changed, 63 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml:3:1: [error] missing document start "---" (document-start)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml: ignoring, error parsing file
Traceback (most recent call last):
  File "/usr/local/bin/dt-doc-validate", line 8, in <module>
    sys.exit(main())
             ^^^^^^
  File "/usr/local/lib/python3.11/dist-packages/dtschema/doc_validate.py", line 66, in main
    ret |= check_doc(f)
           ^^^^^^^^^^^^
  File "/usr/local/lib/python3.11/dist-packages/dtschema/doc_validate.py", line 22, in check_doc
    dtsch = dtschema.DTSchema(filename, line_numbers=line_number)
            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/lib/python3.11/dist-packages/dtschema/schema.py", line 83, in __init__
    id = schema['$id'].rstrip('#')
         ~~~~~~^^^^^^^
KeyError: '$id'
Error: Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.example.dts:34.3-35.1 syntax error
FATAL ERROR: Unable to parse input tree
make[2]: *** [scripts/Makefile.dtbs:132: Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1527: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/0b56ef403a7c8d0f8305e847d68959a1037d365e.1754996033.git.christophe.leroy@csgroup.eu

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


