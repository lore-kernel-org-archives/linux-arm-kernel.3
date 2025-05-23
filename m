Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6DF0C54ED0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 15:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tH29RWPy6Jg9Fm79Q77eZw5Q/ePvzxXuRpSdiyKwTa8=; b=Fa3LvqJ9VJX804z6QbWDF2J+J/
	JxHkugQlKd+dUjj4K1+Kgfik6Bqu0KewN7mNjQojats8LknueczxxkljElnzGNNcEuRNGF2dvJRxD
	tB9557JMs9j9ESp+P0QWofs8Tecul7igUa4suQQUWD7XQRv0zOvmTDcOEpKWFlJzPOJua7ebfBMLw
	AgYtKiL6tmIYeXb5wMuql7Tsjf/5zY4pE+elcSQGsTW/2HPIJUc9MuIQOxKo+kUcIQwByoHPgvdKY
	gr19o45QdSDpMDZOhf9fefzY2viLdXRf+OXaMUQz6y/8vS+4opM11K2//q/U4/wW/CF1hzKJtMyx+
	64cLfUng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uITvi-00000004BWf-2gku;
	Fri, 23 May 2025 15:03:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uITJ1-000000043tz-3djb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 14:23:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8CF935C6420;
	Fri, 23 May 2025 14:21:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC8F2C4CEE9;
	Fri, 23 May 2025 14:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748010206;
	bh=pR9fA4NdXQryYOB0kCjJuwhWY+v7ZXFuSKqfZ1iPpXY=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=goAQq1FSEeTn60D4goiuky385GlbCKp/cuANcZdpE55R5AzKlNc2mfFQLVwjp5yP4
	 30ORao35sm4F03Mt0G9gMNE03eS7cQewA/JuuS8kM2wEbjRJ9gKWf4UH+gOD+maak8
	 i3d39A84sJfy4PIq7mXK9e0FawzTOMjcb3ZvbbCN2XRXj4IKW0ka84gGbfj2Hytw2L
	 z6jtmNQf9FfaULjoBABVQ4yU5BKGgBf649sKb+b/bMi5mZDlVsq4deWn+Swls0KjWz
	 2xl/z7rR0jCcTwFl1vGZMC/LCPieqc5w9YTxmELuJRMqi/euLqjqTDNuIbmm4CD13S
	 D5Py+xMQ78J8w==
Date: Fri, 23 May 2025 09:23:23 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Will Deacon <will@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
 linux-kernel@vger.kernel.org, Peter Griffin <peter.griffin@linaro.org>, 
 Dimitri Fedrau <dima.fedrau@gmail.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Sebastian Reichel <sre@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>
To: Thomas Antoine <t.antoine@uclouvain.be>
In-Reply-To: <20250523-b4-gs101_max77759_fg-v4-3-b49904e35a34@uclouvain.be>
References: <20250523-b4-gs101_max77759_fg-v4-0-b49904e35a34@uclouvain.be>
 <20250523-b4-gs101_max77759_fg-v4-3-b49904e35a34@uclouvain.be>
Message-Id: <174801020213.1711113.345093338339691791.robh@kernel.org>
Subject: Re: [PATCH v4 3/5] dt-bindings: power: supply: add max77759-fg
 flavor
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_072327_993493_B1FF6560 
X-CRM114-Status: GOOD (  19.05  )
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


On Fri, 23 May 2025 14:51:46 +0200, Thomas Antoine wrote:
> The Maxim MAX77759 is an IC used to manage the power supply of the battery
> and the USB-C. Based on drivers from google, it contains at least a PMIC,
> a fuel gauge, a TCPCI and a charger.
> 
> Use max77759-fg compatible to avoid conflict with drivers for other
> functions.
> 
> The Maxim MAX77759 has no non-volatile memory so it doesn't require an
> address and instead requires a value for the current sensing resistor.
> 
> Keep shunt-resistor-micro-ohms optional for the MAX17201/MAX17205 as it is
> not be used at the moment but could be in the future. (e.g. as a default
> value to be used in case of nvmem failure)
> 
> Signed-off-by: Thomas Antoine <t.antoine@uclouvain.be>
> ---
>  .../bindings/power/supply/maxim,max17201.yaml      | 42 ++++++++++++++++++++--
>  1 file changed, 39 insertions(+), 3 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/power/supply/maxim,max17201.yaml: properties:reg: {'items': [{'description': 'ModelGauge m5 registers'}, {'description': 'Nonvolatile registers'}], 'minItems': 1, 'maxItems': 2} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/power/supply/maxim,max17201.yaml: properties:reg-names: {'items': [{'const': 'm5'}, {'const': 'nvmem'}], 'minItems': 1, 'maxItems': 2} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250523-b4-gs101_max77759_fg-v4-3-b49904e35a34@uclouvain.be

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


