Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F376CD6E5D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 04:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hfuoa9jIuBFMW7E7dnxe8T1BD0cJPfKif5I8kRk0YR8=; b=0qPY7LmhinbdIAUC8wwrgm3y5d
	rf490OL+yRe7QnB3FVb57I8x+PpQbvq1L4IqxNLnlXDiBrjBatc+598BJNNUePiWmug2QjmujWw/l
	0IojYoGroad/X3+DgQpnLs/HDx3BHd7n4Npt/f5m+kVK+pR8dafs7C4OuqemtHSMRCa3hXsHWPuK5
	X2XtgXJiIkfzK+63RzYFQWYLviQbUZddB7MBwl85JWhaq67pSXvajE/51X1kg+yiO8DWmQdKXj6lB
	EeyEYHtgSTAj6NemNZkF3hzz8OKqyU5taibFYGfMHBB7v5mFb4svF4gX8uSTINTzdyNQyUT5xHGf2
	HSZpOlrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVMME-000000004nh-0iMa;
	Fri, 05 Jun 2026 04:40:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVMMB-000000004nY-3aBS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 04:40:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 815C260052;
	Fri,  5 Jun 2026 04:40:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EDED1F00898;
	Fri,  5 Jun 2026 04:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780634429;
	bh=Hfuoa9jIuBFMW7E7dnxe8T1BD0cJPfKif5I8kRk0YR8=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=kKvmEULJ7k4W6M7l2R2DdTfBcWiv0oeOJHdyQ8wtW/gqxZP73gQj+0tC3Svu9Os3j
	 Q/Qv/P2Gcq854KBftl+pLJ/1Q2v1sa1usPXvsytOoiDExeIqcXtbNBboJnkXlEOJTS
	 zYH4reXji8g1GXsXRgZ4WIKxQkGn2IV4Kpv8niLVc9r5gS847CUZH5W9kBw87mbcU0
	 Wm5JcEo0lSdnp8lQb+6e5VO7nZ+fZzoI1Ifz01jzEgreWORC9X/CazoozwFsK1OTYU
	 KSrbMbon3ACLkL1RI0YskPiJ9VtAB7/Uf+uZsgbtNI3f4HQK34I8LgyZ1cqBaTJPRj
	 f9XssrQ3bO4cQ==
Date: Thu, 04 Jun 2026 23:40:28 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: krzk+dt@kernel.org, cix-kernel-upstream@cixtech.com, sboyd@kernel.org, 
 conor+dt@kernel.org, mturquette@baylibre.com, bmasney@redhat.com, 
 devicetree@vger.kernel.org, p.zabel@pengutronix.de, gary.yang@cixtech.com, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org
To: joakim.zhang@cixtech.com
In-Reply-To: <20260605032225.523669-2-joakim.zhang@cixtech.com>
References: <20260605032225.523669-1-joakim.zhang@cixtech.com>
 <20260605032225.523669-2-joakim.zhang@cixtech.com>
Message-Id: <178063442819.2077907.17839637858773523685.robh@kernel.org>
Subject: Re: [PATCH v2 1/5] dt-bindings: soc: cix,sky1-system-control: add
 audss system control
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


On Fri, 05 Jun 2026 11:22:21 +0800, joakim.zhang@cixtech.com wrote:
> From: Joakim Zhang <joakim.zhang@cixtech.com>
> 
> The Cix Sky1 Audio Subsystem (AUDSS) groups audio-related clock, reset
> and control registers in a dedicated CRU block. Software reset lines are
> exposed on the syscon parent via #reset-cells, following the same model
> as the existing Sky1 FCH and S5 system control bindings.
> 
> Add the cix,sky1-audss-system-control compatible to
> cix,sky1-system-control.yaml for the MFD/syscon parent node, and define
> AUDSS software reset indices in
> include/dt-bindings/reset/cix,sky1-audss-system-control.h for I2S, HDA,
> DMAC, mailbox, watchdog and timer blocks.
> 
> Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
> ---
>  .../soc/cix/cix,sky1-system-control.yaml      | 39 ++++++++++++++++---
>  .../reset/cix,sky1-audss-system-control.h     | 27 +++++++++++++
>  2 files changed, 61 insertions(+), 5 deletions(-)
>  create mode 100644 include/dt-bindings/reset/cix,sky1-audss-system-control.h
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/cix/cix,sky1-system-control.yaml: Unresolvable reference: /schemas/clock/cix,sky1-audss-clock.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/cix/cix,sky1-system-control.example.dtb: system-controller@7110000 (cix,sky1-audss-system-control): clock-controller: False schema does not allow {'compatible': ['cix,sky1-audss-clock'], 'power-domains': [[4294967295, 0]], '#clock-cells': 1, 'clocks': [[4294967295, 0], [4294967295, 1], [4294967295, 2], [4294967295, 3], [4294967295, 4], [4294967295, 5]], 'clock-names': ['audio_clk0', 'audio_clk1', 'audio_clk2', 'audio_clk3', 'audio_clk4', 'audio_clk5'], 'resets': [[4294967295, 0]]}
	from schema $id: http://devicetree.org/schemas/soc/cix/cix,sky1-system-control.yaml
Documentation/devicetree/bindings/soc/cix/cix,sky1-system-control.example.dtb: /example-1/system-controller@7110000/clock-controller: failed to match any schema with compatible: ['cix,sky1-audss-clock']

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260605032225.523669-2-joakim.zhang@cixtech.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


