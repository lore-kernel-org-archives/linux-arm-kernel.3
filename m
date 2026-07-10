Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90F90C44501
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 07:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X77cxI3Y4wjh/DUB+3afJye72e9J5XmH0QJ8nxG8KLg=; b=LZ4p7lsZWTYVxcZl2+gCl4U3dx
	/BR2aWyxmOKufccf1TGrmkDB4i30I6e18QgMm8WDW/1cLKqokLOsV94hGI0BVPh5YzLIZ5sr0dD/Y
	1HyrUtGNgV5pkpg7yn0P765WJ0FvCVlByt784a1TMx9F1da3Ae2boUAHJvFRaoVx32WWaEM2AL7Fb
	EKYWNCG6qEtmLFUTpirXxBv7ZyaXSCjKjOWrdvQOmUv8QWi8HTci+c74k3JjpLDPjXJKyqDw04Qug
	u5ezoxta/61Xjfij2UW6erYdylFXY3SjdYeJjOwSoE52wJ4kVlH/XWyUpgio8/7s1eRPIo0TIrvpY
	A4a4UYjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi5ey-00000004LDv-1JVF;
	Fri, 10 Jul 2026 07:28:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi5ex-00000004LDp-0mD1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 07:28:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 19BFC43280;
	Fri, 10 Jul 2026 07:28:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26EDC1F00A3A;
	Fri, 10 Jul 2026 07:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783668510;
	bh=X77cxI3Y4wjh/DUB+3afJye72e9J5XmH0QJ8nxG8KLg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mOjsbwEinAqRwp8t5woNDyV1hXlGIky/vuZ2pd4VGETi5lSHlWjm+pqA9V1K446TR
	 306UrhBc6KxxIyekD9zQamy4xtAQinMsxxTRd6at/f/Hx4lvAEy9OKSrSXmmUsq2rl
	 onGXOfiQADHFCDcyesiliJTHP2Y97snb19rv2dVoP8hs2Z5lfqe9xEUcpWkyN/h9ye
	 ELTYH/nrJRYiJ9shHFqIG1lCw4VjbKJWF6A1GkzW6kZkjA8/ZH/aTrnFUiyducGebE
	 wICnor92p9LkCkeSE879HQlTijQUTzGZnsjv/Z+G6TiTWS99/L/Z4+UfjJ7dLsiXNQ
	 agUrDLGvOywDA==
Date: Fri, 10 Jul 2026 09:28:26 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: HaoNing Cheng <Haoning.CHENG@cn.bosch.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: thermal: imx: Document calibration
 offset property
Message-ID: <20260710-alluring-parrot-of-glory-567a07@quoll>
References: <20260710-b4-symana21-11221-imx-thermal-support-upstream-6-18-v4-0-1fef97d1c750@cn.bosch.com>
 <20260710-b4-symana21-11221-imx-thermal-support-upstream-6-18-v4-1-1fef97d1c750@cn.bosch.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260710-b4-symana21-11221-imx-thermal-support-upstream-6-18-v4-1-1fef97d1c750@cn.bosch.com>
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

On Fri, Jul 10, 2026 at 11:03:36AM +0800, HaoNing Cheng wrote:
> Some boards need a small per-design correction to align the reported CPU
> temperature with board-level measurements.
> 
> Document the optional fsl,temp-calibration-offset-millicelsius property,
> a signed offset in millicelsius that is added to the calculated sensor
> temperature. The property is optional and the existing behaviour is kept
> when it is omitted.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


