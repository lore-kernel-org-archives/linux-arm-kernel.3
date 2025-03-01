Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85CB3C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Mar 2025 04:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gktINyFsEBD8823QreDOM6kIE8wh3TONdKD3DWgM9Ps=; b=e8l2sPNgdIPsGoSZ4UDLnr04mc
	+X3bjG/poHAETwV0YlvpSEVnm7IOZGkAZayQC7wbw5X4q/Qbc0A1z9y7rfTnGrDyMO5rGp5Ey54Eu
	DsyGu5WI7eWwCkmd2qrynRe0g4VBiukvSft73i9oTU/WE0WnY5DUkkJPIVrAEo+NlKT7QPNajfCdD
	YSncN156/1sZnGjW0hZjqMeXGU9leRWLRwzR9rBGngSW8cLZcDAHEPLUbpBa+zfuMyGXmms7KrE94
	MbZTrj5YmX0+wznvK5xhu8H1syiWlyZfO0iBxIqfuIrXq2vcIbjREKt4Y+LpXgUO0l4noDrHlryxm
	hggytR6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toE58-0000000DMEo-1AUw;
	Sat, 01 Mar 2025 04:04:06 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toE1l-0000000DLnZ-2msS
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Mar 2025 04:00:38 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 5964F25C4F;
	Sat,  1 Mar 2025 05:00:36 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DaIIIFkxqZ9H; Sat,  1 Mar 2025 05:00:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1740801635; bh=gES+/B8lkFtwldnFslAofLXHw2x8wMNSxzDj7F9SjQk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=IS7EKFwFlT01d5ScSbPJO/i4rajHNOoV7v1YPUJTpbAAaSrfLJX1gpq4MtQw3AWEH
	 HBUXSxVddzNjtS/NmlF5fwC56kwODlv5d0+iW/71vNU/UTZWJq1GTa8S0FcNN54mE8
	 /Geb/Cg32yWfkeP2h1x7MQsdZJBD/0Aeiqd2nFUlyKSJPIoXWoa9wheIwOPTp1Er/g
	 zWg5YeF4T+Qn6xB7bNUgoLzZYdwq1xjV1JPnPslh1CatoUvwpf+YBIDFHKIuRwb9Pl
	 bwy1nGuWBXdFk1Zrbw5z71CMg72gf72GqRUp6FF6wyetl+E1i01ISg/Igcm/YZTUzp
	 OoLIAyUyMKXRg==
MIME-Version: 1.0
Date: Sat, 01 Mar 2025 04:00:35 +0000
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, "Guilherme G.
 Piccoli" <gpiccoli@igalia.com>
Cc: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, Krzysztof Kozlowski
 <krzk@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, Kaustabh
 Chakraborty <kauschluss@disroot.org>
Subject: Re: [PATCH v4 0/7] Add support for the Exynos7870 SoC, along with
 three devices
In-Reply-To: <20250301-exynos7870-v4-0-2925537f9b2a@disroot.org>
References: <20250301-exynos7870-v4-0-2925537f9b2a@disroot.org>
Message-ID: <f37fab8e85cf0c333dc9acc97c1733fd@disroot.org>
X-Sender: kauschluss@disroot.org
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_200037_842240_3387FEF1 
X-CRM114-Status: GOOD (  11.18  )
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

On 2025-02-28 19:46, Kaustabh Chakraborty wrote:
> Samsung Exynos 7870 (codename: Joshua) is an ARM-v8 system-on-chip that was
> announced in 2016. The chipset was found in several popular mid-range to
> low-end Samsung phones, released within 2016 to 2019.
> 
> This patch series aims to add support for Exynos 7870, starting with the
> most basic yet essential components such as CPU, GPU, clock controllers,
> PMIC, pin controllers, etc.
> 
> Moreover, the series also adds support for three Exynos 7870 devices via
> devicetree. The devices are:
>  * Samsung Galaxy J7 Prime	- released 2016, codename on7xelte
>  * Samsung Galaxy J6		- released 2018, codename j6lte
>  * Samsung Galaxy A2 Core	- released 2019, codename a2corelte
> 
> Additional features implemented in this series include:
>  * I2C	- touchscreen, IIO sensors, etc.
>  * UART	- bluetooth and serial debugging
>  * MMC	- eMMC, Wi-Fi SDIO, SDCard
>  * USB	- micro-USB 2.0 interface
> 
> Build dependencies are in these sub-series:
>  * bootmode	  	- https://lore.kernel.org/all/20250204-exynos7870-bootmode-v1-1-0f17b3033c2d@disroot.org/
>  * pmu-clocks		- https://lore.kernel.org/all/20250301-exynos7870-pmu-clocks-v4-0-0f3e73b10db7@disroot.org/

Find v5 of exynos7870-pmu-clocks here:
https://lore.kernel.org/all/20250301-exynos7870-pmu-clocks-v5-0-715b646d5206@disroot.org/

