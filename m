Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4143DC02196
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 09:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uhK0WSdvHMp787ndCJSk4Ea1XSz2JS//VsKMpAoKLlA=; b=qTXmc2W+MP8Jww6EOrZrZiwkxc
	Pdhy7rWwgWgPE5OuLu68WIEbptdd63Fq8JzsmBpC97gfUkaY2Qg9NziTHI6mlXnbEGMqAO5WZ8R6X
	sDh2M6w8Ff5ClMIj64fxo4zQB7Uunt6MNtnbnJloDF51x9TWWJUHwDO7oc4PJqG6XhMmISvtgNQ2c
	BH2zVEAROjOEpj1zev81MBlydWWejFNLHYb9PbE0T4+sgT1btgAG8EeG7VjMv1bpjCyzyNVhbjBb4
	Kx1Rk4nlFXbkjmaqYa/fKomeG4HDCmTimFw03k3FdtIbqVK3yEtzI/cQA4wB02Pex5KbUkjMyVM9k
	QYCXAwPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgKdS-0000000919W-3F8x;
	Fri, 07 Feb 2025 09:26:54 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgKc4-000000090to-33Ya
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 09:25:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AB71BA4271C;
	Fri,  7 Feb 2025 09:23:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFF92C4CED1;
	Fri,  7 Feb 2025 09:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738920327;
	bh=kF7bqOfEPUr/1NjhgrCLEjkTuw9hFLco2ae4W2t7H38=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=FoDA4+SMwU8LqI5xPUcyA5YFPx2OWZI08q3Zegddu0PgzHiWdxO7CWWhvxNWYlxfO
	 dxkAoFvD3RWtPpsGuE01QUligb3BkydtmaoZ9r1m5GRHlXSAJnM1aGUM14/0YtftKv
	 YJFXuGPrXlqL1jF+R4A2SGhThekSSY8+H3DM6AGpVU1h45nmQBol/xtwKLYmpy3MMa
	 2rkC6jrFEvTH+QIqLb0TYStvohRDuUiYMwg+IrXXdCfeK5ehqdwQvzUndv4t1wpGwO
	 ocRFK/Zdt2lU4sEVLCsY7bAd8mMJc7XDY973225MKpI4xz01Cpu/vxcuqwWCuwqdCp
	 jl/ifOtnDArsQ==
Date: Fri, 07 Feb 2025 03:25:25 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-media@vger.kernel.org, conor+dt@kernel.org, 
 devicetree@vger.kernel.org, krzk+dt@kernel.org, eajames@linux.ibm.com, 
 mchehab@kernel.org, andrew@aj.id.au, openbmc@lists.ozlabs.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, joel@jms.id.au, 
 linux-arm-kernel@lists.infradead.org
To: Jammy Huang <jammy_huang@aspeedtech.com>
In-Reply-To: <20250207082351.1298990-1-jammy_huang@aspeedtech.com>
References: <20250207082351.1298990-1-jammy_huang@aspeedtech.com>
Message-Id: <173892032595.3714424.13095199531321692299.robh@kernel.org>
Subject: Re: [PATCH v3] media: dt-bindings: aspeed,video-engine: Convert to
 json schema
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_012528_894712_61C855CD 
X-CRM114-Status: GOOD (  14.80  )
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


On Fri, 07 Feb 2025 16:23:51 +0800, Jammy Huang wrote:
> Convert aspeed-video.txt to yaml format.
> Update aspeed-video.txt to aspeed,video-engine.yaml in MAINTAINER file.
> 
> Additional changes:
> - Two phandle properties, 'aspeed,scu' and 'aspeed,gfx', are added for
>   video engine to capture video from sources other than VGA.
> - Update examples and include appropriate file directives to resolve
>   errors identified by `dt_binding_check` and `dtbs_check`.
> 
> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
> ---
>  v3:
>   - Add Additional changes into comments.
>   - Remove | after phandle description
> 
>  v2:
>   - Update patch subject
>   - Add NOTE for false positive warning
> ---
>  .../bindings/media/aspeed,video-engine.yaml   | 84 +++++++++++++++++++
>  .../bindings/media/aspeed-video.txt           | 33 --------
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 85 insertions(+), 34 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/aspeed,video-engine.yaml
>  delete mode 100644 Documentation/devicetree/bindings/media/aspeed-video.txt
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/media/aspeed,video-engine.yaml:44:55: [error] syntax error: mapping values are not allowed here (syntax)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/aspeed,video-engine.yaml: ignoring, error parsing file
./Documentation/devicetree/bindings/media/aspeed,video-engine.yaml:44:55: mapping values are not allowed in this context
make[2]: *** Deleting file 'Documentation/devicetree/bindings/media/aspeed,video-engine.example.dts'
Documentation/devicetree/bindings/media/aspeed,video-engine.yaml:44:55: mapping values are not allowed in this context
make[2]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/media/aspeed,video-engine.example.dts] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1511: dt_binding_check] Error 2
make: *** [Makefile:251: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250207082351.1298990-1-jammy_huang@aspeedtech.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


