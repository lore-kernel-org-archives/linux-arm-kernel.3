Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F5C8C02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 16:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pCexijReCLDALyBYDT/wveBapsUoKXzsuwJVO6B+djg=; b=AnHNl8ogh6Fq2FaC1e0PdWXeiJ
	4G0a6pVLW3+gB3goks8C7ZeyJ3+sl15jAXp+Mr3yYSlajZDRKxIwfnZSJCn6SKlK9kDz9iQRtqEiy
	ls1VALH+C5KEevf0cwPvUCw0v3pO4gydRu5Cmeqq1i4iQH5L6RvXyEOSRCeMCJYkdxQ8wYi0r1nSX
	76BnmIn9y/pVxsgghcUNnTdFNSwGcIJupzghSVwlgctj/n5SaAlRluqn9Aown/Dh9KYX9rr4pNiKt
	TGtnSBljcFh8+nLqGvqJyxXOtC+vT7AL/SqKRFCPCgWuEVaRT6zqu9S+7YDGydWGnb4yvLsoxORBh
	Z2HI2bLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXMsh-00000005laF-0ga2;
	Mon, 13 Jan 2025 16:01:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXMKS-00000005cky-1zht
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 15:26:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 299B25C4C14;
	Mon, 13 Jan 2025 15:25:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA5F9C4CEE3;
	Mon, 13 Jan 2025 15:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736781971;
	bh=mgTx6aOYLPXtqcfI3g1VHKq5JpmA5YkehPbZVMZdgaY=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=dSDMpSA6C7sZPmyjE97Q3KaGNovHhACtHy3/gldzUUQqt9qeDYLvlneExcnp17wec
	 aGF6aHuF648gSUljdj7UGdneY2TzkuZUQKHYM23k6PZDdCIn24Jn5aw4QWm8CQw3uy
	 TcGDVNQLuJhTaTJnT1sOvQnROTcb1NfDd7PYRJzHz8uMUbUZLztdDoRvUERcE9Qu2k
	 zrpoeT4L4CMextWc8WgHGUmFXmO7lrc+92rsTeqV8o+nNyIf3MTkCKXv4sRlmgvx7k
	 YraJ4NYWaU9a6ffYM1hGo0tuEB3Imd/BikEWjpw71do+MOUdhBx7rBt4ideXfkwSK/
	 aWfifrReyTnpg==
Date: Mon, 13 Jan 2025 09:26:10 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-aspeed@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>, 
 devicetree@vger.kernel.org, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 linux-arm-kernel@lists.infradead.org, Patrick Williams <patrick@stwcx.xyz>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Potin Lai <potin.lai@quantatw.com>, 
 Conor Dooley <conor+dt@kernel.org>
To: Potin Lai <potin.lai.pt@gmail.com>
In-Reply-To: <20250113-potin-catalina-dts-update-20250102-v2-1-1725117fe7a9@gmail.com>
References: <20250113-potin-catalina-dts-update-20250102-v2-1-1725117fe7a9@gmail.com>
Message-Id: <173678161661.2153651.3945745286602645687.robh@kernel.org>
Subject: Re: [PATCH v2] ARM: dts: aspeed: catalina: Update DTS to support
 multiple PDB board sources
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_072612_602915_68365D77 
X-CRM114-Status: GOOD (  15.50  )
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


On Mon, 13 Jan 2025 14:16:23 +0800, Potin Lai wrote:
> This patch updates the Catalina device tree to support different sources
> of PDB boards.
> 
> Changes for Main source PDB board
> - Thermal Sensor Monitoring:
>   - Added IOB NIC nodes (TMP421) for thermal sensor monitoring.
>   - Added FIO remote thermal node (TMP75) for thermal sensor monitoring.
> - Fan Monitoring and Control:
>   - Add fan p12V power sensor node (MP5990) for sensor monitoring.
>   - Add fan controllers (MAX31790) for fan control and tach monitoring.
> 
> Changes for 2nd source PDB board
> - Fan Monitoring and Control:
>   - Added 2nd source fan controllers (NCT7363) for fan duty control and
>     tach monitoring.
> - Power Monitoring:
>   - Added 2nd source HSC nodes (XDP710) for power sensor monitoring.
> - Address Conflicts:
>   - Removed all ina238 nodes due to address conflicts. Moved the driver
>     probe for ina238 to userspace.
> 
> Changes for PDB brick board
> - Power Monitoring:
>   - Add delta brick nodes for power sensor monitoring.
> 
> Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
> ---
> Updating the Catalina DTS to support multiple PDB board sources.
> ---
> Changes in v2:
> - Add delta_brick nodes to support PDB brick board
> - Link to v1: https://lore.kernel.org/r/20250103-potin-catalina-dts-update-20250102-v1-1-b0b7a523c968@gmail.com
> ---
>  .../dts/aspeed/aspeed-bmc-facebook-catalina.dts    | 170 ++++++++++++++++++---
>  1 file changed, 147 insertions(+), 23 deletions(-)
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


New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/aspeed/' for 20250113-potin-catalina-dts-update-20250102-v2-1-1725117fe7a9@gmail.com:

arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@1,0/i2c@1800: failed to match any schema with compatible: ['ibm,fsi-i2c-master']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: /ahb/apb/display@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2600-gfx', 'syscon']
arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dtb: lpc@1e789000: lpc-snoop@90: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dtb: /ahb/apb/bus@1e78a000/i2c@100/i2c-mux@70/i2c@3/delta_brick@63: failed to match any schema with compatible: ['pmbus']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dtb: /ahb/apb/bus@1e78a000/i2c@100/i2c-mux@70/i2c@3/delta_brick@64: failed to match any schema with compatible: ['pmbus']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dtb: /ahb/apb/bus@1e78a000/i2c@100/i2c-mux@70/i2c@3/delta_brick@65: failed to match any schema with compatible: ['pmbus']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dtb: /ahb/apb/bus@1e78a000/i2c@100/i2c-mux@70/i2c@3/delta_brick@66: failed to match any schema with compatible: ['pmbus']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dtb: /ahb/apb/bus@1e78a000/i2c@100/i2c-mux@70/i2c@3/delta_brick@67: failed to match any schema with compatible: ['pmbus']
arch/arm/boot/dts/aspeed/aspeed-bmc-opp-nicole.dtb: /ahb/apb/display@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2500-gfx', 'syscon']
arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dtb: /ahb/apb/video@1e700000: failed to match any schema with compatible: ['aspeed,ast2600-video-engine']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dtb: /ahb/apb/display@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2600-gfx', 'syscon']






