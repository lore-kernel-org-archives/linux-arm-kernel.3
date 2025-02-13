Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E50DFC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 19:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iZunYo9I7wf6gZSlVKwJ3R0Xd/izQ0FqYsAKRmVk7Ng=; b=SkMMD7rkdcSTRAtm50stub4hiQ
	5bwnOR0Gs5nOgPjhj9sSvOpx9NuAYngLQWfuX+HQTsV7bDo5UnexV4twFio42SeDg1ftLG1vpK3fU
	/EzPj2PVC0Oe5KaowXPT2vMaxre/UcmrPbAjOB3X64qjMU1086djzailPfnQe7ZuZppDVTGD0dCzG
	UalKw3roKObiN+cBe4Um+xqawUQsjKs1AWJKrkIzXCXWTYbScn1wJXIg6n+K9r02O6+JXInMNUWnA
	3Ky6VE0OGBjzRo9BYBugrDcYWhtJZxmGJJQiq9hAPm8ZafFOLOtBQf4SaYkgPj5FWYJya42Zk4pzm
	jQ1GJZAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiehb-0000000CMju-1EY0;
	Thu, 13 Feb 2025 19:16:47 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tidln-0000000CBoC-2lah;
	Thu, 13 Feb 2025 18:17:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 88082A4286F;
	Thu, 13 Feb 2025 18:15:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD530C4CEE4;
	Thu, 13 Feb 2025 18:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739470622;
	bh=X0tuFPSSvJzxU+wZ2FKDaowZmVGUnx3nAlQffQt0rM8=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=iwMa+Q92QMTk7s31jZAyZg2gtnxmb2Y6zinOhcjqOtHE26bvHTU8Vn7aE4feGe53B
	 9ZvJ8pkFvXEaqDclLL0gmrqIIvOJWkOG2k5YqskYa/QX7RQ7xuGYBWpjChWuP/fX1a
	 Gx+tndumEyTSE1gwq2Xj8PwhXUdNthD/U3s70tARLtA1t3MOP+ZX06r+pDfFfv27Sx
	 k4pozEB0Ua5iWao8sv+dEagOwLeHTNBoA/IxUWbnhe9sKUDsT1LfMokJAPWNASme9o
	 iL5RfK/AbWxzh4Mi9gfsB/JtP8VPnnb8ynCF48jYFTC985SU0yuAnrTVC4aYY8SFWi
	 ryF57InQ/neBw==
From: Vinod Koul <vkoul@kernel.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250111185407.183855-1-krzysztof.kozlowski@linaro.org>
References: <20250111185407.183855-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] phy: stih407-usb: Use
 syscon_regmap_lookup_by_phandle_args
Message-Id: <173947062030.294083.9746743441329264653.b4-ty@kernel.org>
Date: Thu, 13 Feb 2025 23:47:00 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_101703_766291_0ED453CF 
X-CRM114-Status: UNSURE (   7.07  )
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


On Sat, 11 Jan 2025 19:54:07 +0100, Krzysztof Kozlowski wrote:
> Use syscon_regmap_lookup_by_phandle_args() which is a wrapper over
> syscon_regmap_lookup_by_phandle() combined with getting the syscon
> argument.  Except simpler code this annotates within one line that given
> phandle has arguments, so grepping for code would be easier.
> 
> There is also no real benefit in printing errors on missing syscon
> argument, because this is done just too late: runtime check on
> static/build-time data.  Dtschema and Devicetree bindings offer the
> static/build-time check for this already.
> 
> [...]

Applied, thanks!

[1/1] phy: stih407-usb: Use syscon_regmap_lookup_by_phandle_args
      commit: 13c1eb1b4bd169f820188c62acaa1f96677284b1

Best regards,
-- 
~Vinod



