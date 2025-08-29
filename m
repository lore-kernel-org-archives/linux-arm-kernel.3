Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0645CA1002
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 19:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WoKFvI9iKmCL7/c1udLi7Jo3S0oInoOcSE4k1XZ3llM=; b=W3EYdUhDZTN5GLymthpbDLpzEh
	2XkN+kdDFXb+CCta8modm8ZENSBBP1xWO0fcPKAKDGpelWYGJj7PciXC9KWT3l+M+jSUHiBqtoYV4
	knY9fsTZ1xon+XebIguc7Ia7IEVeWXhDY4b3IKM0la4T6X8kOKZV2ubmpN3Ew+PJLxa5WVxU41pLv
	gqUUmtmXUDvrBkZerZpuKE43LVrGNcORKXKHnx6KjGnz/foStskxu5bnQeQuXQRyxH6prm/w07vMo
	/9iDXWjeq2BFtjdsVsR3/9c1MjNNQfYVHL4/9KA/vfI67dDh77ePNLrfi/M2piD+wYxO5tvZPUs4H
	xo32GHDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us4tE-00000006kwx-488U;
	Fri, 29 Aug 2025 19:36:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us104-00000006BTK-2gcu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 15:26:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E5F0A601B8;
	Fri, 29 Aug 2025 15:26:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71ABFC4CEF0;
	Fri, 29 Aug 2025 15:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756481207;
	bh=8/whQ2AYGJljhj+H+joZZMEKLmK5unw1799A3xVGcIw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mfcwL2rt8JmlBQR3w0v8OzXYtdc7gDtGwxPSdcBWiH9yXWpruV9SaRuR3IWQVh1eu
	 AUpbDreOMtWR56T9K4ytAB8wq21sTZdZ0W811AF6EiEFJy9SbjBD0Afmkg/iwE/3uO
	 N8/d2wUMVVol4KMsCa6S4d7f0Qk881HBL3oU1hi1HLsm0dfMacgSKSXwvj60xzFBpl
	 zMcMD95kk9uqDtPJZhES+9J9ZIRpQjYQZ3TLGO38u56nPYe8rOcVmlis2E7CseUO3I
	 NfEkdSDKuwhTjm5Pfp11di3jb1AplQgjI3+ayKgm6XaHd29dyczmyLjsnf8cYK/+oG
	 24jaRn+OlYSkg==
Date: Fri, 29 Aug 2025 10:26:46 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Denzeel Oliva <wachiturroxd150@gmail.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Stephen Boyd <sboyd@kernel.org>, linux-samsung-soc@vger.kernel.org,
	Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v4 2/4] dt-bindings: clock: exynos990: Extend clocks IDs
Message-ID: <175648120535.809657.15013555721063898358.robh@kernel.org>
References: <20250825-cmu-top-v4-0-71d783680529@gmail.com>
 <20250825-cmu-top-v4-2-71d783680529@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-cmu-top-v4-2-71d783680529@gmail.com>
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


On Mon, 25 Aug 2025 05:51:16 +0000, Denzeel Oliva wrote:
> Add missing clock definitions for DPU and CMUREF.
> 
> Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
> ---
>  include/dt-bindings/clock/samsung,exynos990.h | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


