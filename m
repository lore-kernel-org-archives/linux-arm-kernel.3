Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02E57C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 17:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z0iBfcSNLFVBtp9HwIZVXJ0fWf4A7HiFL45EpW64MkU=; b=JBh2VLe9PHbX9r/3eR6ODQHoti
	DQti+KKFKhKndsVpkUr8BPJPMumsmV1Z2MSmXSfV1MTwTMptvY7iOGq/STyadm+rpgky1TvQ5j+zR
	MZU74OCuP2v8BL/2tSAH1GAp3xwcESJBeilJA8Dzsy4jrw1KSZ0d7y1USpyyIkvM7t59IEJhmb7mW
	WSyZ6rtiEDt5/+AMD2g41TZ6CSxBx6BT5O94SNb1NuvcfBYNcY7a7KFejjwYW1DRTP+zlRaqrbK56
	d8BktAc15kpJUbf9Cy4EYwQAPOFSBS0qrkDuoFNbfR0eJvUNrNXIM1uIeqUJ+s6Ci1l3ztUt3glBO
	eTLSZ9tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thuHu-00000004in5-0rYP;
	Tue, 11 Feb 2025 17:43:10 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thuFl-00000004hzA-1ykr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 17:40:59 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id A858A25B0D;
	Tue, 11 Feb 2025 18:40:52 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2SotM2Jdszzq; Tue, 11 Feb 2025 18:40:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1739295648; bh=GOiwm1wHZc/AznJrAuxQaJv6N7XnPRihLg4UA4rAFHI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=P3iRA/LFZEX1s9f0Z0/3GlcbJ6usxjiHNpVMnzOKgpgC3asR1tryrnnNM1S4d6dKo
	 7DWGN2n77QYchJs1MqDyxOklxrhE52E4QFvySI8riosYYr3iPEdASqUvwxGDmg3eND
	 sf22RN4B6sXqf8ZkBZmjnNeQNLuzan15rugqMLRCOl9qhnkT6HWg508ckl1DXuLSRK
	 nhqVvFMEzyPWhQ8x6c+JSzKykZ0XnbX3JRsX4KSLso25/AKYmkZVrIatZjMRJBAkf+
	 9odluTlD2LzQj+ZT9RLvmw1/Mk1oag626SF25Y5f1BuEWqFXyXCtpf9ZKFtsl/uCf0
	 LG9hjdKMgTbRw==
MIME-Version: 1.0
Date: Tue, 11 Feb 2025 17:40:39 +0000
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki
 <s.nawrocki@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, Linus
 Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, Conor
 Dooley <conor@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>
Cc: Sergey Lisov <sleirsgoevy@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: Re: [PATCH 3/3] pinctrl: samsung: add support for exynos7870 pinctrl
In-Reply-To: <20250204-exynos7870-pinctrl-v1-3-77b9800749b7@disroot.org>
References: <20250204-exynos7870-pinctrl-v1-0-77b9800749b7@disroot.org>
 <20250204-exynos7870-pinctrl-v1-3-77b9800749b7@disroot.org>
Message-ID: <03c51c96256aa6b927febf7c005d9164@disroot.org>
X-Sender: kauschluss@disroot.org
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_094057_934963_46F6B716 
X-CRM114-Status: GOOD (  10.79  )
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

On 2025-02-03 20:35, Kaustabh Chakraborty wrote:
> From: Sergey Lisov <sleirsgoevy@gmail.com>
> 
> Add support for the Exynos7870 SoC pin-controller in the pinctrl driver.
> It has 8 GPIO banks, and 3-bit PINCFG_TYPE_DRV width.
> 
> Signed-off-by: Sergey Lisov <sleirsgoevy@gmail.com>
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  drivers/pinctrl/samsung/pinctrl-exynos-arm64.c | 141 +++++++++++++++++++++++++
>  drivers/pinctrl/samsung/pinctrl-exynos.h       |  29 +++++
>  drivers/pinctrl/samsung/pinctrl-samsung.c      |   2 +
>  drivers/pinctrl/samsung/pinctrl-samsung.h      |   1 +
>  4 files changed, 173 insertions(+)
> 

Please refrain from merging, wait for the next revision.
Thank you.

