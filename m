Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09315CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 15:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ySUKec7wcMB/xPZzhKACyCo75gQZPqejQV+yYGMai0=; b=rK4ixZUG75E22aDi9wifnFUrNX
	PqA4p8fALTzKN41N8C4W+sbOoJFjHb2803GG4+kG57+nJwgtJ2+aWKc3+fyZxxL/1Yp+f+B7ewjrU
	SRpqtKO2ZyieTxiXZXAlLPTitAWm0rehWFhdJLU5t+0T9cxVxDh7FtqPakxQORQxHfwWEzWrqbelO
	Rm1fJ29B1JDffVM3j2yq5ZIUHmahwxMRqW0sBdVUv4iUyPhJ6iwIazQBDme9skNTKJubdCltfwcfi
	E5bv3chY50kwnVXr5Fyf6bzGWCI+7uGVWD1KAnX2JtR8sfCZR1uQhu71tix+ZqF4OjJFRzj/JQZal
	J7KTjc8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3z9I-00000008SJj-485o;
	Wed, 01 Oct 2025 15:53:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3z9H-00000008SJS-2uT1;
	Wed, 01 Oct 2025 15:53:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BFE2961E8D;
	Wed,  1 Oct 2025 15:53:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51AD2C4CEF5;
	Wed,  1 Oct 2025 15:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759334026;
	bh=jWXIj+XQH9k2rgZC0jazDofhOuOkjdLHKY7Gs7wBT/E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TrzW+CXIWwbeoLSHb0D68yTZm+49nG0+/giNoRu8VZ6yS0KxEgGU+delOR0dbRxEe
	 IQknSZeIOek17i4D7cs8YDPO7sUsTxtJD5+vIXDgbm/fMK1Cpdl4JJ9Zo0J2I9UQVd
	 H1TUK4T69ulJ8R2VFXtobzcY9OnEw+u95pU9WzQVip1f/55ZcsJZ9ayVmdPSTlFEr4
	 fcC0+w2TXcTY862q2+zieIDlUMpoENEfeB+dS9fqSUi/fgOrHnCEm0hBTXEAFLga5+
	 FDe3B0MzyLq2U9bI31Xf99E6JiCRuMIEUba43kO6VkKe0gK0bgIML+mdvJj6JdJJWL
	 LnljY/N8OWHxw==
Date: Wed, 1 Oct 2025 10:53:45 -0500
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, lee@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, matthias.bgg@gmail.com, lgirdwood@gmail.com,
	broonie@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com, wenst@chromium.org,
	igor.belwon@mentallysanemainliners.org
Subject: Re: [PATCH v6 7/9] dt-bindings: iio: adc: mt6359: Allow reg for SPMI
 PMICs AuxADC
Message-ID: <20251001155345.GD1833526-robh@kernel.org>
References: <20251001111316.31828-1-angelogioacchino.delregno@collabora.com>
 <20251001111316.31828-8-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251001111316.31828-8-angelogioacchino.delregno@collabora.com>
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

On Wed, Oct 01, 2025 at 01:13:14PM +0200, AngeloGioacchino Del Regno wrote:
> When one or multiple Auxiliary ADC IPs are embedded in a SPMI PMIC
> it is reachable at a specific address.
> 
> Allow specifying the `reg` property and make it a required one for
> MediaTek MT6363/6373 PMICs as those communicate over SPMI and also
> disallow it for the others (as it wouldn't be applicable).
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../iio/adc/mediatek,mt6359-auxadc.yaml         | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

