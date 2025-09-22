Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51F0ECAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 15:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zFfvN8pMIYgJjOoQ7wKSkzUeV41xHTYvTZSGTU6enb4=; b=WVvVeSXwV+kd8f/PLV3c4ZgPLX
	moc31jZclh94e/oQlBBHrDptrN6Bg3LBSU38bcOhfej6pTsLQQOtPtpbfxZEjASsUNTVn6c6ZV6xx
	NrDz8B2k24ovujzY6S1HqyETVjiaoOUA98eATnkcN4GjmlskMN4Kfa2Hg6YeYAxq8EYmWuO5wXpqE
	NNViLw3qrb8p0j2Vg2SkHkrLUn95Py5WNyewK3SGBmAwdqtWfGxK62fgjDjqYakcBjsiHbypnIX9w
	xEm6KA0owjM1oafvhtAg5/XgtW3Cc4zSRUr3pJlDRDCs41z0wv2gsnMywX6EY2aDn2VBsRxoRAtxs
	2diiQd+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0iZJ-0000000ApXi-29ee;
	Mon, 22 Sep 2025 15:35:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0iZI-0000000ApXF-2287
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 15:35:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E74316020A;
	Mon, 22 Sep 2025 15:35:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C90F7C4CEF0;
	Mon, 22 Sep 2025 15:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758555307;
	bh=x+yYvHNSmvcVv77y7miMWOue4Y5ydSD0q1FOqvto+BI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SkwlHwUeGfUX+TMrhULRFwNoHl6PV8x2p5ll3AUw9muVYXM3EVfaPzwhbCJmSv0jx
	 58JbizFTSriYXEYXWs1NosL6tdMX8USyTdpNngtyeXV/rHPH8uMme7P7eJ5P5flO+I
	 g7oViGh4Vwoy3FKxRwZU4Eis9PM4WYovd8iPFOteLNK4EzJGO3yDbyMv1Nw4t3l04p
	 OuN5VZf+vs18BeOv1ouPzFzHaHRfljcjHs+ttPApFRKzvb+C05pjSCIyv4L1JErC9d
	 vR3YPJPNuMVqSOYWvQan8HbIG2w8AV2e7sCpJUOc66jrTByYZm3b2vNwkH1IXgT4xc
	 G7xaRcRxfmE5g==
Date: Mon, 22 Sep 2025 10:35:04 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Jiri Slaby <jirislaby@kernel.org>
Subject: Re: [PATCH v1] dt-bindings: timer: exynos4210-mct: Add
 samsung,exynos8890-mct compatible
Message-ID: <175855530446.4181224.17537732098135113411.robh@kernel.org>
References: <20250914132339.2623006-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250914132339.2623006-1-ivo.ivanov.ivanov1@gmail.com>
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


On Sun, 14 Sep 2025 16:23:39 +0300, Ivaylo Ivanov wrote:
> Just like most Samsung Exynos SoCs, exynos8890 has functionally the same
> multicore timer.
> 
> Add a dedicated samsung,exynos8890-mct compatible to the dt-schema for
> representing the MCT timer of exynos8890.
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
>  .../devicetree/bindings/timer/samsung,exynos4210-mct.yaml       | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


