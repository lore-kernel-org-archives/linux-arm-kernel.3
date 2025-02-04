Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE2C0C02194
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 13:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xKt37ZG34TnrmVewyZJf3s0F+qJEJ/I4mzlVsjaNSvE=; b=YBtN0gV1xTAdk0CH/f3xOoUM8w
	fhqrT8zNPjVo54ncxUO2bZKdgy1xDgVqiaHIxydMf3gmAXajYab8zJNVduY2eU9wGI0ThXyPykYue
	4HJ/6uduud+0OILvpRlUtkcteT8LL3pGFT6lEyoRh0878dVp0UIUxwj2P8xi6QP6XG4c+m+0y3pye
	/p/hIrXZ93OhKJHNc/jp6DC8cBwqva7M53LvdiLIROAhe9Dt5QTeZvVIwwVls4SB87z7rlKNvKvDl
	kdEdy22R5rilnB5RnMXtR6uDz9IcH2Lz3xoFzVW5AgCggNgONir+Vv/zzAbfqTGVGnX7pO2lo6uHv
	Zp/ZR8Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfIjM-00000000VIy-29cR;
	Tue, 04 Feb 2025 13:12:44 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfIfw-00000000Ukf-2o8I
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 13:09:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 338E25C5D04;
	Tue,  4 Feb 2025 13:08:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 942BDC4AF09;
	Tue,  4 Feb 2025 13:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738674551;
	bh=HeGq3gDkjwQ8sGI5kYcTspmgODrJpr1IBbSirfssk1M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=alIa64NwNAmFXcJu+OgvEsBEmChgnaLwpRL7osb8gWffNi5HH0rZo1apqxh+D6u7E
	 Zt71Bac9qa72Agt8Zrbtn6D3V647/Ov29t9SYB+BVFpyegWC6n5P29t+f3OxuPGbHJ
	 E4BXSWXuP6EBeldo9o8i8ndeDhndgpZUGwy0LMf+4QiKE3kNQDT6S27O5gHOEmGBWc
	 liweYWC7uMp3hRmfKSt4kyRNlWI+JyzMHsqGvBJ0Q61kGaPwfPuyMd+1kb3QTNrP0b
	 pSMWi1hFf9mGo+aYVV83PCsG1h3M7GCp9Be542zSNXue9qmo8YNgrL9vlDyLmyUHhl
	 wmmP1U13BV9Vw==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	Yury Khrustalev <yury.khrustalev@arm.com>,
	Mark Brown <broonie@kernel.org>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Spickett <David.Spickett@arm.com>
Subject: Re: [PATCH] arm64/gcs: Fix documentation for HWCAP
Date: Tue,  4 Feb 2025 13:09:02 +0000
Message-Id: <173867198667.3989022.94600880351884502.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250124-arm64-gcs-hwcap-doc-v1-1-fa9368b01ca6@kernel.org>
References: <20250124-arm64-gcs-hwcap-doc-v1-1-fa9368b01ca6@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_050912_747244_D22A0595 
X-CRM114-Status: UNSURE (   7.30  )
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

On Fri, 24 Jan 2025 17:33:22 +0000, Mark Brown wrote:
> In one of the renumberings of the GCS hwcap a stray reference to HWCAP2 was
> left, fix it.
> 
> 

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64/gcs: Fix documentation for HWCAP
      https://git.kernel.org/arm64/c/f64f9dddd1f5

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

