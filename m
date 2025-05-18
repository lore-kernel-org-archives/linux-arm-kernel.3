Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2C0DC3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 May 2025 07:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ip58NLkviUPod1JhaEY83D9bZunZIEqj2J9EbwOaOng=; b=qSouyAXh1XVx8eZoQdg+YoBtgg
	AXRJElWc5lKK84DSsiTkqMjEZukLp+WfpF/yWnYC+bfImMdhecG7QtprT2kGSE1OYCKmaFRTeOgqz
	i7Eq3z+WCAoIcQZNuap1qxw87UUYpYorbEgiNo+qionzIC7WDVSqWXcK9kaaOcStojjTs4T0WwGAv
	fSOB332RBR7FO0fi6QRb4GkLVWAJ61mV5rnBp9BPm0RHCqoyCT2nkQlUO8F4col7qNc0m+We/5IpZ
	EQB6pi5Q0IAcDL/olQRMtsX/MUp0SBBdJDHiJALbAhxIhU48PLSnbgC64vdkmXK4SCDtsCWxd2PHT
	Efx5ssDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGYRE-00000006qVK-39uq;
	Sun, 18 May 2025 07:28:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGYPD-00000006qK9-1WKO;
	Sun, 18 May 2025 07:25:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0A6A943CDC;
	Sun, 18 May 2025 07:25:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9831BC4CEE7;
	Sun, 18 May 2025 07:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747553153;
	bh=AWPQKMivdFQ6QmrVDoYacp12BqW2VCLe3IzFWlx64xM=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=kufke6ESM6tyRA28p3vAhIDHUrDl05myEbDuPao+H1K8lXInFo29/LfAFDFpjbTXM
	 9vxrqjlfrXgYq0NsclGRBqx0WqVUI9AUfTVdMU2Jjve1KXQia/V2qJ1KbmwYlRvz1w
	 BYUiy0CfbAFfCyQugZIC/pEFYruOs6oSiz1TLzlpExcAFvUSE9pDgOOfYMIfOGLIJD
	 TQtEHZjteF1OplCYJY5ie49vZ1VPcK6qDeiHan3dUyXmGXo5jKh9Bsz+hYOQBY2aPs
	 pHOtKynCxFfDeY6nqP5N7reSSZba9JhxWLqSvwU/jQMoP8mXApmhjNhkH5fZV87lf5
	 1O6qjBq4OcC4Q==
Date: Sun, 18 May 2025 02:25:52 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: David Airlie <airlied@gmail.com>, devicetree@vger.kernel.org, 
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Oded Gabbay <ogabbay@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Jonathan Corbet <corbet@lwn.net>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-rockchip@lists.infradead.org, 
 linux-doc@vger.kernel.org
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
In-Reply-To: <20250516-6-10-rocket-v3-1-7051ac9225db@tomeuvizoso.net>
References: <20250516-6-10-rocket-v3-0-7051ac9225db@tomeuvizoso.net>
 <20250516-6-10-rocket-v3-1-7051ac9225db@tomeuvizoso.net>
Message-ID: <174742024812.3649303.12389396177218408388.robh@kernel.org>
Subject: Re: [PATCH v3 01/10] dt-bindings: npu: rockchip,rknn: Add bindings
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250518_002555_577547_92882412 
X-CRM114-Status: GOOD (  12.85  )
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
Message-ID: <20250518072552.gLahObCphQL6Ym6k4rkJgcIl2CEyWmkaXTxRdS6thQ0@z>


On Fri, 16 May 2025 18:53:15 +0200, Tomeu Vizoso wrote:
> Add the bindings for the Neural Processing Unit IP from Rockchip.
> 
> v2:
> - Adapt to new node structure (one node per core, each with its own
>   IOMMU)
> - Several misc. fixes from Sebastian Reichel
> 
> v3:
> - Split register block in its constituent subblocks, and only require
>   the ones that the kernel would ever use (Nicolas Frattaroli)
> - Group supplies (Rob Herring)
> - Explain the way in which the top core is special (Rob Herring)
> 
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  .../bindings/npu/rockchip,rknn-core.yaml           | 162 +++++++++++++++++++++
>  1 file changed, 162 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/npu/rockchip,rknn-core.yaml: properties:reg-names: 'oneOf' conditional failed, one must be fixed:
	[{'const': 'pc'}, {'const': 'cna'}, {'const': 'core'}] is too long
	[{'const': 'pc'}, {'const': 'cna'}, {'const': 'core'}] is too short
	False schema does not allow 3
	1 was expected
	3 is greater than the maximum of 2
	hint: "minItems" is only needed if less than the "items" list length
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/npu/rockchip,rknn-core.example.dtb: npu-core@fdab0000 (rockchip,rk3588-rknn-core-top): compatible: 'oneOf' conditional failed, one must be fixed:
	['rockchip,rk3588-rknn-core-top', 'rockchip,rknn-core-top'] is too long
	'rockchip,rk3588-rknn-core-top' is not one of ['rockchip,rk3588-rknn-core']
	from schema $id: http://devicetree.org/schemas/npu/rockchip,rknn-core.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/npu/rockchip,rknn-core.example.dtb: npu-core@fdab0000 (rockchip,rk3588-rknn-core-top): reg: [[0, 4255842304, 0, 36864]] is too short
	from schema $id: http://devicetree.org/schemas/npu/rockchip,rknn-core.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/npu/rockchip,rknn-core.example.dtb: npu-core@fdac0000 (rockchip,rk3588-rknn-core): compatible: 'oneOf' conditional failed, one must be fixed:
	['rockchip,rk3588-rknn-core', 'rockchip,rknn-core'] is too long
	'rockchip,rk3588-rknn-core' is not one of ['rockchip,rk3588-rknn-core-top']
	from schema $id: http://devicetree.org/schemas/npu/rockchip,rknn-core.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/npu/rockchip,rknn-core.example.dtb: npu-core@fdac0000 (rockchip,rk3588-rknn-core): reg: [[0, 4255907840, 0, 36864]] is too short
	from schema $id: http://devicetree.org/schemas/npu/rockchip,rknn-core.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250516-6-10-rocket-v3-1-7051ac9225db@tomeuvizoso.net

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


