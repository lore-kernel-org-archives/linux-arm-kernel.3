Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD1BBC61DFD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Feb 2026 19:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ILN4hfEwZzefdyY6XjjcKvC9tuaukSvSj33KGASmi5c=; b=slaW8LtfqUBwaHZN82wi27e2rN
	4W+3iootAb+T27sC7gMYCLCfqMH6MIUEVACbfc7g1kHBLaZXop3/qQkMmb1TJX7M6UKU7jbT8ROOe
	nzdy9KoKR9CUpObyGYynJ1o2OyRvhMvAGsyS5deVZnaP+Fmf5tLbeuG+1Q+3U2idQE8rsDdtfottS
	YPWgiEA2E5Y5w++conoSmkBL3V7GIxRwOcxRduFoqaiU1BJBCdl2fizMdzyhSKcuay38zhFDRAQqk
	8So59dHkUQyug4hfIvebHg+joWfCsBarPCobALOxAo63vKhUn74aqu+OGo2R/cpvH3zFbxs/RSfZz
	d+AN1FSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtsWf-0000000GHJa-2uYX;
	Sat, 21 Feb 2026 19:20:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtsWd-0000000GHJ7-0Fwc
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Feb 2026 19:20:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7188D42A80;
	Sat, 21 Feb 2026 19:20:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28C6DC4CEF7;
	Sat, 21 Feb 2026 19:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771701621;
	bh=nvibUprlO0MIF/zL344m7/dwsQPKA8o6ALXiWOkfUlE=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=gUSCwxRoa/0BxBCYCwjEDmr7evQSke0efUWN9t7wnZes4+jUGYKILsZu0dMmtDjb0
	 39OMq3mU4Lz6LXHNc3vUdHe4hWGtuOqpnzyNTgwD4IWj/Cgoy4ziK1H9lacxm3N7dN
	 u34Nm1dDMOmmkqkvHkj6ectljS8tttSrWCyTiY1ugkBzNYQcFtHXdKoiZTDMn1en6c
	 9daFMy1D09CnSGZQWVC0/i55XkS2BeNDpgLMScnCl1r/PUf3Lm6SOG5tBEOyoPv6UN
	 8jOTAV8s/oLOB/Y+kG0zU3uF0p4EGfopgwwnI/59xaVvfqnV5HgQ5nXV3WzmlI9Qd0
	 sIy7AKXxL7q3w==
Date: Sat, 21 Feb 2026 13:20:20 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>, 
 Andrew Lunn <andrew@lunn.ch>, Conor Dooley <conor+dt@kernel.org>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
To: Gabor Juhos <j4g8y7@gmail.com>
In-Reply-To: <20260221-mox-rwtm-yaml-v1-1-25dec4a0228b@gmail.com>
References: <20260221-mox-rwtm-yaml-v1-1-25dec4a0228b@gmail.com>
Message-Id: <177170162022.3445020.12700109367328062121.robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: firmware: cznic,turris-mox-rwtm: convert
 to DT schema
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260221_112023_145401_920EC78B 
X-CRM114-Status: GOOD (  11.52  )
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


On Sat, 21 Feb 2026 19:21:34 +0100, Gabor Juhos wrote:
> Convert the Turris Mox rWTM firmware binding to YAML format. Both the
> compatibles and the examples were adjusted to match with the ones used
> by the existing device trees to avoid new dtb check warnings.
> 
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> ---
>  .../bindings/firmware/cznic,turris-mox-rwtm.txt    | 19 ----------
>  .../bindings/firmware/cznic,turris-mox-rwtm.yaml   | 44 ++++++++++++++++++++++
>  MAINTAINERS                                        |  2 +-
>  3 files changed, 45 insertions(+), 20 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/firmware/cznic,turris-mox-rwtm.yaml:24:9: [warning] wrong indentation: expected 10 but found 8 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260221-mox-rwtm-yaml-v1-1-25dec4a0228b@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


