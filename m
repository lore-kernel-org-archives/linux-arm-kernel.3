Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66F6AF33A60
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 13:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LSEeTtMR5yFcc5J1fevxXA18HiDgrnV7fUzhrfbJcE4=; b=AqFtEx2EFTtVu6rfDOTq9kirnX
	WvOuvP67g8txWNdC7uXtd2R9T/ELiPgP7f45fmQ3uXqJXr6gW8yUWI1lWIJ0JJED6f5s2lTdL9GgV
	6OE9C7jnhCG7yUVkdOascI4zzEWlndRughdfUm/c+iM2iDDLYvxe/zkIHi5ypYkrDM3AI2VC3Cjkk
	HmGUwCA6bH9rp62RMC+mLnDToEj8N3vu8yrZdsi7R+FqLUHd7BKTYfm89SqgtLZClz1XVw+PcQCOb
	vBZQyMv2rzetXp/Sk1A7eypDDxH6irgm6XB9WitU0yCuxxTXq3gcr/WoKHDvCOoQZbFhNTbIL2nT0
	Ks7EW99Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy918-00000001tqg-13GU;
	Thu, 05 Mar 2026 13:45:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy912-00000001to0-3v0d;
	Thu, 05 Mar 2026 13:45:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9B9B14452B;
	Thu,  5 Mar 2026 13:45:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F76BC116C6;
	Thu,  5 Mar 2026 13:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772718324;
	bh=cfwd3qIJwmG1wuBwTW5ybvjyz1eIJ+iRMnfvFs+2hdg=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=R/v3qqbduJEbLupxWE8fZTb/UX+dNWVPcPvZFAHZRU6FM6YXTXinqLyG0sGwv3ksq
	 swPJAVC8ECOibBcjy3A8xnEMnojp/njgVtqOsfLnLUi4lTF/wRUgx14MoW7mY2I3We
	 0ZuyNUp8fHzNM6+MqNvQKihly9AMg6zfTAgsb+K1g5+pCVgLLfoPD49cwK+R2UC9iP
	 sIcY7SqAob3eLScpS3gYrhe4h5+4dwwr3DskR63I2s2gcTnt2bA2rHmLkw+KhEbylL
	 F0hJ4Vt2K4i3grQnSnfqlNn8TjJgvnCjzzRHevDGrNyGZC5nD0uTZhPtfDIKKdmGFz
	 JImiDUYXXIeiA==
Date: Thu, 05 Mar 2026 07:45:23 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 linux-amlogic <linux-amlogic@lists.infradead.org>, 
 Stephen Boyd <sboyd@kernel.org>, Ronald Claveau <linux-kernel-dev@aliel.fr>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 linux-clk <linux-clk@vger.kernel.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 devicetree <devicetree@vger.kernel.org>, robh+dt <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Kevin Hilman <khilman@baylibre.com>
To: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <20260305074328.639993-3-jian.hu@amlogic.com>
References: <20260305074328.639993-1-jian.hu@amlogic.com>
 <20260305074328.639993-3-jian.hu@amlogic.com>
Message-Id: <177271832223.3486876.11276313304536737957.robh@kernel.org>
Subject: Re: [PATCH 2/3] dt-bindings: clock: amlogic: t7: Add missing mpll3
 parent clock
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_054524_990569_8E42FF57 
X-CRM114-Status: GOOD (  12.28  )
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


On Thu, 05 Mar 2026 15:43:26 +0800, Jian Hu wrote:
> The mpll3 clock is a valid parent clock for sd_emmc and mipi_isp on
> the Amlogic T7 SoC, but was missing from t7-peripherals-clkc.yaml.
> Add it to enable proper clock parent configuration for these peripherals.
> 
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> ---
>  .../bindings/clock/amlogic,t7-peripherals-clkc.yaml       | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/clock/amlogic,t7-peripherals-clkc.example.dts:40.26-27 syntax error
FATAL ERROR: Unable to parse input tree
make[2]: *** [scripts/Makefile.dtbs:140: Documentation/devicetree/bindings/clock/amlogic,t7-peripherals-clkc.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1597: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260305074328.639993-3-jian.hu@amlogic.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


