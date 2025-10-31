Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F35BECCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 11:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rF5qaAA5dccyGnSuZqKWFDkC/ZnH+uIEbMsbpiV6+wg=; b=ccTz8PXhxUzjD2Hd1YG5L0LxR2
	ZMKpYCQq5vuc3O+tmVxOMYGKzs+2JOocm6UJpPfqWl+6/BaCoIw/vQcobj6RCMGLQr1OzIWXQzBpF
	8TGswxl4kGs53mBJEorM/GsfYTUz0SJSSIZt+pgQShVAE4H1QdSJlHmsu9oiyXC6dA9s1YNRhRqPX
	yosRAlQScF9Cfhz85ZomLuPYS4I3zbTBPvmOc6Tfy0sUyAeweFw3fDVvwK00vItsLB1QU8vQGm68g
	HIsJXIJywF4LpMrQpaOMtERJse6xe8cwEUcdl47+XlRztQyXBnEFoPe4Sps5cgOnQPlTVjvLzGAyY
	9QX4/stA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEn0y-00000005z93-2oFk;
	Fri, 31 Oct 2025 11:09:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEn0v-00000005z8f-3NJl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 11:09:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 23E3741978;
	Fri, 31 Oct 2025 11:09:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9919CC4CEF8;
	Fri, 31 Oct 2025 11:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761908989;
	bh=I7rzIGhL8xOCEwjsSLVh7bEj5BilIr1yhKEWjb49+sU=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=DUjVSJhggL+MIhCfTYxlHlZ6dS+T8pcQycIa9IRczO/3FIGe/wO2IifwIaNys5NK2
	 BboHfUyOPBXi8OmZjQitgIZe6ZvEH8+NCckKqO547SZvXW9fvt/hq3K0HYlgeB4vjl
	 3MKx3balmoI/1JfVJUv6yvv4tf26x1P+8E/d1zxUMqvLuTE/r0sh4H3UARc0ALOiK4
	 +WnE3GshC4coJDUehLB2xuPs8GRQk+yfZe6tuqR6+R7TWgxf8I/h5qjWxDA77B6Zq2
	 EWQu/rz7d0btKSr8ndLszUeubQwRlZnvJ0HSYZdBSw7dgUz7je0mkKiRUvMNH8klss
	 dHGh+gTtMZMgA==
Date: Fri, 31 Oct 2025 06:09:47 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>, 
 Conor Dooley <conor.dooley@microchip.com>, Paolo Abeni <pabeni@redhat.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 linux-stm32@st-md-mailman.stormreply.com, 
 "David S. Miller" <davem@davemloft.net>, Longbin Li <looong.bin@gmail.com>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
 Han Gao <rabenda.cn@gmail.com>, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Icenowy Zheng <uwu@icenowy.me>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Chen Wang <unicorn_wang@outlook.com>, Eric Dumazet <edumazet@google.com>, 
 sophgo@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Vivian Wang <wangruikang@iscas.ac.cn>, Yixun Lan <dlan@gentoo.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>, 
 linux-kernel@vger.kernel.org, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org, 
 Yao Zi <ziyao@disroot.org>
To: Inochi Amaoto <inochiama@gmail.com>
In-Reply-To: <20251031012428.488184-2-inochiama@gmail.com>
References: <20251031012428.488184-1-inochiama@gmail.com>
 <20251031012428.488184-2-inochiama@gmail.com>
Message-Id: <176190898726.569389.4934903700571310952.robh@kernel.org>
Subject: Re: [PATCH v5 1/3] dt-bindings: net: sophgo,sg2044-dwmac: add phy
 mode restriction
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_040949_895776_98A68737 
X-CRM114-Status: GOOD (  11.51  )
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


On Fri, 31 Oct 2025 09:24:26 +0800, Inochi Amaoto wrote:
> As the ethernet controller of SG2044 and SG2042 only supports
> RGMII phy. Add phy-mode property to restrict the value.
> 
> Also, since SG2042 has internal rx delay in its mac, make
> only "rgmii-txid" and "rgmii-id" valid for phy-mode.
> 
> Fixes: e281c48a7336 ("dt-bindings: net: sophgo,sg2044-dwmac: Add support for Sophgo SG2042 dwmac")
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/net/sophgo,sg2044-dwmac.yaml     | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml:93:1: [warning] too many blank lines (2 > 1) (empty-lines)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251031012428.488184-2-inochiama@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


