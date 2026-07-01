Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E7E8C43327
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 07:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=40Mb1Q99LRaplTPmkgBZJY94T9rle7tGhhFunsh/I3o=; b=M8i1qaB7n9Z3/1jJ87yZRsbvlO
	o+0fitL75dgtJorGkkACKvOEhBbFiHktwHf7fXUpfyJIXfm4w6gq4PVmdmxABIDZkv+fJBw9+i8nY
	TsjR+5jJjMcrHhMPisCBkt1eEWRPEnuWc3vSbkUyzXZnHqKHWek2fosiU/2NtyPNvNw9VY+MHVrmT
	ySByaKvUFjjrPsvGKchib47NIw6oQS4Axy6DpM8DVQsilqikx/xZDzrZFexa4BJQ3GBsqLdIMl/NC
	UtD+cFsY0YBQSzT9W3CW55pbhJzMXJlXA/lFBeDeKUKBSDkU1xiw3hahJHUWeaMIeqCwk3bKnz56e
	lIXKgx2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wepJ3-00000000tOS-1p9h;
	Wed, 01 Jul 2026 07:24:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wepJ2-00000000tNs-0Y2f;
	Wed, 01 Jul 2026 07:24:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8EA6F600AB;
	Wed,  1 Jul 2026 07:24:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A4421F000E9;
	Wed,  1 Jul 2026 07:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782890663;
	bh=40Mb1Q99LRaplTPmkgBZJY94T9rle7tGhhFunsh/I3o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SmDSIMcwnkAhvV07pgkGpaqWSEuRNLUWfPKAeriaCkIXZD34kRN5VJPAwhVedlSf1
	 /hYhWjjucOLBDlTYTPWoP7QbMGD0y7pA+x8IOyA3MZunI05vQz/OGVLUpdlV/ju33J
	 jTmz0rKr8NRNnois5ZXerPyMbIuFovPjNJtx2tW7U064PVNyGFUVeWI9tnJNekzrHd
	 SerYLbMRGU5XUXdFShrDClwCUKZLcIIxbkNJeWiR12VWLAY6WkLmZlrA3ywOu7iJuL
	 8pmpE+djdZ8w+qXX7NzOvUju+RZAiAR1NnAQOCoAE6ql4ngwPKktd2kgtFSAq008Vj
	 0LxLq3NVIcFJw==
Date: Wed, 1 Jul 2026 09:24:19 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gregor Herburger <gregor.herburger@linutronix.de>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/4] dt-bindings: raspberrypi,bcm2835-firmware:
 Include 'reboot-mode.yaml'
Message-ID: <20260701-casual-bumblebee-of-emphasis-ddb404@quoll>
References: <20260630-rpi-tryboot-v2-0-f68d2dc6aa27@linutronix.de>
 <20260630-rpi-tryboot-v2-2-f68d2dc6aa27@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260630-rpi-tryboot-v2-2-f68d2dc6aa27@linutronix.de>
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

On Tue, Jun 30, 2026 at 10:59:28PM +0200, Gregor Herburger wrote:
> The Raspberry Pi firmware allows to set a reboot mode called tryboot
> that allows to try booting from a different partition to allow updating
> of the boot partition. Allow reboot mode properties by referencing the
> reboot-mode schema. The firmware allows a 32bit value to be sent as
> reboot flag so restrict the maxItems to 1.
> 
> Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
> ---
>  .../bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml           | 9 +++++++++
>  1 file changed, 9 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


