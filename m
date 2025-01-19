Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17CB5C02183
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jan 2025 11:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tu/kS/RGFMsRooYCEt/WdzS9dXm84qNKRfTE5ljFaxs=; b=FH37hz6Q2vV6NduZc0VuNwRH0p
	MGKTAT7r4xhZ88mG1hm5gx0wcAU0zyyX0MKGpb5TvaRk99QPCPd9QG9b+G39ID8pMuqOOIj/j2TwU
	mFOL06/QKqKSJwTW8oOGamCV5lrVJ3riYkAcgQFJWFhKOl0wOfd0NOx/Op/jvS3CEGEvG3qhUWkes
	I8+1sStlC/aYJzC0bX4uEJEb/DCOkSPbBLMc4FEzx40UML1yi0VPDRr838jBa2V1fFyVp/iFupIG/
	kyo4X6UhY6OjO0X0JxbynZUj8xAVHPrkQW3E38TjYlkFIWgB8ZP0OySgqBATdTxjPYt39Giinlxxp
	k98Q7/zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZTvS-00000003qd5-1EjJ;
	Sun, 19 Jan 2025 11:57:10 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZTri-00000003plL-2kxn
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Jan 2025 11:53:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 90BFB5C400F;
	Sun, 19 Jan 2025 11:52:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2BDAC4CEE4;
	Sun, 19 Jan 2025 11:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737287597;
	bh=uxIvwK4AoMSXrXG7hoH/WiBzwCDlc57TnYp8UffnNaw=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=bN4L3xBfTeMz6vta3ECosjS3Stdij3hpjlUnwmfWB3q+IkrCauPuMInVLKXZ0Zx1x
	 aLl1WMk2L2a2m20nr7649Wquw3h12ZxLHRgBOkdJ0Dbl+cSuLVjnoqrgJOLWE2/mxA
	 UKwYE4S5jijni/OUmZ0SkQFXueTygFZx3Nf20dr+GP/jzVcKniTCUl6A4hrGlyKh5e
	 RRX567y+PNIok4x6Rl/xJynGb9HiLmsJqm+Mb9CiNCoKDjYjHY4ZwD0qRGTwJSQh6l
	 9MqgvT2D9xcaWiFhDitRykqy7Npy6Jefh7k5wKYIiHvyMGzrLu7ymKDVl7Zz+7Y5L+
	 dNyOt80JhQfFQ==
Date: Sun, 19 Jan 2025 05:53:16 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org, 
 Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, 
 Michael Turquette <mturquette@baylibre.com>, 
 Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Imran Shaik <quic_imrashai@quicinc.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-clk@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Ajit Pandey <quic_ajipan@quicinc.com>, 
 Jagadeesh Kona <quic_jkona@quicinc.com>
To: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <20250119-qcs615-mm-v4-clockcontroller-v4-8-5d1bdb5a140c@quicinc.com>
References: <20250119-qcs615-mm-v4-clockcontroller-v4-0-5d1bdb5a140c@quicinc.com>
 <20250119-qcs615-mm-v4-clockcontroller-v4-8-5d1bdb5a140c@quicinc.com>
Message-Id: <173728759363.813145.4986928739834717140.robh@kernel.org>
Subject: Re: [PATCH v4 08/10] dt-bindings: clock: Add Qualcomm QCS615 Video
 clock controller
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250119_035318_768520_1F076567 
X-CRM114-Status: GOOD (  10.19  )
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


On Sun, 19 Jan 2025 15:53:02 +0530, Taniya Das wrote:
> Add DT bindings for the Video clock on QCS615 platforms. Add the
> relevant DT include definitions as well.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  .../bindings/clock/qcom,qcs615-videocc.yaml        | 64 ++++++++++++++++++++++
>  include/dt-bindings/clock/qcom,qcs615-videocc.h    | 30 ++++++++++
>  2 files changed, 94 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250119-qcs615-mm-v4-clockcontroller-v4-8-5d1bdb5a140c@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


