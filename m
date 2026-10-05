Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6CB0CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 15:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yt2cIxoQIfLnBunLQQhFqDYMawJbVrX8eYhikJaBfJA=; b=c73+cjNZGHF3d+Q/Iw3b5JjjiF
	mNVNb9YRfN/pIwX4dDpyweODSOFCRZTaRokwUO7wNC2s6YjJQPbuCLtWAqcxzQzxIOrjVjSKEYfya
	/QSpgTZZE8AXg5DPpuUpJ+kuL6q//kZIvvYDhXPGLK4ESNU2lRgApWDCXtRnODHZa6IT9eh9iUbqf
	qcxZVcpYQQRQykYCHZvEmmNYREJSB9F2Wiy/1SYYkfEZUH58vKTB/joykuirjgoJWsqSkGqnLnelf
	RSQx6VsgqcBCnfSaXKONNCjjzm1oiGUWfo5c114fu82rjZFcakAwH9+qzYqMsxWx5k9hk1DN+f5B1
	da1OqpMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDkc6-0000000Gksk-2Uo6;
	Mon, 05 Oct 2026 15:28:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDkc5-0000000GksX-0CCE;
	Mon, 05 Oct 2026 15:28:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 223D860514;
	Mon,  5 Oct 2026 15:28:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B74C1F00893;
	Mon,  5 Oct 2026 15:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791214103;
	bh=Yt2cIxoQIfLnBunLQQhFqDYMawJbVrX8eYhikJaBfJA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CfAIATsk3wvGZrddvArgJlaROWSHSJWAqpJ+FVI3dYxKXFIx8PGP/DMcvjkain+c0
	 Ujfnd8VBk7JlEl/017/Y2hkLLy9tSdYiWGFIrU2BvEjNpqSGTyC7E78BnGwc6J+gr3
	 roQC4rZ+14YmSNbzSdu2uM+NE3vRP64GRHzb2CaPC63Q4X0YsG+Zht3P86I1lzuAFp
	 2x44IxEEVy4eqZ1UX1IVmIuRcHjyZCIuadYRAyVFZXX7BiazcwPh9WZlwgbEURg1CN
	 q3wwQlUAyBrowvno6hvAkkb7XWhLyzAWp34xOi1XUGn4KCB70OZ/eiPkCs/ue0SkQq
	 LuuFqiyhVbhnA==
Date: Mon, 5 Oct 2026 17:28:20 +0200
From: Vinod Koul <vkoul@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v13 0/3] airoha: an7581: USB support
Message-ID: <asPCFDMXyntAV6lx@parshuram>
References: <20261005105535.2472-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261005105535.2472-1-ansuelsmth@gmail.com>
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

On 05-10-26, 12:55, Christian Marangi wrote:
> This is a major rework of the old v2 series.
> 
> The SoC always support USB 2.0 but for USB 3.0 it needs additional
> configuration for the Serdes port. Such port can be either configured
> for USB usage or for PCIe lines or HSGMII and these are configured
> in the SCU space.
> 
> The previous implementation of a dedicated SSR driver was too
> complex and fragile for the simple task of configuring a register
> hence it was dropped and the handling is entirely in the PHY driver.
> 
> Everything was reducted to the dt-bindings to describe the Serdes line.
> 
> Also the property for the PHY are renamed to a more suitable name and
> everything is now mandatory to simplify the implementation.
> (the PHY are always present and active on the SoC)
> 
> Also other unrelated patch are dropped from this series.
> 
> Changes v13:
> - Rebase on top of phy next

Pls fix the chechpatch issues. There is new blank line at EOF, SPDX
format mismatches and many more. Make sure you pass --strict flag to it

-- 
~Vinod

