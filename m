Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2418E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 08:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/zxFbVd5oI28n36nXX/DZkfS6A/X6yCvfplzOqYQriQ=; b=UthekMOOvG1QMcpy/QaS50ZAv5
	cE/4Fs0Q/L7lv1+lDCu+Cn07PVjQaBVO+JX5yoRcRW1yebQvIiaruMiKZUpeK9nADHX/44DddIsT5
	gVtn8Y0JTRM4AXxyU+3XyvWKiLDrhGb31q+NjXvxAeVMYLnSwzWGgEtg3KZA47YnXZSOjf5qE2BzL
	ELl5vxxrZ/WiXCHqHvU454Yw4v3TZeu92oHd2hBjk/L3qhliDi7f64E9F90OjxXGLXhLIcsyHUz1d
	iIqAo/qnHVkMZ9/FAKTirL2c4pbkuYRxxjqVJKbz3G6FjtPsyiFEdX41aRsKXdmuXoYWM6Rm8B6tU
	nqwHqa4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLeaa-0000000HJBc-1Odd;
	Thu, 12 Dec 2024 08:30:28 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLeVU-0000000HI4R-2gn3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 08:25:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 81668A4264F;
	Thu, 12 Dec 2024 08:23:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B25D2C4CECE;
	Thu, 12 Dec 2024 08:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733991911;
	bh=ugwQc1RwWiUB2k1DlePOXPHk9EZtb/h2RNYw3kRvsz8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bJK6subic4H5yc5DmT1goNA5KHVw5ury6O4813bvE2j0JvE8Vuom5vACfYmvBVLQP
	 F7ek6FLf9b6OoD+RJo/Bj8WdeLccMoDuLyj0EESGHdilYZLBGJBEwQADnM0PNMLJ+E
	 kHgvJjE/YK9oBKoYbYCxbmCUPbyC46Te+BA1lWLEnYcTRa7JiwuOGyaYF/KiddaFVK
	 vqTUPGJ6H/eMwJDK0HQzgwNZW9MqGogacLB8s2b73DT14qyOqd39jQwrvAGGbDttd5
	 rdw58Buife0wajhKDnZ3NqTtHfvHukbSP5vg4u1PCxW/Vtpllbl/sHbwoZibSnddQZ
	 q7ZZzSABa4bdw==
Date: Thu, 12 Dec 2024 09:25:08 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nick Chan <towinchenmi@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Asahi Linux <asahi@lists.linux.dev>, 
	Linux ARM Kernel Architecture <linux-arm-kernel@lists.infradead.org>, Linux power management <linux-pm@vger.kernel.org>, 
	Devicetree <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/7] dt-bindings: cpufreq: apple,cluster-cpufreq: Add
 A7-A11, T2 compatibles
Message-ID: <f7whbncdt3yud3loe6xane4gwzpvyygfdju6e55gf6s2s3k75k@n7ehtngsrqxp>
References: <20241212070344.3858-1-towinchenmi@gmail.com>
 <20241212070344.3858-2-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241212070344.3858-2-towinchenmi@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_002512_779836_F522F4F1 
X-CRM114-Status: UNSURE (   7.68  )
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

On Thu, Dec 12, 2024 at 03:03:00PM +0800, Nick Chan wrote:
> Add compatibles for Apple A7-A11, T2 SoCs.
> 
> Apple A7, A8, A8X gets the per-SoC compatible and the A7
> "apple,s5l8960x-cluster-cpufreq" compatible.
> 
> Apple A9, A9X, A10, A10X, T2, A11 gets the per-SoC compatible, M1
> "apple,t8103-cluster-cpufreq" compatible, then the
> "apple,cluster-cpufreq" fallback compatible.
> 
> Signed-off-by: Nick Chan <towinchenmi@gmail.com>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


