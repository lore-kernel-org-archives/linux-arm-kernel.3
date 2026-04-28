Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D084FF886F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 07:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fnNgi7xQ1CWaFyBzeuqv9Tr146nbQXjyJh5evZzIC20=; b=CMEQceqRtgyxUf6rfar4Efx81H
	yiFC1bPRbqjJu8fsMixDD8pHCxhQ6nPA4Kak0+VAEjMG72G1hpDhCrOKoCbya5vgr9fjpLDTQ9IBr
	y8vBnqLiH7mkdUeEmWc7jnQMAbS/xfFxhzP6qpNa+vh9O9DgAQeyA9jWeDOJtsE1DSed4SS1pZVaH
	h9oVR9i7ab7xKh4bXAyTPRoi82Sk3zoXVzs4n/Br5svZCPOVdqQJThkOwF0yTyqpAb8ae0sAgyiMU
	UWmO1CrK2i9Cr7gH+G7YQNHx0QvOEn6OfAjYgBfBvBURXI20iKO7q1Ktg29QTMDeQ/w1iped0G+Qd
	+giYTasA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHcVm-00000000fDl-0vhJ;
	Tue, 28 Apr 2026 07:05:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHcVj-00000000fDQ-3glt;
	Tue, 28 Apr 2026 07:05:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ACD5141AF5;
	Tue, 28 Apr 2026 07:05:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00A4BC2BCAF;
	Tue, 28 Apr 2026 07:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777359934;
	bh=BRO9J/ZmX8rsQZ3xlStEfQAaOa2YUCNxilflaRpplMA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IFmFTrY7E4Om8seG+902x+cmIKa/lEV33L2FLbPmGJwI4HuBdsOs6nUeNsEzHNRr6
	 WHlA+1tgb+2A9c5Cd2iM5Ol5jjxVotyxRMXEa/WgkH/5k7AyN2x8V/lM12FWssK86S
	 d52OqmBHJSHa2mb2EFeTszx+mEpra63G/BbD0/7DJ60KwofCnL0kabaZCy3f2sfnhx
	 o6lp9+QyghAHvivNz2W7Uee7qaTfChG+uKu3WXmUIjfDjwMsTH2glaSu8CDwO+ZBXJ
	 HOQ+S/mS8EFU9WyjAJm5INVOq6FV+iFZ9Bd9AdEVBZUKNmkWTuej+Zo/5rzCvQqogX
	 Iyl+ZcI1BlKkw==
Date: Tue, 28 Apr 2026 09:05:31 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Manish Baing <manishbaing2789@gmail.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, kaichieh.chuang@mediatek.com, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] ASoC: dt-bindings: mediatek,mt6351: convert to DT schema
Message-ID: <20260428-unbiased-piquant-spider-5b912c@quoll>
References: <20260424210302.39972-1-manishbaing2789@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260424210302.39972-1-manishbaing2789@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_000535_942048_B6CBF2F6 
X-CRM114-Status: UNSURE (   8.34  )
X-CRM114-Notice: Please train this message.
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

On Fri, Apr 24, 2026 at 09:03:02PM +0000, Manish Baing wrote:
> +description:
> +  MT6351 Audio CODEC is a part of the MediaTek MT6351 PMIC.
> +  It communicates with the SoC through the MediaTek PMIC wrapper(pwrap).
> +
> +allOf:
> +  - $ref: dai-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt6351-sound
> +
> +required:
> +  - compatible
> +
> +additionalProperties: false

This should be unevaluatedProperties and you probably miss here
sound-dai-cells, but this is semi-abandoned incomplete device without
users, so pretty does not matter. Conversion to DT schema also does not
matter that much. :/

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


