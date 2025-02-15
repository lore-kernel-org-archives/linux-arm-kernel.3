Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0206BC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 10:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UO8OXsaa3odBgE5srPoYYQ+h0WWuqfLyGTzGtOP9HPM=; b=z9WJ2Kpa5rhTGsi6E5ju3ulJdk
	c9C9IJYVEcnuzfCikZSppIGNhMzZ9gxMTGj36WP1VzfuStweo1HuukrS4+qrlrIlQryUQ/8BZhw7E
	CKgkO6YeGMLWe4axvJuFbGTCz7eWP5WBHJmmCoMM7/ILNzSfKhqZqSBa0TyDl1s/sZLTZorQ7SAV5
	942qrSFhKwVq0BCkpYd9GUVW3avgj2RFkrxUoMSeLMFWiMWZwUljXcEu2AUgjK/x9dQ8F4MGI5ciV
	MITHr2GGRn2SuTYvQmdbB2AY8D7MQHZPc4fpawvOwZvVceBa3kEMrhM5HwvSwIHvRd1yl9/+ELhK7
	sYIZ8KIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjFQt-0000000HRpo-2NGT;
	Sat, 15 Feb 2025 10:29:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjFPR-0000000HRdl-0kkb
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Feb 2025 10:28:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6FB385C4A51;
	Sat, 15 Feb 2025 10:27:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59EC8C4CEDF;
	Sat, 15 Feb 2025 10:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739615307;
	bh=CEEKh7N14ok4a75LQPAkohKFtemp3HZBXqHD1CvOiWo=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=OJDsM2JSsQlZMvIf51jy+TYtyGGWH8/FcywOqLviO/+8+XP551Ma8f0UnzxEI/PU4
	 WtIofqRXNsppbmn1SkPcdmZZIvSlehazilnCQAm9+eMfyn9BPghUSJ81xI+uHZTUrd
	 PsMqRIhIdxpq1AY9YPBwzw44vO+44aw+BzfEHfFvZ8d2rlcjbSpIqeSUUEUO1Vuls/
	 L/kBQXuthXpW8SaeYeQxx/eUbC6J6MFQTs4b0mqWyzTJ4MmXRIkmKm+4N5PHUZqBB3
	 Ogep1s81cq+Yv6tpMirUtcE9+X6sf5dnP/qGa3mNi1iwgzs3F7X9H4rayeh7RQdadb
	 TJSrt3/rSMNdw==
Date: Sat, 15 Feb 2025 04:28:26 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Lee Jones <lee@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Ray Jui <rjui@broadcom.com>, 
 Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Stanislav Jakubek <stano.jakubek@gmail.com>, 
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Scott Branden <sbranden@broadcom.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 linux-arm-kernel@lists.infradead.org
To: Artur Weber <aweber.kernel@gmail.com>
In-Reply-To: <20250215-bcm59054-v4-1-dbfb2d76a855@gmail.com>
References: <20250215-bcm59054-v4-0-dbfb2d76a855@gmail.com>
 <20250215-bcm59054-v4-1-dbfb2d76a855@gmail.com>
Message-Id: <173961530505.188543.13359016373130021930.robh@kernel.org>
Subject: Re: [PATCH v4 1/9] dt-bindings: mfd: brcm,bcm59056: Convert to
 YAML
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_022829_332296_3C195DE4 
X-CRM114-Status: GOOD (  17.16  )
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


On Sat, 15 Feb 2025 10:39:36 +0100, Artur Weber wrote:
> Convert devicetree bindings for the Broadcom BCM59056 PMU MFD from
> TXT to YAML format. This patch does not change any functionality;
> the bindings remain the same.
> 
> The bindings have been split into two parts: the MFD binding and
> a separate binding for the regulator node, to simplify the addition
> of other models later (which have different regulators).
> 
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
> ---
> Changes in v4:
> - Made $ref use full schema path
> - Cleaned up example
> - Dropped regulator name list comment
> - Changed description of regulator binding to mention BCM59056
>   explicitly
> - Changed "Power Management IC" to "Power Management Unit" to match
>   official Broadcom naming
> - Renamed mfd/brcm,bcm59056.yaml to mfd/brcm,bcm590xx.yaml
> 
> Changes in v3:
> - Moved regulator node to separate binding
> - Removed quotes around compatibles/vbus property
> - Style fixes for example
> ---
>  .../devicetree/bindings/mfd/brcm,bcm59056.txt      | 39 ----------------
>  .../devicetree/bindings/mfd/brcm,bcm590xx.yaml     | 54 ++++++++++++++++++++++
>  .../bindings/regulator/brcm,bcm59056.yaml          | 51 ++++++++++++++++++++
>  3 files changed, 105 insertions(+), 39 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):
Warning: Documentation/devicetree/bindings/regulator/brcm,bcm59056.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/brcm,bcm59056.yaml
Documentation/devicetree/bindings/regulator/brcm,bcm59056.yaml: Documentation/devicetree/bindings/mfd/brcm,bcm59056.yaml

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250215-bcm59054-v4-1-dbfb2d76a855@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


