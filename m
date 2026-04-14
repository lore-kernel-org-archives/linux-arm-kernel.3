Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FB1BF9D0E7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 16:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PcNL2JvkLWME3ozkn6G9unkuvHbCdgO3F2rHHMxczgI=; b=D3/YG+BDqCjOO1FRq9XnNNXzqc
	3cPw1sdi8EpsppG3VaTWOebwbHHTQQ00BWKyHrz7GzLX/9sqAtBSeNGU2rVAml4xMWZXpvm30PzTB
	lLjmn/VE5skUgwguVwUzUlX8rmJqo6m5v164kaHWAGdSmtDp8pTe+rjC6AJu/CNZ3un87XMj7nYkh
	67CdVgCtK2bpikBZ0AcddNNx/qdTT13iZDum9eJfPPXKmT50/ZQX08Ta2xoUdlpIvz+Ecq4T+re64
	HfepQ6O65INhi8RUQH6MVEF3JZubNyuY5kBWTw4uwXkLcOnoYBcg6brS7jjSTk5vm47Mgo5wWtrd7
	3IXljWIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCgss-000000001pu-0b2N;
	Tue, 14 Apr 2026 16:45:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCgso-000000001pR-3JqX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 16:45:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3B48143BF9;
	Tue, 14 Apr 2026 16:45:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80D77C19425;
	Tue, 14 Apr 2026 16:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776185102;
	bh=DtB5DYTaR28SLpzvv7nCbQkO6KtAJJ1wWIiVmOdIfaI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aUZZ36WQPvD5VXDAhUN8kn9hDHX8y/rFXzBwFBHj8Z/+AyewTEJe57G7U3P/2J+mu
	 f6iAJLIsEya1kwM0/GoCX6gceG6DI/KPLczf/692L6srICIXA+qj8Kw/R1F+bkR7bM
	 +28Ehl7h3iSR5NXvaESJe6BKTpIL5N1oRiVRPzes1NGmtzsFBTZb5IkuYRbUF9mCNI
	 W7wjsWrC7H9Bwdsce/2oru/2B9h2Yi7Wk7vieP51xR27ok38kd93a2k6vnXrqCo9fH
	 D5MZC7mVd8jZmFuAXSBqYzdyi0ZrRwIP0qtUpvKu4tqJGz6422NTule5W7Fwk+xtAq
	 viq72a875qHGA==
Date: Tue, 14 Apr 2026 18:44:59 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vignesh Raghavendra <vigneshr@ti.com>
Cc: SoC <soc@kernel.org>, arm@kernel.org, SoC list <soc@lists.linux.dev>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Tero Kristo <kristo@kernel.org>, 
	"Nishanth, Menon" <nm@ti.com>
Subject: Re: [GIT PULL] arm64: dts: ti: k3: Late DT update for v7.1
Message-ID: <20260414-viridian-turkey-of-progress-dd5094@quoll>
References: <6e294d61-9779-41ef-83f8-29f46fd98700@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6e294d61-9779-41ef-83f8-29f46fd98700@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_094502_855801_6986B963 
X-CRM114-Status: GOOD (  10.07  )
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

On Sun, Apr 12, 2026 at 12:52:51PM +0530, Vignesh Raghavendra wrote:
> Hi ARM SoC Maintainers,
> 
> This contains a single patch that updates r5f remoteproc DT nodes, warranted by recent 
> binding update merged via remoteproc tree.
> 
> The following changes since commit 47c806de9e9cf171d197f2f0df86df7f2bd1aa56:
> 
>   arm64: dts: ti: k3-pinctrl: sort shift values numerically (2026-03-27 19:55:06 +0530)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git tags/ti-k3-dt-for-v7.1-part2
> 
> for you to fetch changes up to abe76f9f47d59ff80eb2fc59482aa76bbf6fd13a:
> 
>   arm64: dts: ti: k3: Use memory-region-names for r5f (2026-04-09 17:05:28 +0530)
> 
> ----------------------------------------------------------------
> TI K3 device tree updates for v7.1 part2
> 
> Late addition:
> - Use memory-region-names for r5f across K3 SoCs
> 

Thanks, applied

Best regards,
Krzysztof


