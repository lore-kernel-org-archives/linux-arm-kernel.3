Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 009B6E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Dec 2024 18:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tkWXDd+ie9pgglrmVKx6USQaQrITRL2c9xN2fEQLh2o=; b=ASsDuMNn8fsHaOCq9UeeZ+AP4g
	qUGVuHczi6ja77TfQ3zYUedAJPQsJXWOyOiIY4sKg8t5Ssjx80J31SK/40i0LAtUJafEHRzOM3dQ5
	jKnp+ND+0WPEvhxkEpVvpxVlnpI38izEcZoiL31mHt3rh44B1zKYHcN36KL+sih88IyNf9GSX2INi
	uMJIZkKP6OgM3YrJ0MiPTvw8YZu0VmAv2Zv5ax96swu/TTwAA7EXhu2Buj5IYqZRD0CyT1MWRE95j
	pLEFvTJH2C2xyt1wKYReaNhCkjOkYWftKuqRYmOjHWxwmIKfQlF6kubrz4eUvWAlgmYXrDpQd1sue
	uQUSWZXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSKLV-00000005dxo-3dS9;
	Mon, 30 Dec 2024 18:18:29 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSKKK-00000005dlY-2Jpw;
	Mon, 30 Dec 2024 18:17:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C1C59A40EB9;
	Mon, 30 Dec 2024 18:15:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2DD2C4CED6;
	Mon, 30 Dec 2024 18:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735582634;
	bh=yO/bDAAjALbmdooiFvPDhcv3ctrG92wc4GGL6V+fiSk=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Zhffs2bbyXPE3L1zn5MNztjnOMSJAzkqiRxv2VHJnIX4tbQYGojgAgpYtH2DJu80o
	 bctRSbqot6s7R73zULPZaN29ngPsiEtnxlqJYrT6rLAtnlUthxgyTj0DDfbxa7QUtP
	 ydUwinjHQH6mCKXfOnB9ykYmqRlWKW+5BESYiq1YFMsK7CKqkAG9t721YaQLVuR2uZ
	 V6LPodkOIUoqLTPwtfTlNTClcH1LH6+pIhFRwGnHNZLZrU5eNKWM/lz0ACdpvACh/e
	 qIXkjyMwLUcDoPAGdvwnK1KRWG2n/EPGBF62o5tneVKLdtqzJPay2GGBWWkk7yrBv2
	 B/H2x6UzisL+A==
Date: Mon, 30 Dec 2024 12:17:13 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-rockchip@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org
To: Ivan Sergeev <ivan8215145640@gmail.com>
In-Reply-To: <20241230-bigtreetech-cb2-v4-0-26d2d30e07ce@gmail.com>
References: <20241230-bigtreetech-cb2-v4-0-26d2d30e07ce@gmail.com>
Message-Id: <173558214299.2262675.7745978856834508715.robh@kernel.org>
Subject: Re: [PATCH v4 0/2] arm64: dts: rockchip: Add BigTreeTech CB2 and
 Pi2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_101716_720648_7E4D32A4 
X-CRM114-Status: GOOD (  18.64  )
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


On Mon, 30 Dec 2024 17:58:17 +0300, Ivan Sergeev wrote:
> BigTreeTech CB2 and Pi2 are Rockchip RK3566 SoM and SBC boards made by
> BigTreeTech for the intent of using as a 3d printer control board.
> It is a successor to the Allwinner H616-based BigTreeTech CB1 and Pi, so
> the device trees for CB2 and Pi2 are also done in the same manner: the
> common nodes and properties are put into a dtsi file that the
> board-specific device trees include.
> 
> Changes in v4:
> - Removed invalid `i2c,ignore-nak` properties
> - Set `#address-cells` and `size-cells` on `sdmmc1`
> - Fixed `phy-supply` properties of usb host nodes
> - Link to v3: https://lore.kernel.org/r/20241227-bigtreetech-cb2-v3-0-91c556adcffe@gmail.com
> 
> Changes in v3:
> - Proper formatting and patch series sending (using b4)
> - Converted spaces to tab indentation in the dtsi file
> - Fixed empty line where the license identifier should be
> - Link to v2 1/2: https://lore.kernel.org/linux-rockchip/20241224135751.350379-2-ivan8215145640@gmail.com/
> - Link to v2 2/2: https://lore.kernel.org/linux-rockchip/20241224140057.350667-2-ivan8215145640@gmail.com/
> 
> Changes in v2:
> - Added bigtreetech cb2 and pi2 boards to the list of platforms
> - Split BigTreeTech CB2 and Pi2 into two device trees using common dtsi
> - Link to v1: https://lore.kernel.org/linux-rockchip/20241222203952.84217-2-ivan8215145640@gmail.com/
> 
> Signed-off-by: Ivan Sergeev <ivan8215145640@gmail.com>
> ---
> Ivan Sergeev (2):
>       dt-bindings: arm: rockchip: Add BigTreeTech CB2 and Pi2
>       arm64: dts: rockchip: Add BigTreeTech CB2 and Pi2
> 
>  .../devicetree/bindings/arm/rockchip.yaml          |  11 +
>  arch/arm64/boot/dts/rockchip/Makefile              |   2 +
>  .../dts/rockchip/rk3566-bigtreetech-cb2-manta.dts  |  10 +
>  .../boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi  | 943 +++++++++++++++++++++
>  .../boot/dts/rockchip/rk3566-bigtreetech-pi2.dts   |  10 +
>  5 files changed, 976 insertions(+)
> ---
> base-commit: d6ef8b40d075c425f548002d2f35ae3f06e9cf96
> change-id: 20241224-bigtreetech-cb2-18944b349916
> 
> Best regards,
> --
> Ivan Sergeev <ivan8215145640@gmail.com>
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


New warnings running 'make CHECK_DTBS=y rockchip/rk3566-bigtreetech-cb2-manta.dtb rockchip/rk3566-bigtreetech-pi2.dtb' for 20241230-bigtreetech-cb2-v4-0-26d2d30e07ce@gmail.com:

arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-pi2.dtb: /i2c@fe5c0000/ns2009@48: failed to match any schema with compatible: ['ti,tsc2007']
arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2-manta.dtb: /i2c@fe5c0000/ns2009@48: failed to match any schema with compatible: ['ti,tsc2007']
arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-pi2.dtb: host-port: phy-supply: 'oneOf' conditional failed, one must be fixed:
	[[181, 182]] is not of type 'object'
	[181, 182] is too long
	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-pi2.dtb: host-port: phy-supply: 'oneOf' conditional failed, one must be fixed:
	[[184, 185]] is not of type 'object'
	[184, 185] is too long
	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2-manta.dtb: host-port: phy-supply: 'oneOf' conditional failed, one must be fixed:
	[[181, 182]] is not of type 'object'
	[181, 182] is too long
	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2-manta.dtb: host-port: phy-supply: 'oneOf' conditional failed, one must be fixed:
	[[184, 185]] is not of type 'object'
	[184, 185] is too long
	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-pi2.dtb: wireless-bluetooth: uart1-gpios: {'rockchip,pins': [[2, 13, 0, 187]]} is not of type 'array'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-pi2.dtb: touch: touch-gpio: {'rockchip,pins': [[0, 13, 0, 189], [0, 14, 0, 187]]} is not of type 'array'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2-manta.dtb: wireless-bluetooth: uart1-gpios: {'rockchip,pins': [[2, 13, 0, 187]]} is not of type 'array'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2-manta.dtb: touch: touch-gpio: {'rockchip,pins': [[0, 13, 0, 189], [0, 14, 0, 187]]} is not of type 'array'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#






