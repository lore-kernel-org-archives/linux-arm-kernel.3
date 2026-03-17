Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22DC6F33813
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 08:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IakESoBeP8w1AHGToAICJ0P9z+UIVjADbjRxSMkauJ4=; b=ao0m2zbCr/FMv1r/Q/fUWWJgij
	Cits/cVoYRqCsASJCy825koo/DEuT8w8M1shcVpeUKysTLQbpeh18eHAa9mRmSdABX+Rq2m/VeG2l
	tPNYqIFQy9LRImIurslh3R8MM/+dkeE7BHMldOV2hH8PFscMv1a4XEhSYKRnuTYb75LZQ5NSsYiDq
	Dxrn+uS+CVin0tpkaLnwe5ofhBKkzl1cdSNNY4u9rMPV4GcIW3OulW10KXiO2X6l942V2uua44zFN
	jHEs7afnyYrCXflu9KP/CwaOx7IWB8SqbqeNZnd+XgD4os70nUP1DzPC3gzOMNnSw3/Mf0LHbZuLP
	2bGvEBrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Pvz-00000005jzt-2p38;
	Tue, 17 Mar 2026 08:37:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Pvy-00000005jzh-2cbv;
	Tue, 17 Mar 2026 08:37:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A394C60018;
	Tue, 17 Mar 2026 08:37:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0BF4C4CEF7;
	Tue, 17 Mar 2026 08:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773736669;
	bh=3ROM+tLx7TMgQ2ugUywzp/sxA2JiAFepBbbuV9ioIf0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QCcd57nSkG1imRW3wcIKJ54uHE9cRNkCGPtjkmjAasDZcQiuxxEDoUysrVEfofKR3
	 kqfkuzNAcljChr4EIELEZ+2RPGojZKbuuykN1BBjCAAJi8swMKPA8aUBRsH4nlOktS
	 rATS7B/pW5HbCkwH3zuY34CGmxzgQZlozYnofd1f1TlqHlMp/u0Yu8QtaaazNL7NqL
	 LovXvsUQsbz6UnNi7/NP7wfGpc3mjjZuESbkrpiLhQU9MiazhJLQ0Jo50PLJNS76IM
	 tHaK3xc3NChdBWIiTshcNY6M0Ru4NrjDDKD3Qy89A1udxKWs9+madYqmcJMP8PEPUA
	 nmILck5nB27Ww==
Date: Tue, 17 Mar 2026 09:37:47 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: arm@kernel.org, soc@kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] Rockchip driver fixes for 7.0 #1
Message-ID: <20260317-functional-hot-dingo-a286aa@quoll>
References: <4719110.LvFx2qVVIh@phil>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4719110.LvFx2qVVIh@phil>
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

On Sat, Mar 14, 2026 at 07:41:19PM +0100, Heiko Stuebner wrote:
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v7.0-rockchip-drvfixes1
> 
> for you to fetch changes up to 24ed11ee5bacf9a9aca18fc6b47667c7f38d578b:
> 
>   soc: rockchip: grf: Add missing of_node_put() when returning (2026-02-22 23:27:20 +0100)
> 
> ----------------------------------------------------------------
> Fixing a missing of_node_put() call.

Thanks, applied

Best regards,
Krzysztof


