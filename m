Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D112FCCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 12:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mNOOJCB8albSnOy2PW8ozy7g2ecjY5FgeI9tcxPt244=; b=VsfVbQcAnHnR8EM2KlpQ2ZccBo
	6ukIw/zohaRwxeBvaexRPZfeBvd99rTgjLBSY9ah7J0Yl+WigULdfDCHpXx+jbKN4OrM3E56wkxKr
	TV8q6mr/nOc8xYxAMBGOg871i6a4FJ/aLNwWdUY4RWzauZlktftjfuJgnzCLoxNVjxQLZgOWb4hKw
	YohH3JDLKMIDCatd6yIDLf8Oyb0crm7zTfFtQzEzihFWpCXFJ26d1Xu6zvcMJiuoSwz+h7kFtQEnt
	1LWd+p9pnXaAFR993dgpUJUbFOuzSZOCSXtBb5AKyrYh/8GzD3JK4GN/+5Wx+rThuEa5Nk88ASX45
	ixdNUA/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIR1q-00000005PPf-21BK;
	Mon, 10 Nov 2025 12:29:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIR1n-00000005POs-45OR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 12:29:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AAC4F443AA;
	Mon, 10 Nov 2025 12:29:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 384CFC16AAE;
	Mon, 10 Nov 2025 12:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762777785;
	bh=CHqHQvKuqRvxJRHlw0G9YM2cvk8+dDccmko+WcI99KA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Vojs3Ny7+r1bvs7xTzB+Em17tnHg4ejqwiAsKUBRNYBKq2ESJ8HM7869IXkyne2Ic
	 kQYYlyBmu1zFWRa+XAKfg+syhhn8K7Ke/Aot2v11KTSHp0E+iUNBkh4cD9IDovyqLm
	 I3qy+942BJ+DIqcDZ5xo75PyknQcArDRNJRFGjwoGZrHJkkyzGqNWYn6yS5v1Sfu+F
	 T3edgQ6vZ1QXPQogA+ippFN1frbOwGnby77b3KjRDBEAT/mjKLLSmsiCAn4JPUwmez
	 yfrUUnoHWOXIgAiE4QYBaHHoDbQ7usE/VbAQ4+F+cBaKnNnNbymnEDKXE29apneaw/
	 xxSWFOH6NdReg==
Date: Mon, 10 Nov 2025 06:29:43 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>, netdev@vger.kernel.org, 
 Andrew Lunn <andrew+netdev@lunn.ch>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 taoren@meta.com, Po-Yu Chuang <ratbert@faraday-tech.com>, 
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-aspeed@lists.ozlabs.org
To: Jacky Chou <jacky_chou@aspeedtech.com>
In-Reply-To: <20251110-rgmii_delay_2600-v4-1-5cad32c766f7@aspeedtech.com>
References: <20251110-rgmii_delay_2600-v4-0-5cad32c766f7@aspeedtech.com>
 <20251110-rgmii_delay_2600-v4-1-5cad32c766f7@aspeedtech.com>
Message-Id: <176277778351.3693581.6347765163045847296.robh@kernel.org>
Subject: Re: [PATCH net-next v4 1/4] dt-bindings: net: ftgmac100: Add delay
 properties for AST2600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_042948_055426_4A70AC7D 
X-CRM114-Status: GOOD (  19.45  )
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


On Mon, 10 Nov 2025 19:09:25 +0800, Jacky Chou wrote:
> The AST2600 contains two dies, each with its own MAC, and these MACs
> require different delay configurations.
> Previously, these delay values were configured during the bootloader
> stage rather than in the driver. This change introduces the use of the
> standard properties defined in ethernet-controller.yaml to configure
> the delay values directly in the driver.
> 
> Add the new property, "aspeed,rgmii-delay-ps", to specify per step of
> RGMII delay in different MACs. And for Aspeed platform, the total steps
> of RGMII delay configuraion is 32 steps, so the total delay is
> "apseed,rgmii-delay-ps' * 32.
> Default delay values are declared so that tx-internal-delay-ps and
> rx-internal-delay-ps become optional. If these properties are not present,
> the driver will use the default values instead.
> Add conditional schema constraints for Aspeed AST2600 MAC controllers:
> - For MAC0/1, aspeed,rgmii-delay-ps property is 45 ps
> - For MAC2/3, aspeed,rgmii-delay-ps property is 250 ps
> - Both require the "aspeed,scu" and "aspeed,rgmii-delay-ps" properties.
> Other compatible values remain unrestricted.
> 
> Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
> ---
>  .../devicetree/bindings/net/faraday,ftgmac100.yaml | 35 ++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml: properties:aspeed,rgmii-delay-ps: 'anyOf' conditional failed, one must be fixed:
	'maxItems' is a required property
		hint: Only "maxItems" is required for a single entry if there are no constraints defined for the values.
	'type' is not one of ['maxItems', 'description', 'deprecated']
		hint: Only "maxItems" is required for a single entry if there are no constraints defined for the values.
	Additional properties are not allowed ('type' was unexpected)
		hint: Arrays must be described with a combination of minItems/maxItems/items
	'type' is not one of ['description', 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'multipleOf', 'default', '$ref', 'oneOf']
	hint: cell array properties must define how many entries and what the entries are when there is more than one entry.
	from schema $id: http://devicetree.org/meta-schemas/cell.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml: properties:aspeed,rgmii-delay-ps:type: 'integer' is not one of ['boolean', 'object']
	from schema $id: http://devicetree.org/meta-schemas/core.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251110-rgmii_delay_2600-v4-1-5cad32c766f7@aspeedtech.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


