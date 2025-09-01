Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FEC2CA100E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 00:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uUMmshODc+anRYLGkZqxK8fHtoqiUV8irDCrMvIbBcI=; b=mX6S55zW/NllE4owuH8GAZkgZC
	wcRmTSiBUF4lNYvzJbVOJJ7AOcQkzJoQzAdwOs1TCs+WDongPmCVmc0xkQsaJ4f6m7cA2Jb/WXLeE
	WsjXea0mOkc+aH9Cj0/CzNoNxr7J+ePxIEQlXLZHgb4Lerq8fJsbzABom0nBeVU/qFVE206OcxQkX
	G9bsxPNVmL64MKlomK9xiDCUDiy+i6CN99VkfA31KoC6YAROyJvnqCYCsPFaMQY/IQCq+vWSYkxqg
	qbqklG8e6VPrCclZwaNOb242Ein2QaWJ0QjjKdVqxlXosDqB2NoLurTHT1GM45xHKE6qQqrjt9fcn
	i2JOy0yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utFG8-0000000EYHS-2GLm;
	Tue, 02 Sep 2025 00:52:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utArR-0000000DkPR-15cy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 20:10:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AF08E600BB;
	Mon,  1 Sep 2025 20:10:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D9F4C4CEF0;
	Mon,  1 Sep 2025 20:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756757440;
	bh=LcxOoVfDe48j9HQYLYfYFaL8wNzyIvZJQTx/7QeuDUM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JsUD5qsBO/zj4WeLwN1wgiCt6K0SMl8wWyGQ/lAtQqdcRiibpCLTUdliDNmMMcKIF
	 wjoXDEqE4bCi9/sr8BrjVDAhbL+4Fzw6uQHDMzq1L3bhJJDgJdBQGhxtx9mZpnV/2S
	 gSHFGNL5N0l7aXt8iqTDQ/O3hbPf54zLcKtEY9bMn5R8u/FPLdHfukCrIcDVteqebr
	 pWD+uhm92eepv8ibvRWG75CkZkF5ebOTxA0DVSRPsxfTrKF08bEeEL8br2eFElj1FT
	 /Vt6yj/s/gOWXxuw+vOIjuXCoBw2T4WrTmSfSIBrDPDY1olFM6s5f60F/DkzOTy1yC
	 8/lUbIzk8Rt0A==
Date: Mon, 1 Sep 2025 15:10:38 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-watchdog@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 3/4] dt-bindings: watchdog: samsung-wdt: Drop S3C2410
Message-ID: <175675743743.261788.12655230407244757508.robh@kernel.org>
References: <20250830-watchdog-s3c-cleanup-v1-0-837ae94a21b5@linaro.org>
 <20250830-watchdog-s3c-cleanup-v1-3-837ae94a21b5@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250830-watchdog-s3c-cleanup-v1-3-837ae94a21b5@linaro.org>
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


On Sat, 30 Aug 2025 12:18:59 +0200, Krzysztof Kozlowski wrote:
> Samsung S3C2410 SoC was removed from Linux kernel in the
> commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support"), in January
> 2023.  There are no in-kernel users of samsung,s3c2410-wdt compatible
> anymore and platform is so old, that there should be no out-of-tree
> users.  If such existed, they would have enough of time to object
> dropping Samsung S3C2410 SoC removal from the kernel (which did not
> happen).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml | 1 -
>  1 file changed, 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


