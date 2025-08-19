Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7762DCA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 15:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JVWtj8XQc1C9lLwt1FcMX/eIkkSlGNDGrGDZMXe/QAI=; b=sGNJR23xBj1qe4EY5edLcFQlQ3
	LcVPXgSPyi9tAwHYC9DL7NAeqQDOf/rfK3t+jpzC+MAy0x72iV1WWoJNxbx2jBoaKRdu8xT16kwjm
	2VVaRuUPZFTibzhSGA+FhjaBhzyqiM+4XMjP53ZqPkh+nNC0ToY9o/Q/lzmA6Z9V11v9L0nRm0Tmi
	qvhp4eZmAn7RgvV2Np38prpShrCk4FKYuIcQEBPgMPjxHTEOj4HUP5CDAQS4BJaU/RFjajcXPcdQx
	qBEG/vUg988bdgg6wywkqmdDMqJ+HQ5SCjhuPnxxYHAx0jR4Od9rOb5fydTJur3der2j4oTdHHvUd
	TmZxIt1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoOHa-0000000AtYq-3XcW;
	Tue, 19 Aug 2025 15:29:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoLVu-0000000ARbw-3nMT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 12:32:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3B58061426;
	Tue, 19 Aug 2025 12:32:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9002C116C6;
	Tue, 19 Aug 2025 12:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755606750;
	bh=wjs09Gdigf2R0IE1uLQxql5R4PimNeWNLQzbngasLiU=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=KUV1pM+PSUrbgiuC2qfRrjBmoh/K7SwKUZPEG9Sx43lERH2mIAhJXE43x+YxV+SGd
	 BdtNUMqKKJlINMh6dccC0ScwziqT9emXyV3D+9wnX46JUt0c61L45wM8zOfFf0CUsy
	 97atbCKu7MfQ/4A3q50GqnxaNp6SbtNu00FjCioMQHjnpu///w0Wgu48LG7iKegR3U
	 RtPibAw8lDKnpEhhsGpLfj9WdTX0+K7FHZIU0mYidnxYnEIqCUDkH/n/cMTfLHPWT7
	 IhwS1l80k7T0xpDkP4EHbmRjQGlOAcqofRTPzapIJnpKAwBV6uY2JPtc91+jz2rP06
	 rz76yHEIf9sUQ==
Date: Tue, 19 Aug 2025 07:32:29 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: imx@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org, 
 Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Daniel Thompson <danielt@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, linux-arm-kernel@lists.infradead.org, 
 linux-leds@vger.kernel.org, Helge Deller <deller@gmx.de>
To: Maud Spierings <maudspierings@gocontroll.com>
In-Reply-To: <20250819-max25014-v2-1-5fd7aeb141ea@gocontroll.com>
References: <20250819-max25014-v2-0-5fd7aeb141ea@gocontroll.com>
 <20250819-max25014-v2-1-5fd7aeb141ea@gocontroll.com>
Message-Id: <175560674579.26233.12902824583404207699.robh@kernel.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: backlight: Add max25014 bindings
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


On Tue, 19 Aug 2025 12:58:59 +0200, Maud Spierings wrote:
> The Maxim MAX25014 is a 4-channel automotive grade backlight driver IC
> with intgrated boost controller.
> 
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> ---
>  .../bindings/leds/backlight/maxim,max25014.yaml    | 79 ++++++++++++++++++++++
>  MAINTAINERS                                        |  5 ++
>  2 files changed, 84 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250819-max25014-v2-1-5fd7aeb141ea@gocontroll.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


