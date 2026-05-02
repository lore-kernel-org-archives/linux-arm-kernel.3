Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8228CD13DA
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 May 2026 20:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cEOoN52sZJgC6GBEUET4gzKRvynCeddAxhuKHpv+5jA=; b=Jbuf1OqGY+NDDe7rw07DWuyrFG
	p0W8/RBHwnNIpCDoqvaHpsYTLcb00tGmlIWHEiarCC6QOKVQyS98wtQJs8aM4lCm74DIc5NKRRGD+
	hh4sZT1xeN+MZ4mmkGiyVwr9o9zmRRkRT6lk5/8zRb7KnXvV/1WI7nRLh4w57vBfDrxbYjIA12NY4
	wGFO+MKNxxFeqo7JgUWhwzPtmGmTTcXLPu8P5b5mUhqYVqBAN0zEl41I/p1fDY+9d5JuEcfUuk+Nt
	hzert7gZjmZIB/ILv46viwoTF6Ien2zjUZEa9cQIhLgpKgRZ5Cf0lYMuxnBm68NRc4lK+kLCqGXHH
	fyz1C1uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJGwf-00000009eb7-2Q35;
	Sat, 02 May 2026 20:28:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJGwe-00000009ear-0Yyx
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 May 2026 20:28:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C193A60120;
	Sat,  2 May 2026 20:28:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B1DFC19425;
	Sat,  2 May 2026 20:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777753689;
	bh=wRbkd2E40k/miu3YkMKKA9nNsJMs+bJw1b3/I6M3AwQ=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=FqBPVkO9/xwN4v0u+LK9FbfjH2K6r1xvKXFhR9duvAGEKl28e8z+4K5s9mOo+7KyE
	 WdbrTfuuK2B5FI3Gl6cC/toMDCfucqCXv+bn1MnyfgIwzUmpfOROWpPNrhRqH6cCCS
	 W0X2NREQgwwaEgk39QOsHTRmkTf5X6htBTFEqqZEr3sVtdrp+cYGlaqMiOfKUVkqQT
	 jSfy/+4jwA21QUsdcg433JALfIVt2ixqBDFRdRUQJlH2fGauRxrXKV6h7KjjvKFbWM
	 ccGsPmVAVh0GwiqoDsNcldvGF3Dnqzpa7pWXmwBO6d99csCMdkT+k2sTWhnS3pIhD4
	 FJIQxUwaQt6Pw==
Date: Sat, 02 May 2026 15:28:06 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, devicetree@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260502185557.93061-2-marek.vasut+renesas@mailbox.org>
References: <20260502185557.93061-1-marek.vasut+renesas@mailbox.org>
 <20260502185557.93061-2-marek.vasut+renesas@mailbox.org>
Message-Id: <177775368688.2906489.15956699735661007768.robh@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: clock: renesas,cpg-clocks: Document
 ZT/ZTR trace clock on R-Mobile APE6
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


On Sat, 02 May 2026 20:55:42 +0200, Marek Vasut wrote:
> Document ZT trace bus and ZTR trace clock on the R-Mobile APE6.
> These clock supply the coresight tracing modules, PTM, TPIU,
> ETB and replicator. Without these clock, the coresight tracing
> can not be operated. While this does change the ABI, it does so
> by extending the existing clock-output-names, therefore if an
> old software is used with new DT, the coresight tracing parts
> will likely fail to probe, otherwise if new software is used
> with an old DT, there is no impact.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-clk@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
>  Documentation/devicetree/bindings/clock/renesas,cpg-clocks.yaml | 2 ++
>  include/dt-bindings/clock/r8a73a4-clock.h                       | 2 ++
>  2 files changed, 4 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/renesas,cpg-div6-clock.example.dtb: cpg_clocks@e6150000 (renesas,r8a73a4-cpg-clocks): clock-output-names: ['main', 'pll0', 'pll1', 'pll2', 'pll2s', 'pll2h', 'z', 'z2', 'i', 'm3', 'b', 'm1', 'm2', 'zx', 'zs', 'hp'] is too short
	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-clocks.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260502185557.93061-2-marek.vasut+renesas@mailbox.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


