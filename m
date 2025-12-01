Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF2E1D116FC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 09:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fIHkRbuD/XzpYXZ5YtliOvQHBE1CDhm6lTByezmGMfI=; b=nr721Pc69nIP9zIFbbhCfA1vT8
	M3WkQgdUDJvkeTWDkEbPbP9zPz1JQKhJaJ4V7ticmifWgD9nBngalh87NJPujzZlN2S9Z8FNVKZF5
	CIlZE4xGwyakLRg7wfCYkUFVyU+kTvmLH6Mu8gD7GIh/xlsQ8i1XzR2uFiEFOEB+ttlgCZ8S3ujeh
	ngxKVcDfqmHib1XrFc3Ln/2alWC3PdiAgIf/r7EXe8I+D3Nj2L/BWe4+I0vvX9DYa7R76gOdEOG6n
	u0+rfICNDkx0R6wvnn1Xz6obE28DNbNIwRVlQc9Bh04rbiUOk4i/aVOtuDxZKmDcJYx5AkFVV7ep+
	AH6i7FKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ0Hy-00000003DRV-14cy;
	Mon, 01 Dec 2025 09:33:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ0Hw-00000003DQf-2hfg;
	Mon, 01 Dec 2025 09:33:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 19F4C60161;
	Mon,  1 Dec 2025 09:33:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2B41C116D0;
	Mon,  1 Dec 2025 09:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764581623;
	bh=0c3sOzXam8HtK2ztSwza5Qgcr0iR6X3PAGBLVoCko0s=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Z06CjSCxfBIW/9TNFXeotXUIm1zU9YjDpuc9jQoje+3bQhkBEEg6R3HGabIfscjzN
	 8DPzPvsWlesCINA01UkOcbUunafdpQ8BEAjp3zixxj4mMvMD9TPfo8ds0mcbgCVd3B
	 dRQ0XWc/huRxQuRIZZMgPxRsT9PNwhT2UEXE5bSSGUvSW8cjeZ1ghCBSYNLoQ+cM6Q
	 Kr8/PXIPMPYQ1ooUvFHNbIUaovkttj/U1vnKPr5WBBqbM0hxSZTLX1Fl5N/9rBE2WF
	 Kk3oZ+VNMd9ZluzMP61AecPo2P4gV+C20qAd/E3y30q7edss4wZ4YAjRacPhQp2WUT
	 KJ2UUJN9XofRA==
Date: Mon, 01 Dec 2025 03:33:42 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 matthias.bgg@gmail.com, linux-kernel@vger.kernel.org
To: Gary Bisson <bisson.gary@gmail.com>
In-Reply-To: <20251201084140.376058-3-bisson.gary@gmail.com>
References: <20251201084140.376058-1-bisson.gary@gmail.com>
 <20251201084140.376058-3-bisson.gary@gmail.com>
Message-Id: <176458161959.2489238.15712230014248139528.robh@kernel.org>
Subject: Re: [PATCH 2/5] dt-bindings: arm: mediatek: Add
 ezurio,mt8370-tungsten-smarc
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


On Mon, 01 Dec 2025 09:41:37 +0100, Gary Bisson wrote:
> Add device tree bindings support for the Ezurio Tungsten 510 (MT8370)
> SMARC SOM [1] + Universal SMARC carrier board [2].
> 
> [1] https://www.ezurio.com/product/tungsten510-smarc
> [2]
> https://www.ezurio.com/system-on-module/accessories/universal-smarc-carrier
> 
> Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
> ---
> Cc: robh@kernel.org
> Cc: krzk+dt@kernel.org
> Cc: conor+dt@kernel.org
> Cc: matthias.bgg@gmail.com
> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251201084140.376058-3-bisson.gary@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


