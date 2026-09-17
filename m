Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B64EFC982D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 08:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sbes0882iMbhpDutz94uKHFUZV6ExaVjEgbOPnw20JM=; b=ETIVIYP+Fo1DLDU4h7keDDyNlU
	5wWEYUdkgIgZt0t92hTTmRYA60TrhatAevzJXmIp2RUOBk7bU4ApiI5GFd+tHtTNHUioWzwpXRKLN
	Hl9vIBbAt/9DwXrxxRlv7VIhrQPXtrAEehIOmOwviRnGnC4TLLokjbunAWNWmTskSrWCVgMz+sxW+
	KGKqc5SDQPCUHyml8I3PHmUdQvaUqteQnrqFYOGWJPgfBOF57YLQ/q1mItCNTKw3laMEpdCLU9Uq2
	0uL33wAUvMTC1y9iWl7Vn6k43FBqRbsg39qbKC8CPKIXNfLE5Os9MDOGRW2rSthPolUQsT2wKnUYX
	1bF48IgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x77BU-0000000Aqzl-3Qor;
	Thu, 17 Sep 2026 08:09:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x77BT-0000000Aqze-48bR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 08:09:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A9E2843F84;
	Thu, 17 Sep 2026 08:09:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F383A1F000FF;
	Thu, 17 Sep 2026 08:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789632571;
	bh=sbes0882iMbhpDutz94uKHFUZV6ExaVjEgbOPnw20JM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lTSdDuI9KbA/YNynTcioXRA66l6F0PDbH0/e9a+5mYdfdy85aJM0vAdPrZwQI1B+N
	 No+jizLoau/ThooMkRqmLDZm/Jk4/5GY4z6sDi6PcuI1jOTk0jocBvaUE/A9+8V5j8
	 RzLKzTnjN3z9g4rZ+VrcaEpbehMCgIb2c0o709WGjCRfzjy/TtIz+FAGCLG17WhKvf
	 OMg0oUfnK+qFnK/3sHCRgIdoTI6Xkxw0jNrv42dp7y6Kwuofym0kkKRm3IivPd6UxI
	 HWwIiFBxEp1fu2Z8Dlm7hvL0UTkGQtYpmnob0jJC6JmozrNWWGuLWPl3i5+0MDMPxQ
	 +Y6PYW3fD2vTw==
Date: Thu, 17 Sep 2026 10:09:28 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ulf Hansson <ulfh@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Lee Jones <lee@kernel.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org, dmaengine@vger.kernel.org
Subject: Re: [PATCH v2 02/20] dt-bindings: arm: ux500: Drop NR_DOMAINS
Message-ID: <20260917-arrogant-onyx-weasel-e59f06@quoll>
References: <20260914-ux500-power-domains-v7-1-v2-0-9d0c17e1f816@kernel.org>
 <20260914-ux500-power-domains-v7-1-v2-2-9d0c17e1f816@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260914-ux500-power-domains-v7-1-v2-2-9d0c17e1f816@kernel.org>
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

On Mon, Sep 14, 2026 at 01:54:30PM +0200, Linus Walleij wrote:
> Keep the internal Ux500 PM domain count local to the only driver
> that uses it.
> 
> Do not expose this implementation detail through the DT binding header.
> 
> Assisted-by: LLM
> Reported-by: Krzysztof Kozlowski <krzk@kernel.org>

I would say Suggested-by, because it is not a bug, just preference.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


