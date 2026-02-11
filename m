Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33A52ECD6EA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Feb 2026 21:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JrgBPWR8JOZncCVc7RsUeSEPTWrbLXLkSLRK/6gBpBY=; b=aa85NHX5Yqw98RwngRcpDz4SGQ
	7AnEX3srFKHxC6wAIWkxrlLJWyUrbByaPSR8dyhWS45laXTCFgG6vBnZC4Z+yx6eyrjRaiB0hE3f5
	95uk93zpjcWV62wZ7uI6gxbDExIk45WMH9V+BA1MBT7QgkndF0PYKG1R3w7qHwFlW22p+vEYPFYmR
	ea9syKdzs9GE+HRWN4xrUaPFZf+zXw2mYL10ctC8/UGd3WnjAzSLhlojfU0Jy5w3g7y+vcZVSTAK2
	csK82C+1Gv7ZhQrd1X5H2DdvFNvDW4x/YqgOgGgtPEP8XvrJoqu+AZXY1QgEKIKqTWLEfTWKxurdx
	Z/2BCOAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqHN6-000000013Za-1E97;
	Wed, 11 Feb 2026 21:03:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqHN5-000000013ZL-0g6f
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Feb 2026 21:03:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3AE7E60010;
	Wed, 11 Feb 2026 21:03:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B690EC4CEF7;
	Wed, 11 Feb 2026 21:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770843817;
	bh=yKZgXX+CsYRZzhuWXY3GAbVJ6v2rTJISb4JSw/063sg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iJzwUTrROdDwAU473dmNRp1Kjga6TjSB46dDrsHdY86NUWg9BfPd7zfMrNzzhmnXp
	 vRZi15J+OWDJL+yDmxgfVjK/8UUeiy9vStjc4DDH5DindDJLYRMwSmLBsSG2NUW2t+
	 oVHFAhY3MjyJ92+xqwPTtpx9Lz0i+E44M5nuNReLPspX6jkxI2HoYAlaBJhMvDB0q9
	 h4DidSQ+PB0sHGHk3tBXTP19p4HMxsnVjDkDjWQ3QskhYLEOM+5eJFU9j6CTzrGztX
	 Q4idPT4ST2EA3LwsEZ7ShYBdBMYs4GVsBkyY/r1/rHJQIqUI3p4ERBbZF5RIFQIWT7
	 K+bJ5lku9A2+Q==
Date: Wed, 11 Feb 2026 15:03:37 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: kernel-team@android.com, linux-pm@vger.kernel.org,
	Liam Girdwood <lgirdwood@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Mark Brown <broonie@kernel.org>, Juan Yescas <jyescas@google.com>,
	Will McVicker <willmcvicker@google.com>,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 03/10] dt-bindings: soc: samsung: exynos-pmu: move
 gs101-pmu into separate binding
Message-ID: <177084381638.3881673.13620235276834374128.robh@kernel.org>
References: <20260205-gs101-pd-v5-0-ede49cdb57a6@linaro.org>
 <20260205-gs101-pd-v5-3-ede49cdb57a6@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260205-gs101-pd-v5-3-ede49cdb57a6@linaro.org>
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


On Thu, 05 Feb 2026 21:42:31 +0000, André Draszik wrote:
> The gs101-pmu binding is going to acquire various additional (pattern)
> properties that don't apply to other PMUs supported by this binding.
> 
> To enable this, move google,gs101-pmu into a separate binding.
> 
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: André Draszik <andre.draszik@linaro.org>
> ---
> v4:
> - update since 'syscon' was removed from gs101-pmu compatibles
> - update since 'select:' was removed from google,gs101-pmu.yaml
> 
> v3:
> - use additionalProperties, not unevaluatedProperties
> - fix path in $id (Rob)
> - drop comment around 'select' (Rob)
> ---
>  .../bindings/soc/google/google,gs101-pmu.yaml      | 56 ++++++++++++++++++++++
>  .../bindings/soc/samsung/exynos-pmu.yaml           | 20 --------
>  MAINTAINERS                                        |  1 +
>  3 files changed, 57 insertions(+), 20 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


