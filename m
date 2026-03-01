Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CC75FD005C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 11:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1xbtWZ0FB6pS2OV5dR7hJGWNVGmBVyFK/WExLT6b5rI=; b=Yag343pl8Sxj8Y5PzJ9DhulxNW
	IvmCkvcP4EBJmFS5z4UiqSSsGzQSQpXa8rvt817PuLQS8oXKvQMrD0m7fiKS6vS2jFRUpTlxrUvRH
	I+FUB7acx70b2cyvR+zZv/fpOUeLq0CJ8tnCmx01NWa4Hgoup6I7FqGkeOXCYvDv2FL/iHC4ghSlg
	kbhkR6kqz5Qp6ywAurXkfDNX6UBKag5UbX+aVI6xJ8BCv5duN3OW0/Z4SX1sc/twgTE7e/JI90j9o
	E/q0unAXNiCRu7PUH5CPq652eHYE3vav9cLkeeMnbR67o6c1lEfjwFsRVdQYXOHzXUD554XBar2qg
	wSDeTcJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwec8-0000000B3I1-2lYX;
	Sun, 01 Mar 2026 11:05:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwec7-0000000B3Hk-3E4v
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 11:05:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 39D9660008;
	Sun,  1 Mar 2026 11:05:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E4A6C116C6;
	Sun,  1 Mar 2026 11:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772363129;
	bh=dRHYs8tlqK30WaAI2PEsd5FwcqUMDjbm1x5fp0ZeaWA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=raEMD19uRgq3nTOzkcuOknlBXE8AmVCOiW/1qwmUJXkMdGktl2SiDeFnma8T4bQmM
	 ieyvFJcdQpQ5iOYCLzlTqVyiROJIoInRidrXDKkVqFuRRHycm5Rb16nBImgdM0Yz6w
	 0y2fL9/OPLcaq0zNXpDnnJlbnzZB5OGZOWQpuDBqlrA45jOamsf9hnxF63L1vaKfMJ
	 Bs0mlKcmJtv+dKuMtcf1yyJyX42HKkZO9ZIIJuWeh1HCDOmcpXc8p3p3Kci1w8iNFP
	 NWkwfhaZz+RQ6wqRSkTLB5ycCZOBUu4kymRdB4ov4+j9JOgw1t5kxCCnQMcUcIJvzL
	 TAFMy/YKVjXfg==
Date: Sun, 1 Mar 2026 12:05:27 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Xueyuan Chen <xueyuan.chen21@gmail.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Chen <peter.chen@cixtech.com>, Fugang Duan <fugang.duan@cixtech.com>, 
	Gary Yang <gary.yang@cixtech.com>, 
	CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/3] arm64: dts: cix: add src syscon nodes for sky1
 resets
Message-ID: <20260301-neat-thistle-terrier-ab2885@quoll>
References: <20260301070910.6169-1-xueyuan.chen21@gmail.com>
 <20260301070910.6169-4-xueyuan.chen21@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260301070910.6169-4-xueyuan.chen21@gmail.com>
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

On Sun, Mar 01, 2026 at 03:09:10PM +0800, Xueyuan Chen wrote:
> Add the SRC blocks for the CIX Sky1 SoC. These blocks
> provide reset capabilities to various peripherals across
> the S0 and S5 domain.
> 
> Signed-off-by: Gary Yang <gary.yang@cixtech.com>
> [Xueyuan Chen: Refactored to pure syscon nodes to fix v3 review issues]

v3? We are at v9!

> Signed-off-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> ---
>  arch/arm64/boot/dts/cix/sky1.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/sky1.dtsi
> index fb8c826bbc97..6ad5dc368a66 100644
> --- a/arch/arm64/boot/dts/cix/sky1.dtsi
> +++ b/arch/arm64/boot/dts/cix/sky1.dtsi
> @@ -348,6 +348,12 @@ i3c1: i3c@4100000 {
>  			status = "disabled";
>  		};
>  
> +		src_fch: reset-controller@4160000 {

Random set of changes without any explanation.

> +			compatible = "cix,sky1-src-fch", "syscon";
> +			reg = <0x0 0x04160000 0x0 0x90>;

And here...

Best regards,
Krzysztof


