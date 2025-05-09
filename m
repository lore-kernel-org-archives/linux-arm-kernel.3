Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54767C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 15:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/fUy2yKh/RPLz65MGjD30fnH1nOIBpirqiwEvJyIpAQ=; b=NbZxurXhTvl7QKdpVyAZYZ4GSu
	tWhf5vYI/vjRoW8idWlxObhdfkl/DUiN+caNRtfwZHZ8LqwGjOjan3N2OSdp2tT+uWSp9s2N8Vr3r
	/TfRdCCiM/6E7R3s3ZNO+Q0tJB6JzBO2mPphnddSUispIVmJIIXNWtTN7jGUbNdsqqajs0z9nDGo2
	HODTk+AbRt/PbAjAYwnHdukAMqFgjULmoRC4MDRikEp4s9yUiUWoSVNx8smHnjgacXBtuRh/2YpSw
	UCpBMMG8BYNeCUVb7Pg+uq9OaIUX9S135uQHibWj63rp0+KtAW936+O7wdkFBG17nnIGt9Zc2xOvt
	42/wLCNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDPhR-000000045df-2CaR;
	Fri, 09 May 2025 15:31:45 +0000
Received: from out-170.mta0.migadu.com ([91.218.175.170])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDNZg-00000003icL-3FWP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 13:15:38 +0000
Date: Fri, 9 May 2025 09:15:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1746796534;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/fUy2yKh/RPLz65MGjD30fnH1nOIBpirqiwEvJyIpAQ=;
	b=wPSI/vr3u7SF6YoZXAxqTcCV3vNyXtHP702KgSsJfIP001Re4QxA4KKir7k+2xF8WKhEtR
	MxLxGF26N6mm9JyRJVvLPSHOt3usxmKhfqCNPUlYvJupgrNNo1kHOVb62VqGkQ9JL2Pl+v
	8vhrbDHt/9MdIfWxF2vK6khuTnnV9AYsi28eYyt+i0t+Il8YbKvw6KPW5A8IgnRr4UU5QJ
	IBvq4amg/uhS+5fEQsQ7Us10in8UzaccSCMTCAwSO4UlHozBHx3N1dfFbPSmJyWm1x3P2V
	hey2AhkAnmGGJzT11fgVKNicTlm6tXcPwM5WXn5fAb8S3UdIb8f/ZTSTyz12CA==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: sven@svenpeter.dev
Cc: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
	Hector Martin <marcan@marcan.st>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Reichel <sre@kernel.org>, Lee Jones <lee@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v4 0/9] Apple Mac System Management Controller
Message-ID: <aB3_8QidjfNRPmOG@blossom>
References: <20250503-smc-6-15-v4-0-500b9b6546fc@svenpeter.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250503-smc-6-15-v4-0-500b9b6546fc@svenpeter.dev>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_061537_160391_CB9D581F 
X-CRM114-Status: GOOD (  30.61  )
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

Hi Sven,

Everything here looks good to me. I left a few minor comments through
out but overall nothing scary here to me :)

Cheers,
Alyssa

