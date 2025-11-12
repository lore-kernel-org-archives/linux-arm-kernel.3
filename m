Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB791CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 09:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q71rZ9UeKmgu5JEq75UURmEgxIbVNjm3j60lyU24avI=; b=XBRUDiyAFS9Tmiq6t4mCRpIhLv
	YhtfEAzP8yxD1kIdwJMQ6dHQ+e9YT1B9dw6JRQQM9I3AXxiC6aHJLrL4lyMdAPVMuc2EIpXs9/fEy
	ttHcip4GvZxhBx9x2WGSV3UUz6sDy8LaYH8TrIlATyd6ZMbrAIQBGlNvr+oN2WR8a3AQRvEWWTvVC
	FDv7DBR56h16z2yzQAGUpCwExrk+BQFF8A1HTa0KAS37ZrXlQonfdpvn3bngr8+PxOwQTpaYtORiY
	e/KzOeGgcW71KkixDRz8YlNh9mXUHHuTGulQTrb97kaGxv5rOpk0oHFRZL8efWXtv+EtCJC4zTkmp
	jr+speOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ7G0-00000008TV4-2Pxb;
	Wed, 12 Nov 2025 09:35:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ7Fx-00000008TUg-4BpZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 09:35:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ADB444407C;
	Wed, 12 Nov 2025 09:35:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BBD8C16AAE;
	Wed, 12 Nov 2025 09:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762940113;
	bh=IOdEi/7nm6gSBW15F/BMgBUX9SN7wqTjO+nYOESPGFQ=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=B4hiLWPdZ/fueJdOAr9IS/urlVJh7yN5P0kCLtBPV9aDAvSeV/XJeWkQB46RNUP2G
	 Pw/fPY5UyXbRDrb8qvfGG/b4EUiuugOKpmfPFPEJ/NYVE6gnsJj7zYeDENJFx2y33X
	 R1DpIfXpL6asKQAQyEL+oDd1N7u0I/C3dJ7/TOnEqhjaGOVPyp60ZzepvU00kQiXpE
	 DGsUQxTiAAOpspJtsnmTA6sHpzO6XsM+hmPLzVY8tTU4jBHYCCUQWbscl0oBvHYcOg
	 gdshp+3bFlgkmNtKYox2uuUVVbKjn7MP17FCTKLrrH9W4eLK6c/D3MD5pKqzTvGMvb
	 GaFFZOJlUuc1w==
Date: Wed, 12 Nov 2025 03:35:11 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, Nishanth Menon <nm@ti.com>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Santosh Shilimkar <ssantosh@kernel.org>, linux-kernel@vger.kernel.org, 
 Tero Kristo <kristo@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>
To: Anshul Dalal <anshuld@ti.com>
In-Reply-To: <20251112-k3_syscon_add_boot_mailboxes-v2-1-aebc1e47b391@ti.com>
References: <20251112-k3_syscon_add_boot_mailboxes-v2-0-aebc1e47b391@ti.com>
 <20251112-k3_syscon_add_boot_mailboxes-v2-1-aebc1e47b391@ti.com>
Message-Id: <176294011177.754689.174685485920424984.robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: keystone: add missing items
 to mboxes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_013514_060299_A9847385 
X-CRM114-Status: GOOD (  12.15  )
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


On Wed, 12 Nov 2025 14:00:53 +0530, Anshul Dalal wrote:
> The mailboxes for the ti,sci node were not documented, this patch adds
> the description for the two channel entries as per TI-SCI spec[1].
> 
> [1]:
> https://software-dl.ti.com/tisci/esd/latest/5_soc_doc/am65x/sec_proxy.html
> 
> Signed-off-by: Anshul Dalal <anshuld@ti.com>
> ---
>  Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml: properties:mboxes: 'oneOf' conditional failed, one must be fixed:
	False schema does not allow 2
	[{'description': 'RX thread'}, {'description': 'TX thread'}] is too long
	[{'description': 'RX thread'}, {'description': 'TX thread'}] is too short
	1 was expected
	hint: "minItems" is only needed if less than the "items" list length
	from schema $id: http://devicetree.org/meta-schemas/items.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251112-k3_syscon_add_boot_mailboxes-v2-1-aebc1e47b391@ti.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


