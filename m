Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D3F7C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 23:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fkd2ldu8Q+I83pCYGrDPmhHubIpf74AgImw0zrqtu7Y=; b=UGrplp+oiC0tbCs2cKG0AJiUDr
	ED0l/rYsD4KcWB8e4yqq34xnl+Rih9hPemLz9fKjTUaYoOP+Lk8xsNYilWnn1EtW7yHi2FoTl/vsT
	WIn11LUH2b2aqNIBUZrc9GXAcOahB4/vsOHWbFTg7csgdnGlKesyqD1qEKeEcx9grUd4IOs1l+BaT
	dBay8UizWtNBq6oLOl5eAJHwyOw8xZ18UdAqMIur7fnbxW4VNRHTXc1b39SKERPFZn9RdVFnVa5yO
	QRyQolmTpuAbhzwgWmk6mclGZ4XCMGQBZHAG04irftZR01YyjmBa/VF/HbBfFVsGiYlkWHL5+JaOo
	IhcgTFkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubp7A-00000006PTQ-47rR;
	Tue, 15 Jul 2025 23:31:13 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubp4j-00000006PJR-1vTx;
	Tue, 15 Jul 2025 23:28:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 92748A57294;
	Tue, 15 Jul 2025 23:28:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BFDCC4CEE3;
	Tue, 15 Jul 2025 23:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752622120;
	bh=KyPnLxCQanvEcVHmi+5itxw/D0+fsHEbld35/w59fLQ=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=XAIkGsPyjcQ6Pvc5PUhmeJ21NBrlX7JTvq1l+YEI5nV0/V+8Y6bBzobpBZlmp/LN0
	 WH/xQsRKt8+JcEO3pSK3kCrtRfqf0HAe9cKKm3HFw29I2QeqpyFbSUeY4fVkRgALA+
	 v8GxKL9hZku9yzon7676VRTQ8Evq5BWSxmn7dxBS1o4pa5CcW+gpAu43XCLa9AbHw4
	 P6X9SCvL7xIIQixJL6wbxJVjBSmeCPBkTb0i2GRYcYctOV187F2hi5foR4xSjB9Vy3
	 AMw95fsEfpwKrT+DgtAlz1BnzsPUIDUPwbCIz8iwZoLOPvJQYaHGKHY5rak9ce3dv1
	 oAxsG8WCPKBtQ==
Date: Tue, 15 Jul 2025 18:28:39 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux-mediatek@lists.infradead.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Conor Dooley <conor+dt@kernel.org>
To: Arseniy Velikanov <me@adomerle.pw>
In-Reply-To: <20250715222221.29406-1-me@adomerle.pw>
References: <20250715222221.29406-1-me@adomerle.pw>
Message-Id: <175262211911.2439655.2970589940654906363.robh@kernel.org>
Subject: Re: [PATCH v1 1/2] dt-bindings: clock: mediatek: Describe MT6789
 clock controllers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_162841_564176_83126A6F 
X-CRM114-Status: GOOD (  11.11  )
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


On Wed, 16 Jul 2025 02:22:20 +0400, Arseniy Velikanov wrote:
> Add new bindings for system clocks and functional clocks on
> MediaTek MT6789.
> 
> Signed-off-by: Arseniy Velikanov <me@adomerle.pw>
> ---
>  .../bindings/clock/mediatek,mt6789-clock.yaml | 142 +++++++
>  .../clock/mediatek,mt6789-sys-clock.yaml      |  68 +++
>  .../dt-bindings/clock/mediatek,mt6789-clk.h   | 390 ++++++++++++++++++
>  .../reset/mediatek,mt6789-resets.h            |  15 +
>  4 files changed, 615 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt6789-clock.yaml
>  create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt6789-sys-clock.yaml
>  create mode 100644 include/dt-bindings/clock/mediatek,mt6789-clk.h
>  create mode 100644 include/dt-bindings/reset/mediatek,mt6789-resets.h
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/clock/mediatek,mt6789-sys-clock.example.dtb: /example-2/syscon@10001000: failed to match any schema with compatible: ['mt6789-infracfg-ao', 'syscon']
Documentation/devicetree/bindings/clock/mediatek,mt6789-clock.example.dtb: /example-4/clock-controller@11f01000: failed to match any schema with compatible: ['mediatek,mt6789-imp-iic-wrap-n']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250715222221.29406-1-me@adomerle.pw

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


