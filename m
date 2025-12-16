Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28463D5B161
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 06:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xn2NTIpQ/J9D6AorUKtCXSvz8/y1kCiY/hxeI0KglmU=; b=ZV42AqhKPLLaokg0P9USRc3fHq
	uISUC1Jx2bqVZ5d1WQw2abVQUJxTEWsY687ZJFKpDaGoIZ8J6nowx1/yka8TJ9WOOlwraQPdA3ehJ
	+WqzwCI4aK8FoZ6s462tenIg7ckaqfrDMRmK8MQ1CD1cY1UDYeHXGdgFT9RDmc4l3/2iryg59PSVj
	XfKSg+RkhxWK//VUDEO43K7BCgKM0+G8RmYIvFKEL/z7SCF64DOwfwU4tl0PBkD2eNlO6MApn4o7v
	F6BTxmeqb0We1A6CTKwJ1+3w0rtXY4dfjEUl6CcjA+7/5lM5pF5wtob88dwZ+BI5/6+5JfabrbifC
	jhxVqz/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVOwf-00000004o4r-1B4T;
	Tue, 16 Dec 2025 06:54:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVOwc-00000004o4N-1JiJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 06:54:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8AF82441E4;
	Tue, 16 Dec 2025 06:54:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50CC0C4CEF1;
	Tue, 16 Dec 2025 06:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765868041;
	bh=HlB4rvd0gE1zxwKcPPjkgwihp2trB2AYciEwnFA7cSE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=tQfLDO7uNYdyb/sRdRL9yxT0y5CgZn4jMOG3SOE2frN6wAZpSj8syRMx4R2a82z94
	 co6p7tuIKHBRRoI4KXMSan/DwVyjkjFNjFiAk+e4CPe19ilfTHHHJdd+LvJV+Qpbwc
	 coJkK6KGTst2WdIa5aR+qkD0uF5OUwU422HU3l8OqCjhS1D7D1nzWdEmQeDtm9JHe0
	 uEVT8dA77WhbQqsDFhs+wj/Iwr/VrEHHd9c3vjLss4tkJdz5eb1Ab/cQ9fNEkcnDZb
	 yVMrSah4StaIYZAZmIQpFfABj7wRiDbuwNgyO1OZ7YTpznh1we6kE2TxBmzKD38zBQ
	 KwS0ZUJdHSZHg==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org
In-Reply-To: <20251212203226.458694-7-robh@kernel.org>
References: <20251212203226.458694-7-robh@kernel.org>
Subject: Re: [PATCH] ARM: dts: samsung: Drop s3c6400.dtsi
Message-Id: <176586803906.20461.7032133342686064495.b4-ty@kernel.org>
Date: Tue, 16 Dec 2025 07:53:59 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_225402_377685_BD9EA807 
X-CRM114-Status: UNSURE (   7.47  )
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


On Fri, 12 Dec 2025 14:32:13 -0600, Rob Herring (Arm) wrote:
> This .dtsi file is not included anywhere in the tree and can't be
> tested.
> 
> 

Applied, thanks!

[1/1] ARM: dts: samsung: Drop s3c6400.dtsi
      https://git.kernel.org/krzk/linux/c/549089586a4a45720702c3bbc9fd4fa2ad60ac6d

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


