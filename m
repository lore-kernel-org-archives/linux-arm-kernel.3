Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AD65E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 19:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4m9OqiwFQH6PlG0tJPa3ll0iyy4Enjyf73LBjtm//80=; b=uZXRVsMdA+pLc2zJ/RASnrjoNQ
	990zDw9sLEtL79YYmjdIkqK91ej5Hbq74pfxjL/u8mfH9UiisSOI9+a6j4nubLVv3T0pvC+ztPWPG
	qD9+8e9Wklo9QsOLWiFPOAFSNnVZ/fyEtLEbjqfMWa0YfWZbFHMoT0bJbi43r/9cD54Nh1fvyANqB
	qS+w2U2Sn9mQq0B0cGY8KDJBnLTwaIFq8gNmE2dg7gUY0kKnMySLXZ8JYtsFu+VTBfmRolh8kXIdN
	ewVDZc24pr0sgYB+SRY72n0VSBa7Mrq3GC4NWX4gqdA4o99EriZpl0HdXOd5yNfY7RaPmfeUtMRbY
	6KTj9tnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUsmp-00000002Rs9-1IJP;
	Mon, 06 Jan 2025 19:29:15 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUsld-00000002Rdt-05Qi;
	Mon, 06 Jan 2025 19:28:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6207F5C0644;
	Mon,  6 Jan 2025 19:27:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D257BC4CEEC;
	Mon,  6 Jan 2025 19:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736191679;
	bh=rsXG31WH7wfyTDNrN8YIiWEPDkdjB/Gf7A7Pi2iMbIk=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=oyTFwFGjHshqZLl6kWwazxmVcUO1HWN8CR+4P6qWhdh6SxT70rczFKCCQ7v3vn/Kc
	 KYrdvmLH1qoT2h7bwQSPRMrSSeQ7/lJfUSlNVlP1vht/OgI9cHAZCvp5Io8PrhYp3N
	 sX45dmPwW69Vo1z0AaRa9yxjfCNP+1KjfaCgbMQXWtpWDA0miryzJuhlWL3A1OBHI4
	 ABBbTdIB91bwoJNZnKxsSj/6BlvJBOmV3hf1X4uHFjQNa9LLLctXfFj0/gdb7HQePG
	 5S66n+tp+y+mNlfl24j1RDbGsbSQE451qEJ0jtuFHe/hGXx8kvq2XcBf+VL6Knd5iz
	 PmKZhmApT/kCg==
Date: Mon, 06 Jan 2025 13:27:58 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, linux-rockchip@lists.infradead.org
To: Ivan Sergeev <ivan8215145640@gmail.com>
In-Reply-To: <20250105-bigtreetech-cb2-v6-0-ee7bc9c4df46@gmail.com>
References: <20250105-bigtreetech-cb2-v6-0-ee7bc9c4df46@gmail.com>
Message-Id: <173619154629.838782.15013037487294078992.robh@kernel.org>
Subject: Re: [PATCH v6 0/2] arm64: dts: rockchip: Add BigTreeTech CB2 and
 Pi2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_112801_153106_64319829 
X-CRM114-Status: GOOD (  19.05  )
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


On Sun, 05 Jan 2025 13:40:29 +0300, Ivan Sergeev wrote:
> BigTreeTech CB2 and Pi2 are Rockchip RK3566 SoM and SBC boards made by
> BigTreeTech for the intent of using as a 3d printer control board.
> It is a successor to the Allwinner H616-based BigTreeTech CB1 and Pi, so
> the device trees for CB2 and Pi2 are also done in the same manner: the
> common nodes and properties are put into a dtsi file that the
> board-specific device trees include.
> 
> Changes in v6:
> - Fixed node names missed in v5
> - Link to v5: https://lore.kernel.org/r/20250105-bigtreetech-cb2-v5-0-923f911b10c0@gmail.com
> 
> Changes in v5:
> - Applied requested changes
> - Fixed usb `phy-supply` format
> - Removed improperly named pinctrl nodes that were unused.
> - Fixed names of other pinctrl nodes
> - Link to v4: https://lore.kernel.org/r/20241230-bigtreetech-cb2-v4-0-26d2d30e07ce@gmail.com
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
>  .../boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi  | 919 +++++++++++++++++++++
>  .../boot/dts/rockchip/rk3566-bigtreetech-pi2.dts   |  10 +
>  5 files changed, 952 insertions(+)
> ---
> base-commit: 63676eefb7a026d04b51dcb7aaf54f358517a2ec
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


New warnings running 'make CHECK_DTBS=y rockchip/rk3566-bigtreetech-cb2-manta.dtb rockchip/rk3566-bigtreetech-pi2.dtb' for 20250105-bigtreetech-cb2-v6-0-ee7bc9c4df46@gmail.com:

arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2-manta.dtb: /i2c@fe5c0000/touchscreen@48: failed to match any schema with compatible: ['ti,tsc2007']
arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-pi2.dtb: /i2c@fe5c0000/touchscreen@48: failed to match any schema with compatible: ['ti,tsc2007']
arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-pi2.dtb: pmic: soc-slppin-gpio: {'rockchip,pins': [[0, 2, 0, 196]]} is not of type 'array'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2-manta.dtb: pmic: soc-slppin-gpio: {'rockchip,pins': [[0, 2, 0, 196]]} is not of type 'array'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#






