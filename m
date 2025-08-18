Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21191CA0EF5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 17:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E1mlrjl72T8bZ/P+S5PF8eSASA9CtqmZPcZGhbebNpM=; b=I0SWcDxeFcDltFAlZz3o3dzNqA
	cZ05z86xNq8yPtYVlibwsUnHMi7lKN0MbywA1GY/6Lg0PM0/0XtN9EUzVJd2/AbgDe/FQ+rdRAnMx
	NlAKHnjkf0cviFfaocaGm8yu/HZLJddq/soxeVy3UoH8hi/DNxbsFH43lg4mY8WAwyhgXiSzZux6g
	23KQAYtTeJvRcBCrnonloBDLaDnCXl+o16LK5vTXbfIkD3ZE1GBq8Jo9Kjr5gL4qKmV9R3k+Ednws
	o+aJaGv9aTvYzlE4uan8lCR23YGBEKEwgoTw+eaiWzWYNRRGnWd2xTcHX7iZj3WHmCfFijQd3WzGj
	CQsHoEVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo3hE-000000088XJ-19sB;
	Mon, 18 Aug 2025 17:31:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo0yq-00000007m1B-0z3g;
	Mon, 18 Aug 2025 14:37:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 88E485C5E3C;
	Mon, 18 Aug 2025 14:36:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D2B9C4CEEB;
	Mon, 18 Aug 2025 14:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755527819;
	bh=MEuQmN6dB4qhRlM2ZjIWDLLN/sxc9sQMj976sd99t70=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=EZP1vKGnknr3Yr+gDnMlWUcDB3NILxB6yvh1iwapY4aQr6ySF0XyxO848RHHUMLZA
	 2zMA9sxRNwoFLFKNeav019tKJoKIt0tgP/68X5U2xz6G0s902fHaA6fhyU4WNEOb9D
	 uqudknUe86CdcMrlsp//Weao0bCfWr/r1TyThmjTBsP5VSFzyozlXTjRo7l54DeyOm
	 fsaJiJ20kh+Jt7B8F8SeKR1wtkSYF1siRVVxjVYhpziqxJtm+68jnlo2par0SLsX66
	 ncOgxmVGG2b59e0fqNTX1scyJK647YEm16Z8CiUkfPpDlyt1+JzF+OaXOtPVCpGL+i
	 O8t74L5VuoxyA==
Date: Mon, 18 Aug 2025 09:36:58 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, 
 Chaotian Jing <chaotian.jing@mediatek.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 linux-mmc@vger.kernel.org, Wenbin Mei <wenbin.mei@mediatek.com>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Mengqi Zhang <mengqi.zhang@mediatek.com>
In-Reply-To: <20250818114855.8637-1-mengqi.zhang@mediatek.com>
References: <20250818114855.8637-1-mengqi.zhang@mediatek.com>
Message-Id: <175552781678.1170160.15905675256206563540.robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: mmc: Add compatible for MT8189 SoC
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_073700_309637_8ADB9055 
X-CRM114-Status: GOOD (  10.36  )
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


On Mon, 18 Aug 2025 19:47:27 +0800, Mengqi Zhang wrote:
> Add a compatible string for the MT8189 SoC's mtk-sd mmc controllers.
> 
> Signed-off-by: Mengqi Zhang <mengqi.zhang@mediatek.com>
> ---
>  .../devicetree/bindings/mmc/mtk-sd.yaml       | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/mmc/mtk-sd.yaml:333:10: [warning] wrong indentation: expected 10 but found 9 (indentation)
./Documentation/devicetree/bindings/mmc/mtk-sd.yaml:334:13: [warning] wrong indentation: expected 11 but found 12 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250818114855.8637-1-mengqi.zhang@mediatek.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


