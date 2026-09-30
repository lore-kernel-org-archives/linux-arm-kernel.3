Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 393B0CA5FC7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 14:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TLwqX0Jc4SEY+5d3H8Hlwyk9JbAaEYoiaByM1n6xaJQ=; b=siRFTcMnmUBtTQN38VFA2QUz4P
	vV9SQouLrY+BK5zYoDuwzN3c4SkYL30ISjAO2eX2LuS9o4Zd4AqllnFzVvxDzdk/hE8Sl+htoU3i/
	jVI3mm5viipXTPAW1QSVhZYIAggCo8j2meLRVs7EJBrykWi4JKSoC14bHxjlsQoff3Q53FZjaaMYp
	ujI4THxlcEmnTuQ98Q5Q4qlLwZX4VXJYcxKDBBVIXC6lFOdQE6VC4uzWEPuZIV2VpHhPiVqsg4DUs
	Vqc4l/a2KXu9u7teL6WxbmuKvSpvlFMperKsBYQg1DsyeS7oPK9/LYlRzq8BQ69MECCm+a3CD4TAZ
	RpyfB3ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBvSU-00000006LFM-0Uqd;
	Wed, 30 Sep 2026 14:38:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBvSS-00000006LEy-3gI0;
	Wed, 30 Sep 2026 14:38:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id ED60860008;
	Wed, 30 Sep 2026 14:38:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20BAF1F00893;
	Wed, 30 Sep 2026 14:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790779135;
	bh=TLwqX0Jc4SEY+5d3H8Hlwyk9JbAaEYoiaByM1n6xaJQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mFAEBntTWqsr9f+bZRPYoG8BMt2qUA16+CcPbet1ElNVDfz3duvMY1eTbRrBlpjaN
	 cIon7vOp8BIBORn0wJUIWhj/PltI4gtxG8eVMwGsGdnFsiM1OZ9yBSyUxYUCrwRsTR
	 L83NVeDeG/UuRlwckROIJvRhDJpenFVA2LR4r4OZ6e++EdeFVrohpm7StyCGVNDzLz
	 czTL6ARYUk2MMhcoCzNQaPEsRgTGnwE4aTTjFOXXBs4rAv+XwTwnmbwd62P2bA3Vrs
	 CpcI/r7ObWshXlQWe/q5qyYVT4HbL9j2Lo35umLnU0a1yzP3NPB7mv79ZGQYm/fKXL
	 /HYh7QMDms0pw==
Date: Wed, 30 Sep 2026 22:18:53 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-clk@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	linux-gpio@vger.kernel.org, Frank Li <Frank.Li@nxp.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, Lee Jones <lee@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>, devicetree@vger.kernel.org,
	mfd@lists.linux.dev, Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-spi@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, Linus Walleij <linusw@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jiri Slaby <jirislaby@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	linux-i3c@lists.infradead.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 15/20] dt-bindings: clock: add Synaptics SL261X clock
Message-ID: <ar0aTV1GTWjMN4v_@xhacker>
References: <20260929061417.20733-1-jszhang@kernel.org>
 <20260929061417.20733-16-jszhang@kernel.org>
 <179071488985.2683003.6376725914058156145.robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <179071488985.2683003.6376725914058156145.robh@kernel.org>
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

On Tue, Sep 29, 2026 at 03:49:57PM -0500, Rob Herring (Arm) wrote:
> 
> On Tue, 29 Sep 2026 14:14:12 +0800, Jisheng Zhang wrote:
> > Add support for clocks, plls in Synaptics SL261X SoCs.
> > 
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > ---
> >  .../bindings/clock/syna,sl261x-clk.yaml       |  92 ++++++++++++
> >  include/dt-bindings/clock/syna,sl261x.h       | 131 ++++++++++++++++++
> >  2 files changed, 223 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/clock/syna,sl261x-clk.yaml
> >  create mode 100644 include/dt-bindings/clock/syna,sl261x.h
> > 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/clock/syna,sl261x-clk.example.dtb: syscon@f7e10000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
> 	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
> Documentation/devicetree/bindings/clock/syna,sl261x-clk.example.dtb: cpu-wrap@f7e30000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
> 	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
> 
> doc reference errors (make refcheckdocs):

oops, I missed this dt example dt_binding_check, or in details -- I forget
to update the example after fixing the soc dtsi syscon nodes. In newer
version, I will move synaptics chip global block binding patch earlier
and update the example

> 
> See https://patchwork.kernel.org/project/devicetree/patch/20260929061417.20733-16-jszhang@kernel.org
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
> 

