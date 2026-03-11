Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9BEBFD88D4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 01:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lexEAC5hyuR1XlUd2ruEzCIAIMEjbmLPifoHr5R//EA=; b=a2JjtRkTKx7d8aZuVfsoWEcaA/
	BgW01LPHBknCZcZQaxT4xUcS+/fiYVCAnTo9AJtyhJGDRmxz9/pNNCQaQEkySRs2ByVM8VGAeIBtC
	JQw18OJGEeZ2wtsZfcXQ945/9iz79FYLOIL9z7ymezpKSnOKNRRnuCcU1eGZkhN0PhDfnOokWJNMb
	79S2D69pvxILSRjl9PvWY0+pjf0j8Dc14JS3hn1f8ngzh1DnGHz2LXtj/JDBtikfljzB61G0hVs2K
	R5MIeQ7LbQqYhLEmb5DewByMgLmzd9uzrosTC7L+1dPCsWOJ7l9bkNT2PutHb/Ijua7whqbUconQw
	SzjeniQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w08Wm-0000000AVUq-02Ue;
	Wed, 11 Mar 2026 01:38:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w08Wj-0000000AVU6-2Hj7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 01:38:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CE8EE41A4F;
	Wed, 11 Mar 2026 01:38:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 993F9C19423;
	Wed, 11 Mar 2026 01:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773193100;
	bh=UBeBF6mzG/vlU5u+j5s0y+zmS6JjgSgmbq5KzdOAAvU=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=aYk6EcFBs6HpNfDb/WTBzLlsewnnduPZguJm5+6dG7Bh7thlqMy2Yt+cYSzxuiNph
	 KnXcOtra2ZSKRl+ZRzpOWcLoY8j/KdpNqumpKLEs3MA4ONJMoo1wqez4cMKvX4k0qi
	 saf+5/xRQz0zM/ZHiXhm3yewhUMEpJgXtpf/3BPRIc+56N+IVf1t4Z/Bps3c0+nQwT
	 X/QOWL9OKuuGeGUGe2Cryq+DlmqkET1Czouu41EEzzLUb/vYo+PGJAzpwDN/e2cIVU
	 GE2E8tYMwRh4yGUyspJfiQs0VqJKtZ6O8bzTSmgcMMlktfKBRITDTkNpXhbyHA5mx4
	 5LRKu52aTmvhg==
Date: Tue, 10 Mar 2026 20:38:19 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-pm@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org, 
 arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org
To: "Kevin Hilman (TI)" <khilman@baylibre.com>
In-Reply-To: <20260310-topic-lpm-pmdomain-child-ids-v1-1-5361687a18ff@baylibre.com>
References: <20260310-topic-lpm-pmdomain-child-ids-v1-0-5361687a18ff@baylibre.com>
 <20260310-topic-lpm-pmdomain-child-ids-v1-1-5361687a18ff@baylibre.com>
Message-Id: <177319309976.1426147.15580608651927678828.robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: power: Add power-domains-child-ids
 property
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_183821_631700_63114B4E 
X-CRM114-Status: GOOD (  13.50  )
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


On Tue, 10 Mar 2026 17:19:23 -0700, Kevin Hilman (TI) wrote:
> Add binding documentation for the new power-domains-child-ids property,
> which works in conjunction with the existing power-domains property to
> establish parent-child relationships between a multi-domain power domain
> provider and external parent domains.
> 
> Each element in the uint32 array identifies the child domain
> ID (index) within the provider that should be made a child domain of
> the corresponding phandle entry in power-domains. The two arrays must
> have the same number of elements.
> 
> Signed-off-by: Kevin Hilman (TI) <khilman@baylibre.com>
> ---
>  Documentation/devicetree/bindings/power/power-domain.yaml | 35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/power/power-domain.example.dts:136.13-26: Warning (reg_format): /example-3/protocol@11:reg: property has invalid length (4 bytes) (#address-cells == 1, #size-cells == 1)
Documentation/devicetree/bindings/power/power-domain.example.dtb: Warning (pci_device_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/power/power-domain.example.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/power/power-domain.example.dtb: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/power/power-domain.example.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/power/power-domain.example.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260310-topic-lpm-pmdomain-child-ids-v1-1-5361687a18ff@baylibre.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


