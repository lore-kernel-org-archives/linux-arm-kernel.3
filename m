Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D714FC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 21:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fecxeJ96Ydn5odjeLZtgE1nXc1UfHhefAWSFsy0LwoA=; b=obwSLHfQ/j7bT1EUlImykQZZQi
	o8bxwxuQPEXh9UR7cSECMGbmvWQEF55ZWFQ+LOB6aqZoKHfr57+mJ60rn0mYn9JY0YQAZWcxGQ1iL
	1dwBVVFWu6IOT1/uBGl2lQapHUKbRmIy0VFNUPZXBZmaDzc2ATUFBMmV3+RjRoUltLRLxHmf+At60
	eZX1EQRpmWEFswqOtTFRDhI7Iw/gUp0Ojzn6nHKos1wmQPql7mprrRlwYRmK465TkkJ5xWLFGq0pf
	z24r14TXd6/Dyk6kwKH9SoK8NWzN0nmh8wZhzJ600tjcyMDAfM4fmdh0eT55/xzEG4/QZyDwn2UlV
	aUdmhTVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhECR-00000002TNv-2va7;
	Wed, 30 Jul 2025 21:18:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhE5Y-00000002SY7-36n7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 21:11:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 705BF43CE9;
	Wed, 30 Jul 2025 21:11:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2041AC4CEE3;
	Wed, 30 Jul 2025 21:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753909912;
	bh=sFIpHKRKR7Q2Kj3ofVG6atyA9wvqpFYGRwPhKFIISFo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n3xABHcPFOX3yvig7wmxjCuJPhi6RshxouhCDUYXPm3K6kFZz8yT/qMOan4XHRzh8
	 gnHZ/FwNJiZkBmERRghPasQypZc8mRk7jASMb8Gi+qRcJQp06eIDLHe62Hc0ftkqQV
	 usOByMpMJJ/qTgGgcOA0oMF7S94yAncpaSzEaDUhIrIP0LfctdsGFUw7yj9sC8q6n2
	 aJiZjJ7+r/H1d51rWcYuVBBWfS5TP0CUPO6qIKHP+dElSAlSsO+EtUJzmL0kN/lUib
	 hglSWftmmXtsFcN1/9fWViL13nc9pcqqKxAxv+Ko7NPxEilIU/v88wQ6ffVblg7KrU
	 TETD/8/Y/SwOQ==
Date: Wed, 30 Jul 2025 16:11:51 -0500
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clement.legoffic@foss.st.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Gatien Chevallier <gatien.chevallier@foss.st.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Le Goffic <legoffic.clement@gmail.com>,
	Julius Werner <jwerner@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v5 06/20] dt-bindings: memory: introduce DDR4
Message-ID: <20250730211151.GA1749004-robh@kernel.org>
References: <20250728-ddrperfm-upstream-v5-0-03f1be8ad396@foss.st.com>
 <20250728-ddrperfm-upstream-v5-6-03f1be8ad396@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250728-ddrperfm-upstream-v5-6-03f1be8ad396@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_141152_800622_2776C9A6 
X-CRM114-Status: GOOD (  15.00  )
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

On Mon, Jul 28, 2025 at 05:29:37PM +0200, Clément Le Goffic wrote:
> Introduce JEDEC compliant DDR bindings, that use new memory-props binding.
> 
> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
> ---
>  .../memory-controllers/ddr/jedec,ddr4.yaml         | 34 ++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,ddr4.yaml b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,ddr4.yaml
> new file mode 100644
> index 000000000000..f457066a2f8b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,ddr4.yaml
> @@ -0,0 +1,34 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/memory-controllers/ddr/jedec,ddr4.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: DDR3 SDRAM compliant to JEDEC JESD79-4D
> +
> +maintainers:
> +  - Krzysztof Kozlowski <krzk@kernel.org>
> +
> +allOf:
> +  - $ref: jedec,sdram-props.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - pattern: "^ddr4-[0-9a-f]{2},[0-9a-f]{1}$"

Shouldn't this be 'jedec,ddr4-...'

> +      - const: jedec,ddr4
> +
> +required:
> +  - compatible
> +  - density
> +  - io-width
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    ddr {
> +        compatible = "ddr4-ff,f", "jedec,ddr4";
> +        density = <8192>;
> +        io-width = <8>;
> +    };
> 
> -- 
> 2.43.0
> 

