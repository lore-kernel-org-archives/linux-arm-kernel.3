Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25A49C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 02:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qxT6Nt1Q04hkagtvfdHeoGmiPJWJ7RAPJ/r0KBiCRq0=; b=gMXKgOI8Ez9CwnVGjHYpOHvQuK
	fyri5WH9aFJGC5oPldrHSzr+wE0wbs2wJMFMYcpsvkzOpTMp0qXGI03LqfQvrf3atlNl+Q10uRCkU
	RmyyfMOzx6Jlv519ZEtB+zVJyUNtiKrq4XNMGxaUxHYUWUFgXofLn6ZNtgaOepu9doMH39FwcEO5Z
	d40Q/OTK1Wm3iiw6x7txhtzjnyDEax8CtGRsKgrREH3i2qewip8tSEfma1SpqV9h+/9QAykK7OYDe
	hjMWtchO8UaHyYOY1KoH0WY3PY0Sy6VFtfFRBGTHtH0cnxGC3AjhcWoeEq+BXnyJLTvIZ3zNf03hk
	ZbtZDlKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOonY-00000005e9p-1iqg;
	Tue, 10 Jun 2025 02:33:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOolQ-00000005e22-3KKz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 02:31:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A06A6614E0;
	Tue, 10 Jun 2025 02:30:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14B1BC4CEEB;
	Tue, 10 Jun 2025 02:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749522659;
	bh=MF9eFED5nRvQBjnkQkaYBoOXrlZbPXE3oEhI6hM3hIM=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=QtPCtTdAWiYNrWfnLL1Egie323Tgg630GTtlhtKZVSX9uBqa1Gr88E9RsbxDT91td
	 g8N2E1mXP6KQ3i2S6j5SfrRj0MaXKnbtvuE83BlJUxGGpTiVbnl2rxiJMDCs4KEyTx
	 8GoA9PljkQes7HFBNnlOgpA+P9Osn1lcp/7BumzmdOTDsooqKlOoMYKrU0N+NtBleL
	 XDFNcpnclJnjOq5Ft8al8OYLgep4MJTJBH3B1r74QqveEOOgVHBzBa3R7cBj3KbHtg
	 aOW4kofCS51lkO8XkZR1GLTWMCjnZ4wICUfyW4BwQFGxs5B6ZFfvE6OYVB/idqhdt2
	 m/aI3IhosKoyA==
Date: Mon, 09 Jun 2025 21:30:57 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: edumazet@google.com, netdev@vger.kernel.org, 
 linux-aspeed@lists.ozlabs.org, mturquette@baylibre.com, 
 BMC-SW@aspeedtech.com, linux-kernel@vger.kernel.org, kuba@kernel.org, 
 krzk+dt@kernel.org, p.zabel@pengutronix.de, sboyd@kernel.org, 
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 davem@davemloft.net, conor+dt@kernel.org, joel@jms.id.au, 
 andrew+netdev@lunn.ch, devicetree@vger.kernel.org, pabeni@redhat.com, 
 andrew@codeconstruct.com.au
To: Jacky Chou <jacky_chou@aspeedtech.com>
In-Reply-To: <20250610012406.3703769-2-jacky_chou@aspeedtech.com>
References: <20250610012406.3703769-1-jacky_chou@aspeedtech.com>
 <20250610012406.3703769-2-jacky_chou@aspeedtech.com>
Message-Id: <174952265793.3644019.286629373000016480.robh@kernel.org>
Subject: Re: [net-next v2 1/4] dt-bindings: net: ftgmac100: Add resets
 property
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


On Tue, 10 Jun 2025 09:24:03 +0800, Jacky Chou wrote:
> Add optional resets property for Aspeed SoCs to reset the MAC and
> RGMII/RMII.
> 
> Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
> ---
>  .../bindings/net/faraday,ftgmac100.yaml       | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml:82:1: [error] duplication of key "allOf" in mapping (key-duplicates)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml: ignoring, error parsing file
./Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml:82:1: found duplicate key "allOf" with value "[]" (original value: "[]")
make[2]: *** Deleting file 'Documentation/devicetree/bindings/net/faraday,ftgmac100.example.dts'
Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml:82:1: found duplicate key "allOf" with value "[]" (original value: "[]")
make[2]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/net/faraday,ftgmac100.example.dts] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1519: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250610012406.3703769-2-jacky_chou@aspeedtech.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


