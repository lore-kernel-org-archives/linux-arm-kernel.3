Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6D6EC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 10:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XURBkwfcJxZoqxhVQlJFP8gtLabU/vtRhWXMeh+LSYg=; b=IoZR+yR8KoL4DJ2cf7sq6TqjB6
	rVqvLFoC68Mveu/Rq7O06t2S8UBcPMpBpkSgC8zUXZmw8fhZ66Yw5oYuwYgoZtfP0/j0RBlXQzeRN
	4Vn9ReyxtPRBPUXHXBJvopV8aLhjzRD3V0Zdj4j6+qBYsN3qPLfmpnAh9FfFxmmEoRLc8i8Bh0MyG
	ssrR7y/pZpaG+JP74eo+Hk339/NUnUoNzMQEaJc0PmIvwZWMJoZEVmmNIAWFASsji3hFyds/SdOn0
	WvMpuLUUVSkUmvbjgkFzVY/qhCc2v3AmBKd1TlfnXrSsPz/LPTQc9162twVvR3hiWHaIz+a74GV6O
	0z8MapKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjFSJ-0000000HS1P-0kFe;
	Sat, 15 Feb 2025 10:31:27 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjFPS-0000000HReP-0vwV
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Feb 2025 10:28:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 45461A4029E;
	Sat, 15 Feb 2025 10:26:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D561DC4CEE8;
	Sat, 15 Feb 2025 10:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739615309;
	bh=gNprYAi87qXWXNPsGmU77W5/QOMMYo/jVxd3xT4q5IE=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=oQwX7l6QUrwrSgf9XWJLP2EKJBpj/ccnw4KMliE/W1UQtATb+AgeyLPch2pSBQxrp
	 +1koWenoRzEVpOpn5DafzZYqV4Y+F1aluMEv71LVph0YhEgqV0dwuHd0hedxcmksmD
	 kvm3r5akTZ/DhdZbS7l2rEr91elvx2kdf4wTFe35+m0UIrNiCNnx585yc41bB97TP6
	 0HgRnnbmOl+EfyzawAT9f66idI9TfG/oxQ5j0m3xTolH8HvLIN1/LKcvEY1kptvLq+
	 8AfHDZlpxmXzmKtuvhOTNkqKRxsXDfUjMvR5ZE/FDnlLm+IUEePpY3kBc1OmThtpEG
	 E3f2U79HrpuTA==
Date: Sat, 15 Feb 2025 04:28:27 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 linux-arm-kernel@lists.infradead.org, Scott Branden <sbranden@broadcom.com>, 
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 linux-kernel@vger.kernel.org, Stanislav Jakubek <stano.jakubek@gmail.com>, 
 Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>
To: Artur Weber <aweber.kernel@gmail.com>
In-Reply-To: <20250215-bcm59054-v4-2-dbfb2d76a855@gmail.com>
References: <20250215-bcm59054-v4-0-dbfb2d76a855@gmail.com>
 <20250215-bcm59054-v4-2-dbfb2d76a855@gmail.com>
Message-Id: <173961530619.188590.17123911097531884942.robh@kernel.org>
Subject: Re: [PATCH v4 2/9] dt-bindings: mfd: brcm,bcm59056: Add compatible
 for BCM59054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_022830_392942_07C0CDFD 
X-CRM114-Status: GOOD (  16.22  )
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


On Sat, 15 Feb 2025 10:39:37 +0100, Artur Weber wrote:
> The BCM59054 MFD is fairly similar to the BCM59056, and will use
> the same driver. Add compatible and specify the allowed regulator
> nodes.
> 
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
> ---
> Changes in v4:
> - Fix yamllint errors (missing unevaluatedProperties)
> - Drop comment with regulator name list
> - Use full schema paths for $reg
> - Change description of regulator binding to mention BCM59054
>   explicitly
> - Drop quotes around vbus reg name
> - Change "Power Management IC" to "Power Management Unit" to match
>   official Broadcom naming
> 
> Note that I did not end up moving the regulator refs from
> allOf compatible matches; I explained my reasoning in [1].
> 
> [1] https://lore.kernel.org/lkml/ab853605-859d-44c6-8cbd-44391cd677e6@gmail.com/
> 
> Changes in v3:
> - Split regulator node into separate file
> - Removed quotes around compatible
> ---
>  .../devicetree/bindings/mfd/brcm,bcm590xx.yaml     | 26 +++++++++-
>  .../bindings/regulator/brcm,bcm59054.yaml          | 56 ++++++++++++++++++++++
>  2 files changed, 80 insertions(+), 2 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):
Warning: Documentation/devicetree/bindings/regulator/brcm,bcm59054.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/brcm,bcm59056.yaml
Documentation/devicetree/bindings/regulator/brcm,bcm59054.yaml: Documentation/devicetree/bindings/mfd/brcm,bcm59056.yaml

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250215-bcm59054-v4-2-dbfb2d76a855@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


