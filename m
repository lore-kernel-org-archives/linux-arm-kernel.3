Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89977C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 00:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ugM52EDDN5T4m7r/U5qsyvGrmtbv8uvnFRRVmHC+5uI=; b=NyZSt/h9A6QoI3XUKZUNt2w/Js
	o45EL3eU5c+mDejQLOyCxVRIxO/oFmmDlzoK/KN6Pf3v+0c42YTBN+3E4Pk/gD68r6H2MRt8ZwK5f
	Vp869IPmeJ/HYysSd4sVdnbmDzfQX9PbU8mXs/ZVVZx4O4LgusSvO4aUfar0EimlodiehAgQ+/U2x
	LL9qX/3YsL0RrGJoXTfA/zKPS3oyle98yDvFKPflZIHjljbOnoHJRHAWsja0Fg8NOmFnGmMu3tIfz
	o1jVvaUdaV5tjvfp6EfMQxcFm1cVOlb31YV1en9Rs1mS0g4EkfQY39bFoA4Yui4s7Z6yRpj+zc8ie
	Y4x5sYXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4U0t-00000003yXk-2apH;
	Tue, 15 Apr 2025 00:18:55 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Tz4-00000003yKt-3GFR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 00:17:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0C423A40A02;
	Tue, 15 Apr 2025 00:11:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2EFAC4CEE2;
	Tue, 15 Apr 2025 00:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744676220;
	bh=ugM52EDDN5T4m7r/U5qsyvGrmtbv8uvnFRRVmHC+5uI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=erkyWkykhGfY8ZkymHjIOJrKT9DeXyK/jmtUy7UBbpAPRFhvm5nooC/0EHHjqdMsu
	 UlGFRPBf5DC0DRngjM0vWwoMLzaWKHnZR6FqOk1i+KOiVeGr5FzKPHWrKctsZnHH0q
	 aZKK3Tn9HeeEiTAIfT7Nnl8++CJ7cOz3mlvMFyg6GUUjKEM8OnP0b7W2OFd7SwPJet
	 0n8RHeF9qpUWgXCrLz+XXNQuYLwgueMmTvpQGcv6G/3mx7Y+RwjLJ+hmldUbf2rf3W
	 yHxSOGPOcRAZT+qzTuDi6hlOU4Ee4NLizHW+ljw4S/pczBfCDxzvxXKwytjeU0p5Cv
	 ZeO/OeFf4U6yw==
Message-ID: <756e49dfefe4838c5dce4855c1e7ce87@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250409-spmi-v4-1-eb81ecfd1f64@gmail.com>
References: <20250409-spmi-v4-0-eb81ecfd1f64@gmail.com> <20250409-spmi-v4-1-eb81ecfd1f64@gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: spmi: Add Apple SPMI controller
From: Stephen Boyd <sboyd@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Sasha Finkelstein <fnkl.kernel@gmail.com>
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>, Conor Dooley <conor+dt@kernel.org>, Janne Grunau <j@jannau.net>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>, Sven Peter <sven@svenpeter.dev>, fnkl.kernel@gmail.com
Date: Mon, 14 Apr 2025 17:16:58 -0700
User-Agent: alot/0.12.dev8+g17a99a841c4b
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_171702_881524_95E1E73B 
X-CRM114-Status: UNSURE (   6.52  )
X-CRM114-Notice: Please train this message.
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

Quoting Sasha Finkelstein via B4 Relay (2025-04-09 14:52:12)
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
>=20
> Add bindings for the SPMI controller present on most Apple SoCs
>=20
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: Sven Peter <sven@svenpeter.dev>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---

Applied to spmi-next

