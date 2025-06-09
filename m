Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54E7CC5B552
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 20:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lc5xDc8M9+91KnQqbbBDGQyFwobx10Nwqie2LKld48M=; b=iH7+RsxmYbyrvWf2cnYZV1NEgv
	tSv3eirMlet5CktmOOSg6fHpsel05Yqe12K7TPYQCPss7DYy2/cR8w05rQO89jA22t5FodjJahzvH
	M0H8gOEnth1RUl4Bz/qSYfuK63sSNvtUx1f9tB2n66WnGaQssDwsosdRYAXI9PGw0yYIq3N5t1SeT
	T5+qsnN+Ac5E3YPaCgy8n5V9iSc2gY1lv4TysbdOHDoGynioE0Hm3yUljXogIIGCdVbUCeQnM2MzT
	zvLb/nVp/zutm3EiPli2LN63LiMcijSuw9EJPiAx8dbWs5GQkyrMTMKBkaGaCTRfTg0aPeaWqpCXF
	ybQXMeUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOjX4-00000005Djt-3R9K;
	Mon, 09 Jun 2025 20:55:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOjUt-00000005DVv-0H9h
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 20:53:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 60D005C5462;
	Mon,  9 Jun 2025 20:51:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52F78C4CEEB;
	Mon,  9 Jun 2025 20:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749502413;
	bh=QkS659QHabzrTbHoAMc+/rCsJSOQknSL4ivRoGSy76k=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=qTjsnV8i2exyzbxwyXHUfZb+7GxhrmzUvKYYZTbWzYL8gks1A+oRBaR+wYYGR6SK3
	 9UDtBzOIN26X/OWi6/5FOMVOuXOwKHQnI2GiHRX7ilP/wPhApvkRyddylxqBZP20QC
	 oX7lXIx3BjywGRx4glwOa1ja7MD5777vbia4yfZoGl337/LsXwOVQcGsrOGJhX9ymF
	 Z7Oey4OUO3LP6Gw/x/yfNOlYdesVvueiJOYKZ29Y08UnIphnnyQ+jy14d3H+UbiwsN
	 46xvZJKmvppVrutx5BNFAlD5qXNyY7ofhoxEfJccmJX8K47N4Bje52z9JT0XatF46d
	 CcwSmbqKoevVA==
Date: Mon, 09 Jun 2025 15:53:32 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-i2c@vger.kernel.org, asahi@lists.linux.dev, 
 Sven Peter <sven@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Neal Gompa <neal@gompa.dev>, 
 Andi Shyti <andi.shyti@kernel.org>, Janne Grunau <j@jannau.net>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
To: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <20250609-i2c-no-t2-v1-0-789c4693106f@gmail.com>
References: <20250609-i2c-no-t2-v1-0-789c4693106f@gmail.com>
Message-Id: <174950228622.2915605.1412644681389156564.robh@kernel.org>
Subject: Re: [PATCH 0/8] I2C dt nodes and bindings for Apple A7-A11 SoCs
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_135335_257043_45DE01F1 
X-CRM114-Status: GOOD (  16.20  )
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


On Mon, 09 Jun 2025 22:56:17 +0800, Nick Chan wrote:
> Hi,
> 
> This series adds the device tree nodes and bindings for I2C on Apple A7-A11
> SoCs, since the existing driver appears to be compatible. The drivers for the
> attached Dialog DA2xxx PMIC will be in a future patch series.
> 
> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
> ---
> Nick Chan (8):
>       arm64: dts: apple: s5l8960x: Add I2C nodes
>       arm64: dts: apple: t7000: Add I2C nodes
>       arm64: dts: apple: t7001: Add I2C nodes
>       arm64: dts: apple: s800-0-3: Add I2C nodes
>       arm64: dts: apple: s8001: Add I2C nodes
>       arm64: dts: apple: t8010: Add I2C nodes
>       arm64: dts: apple: t8011: Add I2C nodes
>       arm64: dts: apple: t8015: Add I2C nodes
> 
>  arch/arm64/boot/dts/apple/s5l8960x.dtsi | 76 +++++++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/apple/s800-0-3.dtsi | 57 +++++++++++++++++++++++++
>  arch/arm64/boot/dts/apple/s8001.dtsi    | 76 +++++++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/apple/t7000.dtsi    | 76 +++++++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/apple/t7001.dtsi    | 76 +++++++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/apple/t8010.dtsi    | 76 +++++++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/apple/t8011.dtsi    | 76 +++++++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/apple/t8015.dtsi    | 76 +++++++++++++++++++++++++++++++++
>  8 files changed, 589 insertions(+)
> ---
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> change-id: 20250527-i2c-no-t2-2f3589996d14
> 
> Best regards,
> --
> Nick Chan <towinchenmi@gmail.com>
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: using specified base-commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/apple/' for 20250609-i2c-no-t2-v1-0-789c4693106f@gmail.com:

