Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98A2DCA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 10:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=igZN1JZDbo2eUKBPEUpUUpCrkVNkHeN8r7Knm9kKQTQ=; b=fuGmrOjO4J1dbOLbk98Ze5thCK
	QqKTOVNO25jUsH7MM/ut8M8YNwIU10GCIxYOkIaEEBA/3CNYCXAOYhxaYJ44Kn1Wf/hAPFtZqc3uz
	cW52LGb93JCgF54S4wWyHId3XFBGYLOVfVsDCQn9Gax7zFvleCwqFmgkeBZAfFyKYvm05DTo0g7Hg
	7lv/EZNf25OIEsMuS5HqU0jPTLi8DRB2hXBm75XCR17Dp8UXYL5B7QbBvn46UZOuD/HWqfk3qOk8f
	d5cSUkBSNdn3uSozpbCaZ5tuXVJ/XODNXPH2diASET4kRHKUm8irD8kTJ6RC0yJVLuPxZY5FXLJr+
	EYTWYagg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDfjj-0000000G8hx-0ei9;
	Mon, 05 Oct 2026 10:15:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDfjh-0000000G8hX-37Z2;
	Mon, 05 Oct 2026 10:15:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D16016022E;
	Mon,  5 Oct 2026 10:15:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9D621F000FF;
	Mon,  5 Oct 2026 10:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791195356;
	bh=igZN1JZDbo2eUKBPEUpUUpCrkVNkHeN8r7Knm9kKQTQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=An2WvZiwsWKnpOmzD7EhVh/cUnMfKgzdSuhVcnMzNFQSLCIoBtJx78i0B1znUxaDN
	 RgCKZaTMVvAjf93YFfRIbzLoP53eGrP3LrCzQrln7v/TJnHAXuwNhA19BRsMC9+TMl
	 aMysBMrB0hNy1SPB6gJwdT9kQp6uY6q7oouukBqJinSSS3v9IhDy5ecEujy0ShzCa9
	 U2rLLXsg5fAmaANx438MBfL8cjcvbnS9kiG8AVR/HGyZ0OerZ6bq7iOvAdxsJZqSrI
	 P8cyxXrk669aMgH4FcOwhcrxvJM4csesxv9fvIuXSeU6KYRCZQ2ni6wMiRFGpx7CZ+
	 jxylDv3tBpikg==
Date: Mon, 5 Oct 2026 12:15:53 +0200
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
Subject: Re: [PATCH v12 0/3] airoha: an7581: USB support
Message-ID: <asN42bZlK_jwS6uH@parshuram>
References: <20260930071826.48811-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930071826.48811-1-ansuelsmth@gmail.com>
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

On 30-09-26, 09:18, Christian Marangi wrote:
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

This does not apply for me and Kconfig seems to have a trailing
whitespace which checkpatch complains about. Can you fix these and send

-- 
~Vinod

