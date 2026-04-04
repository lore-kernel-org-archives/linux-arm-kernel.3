Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF8C9E88D9F
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Apr 2026 15:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uLOsTxkMLJpXECeSjmyn/wUElIywieImQ4D0HxPiUg8=; b=QYVTiHz549Vv3dI+R7h3hhx7kk
	cPR7EdPSFnoDYk34EghBgO66p1m9qFW5OoE4s90E32i3YmBRAW2yx5OGO84dSBn1JFY83itMwNZU/
	cBr8nWEZQSvq74EA4drb3H5wE9PMuDQnT8alQ5Ic+NlSmvK6izZSNA8hCBo1dqs9g5cOGXsWogGjj
	zfXnc5NtoqZUdUkosTlNW1HTuU/lJX3BmN+cVkIj/ga7vWVQx+tqYcYhulU2sPiIzfHN7DDbi7PaM
	AT7wzo19SvCvh7rvRQtB31mwPDz5q+dDqjRV7PopY3eUKKDGNR+LXcIjcH+w3SHoGzdDRBES8bdZY
	wSAqg6Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w92s4-00000003YpT-3Yah;
	Sat, 04 Apr 2026 15:25:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w92s3-00000003YpJ-3P3N
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Apr 2026 15:25:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8CE3060008;
	Sat,  4 Apr 2026 15:25:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D56EFC19421;
	Sat,  4 Apr 2026 15:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775316310;
	bh=APOJ9yjOq4YrGjELxjclABUprH8J0TZfU15XjIenl1E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mXSZz5qndEjJF29Ycd1JYhl6ImQxdiG12iUWL6bG9+iCRZ71YWoe0R71opMbCBsrN
	 +r8SNp7IkGuwTTKzoEZtJG5FGL7ta5oI0C0MUPp20eQC4KEK++jLmbGrBifZ7n2IkT
	 qZKOYzrq8F8XuK6W/HKtx+8a0RnZ04zSbhuBYC90RLU/ywXTnhgNuEOrdZuY1MwoXZ
	 +DJm4gDZ1nL/wE2CaoS+GSgJVy1zTvDnqmshElpvmeOUvlT3YL0zo9GSv2sqIynP90
	 y+bHA9FVnVpRRet7/7tP/75JK3nmtcq5Z//5hoYADdqxfmzxV+7xrr/rWrr+T2kFn5
	 eAqnLCpRzn6Ow==
Date: Sat, 4 Apr 2026 17:25:07 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: soc@kernel.org, arm@kernel.org, nicolas.ferre@microchip.com, 
	alexandre.belloni@bootlin.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] Microchip AT91 defconfig updates for v7.1
Message-ID: <20260404-versed-squid-of-upgrade-03aafa@quoll>
References: <20260403070259.2552626-1-claudiu.beznea@tuxon.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260403070259.2552626-1-claudiu.beznea@tuxon.dev>
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

On Fri, Apr 03, 2026 at 10:02:59AM +0300, Claudiu Beznea wrote:
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-defconfig-7.1
> 
> for you to fetch changes up to 1f17fce8bf19a48e5e5610c6da8f806eab81878a:
> 
>   ARM: configs: at91: sama7: enable LVDS serializer support (2026-02-28 16:04:03 +0200)
> 
> ----------------------------------------------------------------
> Microchip AT91 defconfig updates for v7.1
> 
> This update includes:
> - LCD controller, LVDS controller, backlight, simple pannel, touchscreen
>   configuration flags required by SAMA7D65 SoC

Thanks, applied

Best regards,
Krzysztof


