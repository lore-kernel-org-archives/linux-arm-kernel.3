Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA008D41C16
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 08:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ueoR8TdbmL8xxceB5G/RaCNRI58NOglVFLsBHQAf7H4=; b=1I+hg16hjtRI3DSr964b6lH9gE
	oHBtOkxl2AlVNGdUG+Fdk/aJRQdw23hGMaGJylOOHEyzUpWdHg0igmfhDs5Bp2AC4KqIGlbk2IjL4
	JW4IuZP0iFyt39bcclef+CZYIqzNG4ob19JcZsYkQw4+clTjSqOu2BkTaSxbKUye7b6zQnJCz0s41
	X+f11EKWfQF+V7pEZ+C+7/NUDo+Tz4lqak7h4mLDbJzlkwVdfPmP4V5ZbV6sO0ETmoR6Myq6cxg7l
	Pyg/lmu4zdxBCIxlzATqpQEwPpRf393eXXwDDQ3vdKHw28SD7cJHLcB9oj2oqWw0+P+25SDknbfkW
	AjfobSWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tB8qZ-000000067I2-1mne;
	Wed, 13 Nov 2024 08:35:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tB8mW-000000066Ou-0qc0;
	Wed, 13 Nov 2024 08:31:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1EB415C5813;
	Wed, 13 Nov 2024 08:30:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E20D1C4CECD;
	Wed, 13 Nov 2024 08:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731486679;
	bh=l0aV/85UGh+TiyIXs15oLeWBBhnvktxy+Ao2xmqdPEU=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=u+IQMb7vc+ybZwRlOggvAhtm85ytDrq6c9zHkN2yooJE8m+gQFoEKPWK6I8MIclz+
	 d7RWYG1Nxf/xG0BZ9vP4/S/AvlDtGGou78bAL+EnYJhJcrZvhu6G7bMB4mgwrrVJJK
	 pTZzVkj0aGvVniYBG6ZSyPFmzmVn/WglUcnH/0XOz6/23zBCwePmbAky1VGfG7pQ6J
	 B1P2HH3O9oQnEIZjw/N5eFf7r+e1K50TzuvV97d6j3b45AMlX04PSydWmVMnc0wuP7
	 iofodvFB6X09burdwn1n9hqMs/Q18Z8TPQxb1nTATC4UESeq1YtkWoPKTz0qC/ko7J
	 Tdeg5o1J/8OJg==
Date: Wed, 13 Nov 2024 02:31:17 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Bartosz Golaszewski <brgl@bgdev.pl>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <20241113-a4_pinctrl-v6-2-35ba2401ee35@amlogic.com>
References: <20241113-a4_pinctrl-v6-0-35ba2401ee35@amlogic.com>
 <20241113-a4_pinctrl-v6-2-35ba2401ee35@amlogic.com>
Message-Id: <173148667535.3371357.17914251694384557561.robh@kernel.org>
Subject: Re: [PATCH v6 2/5] dt-bindings: pinctrl: Add support for Amlogic
 A4 SoCs
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_003120_427502_597B9CC1 
X-CRM114-Status: GOOD (  10.58  )
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


On Wed, 13 Nov 2024 15:29:40 +0800, Xianwei Zhao wrote:
> Add the dt-bindings for Amlogic A4 pin controller, and add a new
> dt-binding header file which document the GPIO bank names of all
> Amlogic subsequent SoCs.
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>  .../bindings/pinctrl/amlogic,meson-pinctrl-a4.yaml | 80 ++++++++++++++++++++++
>  include/dt-bindings/gpio/amlogic-gpio.h            | 45 ++++++++++++
>  2 files changed, 125 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a4.yaml: patternProperties:^bank@[0-9a-f]+$:properties: 'gpio-controller' is a dependency of '#gpio-cells'
	from schema $id: http://devicetree.org/meta-schemas/gpios.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241113-a4_pinctrl-v6-2-35ba2401ee35@amlogic.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


