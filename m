Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB8AFD41D64
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 15:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g+3XQfRI8SlzMRRDqWRLgVwzexQuXrTAXKKfYG4pUFE=; b=FI88uuXJLef/uItFTtt1qMlVwa
	nIn2WYLoukAnDygavPPFBM7kjCFfRWRK8RDWlW1LKRlkbcfYFr1ScdFSOa/6aZKpmQaRzs53jOoIB
	40WR4naNZ6/ycJ9e4Vg4TP3LUP9+oWAQjZJ06KlqJZU//DsHLl7hc5Q7RnNZ5zUOdlXfPFQ6lZnu3
	IgTwlQPfdhKCX3lYHh2RQjdvNte2XmE0TdiyV2lUucKc45c134SxFrCb78XBn08ImwFYUXGwT4xkJ
	vZPARZ+lYV0iqyFEna9ATkqssmvv+XhrAM6tYhtqaM2flkuPFPOEtj2m8M8MqOA8aQs+tdWNkbLFs
	UERy4pyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTj3C-0000000GnTc-40rw;
	Thu, 11 Dec 2025 15:57:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTj3A-0000000GnSq-1zqV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 15:57:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 742BD419A7;
	Thu, 11 Dec 2025 15:57:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33A1BC4CEFB;
	Thu, 11 Dec 2025 15:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765468671;
	bh=aQN9YBZJ1/3TgzhE0vb1ucmDOVbahlZuL1in8B8rZXA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=esKifij/8dhYsEU8w1WyMNuXAVSlN23yCyZg9abVk+EvvGTJik0I6PaTapC6y6lgk
	 9DSN2eWrwg2PpNOnHvWhEH3b/ZgVGsLDmZXqcNrs0NeOlj+x9E0Wh+kGDDwu4CCF8F
	 4XYa/pUqW6wHxb/qBshR7WOIaLTh/0fnn7VoDOSwgWPdwJ8ErIcFxlduWvBivpoFn+
	 IpPjwCGfsiicFSRpmuICleEUojKPqGOGsf3xwCxxLR5+grBffvMpZEQXfSoGKBJmAc
	 +J/H0qT5EqY1z/AglqUXvyaokIxb2Evp3PrfGCq5FsRJG8aPW+KCfP75qCONvUrM3h
	 pXM6DvHSuCwXw==
Date: Thu, 11 Dec 2025 09:57:50 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: openbmc@lists.ozlabs.org, linux-crypto@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, Joel Stanley <joel@jms.id.au>, 
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-iio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, 
 linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>, Conor Dooley <conor+dt@kernel.org>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
In-Reply-To: <20251211-dev-dt-warnings-all-v1-16-21b18b9ada77@codeconstruct.com.au>
References: <20251211-dev-dt-warnings-all-v1-0-21b18b9ada77@codeconstruct.com.au>
 <20251211-dev-dt-warnings-all-v1-16-21b18b9ada77@codeconstruct.com.au>
Message-Id: <176546866713.1487167.4918701456595372928.robh@kernel.org>
Subject: Re: [PATCH RFC 16/16] dt-bindings: mfd: Document smp-memram node
 for AST2600 SCU
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_075752_563921_9E190A5D 
X-CRM114-Status: GOOD (  11.09  )
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


On Thu, 11 Dec 2025 17:45:58 +0900, Andrew Jeffery wrote:
> The platform initialisation code for the AST2600 implements the custom
> SMP bringup protocol, and searches for the relevant compatible. As a
> consequence, define the requisite node and the compatible string, which
> in-turn tidies up the dtb check results.
> 
> Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> ---
>  .../devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml    | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml:140:16: [error] string value is redundantly quoted with any quotes (quoted-strings)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20251211-dev-dt-warnings-all-v1-16-21b18b9ada77@codeconstruct.com.au

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


