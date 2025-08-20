Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B4B4CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 08:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w0m/uwLoaqBDdfZ2Fxv0SkIC/E5LFb8DKTNlslZJoeA=; b=D9yFhE9Q3mAgdbyvXP6gVLkKol
	SIzHcelZ04F9lPijHD2an7VBV6FX6dXT3afNmFTYUiWTEOnurYu4Si6prTiJlSUlYldyceprgT/ar
	VJlqT5zviR2FqGUFgGgbRZB8ZfntkvHgpUcVocz+eAJaD+VpgzF7nawaPfTzsMn0BroqTaxcQOe0h
	IF1NHNDXgLP/uo68z5ESzdQXMWNNrQIKRR96sybzv7O84eJVTfC9uDdxwDikq8A0iwsN0OtAhsEvD
	yl8vq6/MX+RXq047OGpfuqi+9DuM37lByS0YHYitiQC6ybJ6qxfV+/vfleTbw5z4qw5tgvOmziqvW
	MF+bKeaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoeQA-0000000CmkL-13Cq;
	Wed, 20 Aug 2025 08:43:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uodtb-0000000CgWn-3oyI;
	Wed, 20 Aug 2025 08:10:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 06A38613AB;
	Wed, 20 Aug 2025 08:10:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46E55C4CEEB;
	Wed, 20 Aug 2025 08:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755677410;
	bh=rMAGOw8W70aPMqJ4oYe4yG8AyBcRn52d6Z3l0h2p0l8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=knRq30y8schxAtCBl9yankxHIXIaBa1fsZbg8BApQ/N2jeFgA0l3frjaQ0q3rljNl
	 HUgGU6Kz5FvpfsnjI305F6BxCN3uGWJ1QqTJn9hcCD8OaZWKA/3Na5gZsWBNeehKRS
	 MzsJQF9oq5j10wd0q80of9TchxMV4f2ohN2O2goKP1jIgWKtHQYjXzBJPJgZFCG88s
	 9hkw+cfcbIXzJ3lnfrYp8g0tpFHVo0E4Z3R2RrtDMmGF/LbvVeqDSoKZWPqilJDZ1S
	 EwJ4wuqBNbriuM4io1/zDVm3bhWLKkr7wXg3h0yQsdrnNrUakRFB/lLxS6TQMY9Frf
	 Yqt2cVeaXOmRg==
Date: Wed, 20 Aug 2025 10:10:08 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/13] soc: amlogic: clk-measure: Remove the msr_data
 from clk-measure
Message-ID: <20250820-amber-gecko-of-economy-cce4b4@kuoka>
References: <20250815-add-more-socs-to-support-clk_measure-v1-0-59f04ba67457@amlogic.com>
 <20250815-add-more-socs-to-support-clk_measure-v1-2-59f04ba67457@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250815-add-more-socs-to-support-clk_measure-v1-2-59f04ba67457@amlogic.com>
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

On Fri, Aug 15, 2025 at 04:37:28PM +0800, Chuan Liu wrote:
>  static const struct of_device_id meson_msr_match_table[] = {
>  	{
>  		.compatible = "amlogic,meson-gx-clk-measure",
> -		.data = &clk_msr_gx_data,

NAK, actual ABI break.

>  	},
>  	{
>  		.compatible = "amlogic,meson8-clk-measure",
> -		.data = &clk_msr_m8_data,
>  	},

