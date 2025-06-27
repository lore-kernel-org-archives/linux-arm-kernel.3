Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02235C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 20:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JKxcZNNd+JCvEj7Obhtk0GghLfjdb3+t+yY4i3sE4tw=; b=bdywQxlfDFkXsdx5iiH7z9NLNF
	ak1iFVwlKLMFzAf45OBXHWCUG9lWQX3wjU6wjgj4bZpTArKf3/6Pd/Mjd7dqISZbKdo9gVQRINSf2
	qUHaamTUkIqB8QTQ9//jdTMQOMupSwjPBWsxDb6Sz2aE8iMpN0QzxA3UDB4+8DYbJVMAWuq7wS8oT
	1Izi2cSbbg70fNGF0F4uheGXHzyc1HeGp6vMHDQNbeLSKMU5wZuyVz2mgkxteNgIrPsrF//MNh0Yz
	WSWPVs4HFkQ3vh9pNanz168M2PhWDD/UubFO0k5g/jqtZttED7w5LPUmCQlbSccYWGvsrvVbG+0Wd
	0MWQfP2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVFMI-0000000Fifs-3Mbu;
	Fri, 27 Jun 2025 20:07:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVFIu-0000000FiE6-2ai5;
	Fri, 27 Jun 2025 20:04:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EF851458C2;
	Fri, 27 Jun 2025 20:04:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ED8CC4CEE3;
	Fri, 27 Jun 2025 20:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751054647;
	bh=tgwNd1+4u4rC2Sp0anrqTJg1qUn+7u4c6tn8yXP30sQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KDbSwn3PG6J7xcqj4WyOyCLZ1D2ALUJQcdlUyS40uZlTCkMNukQxkz2Rhi8iAdmtU
	 0WLParewBb/lZrCh8C/zZCz6viU1ie2dvVFSty8gADvJG36hKRHvTSouRNJgBE5hzQ
	 WcDMc5/nf/g/nCBG0nWJQQNqZbS9SK+6FH5Z/OlDt2jRw2dkihyuYyuoMJl3BVupP7
	 KpV3ilsPXVPIUyynaPLwpl9i90nP9YlVgGoHhyVuob9T2AbMmFUgDOyh/gVETrbnRk
	 TpdNtnC4fNA3vmNhlsqBYcsc45dfLjPol2s54kCQZ7ZVxFxYf2q16VRy6bbZc1KoEj
	 KzgPDTSsR2oaQ==
Date: Fri, 27 Jun 2025 15:04:06 -0500
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com,
	andy@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v1 2/5] dt-bindings: iio: adc: mt6359: Add bindings for
 MT6373 PMIC AuxADC
Message-ID: <20250627200406.GA4090376-robh@kernel.org>
References: <20250623120028.108809-1-angelogioacchino.delregno@collabora.com>
 <20250623120028.108809-3-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623120028.108809-3-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_130408_674606_ED396FB4 
X-CRM114-Status: UNSURE (   9.73  )
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

On Mon, Jun 23, 2025 at 02:00:25PM +0200, AngeloGioacchino Del Regno wrote:
> Add a compatible and channel bindings for MediaTek's MT6373 PMIC,
> featuring an Auxiliary ADC IP with 15 ADC channels for external
> (SoC) temperatures and external voltage inputs.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../iio/adc/mediatek,mt6359-auxadc.yaml       |  1 +
>  .../iio/adc/mediatek,mt6373-auxadc.h          | 19 +++++++++++++++++++
>  2 files changed, 20 insertions(+)
>  create mode 100644 include/dt-bindings/iio/adc/mediatek,mt6373-auxadc.h

You can drop 'bindings for ' in the subject. We already said 'bindings' 
once.

Acked-by: Rob Herring (Arm) <robh@kernel.org>

