Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B892AC79FAD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 08:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mQsZ6aebHJQxMkqt08Wbinhh4q6wlMlL8C0i60RN04A=; b=KGQ6mqQVaJQWlHMux8z9C8CVWn
	JbC7LVG6aWBpU/9fJ3ALtVC8rjcb76SAcfLv/ObJ4epCzL4VHM0/S0h7kfYDWpjQPia6UUwGJLkQQ
	MG6rWLXI4TgJMVux0b733SYaoiZ1F9MftZw08VGSFmqe1V8laa9g56q/g2nhl2CXgotmQ2KYSHZBh
	DyIjHV3SvpSsfr1kCVWfUk+c71eWkCDSlTQ+cioyPUcbt3Uw78ZCCuUKCukJbnEqGdObkng3EK3d4
	tB4Z3x+ylWrquuB0OMQd75M5Xo13zMZijNmySfKdpoDo2nz1P9a4wCKBZCk8d2zOdfuw3cpTNNDNZ
	WkHvUvAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Dkd-0000000B8TL-0uar;
	Wed, 09 Sep 2026 08:33:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Dkb-0000000B8T2-2CLf;
	Wed, 09 Sep 2026 08:33:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4A65840548;
	Wed,  9 Sep 2026 08:33:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A69E71F00A3A;
	Wed,  9 Sep 2026 08:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788942829;
	bh=mQsZ6aebHJQxMkqt08Wbinhh4q6wlMlL8C0i60RN04A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Fy4iarGhYC+fWRY4cqIOo4UckU2EIMXS943jL66BN3X8QLqdQmc+dpdmIZU3mx+dk
	 T8pBJ5C62jV4HmOpG+OzT00naRFeuSY7Dt0NFoGkrJLEcHNPk0kx8LGq0UVbEgLEcB
	 QeXk94WlbdJciaYl/0RKL767RGRa0jvIR1Bdw3Mdk3zGiuP3ByXJ7g35V+uWWZRQ2e
	 z/F4MCGVzPverSRjIrLLgnKo2+uRxovZkstb92Vg4jmWifuyQvlCa8bnhpDAgj0MWS
	 yCrOLtF8kMA9RgQuZJqK+zKNy2vWUIy9sxOXD6KWvc++TarkGv7Jz+lVE9EOAeIUNI
	 75C+c7kRhXn8A==
Date: Wed, 9 Sep 2026 10:33:40 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: phy: aspeed: Document AST2700 USB3.2
 PHY
Message-ID: <sb34uqn5egc36c3or6mbhjj3k2sgcdxkdwnrberrnqzn7oqrag@75ghpc6cjmrp>
References: <20260701-upstream_usb3phy-v3-0-00e12315b6f9@aspeedtech.com>
 <20260701-upstream_usb3phy-v3-1-00e12315b6f9@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260701-upstream_usb3phy-v3-1-00e12315b6f9@aspeedtech.com>
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

On Wed, Jul 01, 2026 at 02:58:17PM +0800, Ryan Chen wrote:
> Document AST2700 USB3.2 PHY. This IP is connected between
> USB3 controller and PHY module.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்

