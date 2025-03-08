Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 393EDC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 20:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=65cVK3sXuEvZG8v+zntkMOy6aAO3VgNBqRrndPPjSjc=; b=jKtP8UrC7YT2wgrRW0BVZcpK+t
	MiD9rbdt/P9P+H2XQNH7vHKnJab8S4M7x1g/zYkjXzTb9ClUla2r/fdHT00LHUc8tr/cOeUeUydpC
	AhyrfNbISOSzDzdLuy9bTjhlBgO0o3F0ihfJf8OoZyqo6Eu/2f54gzfXAJSV6g9OIhh79z4a+y7m7
	WP39Fn/u/dWgepE+z6H4PmksXW14ZxCZc/dKzJV6pe/hnH0puGlSkWMn8vPjb5RYYZumupv9K7HxK
	kHL8cdpiJV7na+J0C7Q3zCL9+0pSzcqidP1h9aUzYenbkXr+lS4lKMUCN8ecr4z/wYN76Npo824mB
	GnXY3q3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tr15p-0000000HAsF-3pJq;
	Sat, 08 Mar 2025 20:48:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tr12c-0000000HAbZ-1aoh
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Mar 2025 20:45:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CA5585C0A25;
	Sat,  8 Mar 2025 20:42:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2458CC4CEE0;
	Sat,  8 Mar 2025 20:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741466701;
	bh=10nSWWi5MGce0BH+GQkLNo0/x4b1dtShGmGc6K9YmIY=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Kz1LBSgrogv+lhsn7L7DdYBf6ZHwHChsXvgRU+mU6ABQDwN9mDk8O0mvvImrQfxA3
	 +6cJoz5rO/+wVrrqWjG+CMsxuxz7PIKH+Habq2cisTL/QpOcjfCJmolFfR62CGiIUf
	 Jcvd9uykI4kWXvDLSgcD4uSC9YlpPCBPq0wtPBt93UIxRBCqbxGRn18MahlajdRYz2
	 JtIts04s1WUZ7r3BxY1lnOV9mlm3OD29pY7V4AaPgIiO/2c+IoOchKcXVvc3pP8SVx
	 GZ9HsT6YFxXfc1f481f1IXCoEPi2G+pq4FoiOAxg91rko91KYb6ayRgXSws+ijHsIk
	 HgvPceEkU+wXA==
Date: Sat, 08 Mar 2025 14:44:59 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Heiko Stuebner <heiko@sntech.de>, Dan Carpenter <dan.carpenter@linaro.org>, 
 Cosmin Tanislav <cosmin.tanislav@analog.com>, linux-kernel@vger.kernel.org, 
 Ross Burton <ross.burton@arm.com>, Ricardo Ribalda <ribalda@chromium.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Will Deacon <will@kernel.org>, 
 Bjorn Andersson <quic_bjorande@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, 
 Javier Carrasco <javier.carrasco@wolfvision.net>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Julien Massot <julien.massot@collabora.com>, linux-gpio@vger.kernel.org, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Eric Biggers <ebiggers@google.com>, Conor Dooley <conor+dt@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Ihor Matushchak <ihor.matushchak@foobox.net>, 
 Taniya Das <quic_tdas@quicinc.com>, Mark Brown <broonie@kernel.org>, 
 devicetree@vger.kernel.org, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 =?utf-8?q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>, 
 linux-staging@lists.linux.dev, Biju Das <biju.das.jz@bp.renesas.com>, 
 linux-media@vger.kernel.org, Tommaso Merciai <tomm.merciai@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
 Umang Jain <umang.jain@ideasonboard.com>, 
 Dongcheng Yan <dongcheng.yan@intel.com>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Zhi Mao <zhi.mao@mediatek.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Hans Verkuil <hverkuil@xs4all.nl>
To: Cosmin Tanislav <demonsingur@gmail.com>
In-Reply-To: <20250308183410.3013996-10-demonsingur@gmail.com>
References: <20250308183410.3013996-1-demonsingur@gmail.com>
 <20250308183410.3013996-10-demonsingur@gmail.com>
Message-Id: <174146669769.3550313.9537741171612632999.robh@kernel.org>
Subject: Re: [RFC PATCH 09/24] dt-bindings: media: i2c: max96714: make
 i2c-gate conditional on compatible
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_124502_504458_01F14EDE 
X-CRM114-Status: GOOD (  13.38  )
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


On Sat, 08 Mar 2025 20:33:38 +0200, Cosmin Tanislav wrote:
> Devices to be added in following patches don't use I2C gate.
> 
> Make this property conditional on the compatible strings.
> 
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> ---
>  .../bindings/media/i2c/maxim,max96714.yaml    | 21 ++++++++++++-------
>  1 file changed, 13 insertions(+), 8 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/maxim,max96714.example.dtb: deserializer@28: 'i2c-gate' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/media/i2c/maxim,max96714.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250308183410.3013996-10-demonsingur@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


