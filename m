Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6017E6F095
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 14:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6vyAaTZHNfqEYihtUgDCLsZ1obf35v0ciYJXK0PnUWw=; b=xt/8nDXXsjNFIpBDGjTynRuwcu
	QJADYhPsgq1tf8Sc6DOR+vlrLKGcMVcZp2ZuA1GYi+VIqfbe8yVlS2LH3lwAylHBsauQuH7sge2rA
	W6XSx/zn1z+mUhe3a4P8kfb0SvwwVbWqhiLhGWtsRmdTw5KkzVzZ4E6+fp2tXaDjiV//NjKyqxZxs
	uM3dpYm5FVwbOZte5U6DbqrzUFkBh6W3gdwxpiLrJUIcCuAcOhp28rsdv0zEctkXcHk6wWRGwQJYx
	ta9nzk0waNfG7V+hLiwontEwM9GZD9nWQOQTZNMGPM2FbKcIa7liUhhsjgz1x+EjOo3nmzOxIRVw0
	PdlSmauQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY3Rv-0000000FcTL-2liW;
	Tue, 23 Dec 2025 14:33:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY3Ru-0000000FcSu-2tKb;
	Tue, 23 Dec 2025 14:33:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F164E60139;
	Tue, 23 Dec 2025 14:33:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C817FC113D0;
	Tue, 23 Dec 2025 14:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766500397;
	bh=SrHPMnHEpJgZWnZhkf17/F6xjv4J13mhWyZ8J187vH8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PUenk+a4AkQksDjJCRiPo3D45DzMbOOiFQKKjUALAdCOf+Qyn2yX64yaHImzrzVmc
	 WAwuSDFFbCrzbj8aCWi20dSYT2zcX6VbQMUWy8WKbWqgM7hs0ocI38LCUfYXV/8XEv
	 sL1q0hU4qobhO7sl74CeuV4p/OcPX/k98pS/T4PfBZXWILlp8/5PpansFmeH/1BVH7
	 vUq7nKEEMOeMxcsiPnUyg26fF/j4EllgSFP0WEGTpNwSEXe+Hg9OERwCAmQbj/HxUT
	 XrwJIxRyAqZ5KLMrbWhiJq0/R0kdjJ4CplOV8r8YvbW31KC0GSiX/MNOKQN6QDBkW0
	 sO3/BdAyopmFw==
Date: Tue, 23 Dec 2025 15:33:14 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tzu-Hao Wei <twei@axiado.com>
Cc: SriNavmani A <srinavmani@axiado.com>, 
	Prasad Bolisetty <pbolisetty@axiado.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Harshit Shah <hshah@axiado.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Michal Simek <michal.simek@amd.com>, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org
Subject: Re: [PATCH 0/8] Add Axiado AX3000 eMMC Host Controller Support
Message-ID: <20251223-black-auk-of-priority-8b48ae@quoll>
References: <20251222-axiado-ax3000-add-emmc-host-driver-support-v1-0-5457d0ebcdb4@axiado.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251222-axiado-ax3000-add-emmc-host-driver-support-v1-0-5457d0ebcdb4@axiado.com>
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

On Mon, Dec 22, 2025 at 04:44:59PM +0800, Tzu-Hao Wei wrote:
> This patch series adds support for the eMMC host controller found on
> the Axiado AX3000 SoC. The implementation includes support for an
> external Arasan eMMC PHY that enables HS200 mode operation at 200 MHz,
> significantly improving performance over the default 25 MHz operation.
> 
> Hardware Details:
> 
> Arasan eMMC host controller on AX3000 SoC
> External Arasan eMMC PHY (different from internal PHY supported
> by the standard sdhci-of-arasan driver)
> Support for HS200 mode (200 MHz) operation
> Integration with existing SDHCI framework
> Implementation Overview:
> The series adds support for the external eMMC PHY required for HS200
> mode. The existing sdhci-of-arasan.c driver supports internal PHY
> configurations, but the AX3000 uses an external PHY that requires
> different configuration. The PHY driver was implemented based on the
> reference code in sdhci-pci-arasan.c as recommended by the Arasan team.
> 
> This series includes:
> 1. Device tree bindings for the eMMC PHY
> 2. PHY driver implementation for the external Arasan eMMC PHY
> 3. Integration of PHY support into the sdhci-of-arasan host driver
> 4. Device tree bindings for the eMMC host controller variant
> 5. Device tree source files for the SoC and EVK board
> 6. MAINTAINERS file update

You completely disorganized the patch.. dts is mixed all over driver
code, you combined two or three completely independent subsystems into
one.

Read submitting patches in DT dir to understand how DTS must be sent.


Best regards,
Krzysztof


