Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 986F6E7719E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 07:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XoLXlMO/VGdt0FHU6arwEB/MyJqF/hQ/OGkNU78XyUE=; b=FXYkAw4baCmhBDO/OXFdiCeu2f
	c3AgPKs+lMUaVAZNsPlXNXDO53YnhsH527mXDz2wi2HMOdtUsrUZ4RvuJ30cvA6s9oQ1BcIfmkDnr
	T90VCP6rI1AIdOFCWNrgYgKLKL2Ma09pxpdMMXpp9DFCGxr/0hpXmbujenrzC6D/D4fL/cPOGDrMx
	BxNcXNjJwPWFE9kL7EGsENuDV6yAtJ0O4T7OKIDilCp/O/FN1pV5FVvC+ZL1iYnie7EdiL7HwtqBI
	GYyYhMECJQBZYcdfgRQQyce2uGVsiIrQ4Jpxv4P+tHASSe8s2WI83wWHa7TwZtwhJFtAIyMJJMSWJ
	I6BzmFsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXElA-00000004EaM-1y0M;
	Mon, 13 Jan 2025 07:21:16 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXEjv-00000004EKf-0AgC;
	Mon, 13 Jan 2025 07:20:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B0C035C4C98;
	Mon, 13 Jan 2025 07:19:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A9A8C4CED6;
	Mon, 13 Jan 2025 07:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736752797;
	bh=MYJh3nER0YHHitikyQndEMbpoJyhZPDW6g9Dil0vlRY=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=mjKFkpRjdNsXXJ5zthwnqTsDxtfOwux3uS6dTV9/A8lV3ByHLs7QPzZoG5eOX3XTu
	 Z9Y6yGThfI432tMiVYIueQY4bFTd1oy20h+H2JfbtijnbZom14Vzd9PoG9p+HObrH+
	 9iCFrUMlX5B8RSLX1xf+dtGPqjlK/NNjZjtmjShbqyj14xpNMwiLKjA9JdT4ucp919
	 asB5Q5Di+p3sPXIQ08Tf8telCIYOX1wkRg4Iqvhzmzl28rHR9ZATGve5/jmPTXItjZ
	 7ccTeP5T3pn2qLLwpSljNU4DSYOWTiFUyD7EwozyfUT+HrvoLTZ3kkBaTgI8KnFP/n
	 MppiBw38PetPw==
Date: Mon, 13 Jan 2025 01:19:56 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Kevin Hilman <khilman@baylibre.com>, 
 linux-sound@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, Mark Brown <broonie@kernel.org>, 
 Takashi Iwai <tiwai@suse.com>, devicetree@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>
To: jiebing chen <jiebing.chen@amlogic.com>
In-Reply-To: <20250113-audio_drvier-v1-1-8c14770f38a0@amlogic.com>
References: <20250113-audio_drvier-v1-0-8c14770f38a0@amlogic.com>
 <20250113-audio_drvier-v1-1-8c14770f38a0@amlogic.com>
Message-Id: <173675279619.745064.11661644624607210871.robh@kernel.org>
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: Add Amlogic S4 audio
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_231959_123553_3414D74F 
X-CRM114-Status: GOOD (  10.29  )
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


On Mon, 13 Jan 2025 14:35:13 +0800, jiebing chen wrote:
> Add documentation describing the Amlogic S4 TDM output pad and toacodec.
> 
> Signed-off-by: jiebing chen <jiebing.chen@amlogic.com>
> ---
>  .../bindings/sound/amlogic,s4-tdmout-pad.yaml      | 36 ++++++++++++++++++
>  .../bindings/sound/amlogic,s4-tocodec.yaml         | 44 ++++++++++++++++++++++
>  2 files changed, 80 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/sound/amlogic,s4-tocodec.example.dts:23.35-36 syntax error
FATAL ERROR: Unable to parse input tree
make[2]: *** [scripts/Makefile.dtbs:131: Documentation/devicetree/bindings/sound/amlogic,s4-tocodec.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1506: dt_binding_check] Error 2
make: *** [Makefile:251: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250113-audio_drvier-v1-1-8c14770f38a0@amlogic.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


