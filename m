Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E432BC982D9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 10:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W65260PL0LUngU2B5q4xFMH5FD3mWtrx6eWZgwnRxcE=; b=Y9k8zACeOQM6euekF21Z3UHbyk
	2Y+9UIPd/QXIMtiqXz+hEvHUger3ImlfCKsLXgg1Md2d0MPIYZnux99HNe2IDpu/PkYJImpt/QB/o
	frIm05QGzgHLJEcM8yMHkvcldiMTx0RB2AHFw1Zi9JEFkvaGN428VWLQp9Bdh7ftpiTB5PEEzLbaE
	tkQSh/RUeyhsJzoZol6+zjFdTX+WNJMkT/ByyHnqPm6+YAwrkrbloDZAyvaQjT3sg9cOyKJ/G3phK
	8c3QAKeADSDFcNJvPIKxgaJsZFI0hRQHitztal98VG3Ae4xCrfG0g/eyXYeZhcXFDi5Fdl8ZaNuJW
	0n8HTX/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7W3W-0000000E7Pc-0jYD;
	Fri, 18 Sep 2026 10:42:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7W3U-0000000E7P5-1lgj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 10:42:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 22C7743EC9;
	Fri, 18 Sep 2026 10:42:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07B171F00893;
	Fri, 18 Sep 2026 10:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789728176;
	bh=W65260PL0LUngU2B5q4xFMH5FD3mWtrx6eWZgwnRxcE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=NvstjFlpfWoBaBWoCvPZVphIXMxQcVVa5OB621H3tuHI/tJHld5XJB6ENF7taFlDH
	 yx3DdT8ziaR2Blzslvci+yrFMtdsHUlfrtc0EKkpkKidf14xrilrl4TibMT95UgyJz
	 R5tRvhCu2Nxc/XsqCqlr8UtCp5UnbKrWGCFaiPFuWFG36igkeibqrdtSTLd6luHeS9
	 5CWEnUdhriCQ/KuW2nIYPp3BoGcCK/IUtvCw+DWGdQq8pD02DITIS2SmVUbFa6xNAK
	 NqWE6AlmUNBHNG6T6PYC2gjaVZKpo0/Qs951ZxR6V+xaQ83IpuKzgnZKcFv6vmQh2S
	 ogESXARWwUA+g==
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
In-Reply-To: <20260916-b4-dts-samsung-cleanup-strict-continued-v2-0-8e9d534ba5b8@oss.qualcomm.com>
References: <20260916-b4-dts-samsung-cleanup-strict-continued-v2-0-8e9d534ba5b8@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/2] arm64: dts: exynos: Few strict dt-style-check
 cleanups
Message-Id: <178972817074.83665.4431390528303203267.b4-ty@b4>
Date: Fri, 18 Sep 2026 12:42:50 +0200
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


On Wed, 16 Sep 2026 19:06:16 +0200, Krzysztof Kozlowski wrote:
> Changes in v2:
> - Do not reorder CPUs because cpu@4 must be the first one/boot.
> - Remove applied patches.
> - Link to v1: https://patch.msgid.link/20260911-b4-dts-samsung-cleanup-strict-continued-v1-0-9aa55051c42b@oss.qualcomm.com
> 
> Not yet complete, more files will follow. I probably won't re-order all
> Exynos5433 soc nodes by unit address because it is way too disruptive.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: exynos5433: Re-order nodes to match coding style
      https://git.kernel.org/krzk/linux/c/b940eb8b2153130a960f9d9da63f27b5001d17f3
[2/2] arm64: dts: exynos5433: Re-order properties to match coding style
      https://git.kernel.org/krzk/linux/c/1b1dae647d7395a524dad2a0135bbb07a2b2d519

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


