Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE729CDE000
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 17:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h8OhrhsqQ2Miacsjs8uP266A7aQYd0mZ+To0MUYPgzo=; b=qTZ7dxiyhd6nupZr55l3bo+K5r
	kniUXTEte/drW0GehkEtVtsXbtc0d0pBbdr865wfP1EVYdoAHZT1sgzUlSHakUHL6HN6Av5eyiguE
	Iqdq4PtSHPp4aDJhEfEjd0HDBzQdNlCis+ftdlNFZxREAW7vZup7rmvPUVVndKfiqTTT549giY3D0
	yykQZtaGejGVPLmmz5U+p6vIIqtC1AIG1XuSEsZJc5vclAiYk/B0hRNGAIy6LE0R5QPTnGSJLJxLC
	rKn2NLZTPjgokTksQiSGrUAB8YkggGsjxB28nlraVQPfFJZuZ3Kbni0PzCisG8+eHvLe/M4MAOONq
	u5tqR26g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcoDU-00000009dsq-1dLJ;
	Thu, 25 Jun 2026 17:50:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcoDS-00000009dsQ-1GTm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 17:50:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7E6CB60098;
	Thu, 25 Jun 2026 17:50:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03D851F000E9;
	Thu, 25 Jun 2026 17:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782409816;
	bh=h8OhrhsqQ2Miacsjs8uP266A7aQYd0mZ+To0MUYPgzo=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=MmJy1Y6+0EZEpLyEQTMDhevN9H1VEyVnXlGgShE70KPCi5pPUpkB/ELpllzE/9Pxp
	 MoH+pWMWGcGL00r6mRdX+lu5rkgJC2m1xPdld9HylVPf9VfkTxBsYOrZjzz07YKXKo
	 TZjQ0eSYkoTgsY6zrz8VmvUytiDaJTHqWrX5LDXHC4kKoOnRxJdob3uSLOXOsNjfyX
	 gGygGa7qWR3lfnPI4hd50AohreCZZLGM2at0DII1KVrhnQmibgUUy31GtCjIuM3kJz
	 cTxO/EIVJtIe92y2VJFsWiUrLN62zf7fY9gKUnGnwo5i7H3eBSycVMta1+qZMH6eIj
	 2GHDT+msWpWBg==
Date: Thu, 25 Jun 2026 12:50:15 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, upstream@lists.phytec.de, 
 conor+dt@kernel.org, krzk+dt@kernel.org, nm@ti.com, 
 devicetree@vger.kernel.org, kristo@kernel.org, linux-kernel@vger.kernel.org, 
 vigneshr@ti.com
To: Nathan Morrisson <nmorrisson@phytec.com>
In-Reply-To: <20260625160214.4001298-1-nmorrisson@phytec.com>
References: <20260625160214.4001298-1-nmorrisson@phytec.com>
Message-Id: <178240981517.3450987.4497389495200583534.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: arm: ti: Add bindings for PHYTEC
 AM67x based hardware
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


On Thu, 25 Jun 2026 09:02:13 -0700, Nathan Morrisson wrote:
> Add device tree bindings for the AM67x based phyCORE-AM67x SoM and
> phyBOARD-Rigel.
> 
> Signed-off-by: Nathan Morrisson <nmorrisson@phytec.com>
> ---
>  Documentation/devicetree/bindings/arm/ti/k3.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/arm/ti/k3.yaml:228:1: [error] syntax error: found character '\t' that cannot start any token (syntax)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/ti/k3.yaml: ignoring, error parsing file
./Documentation/devicetree/bindings/arm/ti/k3.yaml: error loading YAML: while scanning for the next token
found character '\t' that cannot start any token
  in "./Documentation/devicetree/bindings/arm/ti/k3.yaml", line 228, column 1
./Documentation/devicetree/bindings/arm/ti/k3.yaml:228:1: found character '\t' that cannot start any token

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260625160214.4001298-1-nmorrisson@phytec.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


