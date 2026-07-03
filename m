Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24FF5C44500
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 06:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u+9sMqB1r9beX3vNKFEtSUw8I/tCjyfUBR2Ob8T7vM8=; b=DC7Sdx7hVujDHEHaYJkIBbpbLU
	nJg6e+gFleRZ5IVJTjH6Nv7MGRXwCN8AC6gUVVx/BLa1IDYm72pu8SigyPkZS0J2+Wu2D6HCoN90y
	4AzTrPVe69fFltQzaTP2RfvkZ/oqgK0ah1JLm3KPV/eSNrF6iHThdgiXAqxfnnZVFRwfjxTPtXcDi
	KOS28jhhh+Tzx1CyBFEWJKtChTI7JXCgtMIY06bSgtKeT10l7dQO4ah0pUUHABlW9jc5sD/CdfClF
	T45mi3pG6wYSKw4iqsaAG+1xEQgeXKurbFmge0iFrFDDbur4k+xZcqnYH5PCTYpzO85jQcTxYS5Xo
	yRgDK5lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfWzr-000000067rF-1cZl;
	Fri, 03 Jul 2026 06:03:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfWzp-000000067pv-2JMP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 06:03:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E4A0A411E5;
	Fri,  3 Jul 2026 06:03:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F5C41F00A3D;
	Fri,  3 Jul 2026 06:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783058608;
	bh=u+9sMqB1r9beX3vNKFEtSUw8I/tCjyfUBR2Ob8T7vM8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VbzJILclvc1144vvtNYuDfQOGLwOuF1pvQ5GY4HLqVgnXBEGYLBfZu4eQCCCp23GJ
	 6yIebnBefO5vw+jPXXXK/dMPntBQsvREOC4TVwHMFr6p15sRxb0nXMnVaijkYDe94v
	 40M6ymWYkaJelpxd2VE7YGqWkABZxpV60uDjHuvb1tJpSuzUa4YtSlAp+cm1Pphz6g
	 O1zwICQvg8fKjZxcXW15Kea8EFPHXtPLC98r4fWry5as1HxhHnt6f5pS71ZXMJHA5R
	 DOLavsGoo7w9JIC4BQKed0fI4iCF/QEgyYsW+XMSJ1SEhqev0s0mkVAdFY10c+01Wv
	 w2EstqTSwpaBQ==
Date: Fri, 3 Jul 2026 08:03:25 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Stefan =?utf-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Brian Masney <bmasney@redhat.com>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 01/12] dt-bindings: soc: zte: Add zx297520v3 top clock
 and reset bindings
Message-ID: <20260703-dynamic-bronze-buffalo-37eac5@quoll>
References: <20260702-zx29clk-v6-0-377b704f80c4@gmail.com>
 <20260702-zx29clk-v6-1-377b704f80c4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260702-zx29clk-v6-1-377b704f80c4@gmail.com>
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

On Thu, Jul 02, 2026 at 11:27:56PM +0300, Stefan D=C3=B6singer wrote:
> +maintainers:
> +  - Stefan D=C3=B6singer <stefandoesinger@gmail.com>
> +
> +description: |
> +  The zx297520v3's top clock and reset controller generates clocks for c=
ore
> +  devices on the board like the main bus, USB and timers. In addition to=
 clocks
> +  it has reset controls for peripherals, a global board reset, watchdog =
reset
> +  controls and a USB status register.
> +
> +  The controller has two clock inputs: a 26 MHz and a 32 KHz external
> +  oscillator. They need to be provided as input clocks. The controller p=
rovides
> +  clocks to the downstream Matrix clock controller.
> +
> +  All available clocks are defined as preprocessor macros in the
> +  'dt-bindings/clock/zte,zx297520v3-clk.h' header. The resets are define=
d in the
> +  'dt-bindings/reset/zte,zx297520v3-reset.h' header.

Use full paths (include/...), so these could be validated by tooling.


> +
> +properties:
> +  compatible:
> +    items:
> +      - const: zte,zx297520v3-topcrm
> +      - const: syscon
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: 26 MHz external oscillator
> +      - description: 32 KHz external oscillator
> +
> +  clock-names:
> +    items:
> +      - const: osc26m
> +      - const: osc32k
> +
> +  "#clock-cells":
> +    const: 1
> +
> +  "#reset-cells":
> +    const: 1
> +
> +  syscon-reboot:
> +    type: object
> +    $ref: /schemas/power/reset/syscon-reboot.yaml#

Missing: unevaluatedProperties: false

> +    description:
> +      Reboot method for the SoC.
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - '#clock-cells'

Use consistent quotes, either ' or "

Best regards,
Krzysztof


