Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A551CA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 16:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gvOzyJD2QNBAI8MTvajlvVRSSEA1nsS/ookdOR+Q0pY=; b=QLNPJS5kGcLi6iSmDsifp/eZcS
	DlU88zuc5X9Eqx7T1ND2SyXHM6izv8rnCe/CSgxMpoLxI0o28r5c2p6aANuVUFGo/kZCM8cHJSIcJ
	42uCa8gY7kXzZCTotpNcrlmfgavxEs1hzrthev24pjLU+zEJjRhQDEGEuUz4Rh1c22F0kCLCKMArR
	GJYuQDwqC80nwwtDLCXpn0Rk4R/gwtPmReHC83Kmh8X1TpXRyLUFU5IZeHgT0uLNQt21fFMA6X1bk
	Ovjdejd0uA2PsnUpmn0Q7X+jvYnSf80Ijhf0OYeriHBrGDZgW7gTLCdc4rrTv+k1Fn0Lx8WcnJy5W
	+tdyFPBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJbR-00000009hMl-2jtX;
	Thu, 01 Oct 2026 16:25:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJbP-00000009hLy-2TOp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 16:25:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A9231602C8;
	Thu,  1 Oct 2026 16:25:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C1A21F00898;
	Thu,  1 Oct 2026 16:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790871946;
	bh=gvOzyJD2QNBAI8MTvajlvVRSSEA1nsS/ookdOR+Q0pY=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=iazilZgXbg93IEbiVHiZQnJ9nRT+Zh9eSMlD2JWXYu2v+ZtyNmo31Xf2YhBvr/byu
	 f5I5p6oWxGxq1Xr88MY5D0nr/UGTMEgb/PYvIQ+JjthucS0/s/n41jG3SuTg5xkfer
	 kK74oAEBrJVFpABjFq43h0d1ax4ka+ERmC4fjzFzeZYT1IvdCWicBNhTHiVxUhDmSP
	 2Ihx+y9otI7lCab2vKchPp8eSVWctms+vg2vPqSbKFggkkwOehuvCcYuR++FU3m2mD
	 S4Hi/YTa6os+43pvsyYkMUUVJTbQ1duT1UjmOhEc/IXtNWGWpd/s1Jzl87YEliK8TJ
	 qWb990rILEdPw==
Date: Thu, 01 Oct 2026 11:25:45 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Andy Shevchenko <andy@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, devicetree@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org
To: Olivier Moysan <olivier.moysan@foss.st.com>
In-Reply-To: <20261001145702.2628429-2-olivier.moysan@foss.st.com>
References: <20261001145702.2628429-1-olivier.moysan@foss.st.com>
 <20261001145702.2628429-2-olivier.moysan@foss.st.com>
Message-Id: <179087149522.849383.5830343342701017040.robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: iio: adc: add bindings for stm32 mdf
 filter
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


On Thu, 01 Oct 2026 16:56:45 +0200, Olivier Moysan wrote:
> Add bindings that describes STM32 MDF settings to support
> digital filtering for Pulse Density Modulation (PDM) microphones
> and analog sigma delta modulators.
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
> ---
>  .../bindings/iio/adc/st,stm32-mdf-adc.yaml    | 383 ++++++++++++++++++
>  1 file changed, 383 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/st,stm32-mdf-adc.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/iio/adc/st,stm32-mdf-adc.yaml:363: example 0 [redundant-whitespace] extra whitespace before {

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20261001145702.2628429-2-olivier.moysan@foss.st.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


