Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38E5FC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 12:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MnVxgTOKD+Qbz0EZDFgjBpsgwV+PLP04o0DIITKpGf4=; b=y7wqfyVsorGp10Xmoy1NUWck1T
	PlY/rXF5U+NH5aBPQEadOpeuR+CtILi4RQhUKBtNf4aQ5DjCv7kN+NXHoWl5GKaI32S5cuwH1TinL
	nbeNpBG8aDMEwGLA2tMqXyKZYnscbW1pY4dvTwi7DSIPLlTJIIj1fpLLbzW6zHbv0JbzRjALJuFI6
	9/aoEClgsrO9EtnoAWJJ7K+yvsbsqda/vFUB0NQeHmIAMleILLFyCdZSXPisjYjndtsGqCk7RO57l
	98oqoNC5DPObco3P3eumujb1lK9MOlYiYg80cOyAfeiJT7ZoNpbFBfWYcyXZnw6PCY+uHzMyTIQO+
	ZQrKktGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmu0l-0000000HCtp-39nZ;
	Tue, 25 Feb 2025 12:26:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmtP3-0000000H5Ly-00KD;
	Tue, 25 Feb 2025 11:47:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BA8D161239;
	Tue, 25 Feb 2025 11:47:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38921C4CEDD;
	Tue, 25 Feb 2025 11:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740484028;
	bh=MnVxgTOKD+Qbz0EZDFgjBpsgwV+PLP04o0DIITKpGf4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D3eHIKBdidCXp/7lUrKFHiR+byC5kr0tbtSgFcGFFzcpHyaqKC2HP+/FsgyIiwrz+
	 JQphjGF4z2AnWUJYvI3FCJuTJIV1hzbyU6/7HDiuruuR7vDHrv0sOCTswiA8/xX3fe
	 ntvoQxMmQXIJ4Pt0Y0DeN0NYbEjZQesa5o/DWsPLkH7j5+WnWZCUSf8nIUDT1F3JBa
	 I6px/rrrdZjN2t1UFUnjesLLjPwJu2zgAjNnvtL+5GZzNc8wFAlXtPPjk9lxFeNzh/
	 JybbgmdPsJ6inWettmeDkevrbSF2KH7vqeu7GdPdtdPPrVDy6hf/Gfnx9peW07uBqJ
	 rzKzArzQBA5NQ==
Date: Tue, 25 Feb 2025 12:47:05 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/8] dt-bindings: phy: rename qcom,snps-eusb2-phy
 binding to snps,eusb2-phy
Message-ID: <20250225-encouraging-deer-of-will-9aeca2@krzk-bin>
References: <20250223122227.725233-1-ivo.ivanov.ivanov1@gmail.com>
 <20250223122227.725233-2-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250223122227.725233-2-ivo.ivanov.ivanov1@gmail.com>
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

On Sun, Feb 23, 2025 at 02:22:20PM +0200, Ivaylo Ivanov wrote:
> As Samsung has been using the same Synopsys eUSB2 IP in Exynos2200,
> albeit with a different register layout, rename qcom,snps-eusb2-phy
> to snps,eusb2-phy and drop mentions of it being only for Qualcomm SoCs
> in the binding description.

Rename itself is pointless. One logical change is: you add here samsung,
this you rename it.

Best regards,
Krzysztof


