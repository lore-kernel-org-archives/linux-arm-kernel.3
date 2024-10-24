Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5B75CE8E91
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 16:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I2hG+52ySKtOuSQdZttzOymE75x/7CWjlqswcKbtWNc=; b=RlqtpSk1cnKWbv+NfEF5Xi0wvH
	XKAjDpNVX2VoZ22xaWdRO/1pmcZpbC0YlhWZhxQRm+ATV8uHKf2kXnKd7xU6SrVmnm2kous7W0NmJ
	8IcvkUC9mpTTM7KR095oFhdfKSO1gx/wmGhJFmoPko0F38AY6MDHf5u3e4rOZOg327aa+dqK/+aND
	eFGOLHwzR8qgFmhCSGAm6E8+HgMn69OIHPQxC/92tRP6OgM3VvUpeMB2Sc2ZT1KBDFDjgCw4TWgLz
	m0jw/jVu2x/gduT9m8Pb+YwD6QtfoQS2UJWPowXCXWAzAPmtAIYQj6DFK+0r+14w8IULqYnvUzs7h
	XG0GztOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t40sD-000000017wT-3WsQ;
	Thu, 24 Oct 2024 16:39:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t40lu-000000016dg-1prr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 16:33:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5D50A5C6003;
	Thu, 24 Oct 2024 16:33:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 174A4C4CEE5;
	Thu, 24 Oct 2024 16:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729787592;
	bh=XiSOQI9L3W8bBGL0+ZH+gBgnozd60J9irbYoRJGkyLk=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=JhS+crzC5WjZ1bk/8YkaW/80btpbgEu6tt+Z8a0GtYnHpqIplmBm8HP5h7aUUK8JH
	 7iAreT41hkYbg33PFRyTSBIOlX+zN8csId5C6S4ebR3sT6BBX3Gpf2iu7BffzvQfCq
	 u/YDzmEx0lGQxjTRSTK35qAM+wktKlC5NMY41o5tTaL2QWN5K8RFyiHDHj2A2mKFzV
	 j+G+jSeXtJS+/OzndZwACoCsXB6d7QjG+MEPpprZQ7/G9vmUOS0ZzUEzDGmCgwZCvq
	 SOKLGsfsb+VNy1vNc+Cj1Dp9djGXQvXqSPSAIIYpKdV8kQblHU/gKicCIarun3lpkx
	 CoIRnlsevEGSQ==
Date: Thu, 24 Oct 2024 11:33:11 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Melody Olvera <quic_molvera@quicinc.com>
Cc: Arnd Bergmann <arnd@arndb.de>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 =?utf-8?q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>, 
 Trilok Soni <quic_tsoni@quicinc.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, Will Deacon <will@kernel.org>
In-Reply-To: <20241021232114.2636083-1-quic_molvera@quicinc.com>
References: <20241021232114.2636083-1-quic_molvera@quicinc.com>
Message-Id: <172978739477.623395.5604249801475913676.robh@kernel.org>
Subject: Re: [PATCH 0/5] dts: qcom: Introduce SM8750 device trees
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_093314_593883_0DB1FD20 
X-CRM114-Status: GOOD (  16.70  )
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


