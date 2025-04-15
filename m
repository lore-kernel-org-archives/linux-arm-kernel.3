Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE2C5C369B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 04:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sDXKH4sjzdjBlh5p6z0x4t5XcSSkZa1HbrCX4WrfKgk=; b=1hC0ME3WseZHqA2vWXj9hKYCOJ
	paASbYKbPoHzzpFe/OyBwa+PqTB54SLjIAgLK2sBzOODtDj6kHL2J7g/6gwa3xhrtFmwsBylNNyW0
	YfGJlgNzYcAEn8twr9A44bVfqNk67K+RZCdqzSoDIe4lms+h6hFeUVa0SAiWtqTkuTLviAzvmUsIb
	ijRehP4W9Hd7m+wzuxc2GjrYlWj1hTT+buwv6xcJe82eSu+zAaEMUhaCuDCVStWNP3HPYFLgC055b
	dCjaHD8ClqAhz6MapeL/7uNyCxF/uX6AB/NNJYp2amtCj8m3oTaF54O+MdhwcDlZerjJuTE6zjWYh
	RA4Ns6JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Xyw-00000004RhO-22J5;
	Tue, 15 Apr 2025 04:33:10 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Xx4-00000004RUz-1q84;
	Tue, 15 Apr 2025 04:31:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2B25EA4116A;
	Tue, 15 Apr 2025 04:25:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD9C5C4CEDD;
	Tue, 15 Apr 2025 04:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744691472;
	bh=QPgVVKuU1xj//lpxR3vKuQSHeE3ZGj5RVnWlnXSdGpM=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Frp36u5+K94T2+XAXJtNTV0SuENecU+W9JPeS0AqcLevLFtMEFhZ3nL//VYEPV2AM
	 TMph+9J3LseE8S/djkN2cVjPZPJ2M1dQJ3C+p8AgzS88F4/sJJi/ArOqaS056dVnQ9
	 JsrYvfgzetQ0IgFJKA7vwstnzf5xfMULKjFgeWxFGj0FQ7u77qTqQBh8Pwo9cdGEnR
	 Hsuq7wlbwiEDZNVjtzuKcpUNY9WhPEP7mxeyD688pOViQRom4ROlzcJ3+ptHere9kS
	 i4IEKO5aYEEe8A2vzMOkjfUa5BERhpkGfgjBXKDGKfGkLJ2H9biPfCfYsDz32Dv02S
	 8CllWWqY9PuRQ==
Date: Mon, 14 Apr 2025 23:31:11 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org, 
 Conor Dooley <conor+dt@kernel.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <20250415-clk-measure-v3-2-9b8551dd33b4@amlogic.com>
References: <20250415-clk-measure-v3-0-9b8551dd33b4@amlogic.com>
 <20250415-clk-measure-v3-2-9b8551dd33b4@amlogic.com>
Message-Id: <174469147098.2812651.9702380390890809479.robh@kernel.org>
Subject: Re: [PATCH v3 2/7] dt-bindings: soc: amlogic: C3 supports
 clk-measure
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_213114_542261_6B633743 
X-CRM114-Status: GOOD (  10.08  )
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


On Tue, 15 Apr 2025 10:45:25 +0800, Chuan Liu wrote:
> C3 adds support for clk-measure.
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> ---
>  .../devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml    | 1 +
>  1 file changed, 1 insertion(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/fsl/fsl,ls1028a-reset.yaml: maintainers:0: 'Frank Li' does not match '@'
	from schema $id: http://devicetree.org/meta-schemas/base.yaml#

doc reference errors (make refcheckdocs):
Documentation/userspace-api/netlink/netlink-raw.rst: :doc:`rt_link<../../networking/netlink_spec/rt_link>`
Warning: Documentation/arch/powerpc/cxl.rst references a file that doesn't exist: Documentation/ABI/testing/sysfs-class-cxl
Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
Warning: lib/Kconfig.debug references a file that doesn't exist: Documentation/dev-tools/fault-injection/fault-injection.rst
Documentation/userspace-api/netlink/netlink-raw.rst: :doc:`rt_link<../../networking/netlink_spec/rt_link>`
Documentation/arch/powerpc/cxl.rst: Documentation/ABI/testing/sysfs-class-cxl
MAINTAINERS: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
lib/Kconfig.debug: Documentation/dev-tools/fault-injection/fault-injection.rst

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250415-clk-measure-v3-2-9b8551dd33b4@amlogic.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


