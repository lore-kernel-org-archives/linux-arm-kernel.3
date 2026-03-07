Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95912FC9EF8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 13:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=diLxA+hMgniyjgcu4s7ZLmJNmRMvEY41R8+77aP87dk=; b=dxxZHC9hXkDBnThhIun9GlHg6E
	2aChKtZlkAzaO9/jrhXGr67AohnSU5N5BdWtQoPgtg0t6kezuPoJU/UttRZFCYv2qCDezVN8DLCUq
	CfRryTb/cVjIMhrBlsCnoWOYi7nz5eA1fk7IdsKfDof0PbGRn49RIp1G5I3CepDS4LLOvbLTx+Jj8
	M1XtyBFLvzfSmMitC/rM15kg14WUd/TR6PkNO6HSmMFgGgdhMT9Ie7S+mK4RhpYJKoM7un3xXvmhx
	qjfAr32Qsjz29W5Zm0ERxyqjwt/aLipnd2C/SLGY9SAzj715XYUVELSEkxmuf3Sg0Eqz/sMDXWG7v
	9NF+H9/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyrPv-00000005DGl-4Ayd;
	Sat, 07 Mar 2026 13:10:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyrPu-00000005DGb-0GpZ;
	Sat, 07 Mar 2026 13:10:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1AA6560053;
	Sat,  7 Mar 2026 13:10:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E2B3C2BC86;
	Sat,  7 Mar 2026 13:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772889000;
	bh=CsR7XjNewZ3NQCE6y0mxkCJ0kBswMv6pLNJLWrjMwZM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YNkLqo07CG75uNpB+lKu0fcol5AQ8E38PYtLyeJfvza+M7BK1RH8aU5Wkmofi+53o
	 CV71xU0doe5AqxDLEdW2y/dQIV68ghcd+hE1M1kSpOnUHvc3C10S6EDbl0KY57xuX2
	 8E1kTYmlScQTCS/MIROUqAhrCfC+BXoy+as390MJhdnJFhdYb7xFH8Gic/TneVkNuc
	 exXfmc45w0gjvthhtII9dbcgN5pv6aMv4MWX/wC9wGN7lsocFQVM+AmWSvwaesv14Z
	 C1pNTPDTiKS5eoACKvXx0xPuhATiUX3ynfKe8cI5TPBgsNU4AU/3M0UzrBGMOs8uiE
	 8lOlKl573/kdQ==
Date: Sat, 7 Mar 2026 14:09:58 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: linusw@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, bartosz.golaszewski@oss.qualcomm.com, afaerber@suse.com, 
	james.tai@realtek.com, cy.huang@realtek.com, stanley_chang@realtek.com, 
	tychang@realtek.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-realtek-soc@lists.infradead.org
Subject: Re: [PATCH v2 11/14] dt-bindings: pinctrl: realtek: Add RTD1625
 pinctrl binding
Message-ID: <20260307-large-wondrous-coot-4f4ee7@quoll>
References: <20260306075244.1170399-1-eleanor.lin@realtek.com>
 <20260306075244.1170399-12-eleanor.lin@realtek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260306075244.1170399-12-eleanor.lin@realtek.com>
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

On Fri, Mar 06, 2026 at 03:52:41PM +0800, Yu-Chun Lin wrote:
> +      input-voltage-microvolt:
> +        description: |
> +          Select the input receiver voltage domain for the pin.
> +          Valid arguments are:
> +          - 1800000: 1.8V input logic level
> +          - 3300000: 3.3V input logic level
> +        enum: [1800000, 3300000]
> +
> +      drive-push-pull: true
> +
> +      power-source:
> +        description: |
> +          Valid arguments are described as below:
> +          0: power supply of 1.8V
> +          1: power supply of 3.3V
> +        enum: [0, 1]

Isn't this duplicating input-voltage-microvolt? Where do you use it in
the driver?

> +
> +      slew-rate:
> +        description: |
> +          Valid arguments are described as below:
> +            0: ~1ns falling time
> +            1: ~10ns falling time
> +            2: ~20ns falling time
> +            3: ~30ns falling time
> +        enum: [0, 1, 2, 3]

