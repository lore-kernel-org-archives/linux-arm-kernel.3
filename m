Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96114C982C1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 08:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NSTRHR/rrHtZcDQWeuQqQHPMcDnerGUSIEKdxd7ZRjI=; b=skw6wNgtEYo9TwC4OZgvMsv1Az
	dv45XygYupbiLcs2+f8KZ6+sD+HnzOHFqXy7427cDkKCFusTmv533c6/tZ75AOE6BZxEvCuBweDnO
	A67cKW6Z70XHgxM4UHZmOvB/CHwq5IlE1XtJuD1EhaKjAiEkSNUNfvKM2BsHC9i52yQol1SbZHNPu
	Re8CaKaWAb7jINU9J+9KD325v6YHCDwD69WkE4+bn7QGqw89VKGm1CCTu8XY2zWZTJKRVXogPLsbt
	plXfEIgdbys6cJWBtDHAVfltooHAGtpA6UeE025oPiunR8dICIKEoRz2x+jCJVLmHxGOpuk9bW/i9
	qHgxo1+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x77E2-0000000ArVC-1hF9;
	Thu, 17 Sep 2026 08:12:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x77E1-0000000ArUd-0XwK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 08:12:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A014643CEB;
	Thu, 17 Sep 2026 08:12:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC1651F000FF;
	Thu, 17 Sep 2026 08:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789632728;
	bh=NSTRHR/rrHtZcDQWeuQqQHPMcDnerGUSIEKdxd7ZRjI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lDrCaYvk+RDoeQwFfRiuikgEhkgxPBbY+9EtZvD2oQ1JxgoXZDeev9hK8+c8fzpbF
	 hSSTPag8TnonwJuAgoZAEkn4mhoYRjZw4BfHE8iIWh4BslX+uTHhxGvbMWcJlIzhIY
	 2VX0RAapm6yQBibVy3MjYiohmC1hUOc4ZUl+u8h0ps47g0zIevr0FeQY8YkV9H6foF
	 D/O7SHpkiaabAlfCwBxvffuXdGUKEQZ9YYgk9WgmxMi+OnmId3Bhl10TIBYeJzXMeq
	 2qJ7wDcSugQFkQvY8iqsRmZ7UOImmv3g4q55pOg1iFhQEMcZhqE3HQ/JLCeXZr/TTC
	 I/VuuVmvyadpg==
Date: Thu, 17 Sep 2026 10:12:03 +0200
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
Subject: Re: [PATCH v2 04/20] dt-bindings: mfd: db8500-prcmu: Relax EPOD
 regulators
Message-ID: <20260917-archetypal-hospitable-auk-39afc6@quoll>
References: <20260914-ux500-power-domains-v7-1-v2-0-9d0c17e1f816@kernel.org>
 <20260914-ux500-power-domains-v7-1-v2-4-9d0c17e1f816@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260914-ux500-power-domains-v7-1-v2-4-9d0c17e1f816@kernel.org>
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

On Mon, Sep 14, 2026 at 01:54:32PM +0200, Linus Walleij wrote:
> Allow the VAPE and VSMPS2 compatibility regulators to carry power-domains.
> 
> Stop requiring the EPOD regulator child nodes that are being replaced
> by generic power domains.
> 
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  .../bindings/mfd/stericsson,db8500-prcmu.yaml      | 24 ++++++----------------
>  1 file changed, 6 insertions(+), 18 deletions(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


