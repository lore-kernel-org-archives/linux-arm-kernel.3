Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36672C369B4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 02:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N4zH6aIS+DYZ1T8KkPh/6odIaZDcCgVbg0nPX9uOJJs=; b=l8KKX0fhKu/wQzztMAz7CwDPOv
	51+runAAGNBCAq2w/ham/C5NG6mWnyfcn+O5nivJO3AgS1e9jMwEejOROY8Ttin/Ks3tVuBUxOpNz
	zRmH2AV1yLHI8eTS6OlHyjtoA8OXGt0BnDWrKEfLKcXTWjCS4u4cRi4VdpW4zVx6VHZ2nBb4p9rA+
	yzwjjiV8k7BWwDsLV8Sikqvmzp+pCAZA4wE3fa7xAUHA4gYnX4mkGMJTZTOf3ilmoQh2JSy9Jjpyh
	YU1TDc7lseLF9oMwM292yVXXjCSqu3SFUsytE44Wpy09IaS46NWKSy53dphZpK3AW37VV1rbh7d4D
	VbrshIKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4W6A-00000004CG3-2Fqg;
	Tue, 15 Apr 2025 02:32:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4W4L-00000004C3l-2Nk2;
	Tue, 15 Apr 2025 02:30:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BE7834415B;
	Tue, 15 Apr 2025 02:30:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68604C4CEE2;
	Tue, 15 Apr 2025 02:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744684236;
	bh=bIFl+juOYVpR/60HIIXvP4aivi52MXYwHtG+zGWQQtk=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=REA2qwO1+qTq51dB6/7puZW1sUBNE/BBjCidkZC+/nG/vUnzRscxKVUw0wbF1WzTD
	 rI7Yvwx+hmtT4IJvJJnxA4+0KGZFxMl7rM9ewfn5pm/BJAxklav9XwXLBpfwbnAqA7
	 Dbb8d3tfkvpQ1cec5RRhhJDabPsHhmxHUZCyYVUHeWTvXUnmLSxikcORYm3S4sX7Ah
	 FFrpJJ+7w28f7A2H3iSPKBFZzUdX2se4biRHaE3TDR3xGTf519wseAGz/tO7Ovskbc
	 RZAIj5bLv3a3PEpp7oyRimA2YuKujJw5njASmJqvi8g3i2CzBwSP6ISQ4b6TL4qiLS
	 PQ/aTzpwtfYjA==
Date: Mon, 14 Apr 2025 21:30:34 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org, 
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, Vinod Koul <vkoul@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
In-Reply-To: <20250415011814.2319719-1-robh@kernel.org>
References: <20250415011814.2319719-1-robh@kernel.org>
Message-Id: <174468423456.2516000.1031965832056252996.robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: phy: rockchip: Convert RK3399 Type-C PHY
 to schema
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_193037_624549_F1678F73 
X-CRM114-Status: GOOD (  11.07  )
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


On Mon, 14 Apr 2025 20:18:13 -0500, Rob Herring (Arm) wrote:
> Convert the Rockchip RK3399 Type-C PHY to DT schema format. Add the
> missing "power-domains" property and "port" and "orientation-switch"
> properties in the child nodes.
> 
> Omit the previously deprecated properties as they aren't used anywhere.
> 
> Drop the 2nd example which was pretty much identical to the 1st example.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../bindings/phy/phy-rockchip-typec.txt       |  84 -------------
>  .../phy/rockchip,rk3399-typec-phy.yaml        | 116 ++++++++++++++++++
>  2 files changed, 116 insertions(+), 84 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/phy/phy-rockchip-typec.txt
>  create mode 100644 Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):
Warning: Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml references a file that doesn't exist: Documentation/devicetree/bindings/phy/phy-rockchip-typec.txt
Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml: Documentation/devicetree/bindings/phy/phy-rockchip-typec.txt

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250415011814.2319719-1-robh@kernel.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


