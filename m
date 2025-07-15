Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5FF1C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 19:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D4Wu2Z2BqyeLXsNb9dBKbcMbvmQXFXIOZvdUQX7W/Co=; b=KfcjjbyAt5hWiqHIMWRZLsFwLc
	LIZzLC+R2L23ii3hnxpMWJbAVptDTC+Hed0z/GpgmUJtX8/UGWCHC2B/prNsn8jOm7GHlSjnUibWL
	QOa6tRU3oN6Q0SEPQfu3ITQVbOy4ui29IpomnDbf5h2x3xei02HjtU1Som4pW1c8u5M6aI8S51f1e
	lr6TSTAH0L89Hv+Yv6DKK0SIycKUStR94+luHYRiFU8PlDakacPn21SpQAUyVKkZH9AZtl7jRjAiW
	5KQyZVI1CJzJg+Ijm6CjKPo7m4Ijh7HavnJCYq4IGNbWOlptuDGm80RJA8VLf30famLGES0565m4+
	ZsZNQFFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubl78-00000005yFK-1Mwj;
	Tue, 15 Jul 2025 19:14:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubhmb-00000005d23-3nbm;
	Tue, 15 Jul 2025 15:41:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1672861456;
	Tue, 15 Jul 2025 15:41:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A394FC4CEE3;
	Tue, 15 Jul 2025 15:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752594088;
	bh=roilGmIfKYzXuFiRYwvO0+MCsCf6IWm8MYDEAQnmBAI=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=pQOsRPUg5Jz/V95mUCNaqMAGPHagKaUjLxLNXUM5i9JUT9YIRYP6qcjgRGo5pIsN1
	 UEoXjE0vMvamFXxvLqt7WOQ+KrSxj7B+TnxC9tZW3pmU2lxF5sraKFcgUhZg0d7Giq
	 tmOLwnn6G+cp6N34u9NXuiQWD9zzEZzXg9CjWROK4dC0Nvyquoxii02s40xSEQNGAQ
	 TsniATFy0bW+GdVcNAnHeHQfF0SjtWZr7+VblN7mLy0v9ZM0qD++W3xVJfDfqesI+P
	 wo9D+Nk1gb+xsaxDENYDspnGPmVXtpmK38zB5h1AtUXluAYclUGap7pdOHFr4yr1jB
	 Nppi7p1R+T7lg==
Date: Tue, 15 Jul 2025 10:41:27 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: broonie@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org, 
 conor+dt@kernel.org, linux-mediatek@lists.infradead.org, 
 lgirdwood@gmail.com, kernel@collabora.com, wenst@chromium.org, 
 linux-arm-kernel@lists.infradead.org, lee@kernel.org, 
 matthias.bgg@gmail.com, linux-kernel@vger.kernel.org
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250715140224.206329-4-angelogioacchino.delregno@collabora.com>
References: <20250715140224.206329-1-angelogioacchino.delregno@collabora.com>
 <20250715140224.206329-4-angelogioacchino.delregno@collabora.com>
Message-Id: <175259408592.1379929.8736544816494320074.robh@kernel.org>
Subject: Re: [PATCH v5 3/8] dt-bindings: regulator: Document MediaTek
 MT6363 PMIC Regulators
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


On Tue, 15 Jul 2025 16:02:19 +0200, AngeloGioacchino Del Regno wrote:
> Add bindings for the regulators found in the MediaTek MT6363 PMIC,
> usually found in board designs using the MT6991 Dimensity 9400 and
> on MT8196 Kompanio SoC for Chromebooks, along with the MT6316 and
> MT6373 PMICs.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../regulator/mediatek,mt6363-regulator.yaml  | 193 ++++++++++++++++++
>  1 file changed, 193 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6363-regulator.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/regulator/mediatek,mt6363-regulator.example.dts:27.21-22 syntax error
FATAL ERROR: Unable to parse input tree
make[2]: *** [scripts/Makefile.dtbs:131: Documentation/devicetree/bindings/regulator/mediatek,mt6363-regulator.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1525: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250715140224.206329-4-angelogioacchino.delregno@collabora.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


