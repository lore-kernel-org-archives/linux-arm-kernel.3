Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A87FFEF48E6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 08:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UE5Je9Fg+RzC0wVKNak9EnQCWei0KaHrxMzIlRVxPyU=; b=uwxaCahpdSCKE9MPvqxTNSbpiS
	Shy6vzsLEdR9N5Ep64LjagINZ9iwM2pDrNrfqvNq2FgOQlwQd7sYuehPF855D+CCDk3m6Jm1hY0NQ
	AJGUNhTeXKB2UTo6e1nggMM48xLXV0r7THE7ryfcb878hJ0BIbfNFN/63sjORssjM9ovTAF6dVVtG
	8+S4hIOBuExDtFOM90gWfKj9EG8YVl8rM40NXKgi9pWZM50rtP9Ao0tmI8+nMlpBL7x0IlGo4DpdJ
	vwstvTl2yc1qNAahgutpePxrwuBwhop4lR0N7OQdsfl1BpoJoP7b8rghOcZTmonuZGkM/6kF63IEl
	k/wL6PCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqoJp-000000039Rk-37vk;
	Fri, 13 Feb 2026 08:14:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqoJm-000000039RA-3UBU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Feb 2026 08:14:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 17497435BD;
	Fri, 13 Feb 2026 08:14:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67B3FC116C6;
	Fri, 13 Feb 2026 08:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770970466;
	bh=TYnHABlVGS+Vu5eoKfe227G8eLf+FnFIQUIXjC/86LQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gazTslRnIMIDWpjlpzoNXslE4gjEG17Q06lpvj3vr5UJ2SzOUnnFF707+71aKGssN
	 ETDdqGKORR1pRoj7zOmrR93bd5uZW2r0aIcQQRygJeh9xiLiW1O70dEUXjwS8asNoy
	 NXVdVViyyUuUDDgbrPVnNL49Ioo+YO06p/XpkHhiAT2Wjgl0ZKH+Dr4EG9zxcPvw5S
	 H+ZhxYQ0tdOgeApvqyNAw739C4k6StOD4NFGgXtkwBLS7MTNxO3y2gVBWtZYrK4dG1
	 LGwODnaJYF1BUSB8JGVD4JT4asX4TqC64v64P+p9+jcjvkh//DqtwxfrRXL+19d6wh
	 AYRMh4y05rKfQ==
Date: Fri, 13 Feb 2026 09:14:23 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hari Nagalla <hnagalla@ti.com>
Subject: Re: [PATCH 2/4] arm64: dts: ti: k3-j722s-main: update compatible
 string for C7XV dsps
Message-ID: <20260213-fabulous-divergent-vulture-aa1abc@quoll>
References: <20260213001151.17370-1-hnagalla@ti.com>
 <20260213001151.17370-3-hnagalla@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260213001151.17370-3-hnagalla@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_001426_888601_07268408 
X-CRM114-Status: GOOD (  13.36  )
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
Cc: nm@ti.com, robh@kernel.org, conor+dt@kernel.org, vigneshr@ti.com, mathieu.poirier@linaro.org, devicetree@vger.kernel.org, andersson@kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, b-padhi@ti.com, krzk+dt@kernel.org, kristo@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Feb 12, 2026 at 06:11:49PM -0600, Hari Nagalla wrote:
> update the compatible string for C7XV deep learning DSP core in J722S.
> 
> Signed-off-by: Hari Nagalla <hnagalla@ti.com>
> ---
>  arch/arm64/boot/dts/ti/k3-j722s-main.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi b/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
> index 9ee5d0c8ffd1..0a746ede01dd 100644
> --- a/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
> @@ -373,7 +373,7 @@ main_r5fss0_core0: r5f@78400000 {
>  	};
>  
>  	c7x_0: dsp@7e000000 {
> -		compatible = "ti,am62a-c7xv-dsp";
> +		compatible = "ti,j722s-c7xv-dsp";

Silent, unjustified users break. Commit msg is so poor that this for
sure should not be accepted.

NAK

Best regards,
Krzysztof


