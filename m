Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08752C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 14:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mkNHEfPynSYqOiDoUBIl37I23OpQnLXnYHWP/Oo5DvA=; b=d4Zj27veYMHayoC/L5Wkw2pkSO
	DnL+USlgcmKTusfoATQVZ0Lsd2qpm4LD7MS1NM4SsgpwX7e6ugHTyKBfQ0SMQS+FjzOPkiYFj6fzP
	nhhnG59OUTkTs/NGoJ2djEN7qKQgj/Rkhz+Kcoh2kT6juQCXbvdGGeSB+3nY9SFsBMMZXcyihm/wl
	BMHNDI+QVTmBLQxy6IGdR+YbkmqNbJ/wT8wlUN0tFBOgE0+Dz4+f5i2x7vnzkGvJEhfXQQ6SBMAGu
	j6EKdFnjVPQF7vSdwysjGYaFeqe/L1isal3W6l4jq+9JbnaNhy2ze4SGhygxlQ7TJd2P6d0E9L9cc
	OEc/XDSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqYp0-0000000ETdG-1ZS8;
	Fri, 07 Mar 2025 14:37:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqYnN-0000000ETS8-24Ol;
	Fri, 07 Mar 2025 14:35:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CFE2D5C59D1;
	Fri,  7 Mar 2025 14:33:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B17EC4CED1;
	Fri,  7 Mar 2025 14:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741358124;
	bh=mSYF5jWdr2DmPy1tLsGF7JnDLa4fBSeg5OOTSDPYIGY=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=FwlDu4Nq5poNzIQ0wTx6obM39typS2Mem5/PONWfpx/qbODRlaAqh8t2UMPtpqvfk
	 b+MiaqJqmzVAz4Uh41I4rqaNfAcLJtPWk5jmW/ygNcQF3Oc54joll+Bbre8NQPpFKq
	 css+kMJGFAeDkCcaCZaK/tooY0+J5vYp8SLwMQDIGsFi4pXA6x/CyVy9ckmnZ60FS6
	 GTm3FLbVIIO36xRFTfoAR1SESbAsOTPIvQDY/EfGu3Sm4XZuVAjFu2PG+KRuz/QvDX
	 9iLz0ba79rbpEu9N3MiWr1YVz9O4jCmjFA7sYLvL28dl0+A2KN35GoYO8xvjT1xIpj
	 ZWMzGMGJ50PDQ==
Date: Fri, 07 Mar 2025 08:35:22 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Linus Walleij <linus.walleij@linaro.org>, Takashi Iwai <tiwai@suse.com>, 
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, Bartosz Golaszewski <brgl@bgdev.pl>, 
 linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, 
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: "Darren.Ye" <darren.ye@mediatek.com>
In-Reply-To: <20250307124841.23777-13-darren.ye@mediatek.com>
References: <20250307124841.23777-1-darren.ye@mediatek.com>
 <20250307124841.23777-13-darren.ye@mediatek.com>
Message-Id: <174135812164.4140447.14223699212791655529.robh@kernel.org>
Subject: Re: [PATCH 12/14] dt-bindings: mediatek: mt8196: add audio AFE
 document
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_063525_573462_27C56675 
X-CRM114-Status: GOOD (  12.11  )
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


On Fri, 07 Mar 2025 20:47:38 +0800, Darren.Ye wrote:
> From: Darren Ye <darren.ye@mediatek.com>
> 
> Add mt8196 audio AFE document.
> 
> Signed-off-by: Darren Ye <darren.ye@mediatek.com>
> ---
>  .../bindings/sound/mediatek,mt8196-afe.yaml   | 259 ++++++++++++++++++
>  1 file changed, 259 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt8196-afe.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/sound/mediatek,mt8196-afe.example.dts:24:18: fatal error: dt-bindings/clock/mt8196-clk.h: No such file or directory
   24 |         #include <dt-bindings/clock/mt8196-clk.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[2]: *** [scripts/Makefile.dtbs:131: Documentation/devicetree/bindings/sound/mediatek,mt8196-afe.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1511: dt_binding_check] Error 2
make: *** [Makefile:251: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250307124841.23777-13-darren.ye@mediatek.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


