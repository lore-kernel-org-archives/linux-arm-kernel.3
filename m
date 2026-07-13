Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6E56C44501
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 07:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=McdvidCR7TQEjAKv3Qut/R/RNS5+oe9QxMO4j5MP8sM=; b=gMU5PJtWEb/74NzkaXbJAMK/uO
	JbkjX1OpTkdOjKpr+xIAkJPMyNC7NsWuhjim8eMfELwU+CsWaUD3H5+HGOHbfkgihsIZAOR2gx61D
	D1Vd0R39Lb8uZjtf7SmilYB2WPMb1Og3ny5lGIUqFyYI4LN8h5zDod4npAgtnVnaO3xn3kXC0XtHu
	377WtK41eNnNm+XJ6x+0wSU/eX0ZaujAjozaHOm4jrXOksF/xve7tGdhjsaKK0SHBcz3j4GhlavD7
	PzTq2tTCWaVdNlc8Lj81E/WBs3ou0yJWRvmXs+Uiur5q9eM3hvbUImTVWiuxXidRmLRSotx46o1Qv
	+05PcZ3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjAmZ-00000008L8b-08ui;
	Mon, 13 Jul 2026 07:08:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjAmY-00000008L8K-0GiO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 07:08:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C695F43A01;
	Mon, 13 Jul 2026 07:08:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11FAC1F00A3A;
	Mon, 13 Jul 2026 07:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783926529;
	bh=McdvidCR7TQEjAKv3Qut/R/RNS5+oe9QxMO4j5MP8sM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LpWanYjGj8VyzgBqDaEEHyFNlminBsoo33C+aS6o4//ty4qE+Mw+mropG2qLwcBtb
	 07XPwGYCbnU1DWk2ewh/xriCEKiEoku6Qn/a8chJLayYh773QQ0Yq9HkED36R7M1eZ
	 KuCZokrNQrzH2dW9D0deUOu3gBuGBsVYqVXZkmJ9+hTsYT36m/WEpFkUWAJIR43l2P
	 z42aLkZNdpmAH9SojCbzO08iBkN3nh6VZSQfoORWVzTO4VTbNjo2/2A81k7+NA9jTW
	 pDzwgj+EVTxHJe766RqWYNj8EGK3JpZVjv/U1QrczWKQFggIfP2yDaStIjawy+7wtu
	 PGdjZQ3dodRpQ==
Date: Mon, 13 Jul 2026 09:08:46 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: usb: Add Aspeed AST2700 DWC3 controller
Message-ID: <20260713-comical-kickass-anaconda-bfb0ca@quoll>
References: <20260710-xhci-v2-1-f292c4f7339a@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260710-xhci-v2-1-f292c4f7339a@aspeedtech.com>
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

On Fri, Jul 10, 2026 at 10:51:35AM +0800, Ryan Chen wrote:
> The Aspeed AST2700 SoC integrates the Synopsys DesignWare USB3 core with
> no vendor glue logic: it is functionally compatible with snps,dwc3, uses
> the standard DWC3 clocks, and the only SoC-specific part is a USB3 PHY
> that is handled by a separate driver.
> 
> Add a dedicated binding document rather than adding the compatible and a
> conditional to snps,dwc3.yaml. This follows the established per-vendor DWC3
> convention (apple,dwc3.yaml, socionext,uniphier-dwc3.yaml, ...) and keeps
> the AST2700-specific constraints - notably the mandatory USB3 PHY - out of
> the generic schema.
> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


