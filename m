Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 938C5CA5FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 12:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BjdWTCMCrG0qSY5UkWMV3CxXtTMt/S/l59K8lGrEUjI=; b=zHTj+0K8FK/kPI/FTeyO4QSUPn
	okss7XoNWuA6BNxE5p18qG1pIjfTuRTfkLbRGutMnMjB1aGqJ03iELNDVEf222oqcYsIwS1q4ztjv
	0SnIk06LJ2ZbZG4Na9v8ar6PYO0mJzLZqmowImepLwft3poT6rxlIa4SOPb5hMopu2g2fUfBVM17v
	TMjbWv8HIA9cPby4LwnXoxk8Jk9ZBTzF89wKJp4uiT+4Tc5wFCtA389p2fiBQEgVLLurGbRKT1koZ
	Y43OwWWpN0lbQugK3n3BIqKv+fI2SCRYPljZfNXRd5Mel7pS9W1DmL3wZ0n0fl2j9nHVYlx7mmWds
	G68fLRDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCFeg-000000092EF-2IKr;
	Thu, 01 Oct 2026 12:12:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCFee-000000092D6-3OjJ;
	Thu, 01 Oct 2026 12:12:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 080EB601E4;
	Thu,  1 Oct 2026 12:12:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8428B1F0089A;
	Thu,  1 Oct 2026 12:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790856771;
	bh=BjdWTCMCrG0qSY5UkWMV3CxXtTMt/S/l59K8lGrEUjI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Mv2uQhff028iEsz0sMG1AJEXmo0Q1SoxZBqU74WS7UHjYb5T1cA/NF8YNj3zfPWCN
	 zy7VyZ9jMQkJn0TEBD+4Uju18urhDsM6ioXFMI7+46fet+ECfZxegY4BBOF0EpL7mx
	 g05v8WCce9xWCh26rJ6O2p9lT6a0H4rDPcP/kOMcCU41ENhkJFrW7ipb45TyqBQ51F
	 965Qx63eAXN8Wx39QaWNFOB5V0IygeoJqWoImxkUMA2XhkMESaS1P01luR9z1GvKyN
	 ltfQpb+toIrithbl2tKEWP1nT2cPDW4NvaI2dDvc4SyDXZ/LSC+9ul0bQaVkfC5mIa
	 AP8qgOPW2155w==
Date: Thu, 1 Oct 2026 14:12:47 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: arm-soc <arm@kernel.org>, soc <soc@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com
Subject: Re: [GIT,PULL,3/3] MediaTek SoC driver updates for v7.4
Message-ID: <20261001-quick-curvy-dragon-b0fbdd@quoll>
References: <20260923103222.25504-1-angelogioacchino.delregno@collabora.com>
 <20260923103222.25504-3-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260923103222.25504-3-angelogioacchino.delregno@collabora.com>
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

On Wed, Sep 23, 2026 at 12:32:07PM +0200, AngeloGioacchino Del Regno wrote:
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> 
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git/ tags/mtk-soc-for-v7.4
> 
> for you to fetch changes up to 96c2b43b1fb305e91700f64e9f758fc140c66b83:
> 
>   soc: mediatek: mt8167-mmsys: add routes for all display paths (2026-09-21 15:10:28 +0200)
> 

Thanks, applied

Best regards,
Krzysztof


