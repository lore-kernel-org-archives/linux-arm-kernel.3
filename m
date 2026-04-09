Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E7E5E9DE62
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 08:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E+lRhdHDVBJrTkG1AmezHRrGltYZhkhVeZypFBMsKvo=; b=WlJ/RKvvkEJwaXaNaCkw5P8hTQ
	0F5gAMbjHjx9C/ug/Mu1GablPFwXyMNacuF+1CGBpPJXyHSzWcDW5VZCkPkJ2zNQD6ESpu5tjM+2I
	F5N7dQq1bavGT7uqB3oUkIefm32dnSjLNu/H06Wqit8JAPOYcmVUoHjMBH4hdvVgoMIhYC81k79Dn
	pFlvQmTaPRFe2gNexBDacDDVbi9ohutoo5fvWP18WQAo5w//2AR99Z6a3qdZwLIvth8RNqeYIP7Sk
	wjtahRZra4buQumt79eTmS9VxRM+ovzJa/UEjIDIg0dNjTOlWBz57rAA2Am85bdWincZ5pbWCCNeR
	jqqx8Xrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAkZx-00000009vtk-2WPO;
	Thu, 09 Apr 2026 08:17:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAkZw-00000009vta-25tX;
	Thu, 09 Apr 2026 08:17:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6CD76600AD;
	Thu,  9 Apr 2026 08:17:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D54DC4CEF7;
	Thu,  9 Apr 2026 08:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775722651;
	bh=sPCrS7Vxsq6SyoOdi8MM943FRV/lGQdBwPfGUAhtoiE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZULk9AoFoGK/bsWIrEczQm+RKRre0K8iu4RVp8K7KIsNSixdhhWMn8KJtAQtC8F4Y
	 nr8Ljqk5J+0stJmGOuYkPiurEWOTFiQbRhjU44q1mBt7ebBABamq0fJyF2ZdEo61iw
	 JUtWr+X3NwsF5UKpUIiW8m1apbvd7qkKKM7hzV58QMA94pnRkN8TEgBc88FuS8S9qf
	 0ypubbDQX+BXP0kwRNOCWkIW+Vf5Rhj3hVrwIjAfYEz7Xc11Au4bJmamJFeOEPDsvX
	 GoHlHV+uA7b/mtlls1wH1x29hs8TpcYTxTr8bOlWsAaJHT9XSdUpYMUlaVGLCqLWuQ
	 iuU5lQbeswGnA==
Date: Thu, 9 Apr 2026 10:17:28 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gregor Herburger <gregor.herburger@linutronix.de>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, 
	Srinivas Kandagatla <srini@kernel.org>, devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] nvmem: Add the Raspberry Pi OTP driver
Message-ID: <20260409-pearl-turkey-of-adventure-815ffe@quoll>
References: <20260408-rpi-otp-driver-v1-0-e02d1dbe6008@linutronix.de>
 <20260408-rpi-otp-driver-v1-2-e02d1dbe6008@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260408-rpi-otp-driver-v1-2-e02d1dbe6008@linutronix.de>
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

On Wed, Apr 08, 2026 at 10:00:16AM +0200, Gregor Herburger wrote:
> Raspberry Pis have OTP registers which can be accessed through the
> videocore firmware. Add a nvmem driver to support these OTP registers.
> 
> Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
> ---
>  drivers/nvmem/Kconfig                      |  12 +++
>  drivers/nvmem/Makefile                     |   1 +
>  drivers/nvmem/raspberrypi-otp.c            | 159 +++++++++++++++++++++++++++++
>  include/soc/bcm2835/raspberrypi-firmware.h |   2 +
>  4 files changed, 174 insertions(+)
> 
> diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
> index 74ddbd0f79b0..892d05fe67be 100644
> --- a/drivers/nvmem/Kconfig
> +++ b/drivers/nvmem/Kconfig
> @@ -483,4 +483,16 @@ config NVMEM_QORIQ_EFUSE
>  	  This driver can also be built as a module. If so, the module
>  	  will be called nvmem_qoriq_efuse.
>  
> +config NVMEM_RASPBERRYPI_OTP
> +	tristate "Raspberry Pi OTP support"
> +	# Make sure not 'y' when RASPBERRYPI_FIRMWARE is 'm'. This can only
> +	# happen when COMPILE_TEST=y, hence the added !RASPBERRYPI_FIRMWARE.

Drop comment and use standard rules for multiple modules.

https://lwn.net/Articles/944368/

Best regards,
Krzysztof


