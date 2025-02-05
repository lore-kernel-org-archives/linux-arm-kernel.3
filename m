Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67B2CC02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 08:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GWX2DEz8S2fG1f4J342f+Iev+23o5SFIDH9XACpi9M8=; b=SYfp0eQ7ICD6aXTCqhr9gd4c57
	MZhQptiyJ/GzAQJtAmXq/sGGzjb80gEGt0/6IfLvIBBgHPwArxaNORFphuqySy4F6x5dGWFf1As1q
	6eb4DsUO9SbXc1ac56wrkqAxgW+JdZTMnhjCt+hmQHZZJZ2mfOuBnd0FeESXNm8PvHWUbourzAz0x
	z9tmN/sV65vExA5ceJ919+jXw2uxRV3iWwhoI0ftU3vqRNoXUpsED9fS+ICOpu1ar4eggIiERlI/T
	kZfTFYFlZ5hKYNzT3KZ0uFIVzxT8XsPixOWL/E7qsQGipMpV4vOB4o4JkLZxBKje7A8wajV3Mv5mS
	RyOiYM4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfb6q-00000002chR-1h5p;
	Wed, 05 Feb 2025 08:50:12 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfb4p-00000002cHu-3viG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 08:48:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 225B7A4326A;
	Wed,  5 Feb 2025 08:46:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B900C4CED1;
	Wed,  5 Feb 2025 08:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738745286;
	bh=gDxFlomX3dUPHwAXjNXKKOGj1Fq1lpYag63Qntcsa+I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EP0JHukCBN3XkCr772neoXDy3/otFczJ33X9/L+Buwm2QgLLrZlgaEP6RHhs7xQQ3
	 FZmbGwEIOIVmVNQ0SXuHltZBRqFSAXArlIYI/OusNSh6ncU0qiUgc5gQ37mHB3Fzh6
	 ChhvAizusnR6JEMAn5TolwnQKLepPGlEtHcao9v/3XQXbXcENuPOi80Xrrq+e8k/sX
	 WmYdPLOzHxKMC4ELTKmga1l/kfmyTns3lFFh0eSI0neSTDoeRRRY2r0X9cJ1dO/Z8q
	 DhK7maPCL8BbEAPXSMLTqpqXB+5qLnV1etoTBvaMNpsA/a5KDCquQln0EUSlIqI+3h
	 MW4XPnqZuvdRA==
Date: Wed, 5 Feb 2025 09:48:03 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Sergey Lisov <sleirsgoevy@gmail.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: usb: samsung,exynos-dwc3: add
 exynos7870 support
Message-ID: <20250205-carp-of-inspiring-science-6dfebb@krzk-bin>
References: <20250204-exynos7870-usb-v1-0-a7753f8183a4@disroot.org>
 <20250204-exynos7870-usb-v1-1-a7753f8183a4@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250204-exynos7870-usb-v1-1-a7753f8183a4@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_004808_039326_3D582D5F 
X-CRM114-Status: UNSURE (   7.95  )
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

On Tue, Feb 04, 2025 at 02:09:29AM +0530, Kaustabh Chakraborty wrote:
> Document compatible string for Exynos7870 DWC3-compatible USB 2.0
> driver. The devicetree node requires three clocks, named "usbdrd20",
> "usbdrd20_ctrl_clk", and "usbdrd20_ref_clk".
> 
> Unlike other variants, Exynos7870's USB node doesn't require extra

I don't think that's true. What makes you think it does not require
them? Device works without power?

Best regards,
Krzysztof


