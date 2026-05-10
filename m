Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DA22CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 May 2026 12:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CcDit2766yGx3WiHTpW3nOgNzjxcblP26K4FyWST/hI=; b=eB1q/+F4TwMLDECNkVWZI4RTm3
	WgntP+IXn8SnBNzExOH4yQDxI6BQLVEwl6onF5h6Pzyj4CGEHn5+h/pGrqwI2O5doe9gZfvUeAaPw
	wcH8cYENOqnqFgJg1CdbKxM1VhIsr7/glND03Iz9+9avfUBNHFOPLZ+7ZmTRybDmUVX3eT+dvAZkE
	XxePwLEKRMKVXB7NTUL7V2WxfGNVcFfztAV57NB0+I7TNVk+gIsO1W/AhtAoRfoR4yLPl6XQwLUuT
	9a/H9n8NmIHhSkKLnIAzUDH8ptmgcaLy2GriARvNDkN+Qm2sXauyfF7yagfENovJR5WC4NNFYqK/9
	UCMRyw/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM3Jy-0000000AiQ2-2GZt;
	Sun, 10 May 2026 12:31:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM3Jx-0000000AiPY-279L;
	Sun, 10 May 2026 12:31:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F033E6001A;
	Sun, 10 May 2026 12:31:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E04CBC2BCB8;
	Sun, 10 May 2026 12:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778416304;
	bh=4sTIU6geCY/ofxbF1Nh9piJovvy17EjyERLoBxmWfXU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=iwN6jy38FZsJGhyHrd3rGfDNTGiQp/9tOIrvIHRK8/NOPNZLFYqnKAYMudEYwFesC
	 WqKhjTBM9MsbBOIkj7SQX2vWr4lBjnIlpETIUB65A1Vn8NXeiAYrg2inrHscyzQSMA
	 fb+PM0HqQitNTnq5uPzNakka+yA5SvHzBOShXVpRW8VhnA1eGnexRF1hqFw4oNoFtG
	 4/K3BOJhjE4VsfLy122sCWfYm+t37sbw0R0d+F3MtzZEBfZsTjqnIzC0fuAQRpLNAS
	 8t152qSjsT9S1hw3PtLncacqzc6jfUdyyykxejokl1/hagWZQEbr3JeeUEMCIi6pgf
	 6H7JbMmt55auQ==
From: Vinod Koul <vkoul@kernel.org>
To: SriNavmani A <srinavmani@axiado.com>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tzu-Hao Wei <twei@axiado.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org
In-Reply-To: <20260504-axiado-ax3000-add-emmc-phy-driver-support-v3-0-3ab7eb45b0c5@axiado.com>
References: <20260504-axiado-ax3000-add-emmc-phy-driver-support-v3-0-3ab7eb45b0c5@axiado.com>
Subject: Re: (subset) [PATCH RESEND v3 0/4] Add eMMC PHY support for Axiado
 AX3000 SoC
Message-Id: <177841630053.434434.9292071839258247877.b4-ty@kernel.org>
Date: Sun, 10 May 2026 18:01:40 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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


On Mon, 04 May 2026 09:38:31 +0800, Tzu-Hao Wei wrote:
> Axiado AX3000 SoC contains Arasan PHY which provides the interface to the
> HS200 eMMC controller.
> 
> This series includes:
> 1. Add bindings for Axiado AX3000 eMMC PHY
> 2. Add Axiado AX3000 eMMC phy driver
> 3. Update MAINTAINERS for the new driver
> 4. Update Axiado AX3000 device tree
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: phy: axiado,ax3000-emmc-phy: add Axiado eMMC PHY
      commit: 1a75ecefa4fbedefc1600e43445de4e1e7f03b55
[2/4] phy: axiado: add Axiado eMMC PHY driver
      commit: 9e7dfa4bcd4e2c3541c4ee954ea5e66edab94d3f
[3/4] MAINTAINERS: Add Axiado AX3000 eMMC PHY driver
      commit: 13ee293a904b7b7b0507aaa8c71f7be7e683800e

Best regards,
-- 
~Vinod



