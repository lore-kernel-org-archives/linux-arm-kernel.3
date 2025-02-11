Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7CD7C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 17:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rLITmpaL3uK7l74cw28kx7BpxduePy9rCcfG59M+utc=; b=ieVwWnSnWpAUuMZhEc3nt8KAoO
	GCsblt3SlRZMPNYoJQ/1AtuXQP6BpQe7HrYytMTRQCrQum5/VcEop2KWm/Qu9Q1XTKmUbuvK8u9gK
	CUfYc1JQ/GdNwhesz5mSaWUsNkWiSihTcSlm6rx0XH1A1KhZB2j4lM2gJZPzz43nzEW6DV9NO06pb
	39QlN9Rg0bblNQw0GecEMk92zhDxf+w+59oin5h2rWO+PgIvYFiIvTRZcj9h1SigHDdUYNNesf11A
	XVXoEVgRtiU/NiRUlfq7U74uXILAXRhLWd1z0sMQdFZFh9tj9BZlw5o9hw3giBJXFOsvSxxgehQjT
	ZpDHm8nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thuKg-00000004k2B-46T0;
	Tue, 11 Feb 2025 17:46:02 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thuJH-00000004jod-0bKM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 17:44:36 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id DED51259FE;
	Tue, 11 Feb 2025 18:44:33 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3hiQgxbp8APx; Tue, 11 Feb 2025 18:44:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1739295869; bh=TE+kovlyWSTMFM9fyPUJLXEeOTtyEapgcVPRKbpjzOg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=VFxg8sGN0IUU3XQ5USJmAQHM6145IqrndAx5eElqea0kDetT2HI2qeb2kml2fCCP7
	 hyZg2F7CA2f/biN4WSDWG0Zmev29CfJSicVllTSFU5OFlnULRqqLF40hhUMjycBSaR
	 vXZeDIzvtSadeJbMHiZh7UnKxsYUo2MBFh6/r7HMzh1ixNG30n2q7GhldYyizIufyr
	 cfninSgKMS5tmGlNZ1H0kpxtR7tMbGJ58T5ja3IC6BrSh2Mx7iZoHGDEF7zNLUX9tr
	 v9WY1R+bQLXGZLuV4N8IGiYvAAfCwJxEHto71LHdBaB5ZmDJ9DVv/PpFvGW5k53HXz
	 wAbpomHFU4K1Q==
MIME-Version: 1.0
Date: Tue, 11 Feb 2025 17:44:28 +0000
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor@kernel.org>, Alim
 Akhtar <alim.akhtar@samsung.com>, Jaehoon Chung <jh80.chung@samsung.com>
Cc: Sergey Lisov <sleirsgoevy@gmail.com>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Kaustabh
 Chakraborty <kauschluss@disroot.org>
Subject: Re: [PATCH 0/3] Introduce DW MMC support for Exynos7870
In-Reply-To: <20250204-exynos7870-mmc-v1-0-c87cfc72be4a@disroot.org>
References: <20250204-exynos7870-mmc-v1-0-c87cfc72be4a@disroot.org>
Message-ID: <b37f41ddf7d16fa1150f25891a7603e5@disroot.org>
X-Sender: kauschluss@disroot.org
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_094435_316757_E517A26B 
X-CRM114-Status: GOOD (  12.32  )
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

On 2025-02-03 20:34, Kaustabh Chakraborty wrote:
> This series adds support for SMU and non-SMU variants of Exynos7870 DW
> MMC controllers.
> 
> Some DW MMC controllers require two 32-bit r/w from a 64-bit FIFO,
> the series implements that feature as well.
> 
> This patch series is a part of Exynos7870 upstreaming.
> 
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
> Kaustabh Chakraborty (1):
>       dt-bindings: mmc: samsung,exynos-dw-mshc: add exynos7870 support
> 
> Sergey Lisov (2):
>       mmc: dw_mmc: add a quirk for accessing 64-bit FIFOs in two halves
>       mmc: dw_mmc: add exynos7870 DW MMC support
> 

Please refrain from merging the following, wait for the next revision.
[PATCH 2/3]
    mmc: dw_mmc: add a quirk for accessing 64-bit FIFOs in two halves
[PATCH 3/3]
    mmc: dw_mmc: add exynos7870 DW MMC support
Thank you.