On Mon, 21 Oct 2024 16:21:09 -0700, Melody Olvera wrote:
> This series adds the initial device tree support for the SM8750 SoCs
> needed to boot to shell. This specifically adds support for clocks,
> pinctrl, rpmhpd, regulators, interconnects, and SoC and board
> compatibles.
> 
> The Qualcomm Technologies, Inc. SM8750 SoC is the latest in the line of
> consumer mobile device SoCs. See more at:
> https://www.qualcomm.com/content/dam/qcomm-martech/dm-assets/images/company/news-media/media-center/press-kits/snapdragon-summit-2024/day-1/documents/Snapdragon8EliteProductBrief.pdf
> 
> Dependencies:
> clks: https://lore.kernel.org/all/20241021230359.2632414-1-quic_molvera@quicinc.com/
> interconnects: https://lore.kernel.org/all/20241021231823.2635534-1-quic_molvera@quicinc.com/
> pinctrl: https://lore.kernel.org/all/20241021230414.2632428-1-quic_molvera@quicinc.com/
> regulators: https://lore.kernel.org/all/20241021230348.2632381-1-quic_molvera@quicinc.com/
> power domains: https://lore.kernel.org/all/20241021230333.2632368-1-quic_molvera@quicinc.com/
> misc bindings:
> - https://lore.kernel.org/all/20241021230427.2632466-1-quic_molvera@quicinc.com/
> - https://lore.kernel.org/all/20241021230500.2632527-1-quic_molvera@quicinc.com/
> - https://lore.kernel.org/all/20241021230439.2632480-1-quic_molvera@quicinc.com/
> - https://lore.kernel.org/all/20241021230449.2632493-1-quic_molvera@quicinc.com/
> 
> Jishnu Prakash (2):
>   dt-bindings: mfd: qcom,spmi-pmic: Document PMICs added in SM8750
>   arm64: dts: qcom: Add pmd8028 and pmih0108 PMIC dtsi files
> 
> Melody Olvera (3):
>   dt-bindings: arm: qcom: Document sm8750 SoC and boards
>   arm64: dts: qcom: Add base sm8750 dtsi and mtp and qrd dts
>   arm64: defconfig: Enable SM8750 SoC base configs
> 
>  .../devicetree/bindings/arm/qcom.yaml         |    7 +
>  .../bindings/mfd/qcom,spmi-pmic.yaml          |    2 +
>  arch/arm64/boot/dts/qcom/Makefile             |    2 +
>  arch/arm64/boot/dts/qcom/pmd8028.dtsi         |   56 +
>  arch/arm64/boot/dts/qcom/pmih0108.dtsi        |   62 +
>  arch/arm64/boot/dts/qcom/sm8750-mtp.dts       |  968 ++++++
>  arch/arm64/boot/dts/qcom/sm8750-qrd.dts       |  965 ++++++
>  arch/arm64/boot/dts/qcom/sm8750.dtsi          | 2903 +++++++++++++++++
>  arch/arm64/configs/defconfig                  |    4 +
>  9 files changed, 4969 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/pmd8028.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/pmih0108.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/sm8750-mtp.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/sm8750-qrd.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/sm8750.dtsi
> 
> 
> base-commit: 63b3ff03d91ae8f875fe8747c781a521f78cde17
> prerequisite-patch-id: 5a4ad7a91dffc1c63a6513736cab88404937bbc5
> prerequisite-patch-id: f98e160b22d065fef3919e807102619ef80a63fd
> prerequisite-patch-id: 9df63975d51d61db536e843f261f837de613c0bb
> prerequisite-patch-id: dca6974344b25b6160e6a2680c438bc59da33374
> prerequisite-patch-id: 36ad7b3a06074897abcbe9521452ed0ec632e2eb
> prerequisite-patch-id: 255b9f24b2765ad6bb8fd5213b620ba2263d48f7
> prerequisite-patch-id: f458aa6a3d53924449be96609a0d1e65ec9f4854
> prerequisite-patch-id: 5bc1ec8226b52170508fd5ac30e31fec72e86f5a
> prerequisite-patch-id: 2b556803a12148cc12c1edcb5e143a454679a047
> prerequisite-patch-id: 0924872ce84c0f0011d53e98e58bf61213e9df43
> prerequisite-patch-id: 3a6538f98c3ce876d8acf3a0c55ac04897cfaf43
> prerequisite-patch-id: 7e047c63eff592833642eae37492b09e1ea7ed2d
> prerequisite-patch-id: cf8bef95f79c460b5b1c231a1122aa0173807a4d
> prerequisite-patch-id: ba4dd339acd73f885fe3d5f018ac620997583599
> prerequisite-patch-id: 5b930049e39fbd1ace2562d7870c2af764fe4cd4
> prerequisite-patch-id: 58acef79b9bf6c2e7d69d598d24502787eddc910
> prerequisite-patch-id: 369d52ee563f34eeca4a9c36e6d2b36b24eac635
> prerequisite-patch-id: e02a35925d37a2e61abbf240cc8963208f54e1c0
> prerequisite-patch-id: e4bf91d9a22d34c567eeab5b0f6fb90913ee908b
> --
> 2.46.1
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


New warnings running 'make CHECK_DTBS=y qcom/sm8750-mtp.dtb qcom/sm8750-qrd.dtb' for 20241021232114.2636083-1-quic_molvera@quicinc.com:

arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: domain-idle-states: cluster-sleep-0: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: domain-idle-states: cluster-sleep-0:compatible:0: 'domain-idle-state' was expected
	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: domain-idle-states: cluster-sleep-0: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: domain-idle-states: cluster-sleep-0:compatible:0: 'domain-idle-state' was expected
	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: pmic@7: 'eusb2-repeater@fd00' does not match any of the regexes: '(.*)?(wled|leds)@[0-9a-f]+$', '^adc-tm@[0-9a-f]+$', '^adc@[0-9a-f]+$', '^audio-codec@[0-9a-f]+$', '^battery@[0-9a-f]+$', '^charger@[0-9a-f]+$', '^led-controller@[0-9a-f]+$', '^mpps@[0-9a-f]+$', '^nvram@[0-9a-f]+$', '^pbs@[0-9a-f]+$', '^rtc@[0-9a-f]+$', '^temp-alarm@[0-9a-f]+$', '^typec@[0-9a-f]+$', '^usb-detect@[0-9a-f]+$', '^usb-vbus-regulator@[0-9a-f]+$', '^vibrator@[0-9a-f]+$', 'gpio@[0-9a-f]+$', 'phy@[0-9a-f]+$', 'pinctrl-[0-9]+', 'pon@[0-9a-f]+$'
	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: pmic@7: 'eusb2-repeater@fd00' does not match any of the regexes: '(.*)?(wled|leds)@[0-9a-f]+$', '^adc-tm@[0-9a-f]+$', '^adc@[0-9a-f]+$', '^audio-codec@[0-9a-f]+$', '^battery@[0-9a-f]+$', '^charger@[0-9a-f]+$', '^led-controller@[0-9a-f]+$', '^mpps@[0-9a-f]+$', '^nvram@[0-9a-f]+$', '^pbs@[0-9a-f]+$', '^rtc@[0-9a-f]+$', '^temp-alarm@[0-9a-f]+$', '^typec@[0-9a-f]+$', '^usb-detect@[0-9a-f]+$', '^usb-vbus-regulator@[0-9a-f]+$', '^vibrator@[0-9a-f]+$', 'gpio@[0-9a-f]+$', 'phy@[0-9a-f]+$', 'pinctrl-[0-9]+', 'pon@[0-9a-f]+$'
	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: rsc@16500000: regulators-0: Unevaluated properties are not allowed ('vdd-l1-supply', 'vdd-l10-supply', 'vdd-l4-supply' were unexpected)
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: rsc@16500000: regulators-0: Unevaluated properties are not allowed ('vdd-l1-supply', 'vdd-l10-supply', 'vdd-l4-supply' were unexpected)
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: rsc@16500000: regulators-4: Unevaluated properties are not allowed ('vdd-s7-supply', 'vdd-s8-supply' were unexpected)
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: rsc@16500000: regulators-4: Unevaluated properties are not allowed ('vdd-s7-supply', 'vdd-s8-supply' were unexpected)
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: rsc@16500000: 'power-domains' is a required property
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: rsc@16500000: 'qcom,drv-count' does not match any of the regexes: '^regulators(-[0-9])?$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: rsc@16500000: regulators-0: Unevaluated properties are not allowed ('vdd-l10-supply' was unexpected)
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: rsc@16500000: regulators-0: Unevaluated properties are not allowed ('vdd-l10-supply' was unexpected)
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: rsc@16500000: regulators-4: Unevaluated properties are not allowed ('vdd-s7-supply', 'vdd-s8-supply' were unexpected)
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: rsc@16500000: regulators-4: Unevaluated properties are not allowed ('vdd-s7-supply', 'vdd-s8-supply' were unexpected)
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: rsc@16500000: 'power-domains' is a required property
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: rsc@16500000: 'qcom,drv-count' does not match any of the regexes: '^regulators(-[0-9])?$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: regulators-0: Unevaluated properties are not allowed ('vdd-l1-supply', 'vdd-l10-supply', 'vdd-l4-supply' were unexpected)
	from schema $id: http://devicetree.org/schemas/regulator/qcom,rpmh-regulator.yaml#
arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: regulators-0: Unevaluated properties are not allowed ('vdd-l10-supply' was unexpected)
	from schema $id: http://devicetree.org/schemas/regulator/qcom,rpmh-regulator.yaml#
arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: regulators-4: Unevaluated properties are not allowed ('vdd-s7-supply', 'vdd-s8-supply' were unexpected)
	from schema $id: http://devicetree.org/schemas/regulator/qcom,rpmh-regulator.yaml#
arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: regulators-4: Unevaluated properties are not allowed ('vdd-s7-supply', 'vdd-s8-supply' were unexpected)
	from schema $id: http://devicetree.org/schemas/regulator/qcom,rpmh-regulator.yaml#
arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: timer@16800000: #size-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer_mmio.yaml#
arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: timer@16800000: #size-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer_mmio.yaml#






