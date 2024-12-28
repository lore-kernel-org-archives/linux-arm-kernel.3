Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 163BDE7718F
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Dec 2024 14:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uQUr6CdBfkevt6FQxfyqbLFqBaSK95LKCyrCZKO06l4=; b=aAITD7C9FmPXxhthiU58Rfh+Cm
	EjxetVs7gTTXiUgc6d6eVv/TXYSdWY75fyVDqbHJ6lm56ocZ10T5ycDN4r2FxRCwYqACW6LgVIvFI
	pIBOFAElN9CzLhBsJQgRdq5os24KP8ivafvxoXnU7qiODLVRD/KFq/eEggQjfC66s8cAaX3fUsJ0K
	oNIlJCkJStMmsCpFby8+QroCC47xXn+jRe1hVT16WsC9Tz0pZQ99Upd3nSZo7ycPhWS0OsyvPYu7d
	7L1Ln7LFtoXn0PzJU+Z4pvp0YDEFqMhRZX/76LcwSD3wDdJ7KqNfBqQZx0rIizteg7TSgwMMmWB4E
	0yt7YAEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRXWJ-00000001ybL-1A5k;
	Sat, 28 Dec 2024 14:10:23 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRXV6-00000001yTx-2Uot;
	Sat, 28 Dec 2024 14:09:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 97B08A401AC;
	Sat, 28 Dec 2024 14:07:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99235C4CECD;
	Sat, 28 Dec 2024 14:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735394947;
	bh=Dkf6FNbmvczR6fwjr8TMuN/izWdItAgYtjp2h3zBUiU=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=NkUtz/tztIW/PhXP2LF3lMOFGClVFeWa5CrOwlzULAlP5973gEksD+7QteiFALTfX
	 VSrG2ZV1ClfYJDpFKZ/XSzsPFm2GjtPLNXHsKUVmZkcoWAnQBhLqH4L1djr6ivwuzQ
	 CC6JmtEo318beq4yK6HdKuaJ9UuwZpRwaEa96mxruNafNt1TqwFjEW/m7G75atqVpD
	 TnbkkQCn+Sx7zNmI/vIDziT47eiZN+iW/fsCXv6NlpeB2jmRfGWJyA9Ktj38jF2evD
	 aG0lOQ5LaKRaEoQT2DEchPI/mGcC+gG6q7Ee9tX+OGlrm9jeH73dwV2T65TrWBCRmL
	 ICN4mGxILIv4Q==
Date: Sat, 28 Dec 2024 08:09:05 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: vkoul@kernel.org, linux-phy@lists.infradead.org, 
 cristian.ciocaltea@collabora.com, Andy Yan <andy.yan@rock-chips.com>, 
 joro@8bytes.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, heiko@sntech.de, 
 dri-devel@lists.freedesktop.org, cl@rock-chips.com, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 detlev.casanova@collabora.com, hjc@rock-chips.com, krzk+dt@kernel.org
To: Andy Yan <andyshrk@163.com>
In-Reply-To: <20241228122155.646957-6-andyshrk@163.com>
References: <20241228122155.646957-1-andyshrk@163.com>
 <20241228122155.646957-6-andyshrk@163.com>
Message-Id: <173539494517.1967895.2732995549466236200.robh@kernel.org>
Subject: Re: [PATCH v2 5/8] dt-bindings: display: vop2: Add rk3576 support
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241228_060908_705501_97C4A5E9 
X-CRM114-Status: GOOD (  12.80  )
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


On Sat, 28 Dec 2024 20:21:48 +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> Add vop found on rk3576, the main difference between rk3576 and the
> previous vop is that each VP has its own interrupt line.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> 
> ---
> 
> Changes in v2:
> - describe constraint SOC by SOC, as interrupts of rk3576 is very
>   different from others
> - Drop Krzysztof's Reviewed-by, as this version changed a lot.
> 
> Changes in v1:
> - ordered by soc name
> - Add description for newly added interrupt
> 
>  .../display/rockchip/rockchip-vop2.yaml       | 70 +++++++++++++++----
>  1 file changed, 56 insertions(+), 14 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml: properties:interrupts: {'minItems': 1, 'maxItems': 4, 'items': [{'description': 'vop system interrupt, such as bus error, and vsync for vop version under rk3576.'}, {'description': 'independent interrupts for each video port, such as vsync and other video port related error interrupts.'}]} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241228122155.646957-6-andyshrk@163.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


