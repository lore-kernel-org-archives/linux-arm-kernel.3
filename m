Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A618ECD343F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 14:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CEBLsdC5BhK44Ow0f/DvFi3ITfR7Y2d7VKh8V95wdMY=; b=mFb0/MIn1PWUuoYFN7CyJcHpUf
	x2WLu+MMjkInHVOo9A7Q3F2zwelLpmySN2XEityD5u1F0yrPy7l4rfKptTFxTIO3qiYsShd5AUDPr
	2LvRFDU/1RDXtINiQ2nrRsZH4xX1xMH4ouGDlDCuiDpL3Ty45Uld6/WkViQ4pVOJCkRlQBOyw9rw/
	tO2/Gx4QIqK5JNfFN5ti4k/Cnv19QejANpk5YFlxj1TF2b8E8bRmFxKTqszur3Sc0PQ1zKYNj4cRw
	iJz+P8Y1T34yYAnJduMVaeIWmEmYSO7QLhtsU+nm9UJXCD6QNwNbMIGLCCosRMnwCyan8dW+cagPa
	IVdS9UWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKziq-000000044EC-3Lrs;
	Thu, 07 May 2026 14:29:04 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKzin-000000044D2-3ViO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 14:29:03 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 61B2D2763F;
	Thu,  7 May 2026 16:28:49 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0bPPlxm6rDu1; Thu,  7 May 2026 16:28:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1778164128; bh=CEBLsdC5BhK44Ow0f/DvFi3ITfR7Y2d7VKh8V95wdMY=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To;
	b=H9g0LH3RjjyzOIC1+Hk+5regrB3BjwoyxdcW1xunzecRiKfuYk1yWQWLiQ2PQYKly
	 oezPg000Kdfk1X7f3a/XorXtnsJ8OG/IDaP/mwds/DSfjNCwKK3p6kbbesEeariTVr
	 IdOvjfyTyTuHziMn1ex6m2E4ksdyWDzNqALxQO2TBrh+GbbYKDHEDAtfep8u39NZ7+
	 0eOJKDiiM3WVcyepFVFi45W1DNtuaY1vfY0D9S4L2ZRbtXeMs5StXkICxJbQW/fodK
	 vRzUOhv0LGI2zzIG7Y/rjhmV1Chq6JKTa83qJiK/KbvUg/oiGO7Gj68ZKRnxNLdf9w
	 QCtclKZc+PvnA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 07 May 2026 19:58:32 +0530
Message-Id: <DICIKJZ1JOZQ.36S4SZ5G8RM5Q@disroot.org>
Cc: <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-samsung-soc@vger.kernel.org>
Subject: Re: [PATCH v3 0/2] Configuring DMA threshold value for DW-MMC
 controllers
From: "Kaustabh Chakraborty" <kauschluss@disroot.org>
To: "Kaustabh Chakraborty" <kauschluss@disroot.org>, "Ulf Hansson"
 <ulfh@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Jaehoon Chung"
 <jh80.chung@samsung.com>, "Shawn Lin" <shawn.lin@rock-chips.com>,
 "Krzysztof Kozlowski" <krzk@kernel.org>, "Alim Akhtar"
 <alim.akhtar@samsung.com>
References: <20260415-dwmmc-dma-thr-v3-0-31014d36b6ee@disroot.org>
In-Reply-To: <20260415-dwmmc-dma-thr-v3-0-31014d36b6ee@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_072902_290916_1805C1DD 
X-CRM114-Status: GOOD (  12.29  )
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

On 2026-04-15 20:32 +05:30, Kaustabh Chakraborty wrote:
> In Samsung Exynos 7870 devices with Broadcom Wi-Fi, it has been observed
> that small sized DMA transfers are unreliable and are not written
> properly, which renders the cache incoherent.
>
> Experimental observations say that DMA transfer sizes of somewhere
> around 64 to 512 are intolerable. We must thus implement a mechanism to
> fall back to PIO transfer in this case. One such approach, which this
> series implements is allowing the DMA transfer threshold, which is
> already defined in the driver, to be configurable.
>
> Note that this patch is likely to be labelled as a workaround. These
> smaller transfers seem to be successful from downstream kernels,
> however efforts to figure out how so went in vain. It is also very
> possible that the downstream Broadcom Wi-Fi SDIO driver uses PIO
> transfers as well.
>
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>

Hi, bump! What's the status of this patch series? Both patches have been
reviewed.

