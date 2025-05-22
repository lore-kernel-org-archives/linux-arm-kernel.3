Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F0ECC54E65
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 09:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cy8bRhmyQJ/d7eu1Zb2F778XWoW2ZdMdqGCMHnEhRo0=; b=TPYRrOe3w8gUkSr+056U15U7MH
	gfFJIMbnPCHMJ+smy8mdqovLD4ABKrgST9wM9sk+88WHTbbDe/NHuZy2SdpOd0M/GNNdbZssC31PO
	rEJ3VcUXIG9MRHkBPJc6NGfEgIv4YxjA8hmrjL8V5vWo5zkU56O4hIEUVwL83LSaVhcRbB5e7Cu9X
	W7XhBwiFuw/qxIrl3qF+Pv1P8KElzw6sXfmKfsFcNRFJCt8c4nnRvpmOh/Bo8S7Gv+nKNNt/MCOyZ
	0OS23/Wysl3s+sJJa8BAu+b9Hhc2d+K2uYKFuKMhU3MHJVXP/RPNo1HlWfCu1CAYJQNZC/Qz9jjsY
	UreqKt0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI2DQ-00000000UuQ-3nCw;
	Thu, 22 May 2025 09:27:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI2BL-00000000UZx-2oUj;
	Thu, 22 May 2025 09:25:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9A4E45C57A5;
	Thu, 22 May 2025 09:23:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34187C4CEE4;
	Thu, 22 May 2025 09:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747905942;
	bh=p53SfCe7muDgtvQFHMIVqvkowaeuQ3Tx7It7jszYKD4=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=CO9mh0dYYJ6S4syWXHaQCopevlhaqGAYO5iqcLaWHMlY00lVp9y+W4/oG4MnnBP4/
	 tr+s3pHewoNQEBg1NNcnx3voyBJHMTfpOzB+48AgrF4gMYvM/+/dkDnqj9oUDN6D4+
	 Cd1x7EZ8bzOpZvmQVk0+QhRzIyf2h+4mYCnu/ILvzt4ucD1XT6EMrpItDesYc8MZrK
	 3xeM2zdbF2zBeiW6drS2KAe8uMiwbLrK55SzE6/qzNQeC23AFvjE3Vd1i1wV0BdXHA
	 yiO+mEI+J3ejMfzo58Vj+tJb1V7ynQZO1dCjTIzeK1T7CB6Hp/OQcJAxodLqFZjjkn
	 P35doFcmKnAvw==
Date: Thu, 22 May 2025 04:25:40 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, krzk+dt@kernel.org, cl@rock-chips.com, 
 mkl@pengutronix.de, conor+dt@kernel.org, linux-can@vger.kernel.org, 
 mailhol.vincent@wanadoo.fr, kever.yang@rock-chips.com, 
 kernel@pengutronix.de, linux-rockchip@lists.infradead.org, heiko@sntech.de, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
To: Elaine Zhang <zhangqing@rock-chips.com>
In-Reply-To: <20250522074616.3115348-2-zhangqing@rock-chips.com>
References: <20250522074616.3115348-1-zhangqing@rock-chips.com>
 <20250522074616.3115348-2-zhangqing@rock-chips.com>
Message-Id: <174790594029.1733292.2362448733539179713.robh@kernel.org>
Subject: Re: [PATCH v4 1/3] dt-bindings: can: rockchip_canfd: add rk3576
 CAN-FD controller
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_022543_793112_C2A66EDA 
X-CRM114-Status: GOOD (  10.30  )
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


On Thu, 22 May 2025 15:46:14 +0800, Elaine Zhang wrote:
> Add documentation for the rockchip rk3576 CAN-FD controller.
> 
> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
> ---
>  .../net/can/rockchip,rk3576-canfd.yaml        | 86 +++++++++++++++++++
>  1 file changed, 86 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/can/rockchip,rk3576-canfd.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/net/can/rockchip,rk3576-canfd.yaml:51:111: [warning] line too long (153 > 110 characters) (line-length)
./Documentation/devicetree/bindings/net/can/rockchip,rk3576-canfd.yaml:55:111: [warning] line too long (159 > 110 characters) (line-length)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/can/rockchip,rk3576-canfd.yaml: properties:compatible:oneOf: [{'const': 'rockchip,rk3576-canfd'}] should not be valid under {'items': {'propertyNames': {'const': 'const'}, 'required': ['const']}}
	hint: Use 'enum' rather than 'oneOf' + 'const' entries
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
Error: Documentation/devicetree/bindings/net/can/rockchip,rk3576-canfd.example.dts:36.44-45 syntax error
FATAL ERROR: Unable to parse input tree
make[2]: *** [scripts/Makefile.dtbs:131: Documentation/devicetree/bindings/net/can/rockchip,rk3576-canfd.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1524: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250522074616.3115348-2-zhangqing@rock-chips.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