Le Sat, May 03, 2025 at 10:06:47AM +0000, Sven Peter via B4 Relay a écrit :
> Hi,
> 
> It's been quite a while (end of 2022) since the last version of this
> series was sent by Russel. I'd like to pick this up again and get SMC
> upstream.
> 
> I've taken the last version from the ML and worked in the review
> comments and some other changed:
> 
>   - Added documentation for all functions and structs
>   - Fixed dt-bindings and re-ordered commits so that the mfd one comes
>     last and can include the gpio subdevice
>   - Added the reset driver and corresponding bindings
>   - Reworked the atomic mode inside SMC since the previous implementation
>     called mutex_lock from atomic context
>   - Removed the backend split for now which lead to a quite intense discussion
>     for the previous versions which hadn't been solved as far as I could tell
>     from the old threads.
>     It's also been 2+ years and I haven't heard of any backend implementation
>     for T2 or even older macs. It's also unclear to me which sub-devices
>     are actually useful there because at least GPIO and shutdown/reboot
>     from this series will not work as-is there.
>     I'd rather have this initial version which only supports M1+ macs upstream
>     and then iterate there if any other backend is developed.
>     I'll gladly help to re-introduce backend support if it's ever required.
> 
> Dependencies:
> The code and dt-bindings themselves apply cleanly to 6.15-rc1 but
> the device tree changes require the already merged SPMI controller
> and SPMI NVMEM series which will be part of 6.16.
> The series is also using the printf format specifiers which will
> land in 6.16 via the drm-misc tree.
> A tree with all dependencies for testing is available at
> https://github.com/AsahiLinux/linux/commits/sven/smc-v4/.
> 
> Merging:
> The dt-binding patches all depend on each other such that they all
> should probably go together with the mfd device itself.
> The following commits also depend on mfd due to the new header file and
> will either have to go through the mfd tree as well or we'll need an
> immutable branch there.
> I'll take the device tree updates through our tree which also has the
> previous device tree updates these depend on.
> 
> v3: https://lore.kernel.org/asahi/Y2qEpgIdpRTzTQbN@shell.armlinux.org.uk/
> v2: https://lore.kernel.org/asahi/YxdInl2qzQWM+3bs@shell.armlinux.org.uk/
> v1: https://lore.kernel.org/asahi/YxC5eZjGgd8xguDr@shell.armlinux.org.uk/
> 
> Best,
> 
> Sven
> 
> ---
> Hector Martin (5):
>       gpio: Add new gpio-macsmc driver for Apple Macs
>       power: reset: macsmc-reboot: Add driver for rebooting via Apple SMC
>       arm64: dts: apple: t8103: Add SMC node
>       arm64: dts: apple: t8112: Add SMC node
>       arm64: dts: apple: t600x: Add SMC node
> 
> Russell King (Oracle) (2):
>       dt-bindings: gpio: Add Apple Mac SMC GPIO block
>       dt-bindings: mfd: Add Apple Mac System Management Controller
> 
> Sven Peter (2):
>       dt-bindings: power: reboot: Add Apple Mac SMC Reboot Controller
>       mfd: Add Apple Silicon System Management Controller
> 
>  .../devicetree/bindings/gpio/apple,smc-gpio.yaml   |  37 ++
>  .../devicetree/bindings/mfd/apple,smc.yaml         |  71 +++
>  .../bindings/power/reset/apple,smc-reboot.yaml     |  52 ++
>  MAINTAINERS                                        |   7 +
>  arch/arm64/boot/dts/apple/t600x-die0.dtsi          |  35 ++
>  arch/arm64/boot/dts/apple/t8103.dtsi               |  35 ++
>  arch/arm64/boot/dts/apple/t8112.dtsi               |  35 ++
>  drivers/gpio/Kconfig                               |  10 +
>  drivers/gpio/Makefile                              |   1 +
>  drivers/gpio/gpio-macsmc.c                         | 246 ++++++++
>  drivers/mfd/Kconfig                                |  15 +
>  drivers/mfd/Makefile                               |   1 +
>  drivers/mfd/macsmc.c                               | 657 +++++++++++++++++++++
>  drivers/power/reset/Kconfig                        |  11 +
>  drivers/power/reset/Makefile                       |   1 +
>  drivers/power/reset/macsmc-reboot.c                | 362 ++++++++++++
>  include/linux/mfd/macsmc.h                         | 337 +++++++++++
>  17 files changed, 1913 insertions(+)
> ---
> base-commit: 8b7e6734e2231a549a23943678ee3452bd19a1fe
> change-id: 20250304-smc-6-15-f0ed619e31d4
> 
> Best regards,
> -- 
> Sven Peter <sven@svenpeter.dev>
> 
> 

