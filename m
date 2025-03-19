Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DB7CC35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 08:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vQdcc3y4A4mJSa0JAr2Tv0YIVinFiGymqWY0ivmqyy0=; b=I9w3Kih95dXeX/A2ESAg1n5GfJ
	gsV0dJSVTsmqVZylDOw1SqSrcvovoKH8dsM5WVWJ8dckRyM7PsvNXHZd4pCUIThUuVu8q0v6MNSoE
	6qgB8hV/YpqAKMjytlRfPnfhzpuc7/2T+6QZtmGMc2EPs4YqQpeAhK7oxa9f0KueOKsiy8vyKo54L
	9Lh+/iJSFm61U4iiL+ia7HrYxQT0Aul2sZ//nKCcay23XIIDgQ1JhPmT0s5JVGoEaQSDZFuXtGrnI
	2TXNEo4E40P3JOepOsYT9B6H1U/9T51uNao7bbKcmnm+gp49n4lUM02frRchtD4JIssoE6TGvvZns
	nHZkdnWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuozq-00000008NhH-34eT;
	Wed, 19 Mar 2025 08:41:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuowZ-00000008N7n-2Eol;
	Wed, 19 Mar 2025 08:38:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D3D5A5C5A5E;
	Wed, 19 Mar 2025 08:36:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F28FCC4CEE9;
	Wed, 19 Mar 2025 08:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742373510;
	bh=pMf/64E0I6+rFdDaTCFrvk/ro7kn43RkXMkXNOOl2KE=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Vl29zLb1ktQPGIFpaNCNSePzZ1tgJ5hKdd5I92dGYAvusEMf8SCjPdQgubq4Ms0t9
	 7SKID+5erdpQG2UtW90kjWUfnXo0vJDKavGDxGxR0hlAxI1Gn+dxBUfVhRALKaAKyg
	 Ot8ENmOEA63ZqhoPlid0lTt3Jr5qNoxH0bRgksNlTy24NAm3Hekae761xiCb0JjP+S
	 eQWRaEJ+T32XrfF59cyYkfJdyI0yYFxgL0wZx66chMPEg04AjlvTUpyoAMRQE+47tr
	 RPd6YRGhnY93+EsgNcdEdtRSZJZxBVEc17kWLzwP1mf24t+Ob98BRT3kfjItJnoe07
	 SmPwDMODRObEw==
Date: Wed, 19 Mar 2025 03:38:28 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: shuai.li@amlogic.com, devicetree@vger.kernel.org, 
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 linux-amlogic@lists.infradead.org, Takashi Iwai <tiwai@suse.com>, 
 linux-sound@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>, 
 linux-kernel@vger.kernel.org, zhe.wang@amlogic.com, 
 Jerome Brunet <jbrunet@baylibre.com>, Mark Brown <broonie@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, jian.xu@amlogic.com, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: jiebing chen <jiebing.chen@amlogic.com>
In-Reply-To: <20250319-audio_drvier-v4-1-686867fad719@amlogic.com>
References: <20250319-audio_drvier-v4-0-686867fad719@amlogic.com>
 <20250319-audio_drvier-v4-1-686867fad719@amlogic.com>
Message-Id: <174237350819.971004.1098115771430334211.robh@kernel.org>
Subject: Re: [PATCH v4 1/6] dt-bindings: clock: meson: Add audio power
 domain for s4 soc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_013831_635646_669DF1B8 
X-CRM114-Status: GOOD (  10.83  )
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


On Wed, 19 Mar 2025 15:04:44 +0800, jiebing chen wrote:
> Audio power domain found on S4 device.it need to enable before audio work.
> 
> Signed-off-by: jiebing chen <jiebing.chen@amlogic.com>
> ---
>  .../bindings/clock/amlogic,axg-audio-clkc.yaml       | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml:105:7: [warning] wrong indentation: expected 4 but found 6 (indentation)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.example.dtb: clock-controller@0: reg: [[0, 0, 0, 180]] is too short
	from schema $id: http://devicetree.org/schemas/clock/amlogic,axg-audio-clkc.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250319-audio_drvier-v4-1-686867fad719@amlogic.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


