Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77664C79F8C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 08:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=58EOD7l2qHE4wo91y89rSgzwAVP6VfLV2rivV/mwtnQ=; b=5BJj+naqnTZA7yVIOZpyRaHxXo
	ovhVUCEWkeJw0ECK2pu1CJ1076fXgImTCXACJEhLfJMLAPKKfeplzYzsSKlcokhFfuIo5CC6GUPWC
	Itf2y1OIF4ftyBmGwweMQp5OrPrU58ijfO3ZOaz2FDXXVp6xHyIxsf0HIwGWdrniAlc6+b6M4cBhY
	uxqV6CTgkZ+zKppOHxTOLrxUjefjhx9tzhvReB/SQ0aOeZn4mCbe1mkKec9h/I+jFqPuxuSQY7D7f
	uL2yTupMzJs4HwrWZLQJXMBuKdsuD3RK12h1U9V987Cyfogfxxd6DHkyXFZ/k4mUkFd5QPyCFPVD9
	PwOfX47A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Dja-0000000B88Z-2j0n;
	Wed, 09 Sep 2026 08:32:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4DjX-0000000B86L-0MWa;
	Wed, 09 Sep 2026 08:32:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 67A20601FD;
	Wed,  9 Sep 2026 08:32:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A793F1F00A3A;
	Wed,  9 Sep 2026 08:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788942762;
	bh=58EOD7l2qHE4wo91y89rSgzwAVP6VfLV2rivV/mwtnQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CsGcn7sYULHd2mcLbyjwpT3LIq0q4Ly0IxF2GVkacWdp25tdv+mGcpYRhpB9b3RF6
	 PftG00HGRHpsifnw6g5l83/NkOvQTHQU+hBWfxU5bZFPm35kooW6gH39gvp98mq64p
	 peeyLmPelCLv5E9IqPU6Oo0vfhlpikra1NvNFnNNKeIEatOhm7aGBWeRbCFtCrJPrd
	 UOQZxvzk3s+olK3OxQRk9c78bindNkxZ0sJkxePam8HON1PDwYmt2vBY9q87J9YNEc
	 GWPrZEPPfglxp0/bFGJED/97vFrQLXHZa/HCuxCm+R5W09sPtVb5O3uQ6w8/X4IJmt
	 7xTrRRT3UPMgA==
Date: Wed, 9 Sep 2026 10:32:33 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] MAINTAINERS: Add ASPEED USB3 PHY driver
Message-ID: <eizuwdemgc535gutiq3drpnxkqlw2c4a5bgjmjnnoe52lrbpqa@3p3mzanalcce>
References: <20260701-upstream_usb3phy-v3-0-00e12315b6f9@aspeedtech.com>
 <20260701-upstream_usb3phy-v3-3-00e12315b6f9@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260701-upstream_usb3phy-v3-3-00e12315b6f9@aspeedtech.com>
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

On Wed, Jul 01, 2026 at 02:58:19PM +0800, Ryan Chen wrote:
> Add maintainer entry for ASPEED USB3 PHY driver.
> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்

