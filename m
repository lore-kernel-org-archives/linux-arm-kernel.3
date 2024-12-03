Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9951BE6C611
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 07:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4pDcV3y4iQBsKRnKr7MXD6rGBgSvcZ1aU6EwZaXAwCk=; b=qjxnDD9jmUK4+VOwbj8TiTrWHX
	6cFq9GmPckd4aRahns53M9bpoKrlK1ZJLIPoLLz5LavHFoGapjxDzwqT4Njl1tFbfXq2KE3v49d0v
	8pdmvJ8/nBjS92B8znOzSNkg83kGNEIJ8ngEUFaQSaFYYJNnYcv537uQFsB9XxuQt515ryDy1M+A/
	yxJjPLAO3xpnCf5VTBamHETwXkMAtWjX9m1ivxSKr2t5UuN72re73o9pN34uRL6+50TlQw7mYwQuQ
	fkfNxsfqVrQoOD7nFJAecWHjqmnwPUteOje3VeGnC8kbMHicFTSS3ccXAAySG1c2hf0nYJFGh1lvJ
	zPLQUPvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tINUS-00000008Y7G-3XU1;
	Tue, 03 Dec 2024 07:38:36 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tINTS-00000008XyD-2gbZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 07:37:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8626FA40500;
	Tue,  3 Dec 2024 07:35:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5734C4CECF;
	Tue,  3 Dec 2024 07:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733211453;
	bh=rEGPx2pnXM75vPiO0vxKOrSNAyrijtXiX5PobHe/ZkQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kfnrlCUb87kOU8ibUZM3b+Y1HdcnNr2X9xmflkWNiqoS7PaL/yQLwV6S73r3spawD
	 n7fFDUAkG7pXBPGleCHXbmAXN/pGvs6E14bY9ve5MZAbMkyvF2aEXa3bbWLbieezv7
	 N25wcZ0g2Lrg6eoVSAJemgaCdtItJWeuBHmxhewOJ8Vkw8T0D04FNTa/LloapjUJQU
	 aHdrZqFgwNmJVUSQa8YPPa7cVvVURkKLuLRANjwMXV8viJNJs2IpjcmL7NNFWRtE8O
	 2vj6anb9b8fgkgbNEad3nTl5iQP99M1Xh4e55Zf6RmkqeoPhnsaVzmRJkAAJZVSOEk
	 u1QYUwmmvtOzg==
Date: Tue, 3 Dec 2024 08:37:30 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Umer Uddin <umer.uddin@mentallysanemainliners.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, igor.belwon@mentallysanemainliners.org
Subject: Re: [PATCH v3 2/4] arm64: dts: exynos: Add initial support for
 Samsung Galaxy S20 Series boards (hubble)
Message-ID: <p43dwymjwjhxur7v7x6dl5fl6fq2bt2oxh2zjhoonmqadgj2io@zc6s6bdcqrff>
References: <20241202162158.5208-1-umer.uddin@mentallysanemainliners.org>
 <20241202162158.5208-3-umer.uddin@mentallysanemainliners.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241202162158.5208-3-umer.uddin@mentallysanemainliners.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_233734_749744_91C05A64 
X-CRM114-Status: GOOD (  13.64  )
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

On Mon, Dec 02, 2024 at 04:21:56PM +0000, Umer Uddin wrote:
> Add initial support for the Samsung Galaxy S20 Series (hubble) phones.
> They were launched in 2020, and are based on the Exynos 990 SoC.
> The devices have multiple RAM configurations,
> starting from 8GB going all the way up to 16GB for the S20 Ultra devices.
> 
> This device tree adds support for the following:
> 
> - SimpleFB
> - 8GB RAM (Any more will be mapped in device trees)
> - Buttons
> 
> Signed-off-by: Umer Uddin <umer.uddin@mentallysanemainliners.org>
> ---
>  .../dts/exynos/exynos990-hubble-common.dtsi   | 98 +++++++++++++++++++
>  1 file changed, 98 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/exynos/exynos990-hubble-common.dtsi

Filename matching boards, so:
exynos990-x1s-common.dtsi

Best regards,
Krzysztof