If you have specific values, why not using 1/10/20/30?

> +
> +      realtek,drive-strength-p:
> +        description: |
> +          Some of pins can be driven using the P-MOS and N-MOS transistor to
> +          achieve finer adjustments. The block-diagram representation is as
> +          follows:
> +                         VDD
> +                          |
> +                      ||--+
> +               +-----o||     P-MOS-FET
> +               |      ||--+
> +          IN --+          +----- out
> +               |      ||--+
> +               +------||     N-MOS-FET
> +                      ||--+
> +                          |
> +                         GND
> +          The driving strength of the P-MOS/N-MOS transistors impacts the
> +          waveform's rise/fall times. Greater driving strength results in
> +          shorter rise/fall times. Each P-MOS and N-MOS transistor offers
> +          8 configurable levels (0 to 7), with higher values indicating
> +          greater driving strength, contributing to achieving the desired
> +          speed.
> +
> +          The realtek,drive-strength-p is used to control the driving strength
> +          of the P-MOS output.
> +
> +          This value is not a simple count of transistors. Instead, it
> +          represents a weighted configuration. There is a base driving
> +          capability (even at value 0), and each bit adds a different weight to
> +          the total strength. The resulting current is non-linear and varies
> +          significantly based on the IO voltage (1.8V vs 3.3V) and the specific
> +          pad group.
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        minimum: 0
> +        maximum: 7
> +
> +      realtek,drive-strength-n:
> +        description: |
> +          Similar to the realtek,drive-strength-p, the realtek,drive-strength-n
> +          is used to control the driving strength of the N-MOS output.
> +
> +          This property uses the same weighted configuration logic where values
> +          0-7 represent non-linear strength adjustments rather than a transistor
> +          count.
> +
> +          Higher values indicate greater driving strength, resulting in shorter
> +          fall times.
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        minimum: 0
> +        maximum: 7
> +
> +      realtek,pulse-width-adjust:
> +        description: |
> +          An integer describing the level to adjust the output pulse width, it
> +          provides a fixed nanosecond-level adjustment to the rising/falling
> +          edges of an existing signal. It is used for Signal Integrity tuning
> +          (adding/subtracting delay to fine-tune the high/low duration), rather
> +          than generating a specific PWM frequency.
> +
> +          Valid arguments are described as below:
> +          0: 0ns
> +          2: + 0.25ns
> +          3: + 0.5ns
> +          4: -0.25ns
> +          5: -0.5ns
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        enum: [0, 2, 3, 4, 5]
> +
> +      realtek,high-vil-microvolt:
> +        description: |
> +          The threshold value for the input receiver's LOW recognition (VIL).
> +
> +          This property is used to address specific HDMI I2C compatibility
> +          issues where some sinks (TVs) have weak pull-down capabilities and
> +          fail to pull the bus voltage below the standard VIL threshold
> +          (~0.7V).
> +
> +          Setting this property to 1100000 (1.1V) enables a specialized input
> +          receiver mode that raises the effective VIL threshold to improve
> +          detection.
> +        enum: [1100000]
> +
> +    required:
> +      - pins
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    pinctrl@4e000 {
> +        compatible = "realtek,rtd1625-iso-pinctrl";
> +        reg = <0x4e000 0x130>;
> +
> +        emmc-hs200-pins {
> +            pins = "emmc_clk",
> +                   "emmc_cmd",
> +                   "emmc_data_0",
> +                   "emmc_data_1",
> +                   "emmc_data_2",
> +                   "emmc_data_3",
> +                   "emmc_data_4",
> +                   "emmc_data_5",
> +                   "emmc_data_6",
> +                   "emmc_data_7";
> +            function = "emmc";
> +            realtek,drive-strength-p = <0x2>;
> +            realtek,drive-strength-n = <0x2>;

These are not hex, but simple decimals

> +        };
> +
> +        i2c-0-pins {
> +            pins = "gpio_12",
> +                   "gpio_13";
> +            function = "i2c0";
> +            drive-strength = <4>;
> +        };
> +    };
> -- 
> 2.34.1
> 

