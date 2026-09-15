Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5700BC88E53
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 10:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tTTo1b2FHnBApOFProxdU0vyMhrX5kO/AGRkhlVKgLE=; b=PhlDHy+CpUwXxCNcVYEx6Prznv
	MoyaL78E23xLtOhcRQhMySq2fOdvAr1N81+oRLl2YNoUSkNrRDmL6gNEUyQD5koFayGn03hWHopMU
	3kbNL42ZSXAiL4TF00jLWSZFDv25HVNU4w/SkeGw+A+LseBtAeqfRXqTv2sQQ99wZXO6y0mUDuKKZ
	wpwRLLSvTRhHYkh9Hl0oVf9tOctmA2axrrpJPTe+XZLZ3jvg7UViWQi7vuFdJLZi8sUuskNB/1iJj
	ZwCV/3Eeo3WRbKwV8BW1d6HXJdH9pVt5J674vMdpNEd+wewB3nAJ62z5zxTF/DZSvGshb1uRg1BtG
	u5hUfGfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6QZe-00000005wmM-1bHq;
	Tue, 15 Sep 2026 10:39:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6QZd-00000005wlu-08L4;
	Tue, 15 Sep 2026 10:39:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6747A4321D;
	Tue, 15 Sep 2026 10:39:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ED021F000FF;
	Tue, 15 Sep 2026 10:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789468776;
	bh=tTTo1b2FHnBApOFProxdU0vyMhrX5kO/AGRkhlVKgLE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DsvJHjde5hRHbDp8UkbkUBf8VNrGZjHlbZQwjOtedLCOrq152tR3KVyn30JdNeswi
	 zw0gh56h0HBNySyqrmF/AHyqo9tF8tBVhxY+fSmMNsQa40BViuy6bbZSUIaBxKtEPM
	 tWM8fMZaxcR9++ZWx7dwYk3/sJIrW/M4AhCHIbE+lm3e7K3vfEZ3eaFg/ral1jy7nl
	 KSiKtGzvTpCxqYD/5JlZKGt/F+7MQaLQeCiFxScmhYoyznEQvZO8UTa28sC3IuFVtV
	 hzW5dLs4PDuv7W5MwPBhYkcm2heFTLyt/A6Gw2BcHpuv14396ySS5is+Gz6v905GRb
	 ylGGoMtgsWhMA==
Date: Tue, 15 Sep 2026 12:39:32 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ryan Brue <ryanbrue.dev@gmail.com>
Cc: Nickolay Goppen <setotau@mainlining.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alexey Minnekhanov <alexeymin@minlexx.ru>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 0/3] Novatek NT51021 DSI panel IC driver
Message-ID: <20260915-funky-hot-lobster-2eeee8@quoll>
References: <20260913-qcom-novatek-nt51021-panels-v3-0-266bc5d7e8c9@mainlining.org>
 <2ac704f5-40e5-4212-8b16-6b23912ef4b8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2ac704f5-40e5-4212-8b16-6b23912ef4b8@gmail.com>
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

On Sun, Sep 13, 2026 at 12:23:46PM -0500, Ryan Brue wrote:
> Tested-by: Ryan Brue <ryanbrue.dev@gmail.com> # Amazon Fire HD 10 (2017),
> boe,tv101wum-nm0

This tag is applicable only to one patch out of tree, so just respond
there instead of causing scripts to get this tag to all patches.

Best regards,
Krzysztof