arch/arm64/boot/dts/apple/s8000-n71.dtb: i2c@20a110000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8000-n71.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s8003-n69.dtb: i2c@20a110000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8003-n69.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s8000-n71.dtb: i2c@20a111000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8000-n71.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s8003-n69.dtb: i2c@20a111000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8003-n69.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s8000-n71.dtb: i2c@20a112000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8000-n71.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s8003-n69.dtb: i2c@20a112000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8003-n69.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8010-d111.dtb: i2c@20a110000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8010-j71b.dtb: i2c@20a110000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8010-d111.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8010-j71b.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t7000-j96.dtb: i2c@20a110000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t7000-j96.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8010-d111.dtb: i2c@20a111000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8010-j71b.dtb: i2c@20a111000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8010-d11.dtb: i2c@20a110000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8010-d111.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8010-j71b.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8010-d11.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t7000-j96.dtb: i2c@20a111000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t7000-j96.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8010-d111.dtb: i2c@20a112000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8010-j71b.dtb: i2c@20a112000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8010-d111.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8010-j71b.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8010-d11.dtb: i2c@20a111000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8010-d11.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t7000-j96.dtb: i2c@20a112000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t7000-j96.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8010-d111.dtb: i2c@20a113000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8010-j71b.dtb: i2c@20a113000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8010-d111.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8010-j71b.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8010-d11.dtb: i2c@20a112000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8010-d11.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t7000-j96.dtb: i2c@20a113000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t7000-j96.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8011-j105a.dtb: i2c@20a110000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8010-d11.dtb: i2c@20a113000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8010-d11.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8011-j105a.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8011-j105a.dtb: i2c@20a111000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8011-j105a.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8011-j105a.dtb: i2c@20a112000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8011-j105a.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8011-j105a.dtb: i2c@20a113000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8011-j105a.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8015-d21.dtb: i2c@22e200000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8015-d21.dtb: /soc/i2c@22e200000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8015-d21.dtb: i2c@22e204000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8015-d21.dtb: /soc/i2c@22e204000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8015-d21.dtb: i2c@22e208000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8015-d21.dtb: /soc/i2c@22e208000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8015-d21.dtb: i2c@22e20c000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8015-d21.dtb: /soc/i2c@22e20c000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s5l8960x-j73.dtb: i2c@20a110000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s5l8960x-j73.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s8003-n71m.dtb: i2c@20a110000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8003-n71m.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s5l8960x-j73.dtb: i2c@20a111000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s5l8960x-j73.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s5l8960x-j73.dtb: i2c@20a112000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8003-n71m.dtb: i2c@20a111000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s5l8960x-j73.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s8003-n71m.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s5l8960x-j73.dtb: i2c@20a113000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8003-n71m.dtb: i2c@20a112000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s5l8960x-j73.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s8003-n71m.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8010-d10.dtb: i2c@20a110000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s5l8960x-j86m.dtb: i2c@20a110000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8010-d10.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s5l8960x-j86m.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8010-d10.dtb: i2c@20a111000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8010-d10.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s5l8960x-j86m.dtb: i2c@20a111000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8001-j99a.dtb: i2c@20a110000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s5l8960x-j86m.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8010-d10.dtb: i2c@20a112000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8001-j99a.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8010-d10.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8010-j172.dtb: i2c@20a110000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s5l8960x-j86m.dtb: i2c@20a112000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s5l8960x-j86m.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s8001-j99a.dtb: i2c@20a111000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8010-j172.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8010-d10.dtb: i2c@20a113000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8001-j99a.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8010-d10.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s5l8960x-j86m.dtb: i2c@20a113000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s5l8960x-j86m.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8010-j172.dtb: i2c@20a111000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8001-j99a.dtb: i2c@20a112000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8010-j172.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s8001-j99a.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8010-j172.dtb: i2c@20a112000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8001-j99a.dtb: i2c@20a113000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8010-j172.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s8001-j99a.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8010-j172.dtb: i2c@20a113000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8010-j172.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8011-j208.dtb: i2c@20a110000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8003-j71t.dtb: i2c@20a110000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8011-j208.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s8003-j71t.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8011-j208.dtb: i2c@20a111000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8011-j208.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s8003-j71t.dtb: i2c@20a111000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8003-j71t.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8011-j208.dtb: i2c@20a112000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8011-j208.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s8003-j71t.dtb: i2c@20a112000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8003-j71t.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8011-j208.dtb: i2c@20a113000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8011-j208.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8011-j121.dtb: i2c@20a110000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8011-j121.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8011-j121.dtb: i2c@20a111000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8011-j121.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8011-j121.dtb: i2c@20a112000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8011-j121.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8011-j121.dtb: i2c@20a113000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8011-j121.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s5l8960x-j85.dtb: i2c@20a110000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s5l8960x-j85.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s5l8960x-j85.dtb: i2c@20a111000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s5l8960x-j85.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s5l8960x-j85.dtb: i2c@20a112000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s5l8960x-j85.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s5l8960x-j85.dtb: i2c@20a113000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s5l8960x-j85.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8015-d22.dtb: i2c@22e200000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8015-d22.dtb: /soc/i2c@22e200000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s5l8960x-j71.dtb: i2c@20a110000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8015-d22.dtb: i2c@22e204000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8015-d22.dtb: /soc/i2c@22e204000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s5l8960x-j71.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8015-d22.dtb: i2c@22e208000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8015-d22.dtb: /soc/i2c@22e208000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s5l8960x-j71.dtb: i2c@20a111000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s5l8960x-j71.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8015-d22.dtb: i2c@22e20c000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8015-d22.dtb: /soc/i2c@22e20c000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s5l8960x-j71.dtb: i2c@20a112000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s5l8960x-j71.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s5l8960x-j71.dtb: i2c@20a113000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s5l8960x-j71.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t7000-j42d.dtb: i2c@20a110000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t7000-j42d.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t7000-j42d.dtb: i2c@20a111000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t7000-j42d.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t7000-j42d.dtb: i2c@20a112000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t7000-j42d.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s8000-n69u.dtb: i2c@20a110000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t7000-j42d.dtb: i2c@20a113000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8000-n69u.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t7000-j42d.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s8000-n69u.dtb: i2c@20a111000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8003-n66m.dtb: i2c@20a110000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8000-n69u.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s8003-n66m.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s8000-n69u.dtb: i2c@20a112000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8000-n69u.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s8003-n66m.dtb: i2c@20a111000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8003-n66m.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s8003-n66m.dtb: i2c@20a112000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8003-n66m.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8010-j171.dtb: i2c@20a110000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8010-j171.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8010-j171.dtb: i2c@20a111000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8010-j171.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8010-j171.dtb: i2c@20a112000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8010-j171.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8010-j171.dtb: i2c@20a113000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8010-j171.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t7001-j82.dtb: i2c@20a110000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t7001-j82.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t7001-j82.dtb: i2c@20a111000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t7001-j82.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t7001-j82.dtb: i2c@20a112000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t7001-j82.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t7001-j82.dtb: i2c@20a113000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t7001-j82.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s5l8960x-j87.dtb: i2c@20a110000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s5l8960x-j87.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s5l8960x-j87.dtb: i2c@20a111000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s5l8960x-j87.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s5l8960x-j87.dtb: i2c@20a112000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s5l8960x-j87.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s5l8960x-j87.dtb: i2c@20a113000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s5l8960x-j87.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s5l8960x-j86.dtb: i2c@20a110000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s5l8960x-j86.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s5l8960x-j86.dtb: i2c@20a111000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s5l8960x-j86.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s5l8960x-j86.dtb: i2c@20a112000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s5l8960x-j86.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s5l8960x-j86.dtb: i2c@20a113000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s5l8960x-j86.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8015-d211.dtb: i2c@22e200000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8015-d211.dtb: /soc/i2c@22e200000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8015-d211.dtb: i2c@22e204000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8015-d211.dtb: /soc/i2c@22e204000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8015-d211.dtb: i2c@22e208000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8015-d211.dtb: /soc/i2c@22e208000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8015-d211.dtb: i2c@22e20c000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8015-d211.dtb: /soc/i2c@22e20c000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8015-d221.dtb: i2c@22e200000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8015-d221.dtb: /soc/i2c@22e200000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8015-d221.dtb: i2c@22e204000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8015-d221.dtb: /soc/i2c@22e204000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8015-d221.dtb: i2c@22e208000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8015-d221.dtb: /soc/i2c@22e208000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8015-d221.dtb: i2c@22e20c000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8015-d221.dtb: /soc/i2c@22e20c000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t7001-j81.dtb: i2c@20a110000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t7001-j81.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t7001-j81.dtb: i2c@20a111000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t7001-j81.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t7001-j81.dtb: i2c@20a112000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t7001-j81.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t7001-j81.dtb: i2c@20a113000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t7001-j81.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s5l8960x-j85m.dtb: i2c@20a110000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s5l8960x-j85m.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s5l8960x-j85m.dtb: i2c@20a111000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s5l8960x-j85m.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s5l8960x-j85m.dtb: i2c@20a112000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s5l8960x-j85m.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s5l8960x-j85m.dtb: i2c@20a113000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s5l8960x-j85m.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8011-j120.dtb: i2c@20a110000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8011-j120.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8011-j120.dtb: i2c@20a111000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8011-j120.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8015-d20.dtb: i2c@22e200000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8015-d20.dtb: /soc/i2c@22e200000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8011-j120.dtb: i2c@20a112000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8011-j120.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8015-d20.dtb: i2c@22e204000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8015-d20.dtb: /soc/i2c@22e204000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8011-j120.dtb: i2c@20a113000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8011-j120.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8015-d20.dtb: i2c@22e208000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8015-d20.dtb: /soc/i2c@22e208000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8015-d20.dtb: i2c@22e20c000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8015-d20.dtb: /soc/i2c@22e20c000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s5l8960x-n51.dtb: i2c@20a110000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s5l8960x-n51.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s5l8960x-n51.dtb: i2c@20a111000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s5l8960x-n51.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s5l8960x-n51.dtb: i2c@20a112000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s5l8960x-n51.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s5l8960x-n51.dtb: i2c@20a113000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s5l8960x-n51.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8010-j72b.dtb: i2c@20a110000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8010-j72b.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8010-j72b.dtb: i2c@20a111000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8010-j72b.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8010-j72b.dtb: i2c@20a112000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8010-j72b.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8010-j72b.dtb: i2c@20a113000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8010-j72b.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s5l8960x-j87m.dtb: i2c@20a110000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s5l8960x-j87m.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s5l8960x-j87m.dtb: i2c@20a111000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s5l8960x-j87m.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s5l8960x-j87m.dtb: i2c@20a112000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s5l8960x-j87m.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s5l8960x-j87m.dtb: i2c@20a113000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s5l8960x-j87m.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s8001-j128.dtb: i2c@20a110000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8001-j128.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s8001-j128.dtb: i2c@20a111000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8001-j128.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s8001-j128.dtb: i2c@20a112000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8001-j128.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s8001-j128.dtb: i2c@20a113000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8001-j128.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t7000-n61.dtb: i2c@20a110000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t7000-n61.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t7000-n61.dtb: i2c@20a111000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t7000-n61.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t7000-n61.dtb: i2c@20a112000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t7000-n61.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t7000-n61.dtb: i2c@20a113000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t7000-n61.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s8001-j127.dtb: i2c@20a110000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8001-j127.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s8001-j127.dtb: i2c@20a111000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8001-j127.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s8001-j127.dtb: i2c@20a112000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8001-j127.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s8001-j127.dtb: i2c@20a113000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8001-j127.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t7000-n102.dtb: i2c@20a110000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t7000-n102.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t7000-n102.dtb: i2c@20a111000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s5l8960x-n53.dtb: i2c@20a110000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t7000-n102.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s5l8960x-n53.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t7000-n102.dtb: i2c@20a112000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t7000-n102.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s5l8960x-n53.dtb: i2c@20a111000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s5l8960x-n53.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t7000-n102.dtb: i2c@20a113000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t7000-n102.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s5l8960x-n53.dtb: i2c@20a112000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s5l8960x-n53.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s5l8960x-n53.dtb: i2c@20a113000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s5l8960x-n53.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t7000-n56.dtb: i2c@20a110000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t7000-n56.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t7000-n56.dtb: i2c@20a111000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t7000-n56.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t7000-n56.dtb: i2c@20a112000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t7000-n56.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t7000-n56.dtb: i2c@20a113000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t7000-n56.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t7000-j97.dtb: i2c@20a110000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t7000-j97.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t7000-j97.dtb: i2c@20a111000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t7000-j97.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t7000-j97.dtb: i2c@20a112000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t7000-j97.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t7000-j97.dtb: i2c@20a113000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t7000-j97.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s8000-n66.dtb: i2c@20a110000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8000-n66.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s8000-n66.dtb: i2c@20a111000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8000-n66.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s8000-n66.dtb: i2c@20a112000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8000-n66.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8010-n112.dtb: i2c@20a110000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8010-n112.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8010-n112.dtb: i2c@20a111000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8010-n112.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8010-n112.dtb: i2c@20a112000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8010-n112.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8010-n112.dtb: i2c@20a113000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8010-n112.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s5l8960x-j72.dtb: i2c@20a110000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s5l8960x-j72.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s5l8960x-j72.dtb: i2c@20a111000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s5l8960x-j72.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s5l8960x-j72.dtb: i2c@20a112000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s5l8960x-j72.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s5l8960x-j72.dtb: i2c@20a113000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s5l8960x-j72.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s8001-j98a.dtb: i2c@20a110000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8001-j98a.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s8001-j98a.dtb: i2c@20a111000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8001-j98a.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8011-j207.dtb: i2c@20a110000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8011-j207.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8011-j207.dtb: i2c@20a111000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8011-j207.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s8001-j98a.dtb: i2c@20a112000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8010-d101.dtb: i2c@20a110000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8011-j207.dtb: i2c@20a112000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8000-j71s.dtb: i2c@20a110000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8003-j72t.dtb: i2c@20a110000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8011-j207.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8010-d101.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s8001-j98a.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s8000-j71s.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s8003-j72t.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8011-j207.dtb: i2c@20a113000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8010-d101.dtb: i2c@20a111000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8011-j207.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8010-d101.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s8000-j71s.dtb: i2c@20a111000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8003-j72t.dtb: i2c@20a111000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8000-j71s.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s8003-j72t.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8010-d101.dtb: i2c@20a112000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8010-d101.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s8000-j71s.dtb: i2c@20a112000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8003-j72t.dtb: i2c@20a112000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8001-j98a.dtb: i2c@20a113000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8000-j71s.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s8003-j72t.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8010-d101.dtb: i2c@20a113000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8001-j98a.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8010-d101.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s8000-j72s.dtb: i2c@20a110000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8015-d201.dtb: i2c@22e200000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8000-j72s.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8015-d201.dtb: /soc/i2c@22e200000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s8000-j72s.dtb: i2c@20a111000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8000-j72s.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8015-d201.dtb: i2c@22e204000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8015-d201.dtb: /soc/i2c@22e204000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/s8000-j72s.dtb: i2c@20a112000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/s8000-j72s.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8015-d201.dtb: i2c@22e208000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8015-d201.dtb: /soc/i2c@22e208000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']
arch/arm64/boot/dts/apple/t8015-d201.dtb: i2c@22e20c000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
arch/arm64/boot/dts/apple/t8015-d201.dtb: /soc/i2c@22e20c000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']






