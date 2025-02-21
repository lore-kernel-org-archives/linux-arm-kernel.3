Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71B6AC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 09:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nIkBoMSOfYqFm9wpczBMF0srvwdrcwGyQqVrVKa7Yak=; b=vzM9/NMGFIocdGe1yFwe+255Fn
	v25Ufwjf1XlIU1pClTvllRoUkdWzrPnIYsMop+iEQJ020tT+OUPQ4WPgsK6oso4X2MEFFDq7OaRvZ
	Bemej3QqVGyBMH8obWJt6fvRfKE3dL/COjEaWvjdk6PDmv1X7iOWKwq/vaEqS23rDnqvRbNVTYrlb
	M0dShRV6BffSuE49r0tE4kj2NjK8wC8VjdvhVlAzkV1CnW/VHzpYMcfTCRZpjxH/1tckRj7oIXFkt
	ouFEP91TUzhfu6ALO7WfARehwtU3ldhJJmjftOKgQpbv6emQtRAuQmpakdGUXu61tyHo664VeBH0r
	I6pGglQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlPhk-000000051OV-1PmE;
	Fri, 21 Feb 2025 09:52:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlPSG-00000004xV4-3ptw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 09:36:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4C2085C3A62;
	Fri, 21 Feb 2025 09:35:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1AFAC4CED6;
	Fri, 21 Feb 2025 09:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740130580;
	bh=2JYtZqX939Y+D87kR0xAmcGyGqDeR/SDLpu7Ha5+6ps=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TAWlb8BWw0ZkWQSpCua6PtYzLZmlyMoBOktuhHneAneNEbrKIOzBF8duUu9GRVTiJ
	 cnIumZ/AOh10dWag5FO33bxpV6CyO1USpCBsRc6shfTKZVV5l3ct92KO7q2qi0rac9
	 zZT3E7549u6k9bLw9sQcaU1vBmcuOu8V3Xccd7p25yjnYkUPoQEfFt/dO2wdQg7Tu8
	 98KIQWkNzXv3MTOhKyCjQvKGjfUCgkLgye69mjup0i51Mm6wlWDZbEHiBaDVqkkbUk
	 wDHEmwbC47+A5gbP36yjoJGrLfF08N6Uvk9jV9mEUQ9yWHg9vW66TkG+1qHSgzXr1A
	 oRGfOBnZCpLKQ==
Date: Fri, 21 Feb 2025 10:36:17 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3 0/7] Add support for the Exynos7870 SoC, along with
 three devices
Message-ID: <20250221-able-quoll-of-storm-1cd6aa@krzk-bin>
References: <20250219-exynos7870-v3-0-e384fb610cad@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250219-exynos7870-v3-0-e384fb610cad@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_013621_040612_8104A5EA 
X-CRM114-Status: GOOD (  13.71  )
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

On Wed, Feb 19, 2025 at 12:33:10AM +0530, Kaustabh Chakraborty wrote:
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

You have some dependencies here, so you must always clearly mention
them.

> Additional features implemented in this series include:
>  * I2C	- touchscreen, IIO sensors, etc.
>  * UART	- bluetooth and serial debugging
>  * MMC	- eMMC, Wi-Fi SDIO, SDCard
>  * USB	- micro-USB 2.0 interface
> 
> Here is a list of all sub-series:
>  * bootmode	  	- https://lore.kernel.org/all/20250204-exynos7870-bootmode-v1-1-0f17b3033c2d@disroot.org/
>  * gpu			R https://lore.kernel.org/all/20250204-exynos7870-gpu-v1-1-0db4c163a030@disroot.org/
>  * i2c	      		A https://lore.kernel.org/all/20250204-exynos7870-i2c-v1-0-63d67871ab7e@disroot.org/
>  * mmc			- https://lore.kernel.org/all/20250219-exynos7870-mmc-v2-0-b4255a3e39ed@disroot.org/
>  * pinctrl	  	- https://lore.kernel.org/all/20250219-exynos7870-pinctrl-v2-0-1ff9b10bf913@disroot.org/
>  * pmic-regulators	- https://lore.kernel.org/all/20250219-exynos7870-pmic-regulators-v2-0-1ea86fb332f7@disroot.org/
>  * pmu-clocks		- https://lore.kernel.org/all/20250219-exynos7870-pmu-clocks-v3-0-0d1e415e9e3a@disroot.org/
>  * uart			- https://lore.kernel.org/all/20250219-exynos7870-uart-v2-1-c8c67f3a936c@disroot.org/
>  * usb			- https://lore.kernel.org/all/20250219-exynos7870-usb-v2-0-1de41a89c9d4@disroot.org/
>  * usbphy		- https://lore.kernel.org/all/20250219-exynos7870-usbphy-v2-0-b8ba4e7a72e9@disroot.org/

These are not dependencies. Weirdly, you link related patches but you do
not even mention the actual dependency.

Best regards,
Krzysztof


