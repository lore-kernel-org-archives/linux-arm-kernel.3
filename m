Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28087C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 21:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WQvjwkoGtkiRkc1QUmhqqnSjkKPzOCvNCthCIlj5iBo=; b=HFWCEVljLsAvUv5aLIm8TdY0DW
	UyeU6gky+ujWYlJ5QR0LlI3QCQsFMryrwN91ERB3NLY8pBBQn2zzqP6s4okNY7G4Q/XO3/TlhI08G
	JffSsIsRoO3iqXkLAjnN/RDh9QXHnla7rYlbXM6RwXX6JFKKL/FAhnozrtyQB0nxFgxhjS6Ro4iGT
	Al4XBJhBfKWjiF5ug/bF4ob9yl1bvoRcPLPKaD4Z3EPbdfyb9ym+rayS6Jc92mxiW8fq3fcrW14rS
	0LeMW24GJTFUqshOjBLDJ/uydQCPAeP7jJvO5bpPsq9RgeSXH1G3Pf5I0BtQLn66Ctm7hFyTIg6+E
	zdvdzm2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVGyK-0000000FteQ-0yUP;
	Fri, 27 Jun 2025 21:51:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVGqZ-0000000FsNe-30wg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 21:43:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3AEE15C4B48;
	Fri, 27 Jun 2025 21:42:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C61BEC4CEE3;
	Fri, 27 Jun 2025 21:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751060578;
	bh=czJLeHqDH1p8gvIVbBiKPlZAfz6hFhZHpZpUmMr4ul4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uX2nW3F60NzlirUdhuGn+AVs63uk+n9hSSxAUZyj/Wrrp43hdUDi/xBF1QFxeX3RQ
	 NHjTMB+zBHZPi1z893PX8D6bRe7NXlB3iUIVd7YzThcpaSRtiAZtHswxg1GxgDbda1
	 N3IZz/stGZQyaqdCEKbQxPpfPztxS5MzJTdyvhpduzzBJUdGtEHObV+1pW+MzFmmkS
	 t98XVMoiZJap5aU1bUMxXe0U4h17+145bsU6mYbG0HoTseRF0JoHpMAmnL3kpwE/wd
	 x5Yymx0tMLStbPFDz3AOxnBh2HDO1WD35mXI1jfSQCyPI4u0ff57TpGrTguTgO1HoU
	 WdHXIZpMabgzQ==
Date: Fri, 27 Jun 2025 16:42:58 -0500
From: Rob Herring <robh@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/6] dt-bindings: soc: samsung: exynos-pmu: allow
 mipi-phy subnode
Message-ID: <20250627214258.GA189284-robh@kernel.org>
References: <20250627-exynos7870-drm-dts-v2-0-d4a59207390d@disroot.org>
 <20250627-exynos7870-drm-dts-v2-2-d4a59207390d@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627-exynos7870-drm-dts-v2-2-d4a59207390d@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_144259_794147_FC0339CC 
X-CRM114-Status: GOOD (  14.01  )
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

On Fri, Jun 27, 2025 at 01:43:25AM +0530, Kaustabh Chakraborty wrote:
> Add Exynos7870's PMU compatible to the list of nodes which allow a MIPI
> PHY driver.
> 
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
> index f0fb24156da9b8980dcfd5339ae75f12a71cf6d6..45acd6a03d761a833cec435302e5190fb50f7a23 100644
> --- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
> +++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
> @@ -172,6 +172,7 @@ allOf:
>                - samsung,exynos5250-pmu
>                - samsung,exynos5420-pmu
>                - samsung,exynos5433-pmu
> +              - samsung,exynos7870-pmu

Don't you need to add this to 'compatible' and under 'select'?

>      then:
>        properties:
>          mipi-phy: true
> 
> -- 
> 2.49.0
> 

