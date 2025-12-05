Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 768FED2F7EB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 12:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l4F7qYqLZeOCrE0lRTQguiPWaKCW91ggfPfoAAiaTBI=; b=GVk3kawn5y77mMBiZjKe7rxR9b
	O/ZsCmP7aCTnWis7uExzsIcRZ7l59aU7wG6hfe1b1Gmae9nNR1JZ+9hgiq5o0LIhU9o6/xuxegVdB
	pdr8agnw3sDuC5XUKeF9LyPKkUI+LImUx/lweWG4LZh8yWXdZ8irAneIhN7xs5WqExJHWsP6sH6ws
	71J9uJyS+H7oki+QIvdzu1pPLmr6s3Do6rPzPnDmpuxL6jrXUH8oJo+a6NKdBj9S+3Su9BtHvRErO
	w3O8LS0vXw3EtrRi7X1tqOOPMTdc5jPGO4jPNeMlTId/yjv50iDt6uPbZveEkO4G7rfX8HjAfBNy0
	RTU8uhdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRUyO-00000009TMQ-0uO9;
	Fri, 05 Dec 2025 12:31:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRUyL-00000009TLv-1tQn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 12:31:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CBD6B441D4;
	Fri,  5 Dec 2025 12:31:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73F46C4CEF1;
	Fri,  5 Dec 2025 12:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764937900;
	bh=+CRp8yynNybcaLkCmQEtMgcN2+GKbGVhIF5SJyTicA8=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=tXhIB5b0mw0rKTR8eoXzV6oxQnxEw/MzuhlOAvEmOsk57XOh9k4uL8rF2J6AUNVTV
	 ONYrWBrxjMW2IczWFxsNsRKQGPnHy3feKLHvqUNSEnpTMzBxQmaSSZf5gUEavb1z7R
	 V80WFmiCmR30pCYp4QIDFAynSg+HhDbeJJOFe6RStTj5YnYSWbjMfvMsRICH0a1WPl
	 09Lmc5z5Nq7NJMipN/9sVTRA8DqkwOqqfksHtnT9lbzeNPXPguuvgxrWmidL4WTw7O
	 Go5BUZBaiCmjrLBM8mY6Y2hUhHT8H/EaorozADDM1vSPz7yxX74eiz1ZWsTqMF8cfZ
	 O9F9pIJh7KlUA==
Date: Fri, 05 Dec 2025 06:31:37 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Joel Stanley <joel@jms.id.au>, devicetree@vger.kernel.org, 
 Billy Tsai <billy_tsai@aspeedtech.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-aspeed@lists.ozlabs.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org
To: Rebecca Cran <rebecca@bsdio.com>
In-Reply-To: <20251204210238.40742-4-rebecca@bsdio.com>
References: <20251204210238.40742-1-rebecca@bsdio.com>
 <20251204210238.40742-4-rebecca@bsdio.com>
Message-Id: <176493761251.3641290.13291920660908033862.robh@kernel.org>
Subject: Re: [PATCH v3 3/3] dt-bindings: hwmon: (aspeed,g5-pwm-tacho) Move
 info from txt to yaml
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_043141_525800_01BFC595 
X-CRM114-Status: GOOD (  15.34  )
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


On Thu, 04 Dec 2025 14:02:36 -0700, Rebecca Cran wrote:
> Move the documentation for the aspeed,ast2400-pwm-tacho and
> aspeed,ast2500-pwm-tacho devices from a text file to yaml file.
> 
> This allows for dts files containing these devices to be validated.
> 
> Where the text file documenation of required properties differ from the
> implementation, prefer the implementation and update the schema to
> match.
> 
> "#size-cells" was 1 but implementation is 0.
> "#cooling-cells" was marked as required but appears optional.
> 
> In the fan subnode, "cooling-levels" is optional according to the code
> in drivers/hwmon/aspeed-pwm-tacho.c.
> 
> Signed-off-by: Rebecca Cran <rebecca@bsdio.com>
> ---
>  Documentation/devicetree/bindings/hwmon/aspeed,pwm-tacho.yaml | 91 ++++++++++++++++++++
>  Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt  | 73 ----------------
>  2 files changed, 91 insertions(+), 73 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/hwmon/aspeed,pwm-tacho.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
 	 $id: http://devicetree.org/schemas/hwmon/aspeed,g5-pwm-tacho.yaml
 	file: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/hwmon/aspeed,pwm-tacho.yaml
cooling-levels: size (6) error for type uint32-array
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/hwmon/aspeed,pwm-tacho.example.dtb: pwmtachocontroller@1e786000 (aspeed,ast2500-pwm-tacho): '#cooling-cells' does not match any of the regexes: '^fan@[0-9]+$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/hwmon/aspeed,g5-pwm-tacho.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/hwmon/aspeed,pwm-tacho.example.dtb: pwmtachocontroller@1e786000 (aspeed,ast2500-pwm-tacho): fan@0:cooling-levels: b'}\x97\xb1\xcb\xe5\xff' is not of type 'array'
	from schema $id: http://devicetree.org/schemas/hwmon/aspeed,g5-pwm-tacho.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/hwmon/aspeed,pwm-tacho.example.dtb: fan@0: cooling-levels: b'}\x97\xb1\xcb\xe5\xff' is not of type 'object', 'integer', 'array', 'boolean', 'null'
	from schema $id: http://devicetree.org/schemas/dt-core.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251204210238.40742-4-rebecca@bsdio.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


