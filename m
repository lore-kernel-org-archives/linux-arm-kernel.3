Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E707CA5FCB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 12:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fTheCtXk8XaSmkfHsLnCjU58UvR0FjZKzHGfT+fHM6U=; b=vHE3iHaDUkd7WbOQjR2BxNlFgV
	Mvtqlpr/KT7dbHfDD4ftFLybhramcRkFNNnu5tzXYj49BA3ESEBI6IDYz/FgsxRWnSazzuw+P70nT
	Kd9eIUvJwuHpsC1e39LVgY+0PkTsfLIyNjBjq2xPAniMONrTJiWdSNGfBCFFHWEeVNfUpz2C4SzxZ
	t/Tkg8VvTS1tYx7qcf47Zc2J2ytS+9FODxonGtHcgoWnmUCWZPrwv1oYhVrr7EGDjyqaLrlf74P02
	luMQt2FOmEwuTYjOU3jrAOfvDAVTYHs74NTIsS41ymSikfteH5QMy7j95HXEgDuoaQ6MdFvreNs2m
	IGcIs3lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCFbE-00000008z0x-3pLu;
	Thu, 01 Oct 2026 12:09:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCFap-00000008xvE-0kmA;
	Thu, 01 Oct 2026 12:08:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DB12A4402F;
	Thu,  1 Oct 2026 12:08:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEC341F000FF;
	Thu,  1 Oct 2026 12:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790856534;
	bh=fTheCtXk8XaSmkfHsLnCjU58UvR0FjZKzHGfT+fHM6U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XgW5Jy0ZaSFeVwUsAQA87Zo1H/iLOEUmZTLoHoCpkQu1OZzviJMO2eXr1jEKmDdd5
	 zkXVROYIE8BlF7w0Kwlw+RWyZu0gt2xMi8YD9qeWv55ux6ZxdgQend3eEG5/Aqj/cA
	 FjIWpyn3+pwpR1SsZd1AuXJhrUWiGL6kpU9Z56YoS/ctdALAGvBsQ7ysIbwMEZuSlc
	 EnUKXTlcIlXYtoJTQkhtL9VShUh/Iwdu9HUrkVgKdeqMcEIwusV0ANXPNttg+kqLgL
	 GA45LrKr7cxHI9dJ+yS9jH4Qsk7SxO2Dq7dUi4SAGhfwNIniSzTVFgA5HYjbz8SFap
	 LpAeTSiVjqMdA==
Date: Thu, 1 Oct 2026 14:08:50 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: arm-soc <arm@kernel.org>, soc <soc@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com
Subject: Re: [GIT,PULL,1/3] MediaTek ARM64 Device Tree updates for v7.4
Message-ID: <20261001-free-zealous-porpoise-7c6eb8@quoll>
References: <20260923103222.25504-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260923103222.25504-1-angelogioacchino.delregno@collabora.com>
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

On Wed, Sep 23, 2026 at 12:32:05PM +0200, AngeloGioacchino Del Regno wrote:
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> 
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git/ tags/mtk-dts64-for-v7.4
> 
> for you to fetch changes up to bf89276b2db391cbb25d1a0e898280fe85b16fb5:
> 
>   arm64: dts: mediatek: mt7988a-bpi-r4pro: label gpio-hogs (2026-09-21 12:22:18 +0200)
> 

Thanks, applied

Best regards,
Krzysztof


