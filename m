Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3228C982CC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 16:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=opghePY1FwxuGa4eTmW6PxG2+LzGY5JdFT48BB1gByg=; b=HHRr+MvvlMVnsQP4an+CzTJDGr
	QEPdIS3IOOmunXPgAPrTt+w5jvNWQYrtrufRhg6KkvvDTNP2RyvE5etKLO4dW5vdV6COSVuivmHPi
	kjTz9zfWgxs9Rj3zm42icZFDdfTHmT9GGz7E1dleOAsFQoEX2s5ZDyP5hbo4/uEaWJUeyqC78ZNMA
	XflhoR3UEkIEYIAkdtMMHDzVPMGdPa9CfYhEMBj1/uD7HcdQ3XFODMShxpLIFeiQHoNEZ3IWQVXgi
	Kux0kwZQ4mWnLvRWIMIWLXEdYNr1Y5C7sJp8lsGM/qw1S19DXecOgFc9DBM1ao59DPdNZ0p33HCvy
	4BAbVJMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6swF-00000009oW3-3f1x;
	Wed, 16 Sep 2026 16:56:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6swC-00000009oV0-1HmO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 16:56:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B8B69600CB;
	Wed, 16 Sep 2026 16:56:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EC3A1F00899;
	Wed, 16 Sep 2026 16:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789577807;
	bh=opghePY1FwxuGa4eTmW6PxG2+LzGY5JdFT48BB1gByg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=lnx239Or0VM2t/CQsULRftCM+5HryO5ORO3P5reJLRYCr6p+1izEpOlwsemLRXhfp
	 yBxzWQYacMB6IqUJC+06IpfoqAtdYmNCVWTnLEgw3ciHKoF8TPjmmD8KTnm1P6SVwE
	 fBw3LtMENdeQ20cnNYeeStYFc5bntuGKou7l7C87BBGb4PcYFrFL5Mjh4/ivpxP0sH
	 sE/WjEsTcD16BF5cGndwuBS/jrO/g7tAD88LJUMYMeP9WLg20rGJcPIKO3V4E5I6IS
	 7q5GkmoHLln7Ab1XNOwWIdEy6TbytbOukvHBc5pMHTURSGG0mgcJa7lTluRAngn4E6
	 bxnFR+Ypwajcw==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jesper Nilsson <jesper.nilsson@axis.com>, 
 Lars Persson <lars.persson@axis.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@axis.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260911-b4-dts-samsung-cleanup-strict-continued-v1-0-9aa55051c42b@oss.qualcomm.com>
References: <20260911-b4-dts-samsung-cleanup-strict-continued-v1-0-9aa55051c42b@oss.qualcomm.com>
Subject: Re: (subset) [PATCH 00/10] arm64: dts: exynos: Few strict
 dt-style-check cleanups
Message-Id: <178957780169.215106.2751361288260052803.b4-ty@b4>
Date: Wed, 16 Sep 2026 18:56:41 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
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


On Fri, 11 Sep 2026 12:19:08 +0200, Krzysztof Kozlowski wrote:
> Not yet complete, more files will follow. I probably won't re-order all
> Exynos5433 soc nodes by unit address because it is way too disruptive.
> 
> Best regards,
> Krzysztof

Applied, thanks!

[01/10] arm64: dts: exynos: axis: Re-order nodes to match coding style
        https://git.kernel.org/krzk/linux/c/6c864d06e81e325dccbdb06960cc697f763400df
[02/10] arm64: dts: exynos: axis: Re-order properties to match coding style
        https://git.kernel.org/krzk/linux/c/f145a6ce3746694a58229e828e3186a89dc43eeb
[03/10] arm64: dts: exynos: gs101: Re-order properties to match coding style
        https://git.kernel.org/krzk/linux/c/ae54981c41677b5d3b0479d9d01a663dcb2b0cd2
[04/10] arm64: dts: exynos: gs101: Re-order nodes to match coding style
        https://git.kernel.org/krzk/linux/c/a4479cbc18bc61c6f49a4fd79ccf41ee2481b0e6
[05/10] arm64: dts: exynos2200-g0s: Drop chosen address/size cells
        https://git.kernel.org/krzk/linux/c/7d7b0a58aa23a90a71beba9841c8149456f28fd3
[06/10] arm64: dts: exynos2200-g0s: Re-order properties to match coding style
        https://git.kernel.org/krzk/linux/c/f19b5942fc98932f1016a7e8f0e7d87b83b81ebb
[07/10] arm64: dts: exynos2200: Drop redundant blank lines
        https://git.kernel.org/krzk/linux/c/835875acbfd58fe6330c4755f17f5c02d85c43c3
[10/10] arm64: dts: exynos7870: Re-order properties to match coding style
        https://git.kernel.org/krzk/linux/c/6b68ca6fe0c855971b6dfefcbb287cc530f4774d

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


