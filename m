Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 930D3E9410C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Jan 2026 04:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uHh6bDXOTIDz9WvvIXUfBBt5MQ9GI1z2p0g222Ui0fw=; b=svCQq8V06bEuK+n8TTQkT3MuB1
	WZk8E3QBQNT1LLTuoyhrQqikoVA+tCpK4rL78hyuNpeYVLwu4pY3dum6ngMpS33A3FDpe8Gj621Tr
	J4rgnFesz697OpeUvNP9rorUktybxCbzSIIxFBzRpi7rqJvf95FNkGC8oHxuODlvV1B6QKkN/dpE5
	xnoR4kE53xU1EtZ2jb00KM3NB9RzI0oOmOqBCvM90rhVB9pUarerDpE93v6I2oNtjaVmxL9mftGG0
	F6/GbUxd5WPq6/qCAaC1HN9lZ0uO0YRu38MUwTcRlRIYaNr6DYGlG2jgN7slBFNj9p4idr/3xE+MC
	3iz9C7gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbANV-00000006auv-3XoT;
	Thu, 01 Jan 2026 04:33:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbANU-00000006aun-43g1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Jan 2026 04:33:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0601D60008;
	Thu,  1 Jan 2026 04:33:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AEBBC4CEF7;
	Thu,  1 Jan 2026 04:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767242015;
	bh=XZ4w/Kc4FdOkvCsMtWFzbaRmcHB4OD88H5KpnhVaOYw=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=sEXGRbjEzJuzOSLiBY6qmgBCMLQ6SFDPiPZaz9zGsgOuKgcPCKujTIRLWorxTzKtO
	 VX0adwldf3LVg6Pc7s+68dQskDzy5BEwnFkpd22iwDh50V/yPGp4pVdyoT+uEjB+P/
	 cXQPFp/DPHpNk6mLLl86aH7kSx7CCLZP+1nTWFwKfmOKAYFL1kGvjji4Y1JzSV6cWt
	 FzSrXyn9y53qZ1RYWze+O1jN0AuKBBLoygH6rpWh8zzbqTqH9oGrlqNemdkw7YJtj1
	 OluV9hr7jkAg22h3opa0ClAU/lN/ZdCF8jWHh+4g3sIi9heMmxUuXv3dHxdrr+eAaM
	 hYNah7CqOzgZg==
Date: Wed, 31 Dec 2025 22:33:34 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 romain.perier@gmail.com
To: Daniel Palmer <daniel@0x0f.com>
In-Reply-To: <20260101034306.1233091-2-daniel@0x0f.com>
References: <20260101034306.1233091-1-daniel@0x0f.com>
 <20260101034306.1233091-2-daniel@0x0f.com>
Message-Id: <176724201428.245927.50135278414047771.robh@kernel.org>
Subject: Re: [PATCH v2 1/8] dt-bindings: clk: mstar msc313 cpupll: Correct
 clock-cells value
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


On Thu, 01 Jan 2026 12:42:59 +0900, Daniel Palmer wrote:
> clock-cells should have been 0 and causes warnings when
> validating devicetrees.
> 
> Fix the value and fix the binding example.
> 
> Signed-off-by: Daniel Palmer <daniel@0x0f.com>
> ---
>  .../devicetree/bindings/clock/mstar,msc313-cpupll.yaml       | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Lexical error: Documentation/devicetree/bindings/clock/mstar,msc313-cpupll.example.dts:22.29-51 Unexpected 'MSTAR_MSC313_MPLL_DIV2'
FATAL ERROR: Syntax error parsing input tree
make[2]: *** [scripts/Makefile.dtbs:145: Documentation/devicetree/bindings/clock/mstar,msc313-cpupll.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1565: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260101034306.1233091-2-daniel@0x0f.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


