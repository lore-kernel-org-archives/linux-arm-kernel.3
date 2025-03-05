Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29223C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 19:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K83EwNwEeeB8B7Z6hX6FR05+4qzGIA2Mzc2+jXoml1c=; b=2SgMqaSbDA2dEVMMLk2dWeiO42
	pG6PZZiW5fpAv5/TdjMe3NH1an+CJTw4s1BnUn0T3n0Bd29lglgj9HfqLFmkh9T+Ck6ZCqNAElLzC
	BFjubfK/gSyLCjDacF7J4CnkRL69zFfVtYmXoN48sxbzmeh4Or5txn7yjhocwEvO7ECJoCE7pBOvv
	8iHpt91vXqJc3gGczBk5HllF9XEo86/ICcNBpkaY7FXW7OIAChJbDNOtuuThctxm0XLwMhPiYDZkL
	aG2hE5vXb3TZX1SbWu+1XYsHeO3t8Lq2P6AMIlySXFDWq3QEIiSlgVlMz7XVfMlCAFILRneZ6S/Vj
	x6BfR+EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpub5-000000095za-3AfB;
	Wed, 05 Mar 2025 19:40:03 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpu6N-000000091p9-3BsF
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Mar 2025 19:08:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=K83EwNwEeeB8B7Z6hX6FR05+4qzGIA2Mzc2+jXoml1c=; b=E+0WVX8akLYwmiogH85sP4VYs4
	Oy7I9jazfAN/YI8oQCgGLV+GG1sgBN/XNRxSh4Zo3tTxC6HvSrgDPz6dnYP5gUvAMZ143oRRUELFo
	UerfFI0t9ksYPvsPH8aGuhjtfH/SKjzZ5WomLtZz7ylZy7jpW0RSXrHzxlJ+n0iOI5uuXnLqK5wII
	sJKkb8cv1i+4vx/HjPDuwAgE7iycE8ZQSE0L2gK4yDZSfSGTdcKQOt2ROe19Wp7h5zEnTQ2StUYzq
	r9gVoi0YH+Jv3N9IaU13BiD1yw8FXZvByjr3m0mAIwzxFuqxYXXMK2MOxLma3P6h7z3GnFFjxE04r
	aVqgCMew==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpu6K-000000063zS-1kbg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 19:08:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DACB9A4605E;
	Wed,  5 Mar 2025 19:02:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69017C4CED1;
	Wed,  5 Mar 2025 19:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741201694;
	bh=6CcsKwqJSLiz7bjMLQJBZiu3LQBJjQXJQ7zQz3/16Y4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XddcZiJnKr6JIV1Cds47liqbB8dr41V/PUj0oa7tvjGCyfRO9PprWSbPkpxMy8VrP
	 UU27MT8Fnyn+bjKPC7tbBM9vuRR6psmGEqhRRApJ+BpSpIjtKfnlefN67GluABHnlI
	 /ONnDcyKvgXR/GZkUxPX0L1g3ic/jTvPyaLC+Q3E+RbJTx9q55jUFO/h81Qn7c7Nlq
	 bDgB6XakVp5jJz3i65+ZHa1w1C40HZVEMPX7fMjA0WFZewFrL9ThXYgYxS5aZYWUNZ
	 bRRF2I/xh8O/Lw0aDLxzfrA79MxmXcCy71UtyDJVb082d4mt9Ky98suJrA/j12PIC4
	 9XwYru3n1k28w==
Message-ID: <de3cc07a-e2f2-475d-9418-2621cb0a5d2c@kernel.org>
Date: Wed, 5 Mar 2025 20:08:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/7] Add support for the Exynos7870 SoC, along with
 three devices
To: Kaustabh Chakraborty <kauschluss@disroot.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20250301-exynos7870-v4-0-2925537f9b2a@disroot.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250301-exynos7870-v4-0-2925537f9b2a@disroot.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_190816_643419_78DD58A8 
X-CRM114-Status: UNSURE (   6.19  )
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

On 28/02/2025 20:46, Kaustabh Chakraborty wrote:
> Additional features implemented in this series include:
>  * I2C	- touchscreen, IIO sensors, etc.
>  * UART	- bluetooth and serial debugging
>  * MMC	- eMMC, Wi-Fi SDIO, SDCard
>  * USB	- micro-USB 2.0 interface
> 
> Build dependencies are in these sub-series:
>  * bootmode	  	- https://lore.kernel.org/all/20250204-exynos7870-bootmode-v1-1-0f17b3033c2d@disroot.org/
>  * pmu-clocks		- https://lore.kernel.org/all/20250301-exynos7870-pmu-clocks-v4-0-0f3e73b10db7@disroot.org/
> 
> Other related sub-series:
>  * gpu			R https://lore.kernel.org/all/20250204-exynos7870-gpu-v1-1-0db4c163a030@disroot.org/
>  * i2c	      		A https://lore.kernel.org/all/20250204-exynos7870-i2c-v1-0-63d67871ab7e@disroot.org/
>  * mmc			- https://lore.kernel.org/all/20250219-exynos7870-mmc-v2-0-b4255a3e39ed@disroot.org/
>  * pinctrl	  	- https://lore.kernel.org/all/20250301-exynos7870-pinctrl-v3-0-ba1da9d3cd2f@disroot.org/
>  * pmic-regulators	- https://lore.kernel.org/all/20250301-exynos7870-pmic-regulators-v3-0-808d0b47a564@disroot.org/
>  * uart			R https://lore.kernel.org/all/20250219-exynos7870-uart-v2-1-c8c67f3a936c@disroot.org/
>  * usb			- https://lore.kernel.org/all/20250301-exynos7870-usb-v3-0-f01697165d19@disroot.org/
>  * usbphy		- https://lore.kernel.org/all/20250219-exynos7870-usbphy-v2-0-b8ba4e7a72e9@disroot.org/
> (Legend: [R]eviewed, [A]pplied)


Seems this will have to wait for the next cycle. I saw also some
checkpatch warnings, which anyway need fixing.

Best regards,
Krzysztof

