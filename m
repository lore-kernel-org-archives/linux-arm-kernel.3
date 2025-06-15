Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3076C71135
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Jun 2025 16:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xdg/E6tvGhL6m9lZdkSah5KvcT9Dl6Azi89QzG1j6Hs=; b=1eS2XzIRZg8BSUE/fyBsEJz56i
	N1yFAVXjaPSAfm2WCoKwzVmLP9Z94WIp1kIwqwf+qvN6tPS8qwmMlVXueyRUd9LgFnX/kDsLv2wG3
	5nl8Fcy5Rq71o2MmNmJeHm+65YyghZRPsafSx272CODcuGYbVd8tHhSLrZe+416qCyWEs235QYV/7
	ovtJAPiio5aZ0uAz+zezIoXqRQclLivOJNLHqzFNEZMHPuiQTye3n+JhLi7vEW4UFCj/KfZ+w16lb
	xa6z+bVMUS/eZPwFtk7bZRJbior0d8SahFMZNo2f9D7pzDJdQndjxmlbW+gYMZDi1M63qru+LFpMi
	BOI0eU6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQqcy-00000002gDV-3Dvj;
	Sun, 15 Jun 2025 16:54:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQqam-00000002fpw-2TEF;
	Sun, 15 Jun 2025 16:52:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0CA9261120;
	Sun, 15 Jun 2025 16:52:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4B69C4CEE3;
	Sun, 15 Jun 2025 16:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750006343;
	bh=bAvi/hc899Xx4wJEJHPJhi4z7oQVc3CAWG5FfnZi+Yo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=NFi+H/B7gtAN8b/2kL0xOSpZpe9+o725fPZ0S2gYt7fLbupKVdwUq4484g5M37VAk
	 ZYHqnF0N6wD7GfSWM28thiPG5ySFTOGlvRlc5bFntTpHmRfngf7pqHceayBszIi83u
	 4JH5agtj0tPwNz31Jwhu533LNML/kF0wTP6AQZYxiy2qm0gRwnKNgLVrp6veep/50E
	 kMkSN2upTbNSqpfKQD+16EHCvmzw+xyP28J8ztnZVHbeneclVRmy21WFz02n+04HHS
	 bSZs/I+F86vWp3VeSBXopaayFOsAenZ17EVrA/5yEIX7RpKAs79X67Vn744jtGGJIu
	 /9S8K7io7+DQw==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
In-Reply-To: <20250214-exynos990-dwusb-v1-0-d68282c51ba8@mentallysanemainliners.org>
References: <20250214-exynos990-dwusb-v1-0-d68282c51ba8@mentallysanemainliners.org>
Subject: Re: [PATCH 0/2] USB PHY support for Exynos990 SoCs
Message-Id: <175000633955.1180927.15897677423516410884.b4-ty@kernel.org>
Date: Sun, 15 Jun 2025 22:22:19 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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


On Fri, 14 Feb 2025 18:21:06 +0100, Igor Belwon wrote:
> This patchset adds support for the USB 2.0 PHY of the Exynos990 SoC.
> This SoC has a combo PHY that supports highspeed, superspeed USB and
> DisplayPort, however due to my inability to test the superspeed part of
> the combo phy (device always enumerated as high-speed, even on the
> vendor kernels/bootloaders) only the highspeed part is brought up.
> 
> These changes have been tested and confirmed working (with the USB_ETH
> gadget and telnet/ssh in a ramdisk) on a device from the hubble family
> (x1s) and also a device from the canvas family (c1s).
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: phy: samsung,usb3-drd-phy: Add exynos990 compatible
      commit: 9f77d234c1f41e78a99f124bf6fee59dc2e3d46f
[2/2] phy: exynos5-usbdrd: Add support for the Exynos990 usbdrd phy
      commit: 385a766bed48c5bcf620061f24e864dafeca671a

Best regards,
-- 
~Vinod



