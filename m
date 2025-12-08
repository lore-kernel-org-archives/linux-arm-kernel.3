Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2EA5D3ABEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 06:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/ztlJ3rhIfUaFptGhPcU/2Y/EoL0y6YBUMgsb4znaS4=; b=G/AG1TBmse59T+xw4yWzUgviUI
	M2TFc0oNbMFV+Cv60wjWIfU7GWFa8qIGnqpzU2NQtpNZpf5rfujGVqjNHiFg1x0YwvktCcOECrY65
	1Vd3ctXBKos2VYQGrjQN9uO3NG6oK8KVkMflaZVAwezMteVFkqf80XU5VrhEcZAhvCHfYvIjxurYa
	quCfaCVN7prKpFXQM4y5yxzQw2B6Q3YPxGlFLP3hu0V1/iwqFefAp12uXWUHtqi+IMLfWgSsDzxf1
	gHfTQjbY++xP8tGeyEuMml/HEyOBrXpLsOQnZ/fwwu2KslH5tjcXFmfHgx9pBOZSbGkm6BZQbp6q5
	UE6w8v1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSUYZ-0000000CfZG-3O87;
	Mon, 08 Dec 2025 06:17:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSUYW-0000000CfYx-2QY3;
	Mon, 08 Dec 2025 06:17:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 98E9E600AC;
	Mon,  8 Dec 2025 06:17:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13CAFC4CEF1;
	Mon,  8 Dec 2025 06:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765174627;
	bh=/CNz4G1Z/HzNH9iWHAzsgrxR7BVOXO1OkE0s/xI2IQk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iCmBtsTPZEmaChMTFeu+cS+qxz2KVruK1Z//UVgC1WpJaiNNf786LLahqPk3AN+GS
	 iuf1fgL9TlAXnPUwoCLn3yU8Xb8uLrpGynubq3Kld7HUV2NfmO4tGrgp2o1xZxHh8j
	 XyYk1Przk1h0lwYrQGcFe87YANrusDrGNwJ1CcMVHpAgoCDMB6EoogbOfJhNBCvO7S
	 U7tVQGek8cJ8VD+wPmfKZ+KEpFG+ClxUaFeKsLEHJg7rgWW6VBZ3GrKDWKMld3TdVT
	 YiEA3UabvDvHGOCQQlweLTOwFpMHTRjF+V8+k1kdqwRjQchLhxaigy4l5erBqkYIXo
	 X/cTw75bTuXOg==
Date: Mon, 8 Dec 2025 07:17:05 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jian Hu <jian.hu@amlogic.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, 
	Xianwei Zhao <xianwei.zhao@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	robh+dt <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	devicetree <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, 
	linux-amlogic <linux-amlogic@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v6 2/5] dt-bindings: clock: add Amlogic T7 SCMI clock
 controller
Message-ID: <20251208-independent-warping-macaw-74a169@quoll>
References: <20251204053635.1234150-1-jian.hu@amlogic.com>
 <20251204053635.1234150-3-jian.hu@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251204053635.1234150-3-jian.hu@amlogic.com>
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

On Thu, Dec 04, 2025 at 01:36:31PM +0800, Jian Hu wrote:
> Add DT bindings for the SCMI clock controller of the Amlogic T7 SoC family.
> 
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  include/dt-bindings/clock/amlogic,t7-scmi.h | 47 +++++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 include/dt-bindings/clock/amlogic,t7-scmi.h
> 

Where is any binding doc for this? Why is this a separate patch?

Best regards,
Krzysztof


