Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A807E6F095
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 14:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uQ2WAHS2Isb3u0T/uNoKrcRtUhYa+eMIHzKU3GIBezI=; b=jvei9RjFNCyT4ETOaH1w5WPDKb
	Yo9mGxNzfGqSvnrPJiNshu+rC3lwns6pekml4mAKq2Mn2W7/USuxv5tkTSXGdRTGmBYpc31Mm81o+
	mz/j9I/gyg4o1XslPB1eQ/4+LVHXhhr0f8AgR9jtHcsmcUv3LciOaWiM56fWTs0DpBoryhq4OovXT
	mxVarcwTyTPKuAdNx6MkIfTXv/ZNagR5LpR/r6hUOUC5CVkiY4SRU/j1NpcynazPwNAPNuGdWrxDj
	iFNb+DejHgZ8X7uPnlW5OORULTFvE3j0dafqOAFqAWQhL7PMDgM/DjNdgJwWJ/B0ue1+q/CzqhjDg
	i4cLIsRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY3TW-0000000Fcj4-1rYN;
	Tue, 23 Dec 2025 14:34:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY3TV-0000000Fcip-1ruj;
	Tue, 23 Dec 2025 14:34:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DD9C960139;
	Tue, 23 Dec 2025 14:34:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68B82C16AAE;
	Tue, 23 Dec 2025 14:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766500496;
	bh=GXtA+vB+W9gE4Dn/u160SHU3bD3uZ/5Ml+1W+23Kiwg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LUpNs4vhYmXhRm1ObM0ruZ/cdf+EVFZ5EU+hW1R0kx15iGOoVNNkXIhCq6ZEe6+nm
	 x2mFl1uR73zvgyI9B6Lib4DBUesmi30KrBJfAyYByz/Lky7qqJRnOiZrLfNMO2RAEo
	 P+0RbpwhaIiAbaixDEqDRPcdqwK1BY4s7swnbvRqXHdAz4yPiHwRbxn0Tprv9dwKme
	 kJcpEq2SsKr46ufiqo7fg2MYG6Daoc2e6ghp8OkiW6PdjDZXzRRkdxCJw+S+yJF6f/
	 etTP2/+e8KI5joxJPC+L5KqOmhXxCDN/ELpZVFxryHh5DdPtL7QeYQDLezSj7Fc1Bn
	 pk8zxtFJh7bbg==
Date: Tue, 23 Dec 2025 15:34:52 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tzu-Hao Wei <twei@axiado.com>
Cc: SriNavmani A <srinavmani@axiado.com>, 
	Prasad Bolisetty <pbolisetty@axiado.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Harshit Shah <hshah@axiado.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Michal Simek <michal.simek@amd.com>, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org
Subject: Re: [PATCH 8/8] arm64: dts: axiado: enable sdhci host
Message-ID: <20251223-fat-nickel-copperhead-9adeed@quoll>
References: <20251222-axiado-ax3000-add-emmc-host-driver-support-v1-0-5457d0ebcdb4@axiado.com>
 <20251222-axiado-ax3000-add-emmc-host-driver-support-v1-8-5457d0ebcdb4@axiado.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251222-axiado-ax3000-add-emmc-host-driver-support-v1-8-5457d0ebcdb4@axiado.com>
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

On Mon, Dec 22, 2025 at 04:45:07PM +0800, Tzu-Hao Wei wrote:
> From: SriNavmani A <srinavmani@axiado.com>
> 
> Enable the SDHCI host controller for eMMC support on the AX3000 EVK
> evaluation board by referencing the SDHCI node defined in the SoC
> device tree include file. This enables eMMC functionality on the
> evaluation board.
> 
> Signed-off-by: Tzu-Hao Wei <twei@axiado.com>

Why DTS is both BEFORE and AFTER drivers? This is a total mess.


> ---
>  arch/arm64/boot/dts/axiado/ax3000-evk.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/axiado/ax3000-evk.dts b/arch/arm64/boot/dts/axiado/ax3000-evk.dts
> index b86e969625573bf92bdd5e4435ea571dd7500de2..a5cc75dfbe554749201b0910ec268c899bc5246c 100644
> --- a/arch/arm64/boot/dts/axiado/ax3000-evk.dts
> +++ b/arch/arm64/boot/dts/axiado/ax3000-evk.dts
> @@ -80,3 +80,11 @@ &uart2 {
>  &uart3 {
>  	status = "okay";
>  };
> +
> +&emmc_phy {

Axiado already received comment to read DTS coding style. Did you read
it?

Best regards,
Krzysztof


