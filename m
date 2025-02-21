Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CFACC021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 09:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eXDcWPDLaglL316SDhxzWpx6i5mvQIaAZsYp7Kr+3ZQ=; b=NsCK6yKBo+PjOfU34tlALiCsu6
	Q8GbSbQtxDK7yAETwY7cbPk6/l6t2y9qXdKveF9sY85cj/cyShLAyPnZw5rzJOpVPHgNFbebdofVt
	5/R8pHZXflFJS0SpTvQkDY90sI5hCAQp+D7xUnDvVt9eqc86C7tHeg2Vj9Hj65MHoayuM2WJMF9Mq
	8oIag8DKYm5+Ms7R96eVlQV/SqHgro/yWVrUlAtxxhAf6X9txNXYWhaHllXey5MgSo+0fj9PxWTHD
	P961FZORZKPTu2WeXdE6EDzlpl55dyPp2up34rhKkXaU2Vtb0rXs4kmGwrbS9OTMByHlR/tJjN12+
	8i5fcYWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlPjG-000000051uO-18yw;
	Fri, 21 Feb 2025 09:53:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlPV0-00000004y6s-1aSZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 09:39:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0B1055C54C3;
	Fri, 21 Feb 2025 09:38:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41675C4CED6;
	Fri, 21 Feb 2025 09:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740130748;
	bh=7iSC6jX/BBYZhH5CaMvHMaDMArGW/YNl+vqAADY7Ryo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LPYUgpNUY6pSswlFIBr7Sc7Jt7au5PvMrBxeQRljl90tC9FK685BZQaXbYqm8lk0+
	 G05lEdamwdcfC9P5awa+51GjhhSHmY5kXPfyE++ev9CVcuFS91FVc6qGCzCtw3u3kq
	 DVXcvlbu8SPq0RLTGPnamPS8F5eywE0BT1MDl/i+kl0R6iNZr3AuNuR0oeTj0jI+dC
	 BgQNxQTQy2dbIXAPv6HNdxmsQ9XCZZc9qtq1I+BK/XQ/bASOz+9DMrv4jl/SFc19Pc
	 ku+synFWgrAeQQGcAmJcnkYIY4sL2hmx+/UemrDn4BdzT6i7/gaPHczw5Kj9hGSYBd
	 4pTbZdSAlFJdQ==
Date: Fri, 21 Feb 2025 10:39:06 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3 3/7] soc: samsung: exynos-chipid: add support for
 exynos7870
Message-ID: <20250221-stimulating-sophisticated-armadillo-0a72bb@krzk-bin>
References: <20250219-exynos7870-v3-0-e384fb610cad@disroot.org>
 <20250219-exynos7870-v3-3-e384fb610cad@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250219-exynos7870-v3-3-e384fb610cad@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_013910_457727_B8C0DCA6 
X-CRM114-Status: GOOD (  10.48  )
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

On Wed, Feb 19, 2025 at 12:33:13AM +0530, Kaustabh Chakraborty wrote:
> Add the product ID of Exynos7870 (S5E7870) to the existing list.
> 
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  drivers/soc/samsung/exynos-chipid.c | 1 +
>  1 file changed, 1 insertion(+)
> 

This does not apply anymore - conflict. Please rebase and resend.

Best regards,
Krzysztof


