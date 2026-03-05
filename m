Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA702EEF316
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 08:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4oTitRPCgD9g0EEgsKLhvaDCkJjPjgHuUKEKink2Z/k=; b=l0VXxlBvXjVeUScYK+gSjJt6AJ
	gUogG9CDiQCCw9X5XUCT9eavGfCONY7jfBjeI9CZz6V79RtuPrNXYyretuHU76ggbNA0Ynr/85Qnj
	sl1Bqv4pRgPjg2m4WwtaAOhWelyo9w8PFv+k5lDmuy2XAzDMkcsKbvgHhsjH25qhW+RNYp/T1DqPP
	0Wym0fA6V4qLXcX+OejaNGgis9Xi4l5zdKsnNlrPQwQ0tKEfSWRlL5gkWfMSfB9uQaE9DkEjRvX7W
	6mNGC1gyZjNg70Bk/g574CyltUOe3aNl+YLFRkpM+sr66n6CzvQaGmyH55YlVlvG1k2aAE80WzTnF
	FZ2I4Gvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy40z-00000001BgI-0dxz;
	Thu, 05 Mar 2026 08:25:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy40w-00000001Ben-3EM5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 08:24:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 517E643A75;
	Thu,  5 Mar 2026 08:24:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A34BDC116C6;
	Thu,  5 Mar 2026 08:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772699098;
	bh=CcyQ0FMKZLYA3+oMSJy4e+mo+GRWCZA/Ac3gQFkgIFM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=B0gP836dyQqJ/ZqrtT88OSaSVc4D9DXhcHlGKUuLEMRd8+2YAyjR1SmTOaAMUGlgk
	 hGPF6vCIUcX+o+jB+AsE5h2zfe5oN7ihWTVXKE+oCzxSHhpiQxepHSddUu0HjjtXRS
	 R2fG7BV45RsVH7E/ZU/9Aq4bahlLxCJv4Hf0Pk53aM1PtfNOFLyouyvnvogCL9SJBt
	 OnPEtvFhgLRfivGZaY6jz/vxbMhkEfkEnx3ykjfo4ABkPPFZIZTAq8Umn0UwHOZyQN
	 gI9U+iOHW8+0LGEVLVTpFu7bQ/MQoffQ0+ZxZeG2UqdSPcXcGWeX1Bss4muwplFNiI
	 CMqTrpPYP1ALg==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 Andras Sebok <sebokandris2009@gmail.com>, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260304-exynos7870-j5y17lte-v1-0-eb25902c84c8@disroot.org>
References: <20260304-exynos7870-j5y17lte-v1-0-eb25902c84c8@disroot.org>
Subject: Re: [PATCH 0/2] Add exynos7870-j5y17lte
Message-Id: <177269909539.19782.10813796455691399837.b4-ty@kernel.org>
Date: Thu, 05 Mar 2026 09:24:55 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_002458_828093_EDE62DE7 
X-CRM114-Status: UNSURE (   8.01  )
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


On Wed, 04 Mar 2026 22:56:52 +0530, Kaustabh Chakraborty wrote:
> This series introduces the device tree for a new Samsung Exynos 7870
> device – Samsung Galaxy J5 (2017).
> 
> 

Applied, thanks!

[1/2] dt-bindings: arm: samsung: add compatible for samsung-j5y17lte
      https://git.kernel.org/krzk/linux/c/135b55014109de2e6c8b9c5d52e5cfd7b765315e
[2/2] arm64: dts: exynos: add initial support for samsung-j5y17lte
      https://git.kernel.org/krzk/linux/c/a3a20c5f4e10f43e137ee32842639637c853c3a6

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


