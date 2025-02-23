Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A73C7C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Feb 2025 10:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g9gUhh1b0Gkme/HS8sn37lbz/ZA/BsNTt5p50WGNMak=; b=vN8v4qVKOP10fjfFdT+Smm50i4
	zb4sgcrUxncJocKtX/C76f1N2F2v46JZ8IZ2XECk51jVaf/lO1xDjcz3w7fFwn9gS1DA6DmRuQVXl
	95fIXlypBwWRLOX0eAgUbV9rXakadR3sVerRaaAwCAMoJl5nZBTaUS+AoAECYSOQ5vqn6SeZCxET9
	c3JV2/6CIsCdRyiBdLrn7njKHhvnPp6oBwbdBWL3+gNig0bRhn0P2mfgX4ft3z7E4to3NRbO08uDd
	nlHBbAh+HQvlFGSUlnfnA2f69l01DPefN4zF5wgGb0a1qq6+FfNyVJMfSUawdq1RbmA5IB8606o8S
	h/U18AAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tm9Jy-0000000Askj-1EsM;
	Sun, 23 Feb 2025 10:34:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tm9IU-0000000AsdN-2V12
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Feb 2025 10:33:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E9F745C48DB;
	Sun, 23 Feb 2025 10:32:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBC8DC4CEDD;
	Sun, 23 Feb 2025 10:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740306797;
	bh=FLirW3ftLfXRJNxdSRNnrqsyTaGJiadECUqG3czTtBs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V+gd4JXlabh+DhfEPBhrqC28xt0zFouB40fJznlRA8WX25vNK4NpubB/XTu9wdohm
	 TUGFxqw3M5vfgiYGMVDeJw93JSRd0+pzHg6bwb+p0POjtkPZpR5FBWvKR2IvCGFgaL
	 qvfBnula+H7SpAGtgz43ix3B2A63IznR0saRl7T6fbhv1GcpsyGBhmvHW1cTVA244W
	 rg87/ohN6zauB+kSi9VAq9DWeT/OGUIZPAGBc9I5O/Be2KEd2VuJDI+LjdGCFO5oUG
	 k/iZVR2YHYsJobPDLZlBWjG6i258UqwoEIDZWqNSALq65CSxUM4RClCltHUPSDyfQ4
	 ml4X5nhorGRMQ==
Date: Sun, 23 Feb 2025 11:33:14 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Tomasz Figa <tomasz.figa@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] pinctrl: samsung: add support for exynos7870
 pinctrl
Message-ID: <20250223-peculiar-coati-of-gallantry-6556ee@krzk-bin>
References: <20250219-exynos7870-pinctrl-v2-0-1ff9b10bf913@disroot.org>
 <20250219-exynos7870-pinctrl-v2-3-1ff9b10bf913@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250219-exynos7870-pinctrl-v2-3-1ff9b10bf913@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_023318_689096_6256CC10 
X-CRM114-Status: UNSURE (   8.66  )
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

On Wed, Feb 19, 2025 at 12:18:59AM +0530, Kaustabh Chakraborty wrote:
 +
> +/* pin banks of exynos7870 pin-controller 2 (ESE) */
> +static const struct samsung_pin_bank_data exynos7870_pin_banks2[] __initconst = {
> +	EXYNOS7870_PIN_BANK_EINTG(5, 0x000, "gpc7", 0x00),
> +};
> +
> +/* pin banks of exynos7870 pin-controller 3 (FSYS) */
> +static const struct samsung_pin_bank_data exynos7870_pin_banks3[] __initconst = {
> +	EXYNOS7870_PIN_BANK_EINTG(3, 0x000, "gpr0", 0x00),
> +	EXYNOS7870_PIN_BANK_EINTG(8, 0x020, "gpr1", 0x04),
> +	EXYNOS7870_PIN_BANK_EINTG(2, 0x040, "gpr2", 0x08),
> +	EXYNOS7870_PIN_BANK_EINTG(4, 0x060, "gpr3", 0x0c),
> +	EXYNOS7870_PIN_BANK_EINTG(6, 0x080, "gpr4", 0x10),
> +};
> +
> +/* pin banks of exynos7870 pin-controller 4 (MIF) */
> +static const struct samsung_pin_bank_data exynos7870_pin_banks4[] __initconst = {
> +	EXYNOS7870_PIN_BANK_EINTG(2, 0x000, "gpm0", 0x00),
> +};
> +
> +/* pin banks of exynos7870 pin-controller 5 (NFC) */
> +static const struct samsung_pin_bank_data exynos7870_pin_banks5[] __initconst = {
> +	EXYNOS7870_PIN_BANK_EINTG(4, 0x000, "gpc2", 0x00),
> +};
> +
> +/* pin banks of exynos7870 pin-controller 6 (TOP) */
> +static const struct samsung_pin_bank_data exynos7870_pin_banks6[] __initconst = {
> +	EXYNOS7870_PIN_BANK_EINTG(4, 0x000, "gpb0", 0x00),

Why do you need this new macro? Isn't this the same as existing
exynos8895? Maybe just rename exynos8895 driver bits/structs/types into
7870?

Best regards,
Krzysztof


