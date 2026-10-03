Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 872B0CA5FF3
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 15:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MX9aB6PwQHsHsiY0tEeijH0+CAtN1fEbIer9DwvycAc=; b=nNnAr7Z1aUIB/2I1tuBE7TULwU
	ELpRtSkdDPUwXmdqJo1uDHaXq+A7Dmh69/YhO0iOZVdS+CmaGriH7HQ99Kiy4780RLpnG7mwCbeNf
	+XfmUE+TAqdUpND6cKWZcfbOcDXrlCu6YHiHNjq1dkfJeLkOmiziiOCpNgjgR/TTgPoTAJkxf9ROv
	HIUoJUFDfGfSERzLm47tG2UVXYB/rYLlImpwB/iXUgtA4J0OzTvwas6wiU4W/BMgAsBXfS1LELG7F
	8E3PUKv1vsX2mM2Llhh9CheSgdU/pxe7CxcYvXJPczBg7J1fLjo8G96hQWsPllwu/4SMDtl2XdI1X
	0h7ONCvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD1c1-0000000DgWx-3yLh;
	Sat, 03 Oct 2026 15:25:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD1bz-0000000DgWX-3d7A;
	Sat, 03 Oct 2026 15:25:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8CB99418CB;
	Sat,  3 Oct 2026 15:25:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B8701F0089B;
	Sat,  3 Oct 2026 15:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791041117;
	bh=MX9aB6PwQHsHsiY0tEeijH0+CAtN1fEbIer9DwvycAc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=aAoqDat+Q89oO/U4XsYvv+6iolQlUiVFN2uAyCGDz9O8O5zeNf0bG9/M5BtZVfbRA
	 y9vpNHqOqXKntCf5ly5efU77IKcGAPsbjCnJ5AOySwX32MWJ2Hlj2tRrwCGSGS0rfE
	 6e8aEXzKDNQlyvmteKbXFUNUFx2vorFfutyKmDWOZF7Q/ypTCubxFVRgwpidjfqBAD
	 qUIOWvYgBu0kDXgJBNTLILGsXLSqcFL+4nOrAztAnmhMVwO1z19zfE2GzlVCWteRzW
	 HKfz+COj3lDOhi/JAF7BaVJTZhKP0FCWFlOfNSeiTAKShGexJvyGWqfyXlFOpwjGc3
	 939xtt+1OLawQ==
From: Vinod Koul <vkoul@kernel.org>
To: peter.griffin@linaro.org, andre.draszik@linaro.org, 
 tudor.ambarus@linaro.org, p.zabel@pengutronix.de, neil.armstrong@linaro.org, 
 RD Babiera <rdbabiera@google.com>
Cc: badhri@google.com, nkapron@google.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260925222959.3607769-2-rdbabiera@google.com>
References: <20260925222959.3607769-2-rdbabiera@google.com>
Subject: Re: [PATCH v8] phy: Add USB3 PHY support to Google Tensor SoC USB
 PHY driver
Message-Id: <179104111428.223537.9712692661355161326.b4-ty@kernel.org>
Date: Sat, 03 Oct 2026 17:25:14 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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


On Fri, 25 Sep 2026 22:30:00 +0000, RD Babiera wrote:
> Add USB3 PHY support for the Google Tensor G5 USB PHY driver.
> This patch adds functionality for the usb3_tca register, usb3 clock,
> and usb3 reset as defined in google,lga-usb-phy.yaml. Kconfig now lists
> USB SuperSpeed support.
> 
> Refactor the probe sequence to initialize the USB2 and USB3 PHYs, and then
> initialize clocks and resets for both PHYs afterwards.
> 
> [...]

Applied, thanks!

[1/1] phy: Add USB3 PHY support to Google Tensor SoC USB PHY driver
      commit: 8c2b331e6327ead44e72e347ce405c21dd781a99

Best regards,
-- 
~Vinod



