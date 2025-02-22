Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72186C021B5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 04:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JVPXaGswn6h9CQME9YRi+phZaOE/13SLpDLogchJANM=; b=JynJngnqeuq5BnZEfJZ+I/X5ec
	YLYb7RHGKKdT8Jkyot9GUE5uR147I6SukCB0q7cGMfcuvUvrr5FEdX37+Y/A+GnKqMt09XXyKoY7e
	5ZoO6nfX4/f7QxQM85zyOHluXkN8OgROyFSdMMZsidilyRUXGpjcvQzgEpICHBwrOODvFXhwSytTC
	31YVuGz0xi1jhXpghVB0AL6u37kETM1CqUN6zhwSazjMl3jBLiOMn7DGMozHThISadvCPGX7gg7R/
	CRj/HMyvdmEFmThtYM1al0/DKXrHVbbmSAaix4vFH0fpQcNB9C5PsDzq+Z0zfP2PmPP0pPQ7eVnML
	grz60H5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlhHI-00000007RsC-1c8s;
	Sat, 22 Feb 2025 04:38:12 +0000
Received: from out.bound.email ([141.193.244.10])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlhFp-00000007RkB-1e9n;
	Sat, 22 Feb 2025 04:36:42 +0000
Received: from mail.sventech.com (localhost [127.0.0.1])
	by out.bound.email (Postfix) with ESMTP id 6B4318A0A03;
	Fri, 21 Feb 2025 20:31:38 -0800 (PST)
Received: by mail.sventech.com (Postfix, from userid 1000)
	id 53B7B160036F; Fri, 21 Feb 2025 20:31:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=erdfelt.com;
	s=default; t=1740198698;
	bh=JVPXaGswn6h9CQME9YRi+phZaOE/13SLpDLogchJANM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E/dlZ6D1Arf0WodgxXqPt7bEWnIj0uZOjyg5MC8RpBmWOdzP+vhBPGysfC826Lk6c
	 CR/F3LJo6ghe6xix0waGz2pVBrcmgBBZ4ZCLo7r7o4PGUvANoq5eX+UhShO0yp9HzY
	 10uZfly67E3E8fptEz2mMXBCggsZshbeEPq9JA50=
Date: Fri, 21 Feb 2025 20:31:38 -0800
From: Johannes Erdfelt <johannes@erdfelt.com>
To: Jimmy Hon <honyuenkwun@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH UNTESTED v5 0/4] Orange Pi 5 Ultra
Message-ID: <20250222043138.GT16911@sventech.com>
References: <20250220041010.3801-1-honyuenkwun@gmail.com>
 <20250221231340.GS16911@sventech.com>
 <CALWfF7KW8_vAx49nNygKpLHNJQVpjvVdVpzYiTAWgQvSopHikw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALWfF7KW8_vAx49nNygKpLHNJQVpjvVdVpzYiTAWgQvSopHikw@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_203641_553856_DBE42E88 
X-CRM114-Status: GOOD (  23.04  )
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

On Fri, Feb 21, 2025, Jimmy Hon <honyuenkwun@gmail.com> wrote:
> On Fri, Feb 21, 2025 at 5:13 PM Johannes Erdfelt <johannes@erdfelt.com> wrote:
> > However, neither of the USB 3.0 ports work. There are no XHCI messages
> > during boot. I confirmed my kernel config does build XHCI. I haven't
> > ruled out a mistake on my end yet.
> 
> Does your kernel config have CONFIG_PHY_ROCKCHIP_USBDP?
> Both USB 3 ports on the Max/Ultra ports are wired to the usbdp
> controller and not combphy2_psu controller.
> It'll be set if you're using the arm64 defconfig.

Yeah, we came to the same conclusion. I noticed this was disabled in my
config when I was looking for potential mistakes I may have made.

Enabling it fixes the USB 3.0 port problem.

> > Also, the green LED is constantly lit even when the trigger is set to
> > none and the brightness is set to 0. This made is a bit harder to
> > confirm that the blue LED was working. I haven't ruled out a mistake on
> > my end for this one yet either.
> 
> Checking the schematic for the Max and the Ultra, they both use
> PWM4_M0 and PWM5_M1 to control the blue and green LEDs.

Some brief testing makes it seem like the LEDs are inverted.

If I set the trigger for each LED to "default-on", then they turn off.
If both are set to "default-on", then only the red LED is lit.

Also, "heartbeat" appears to be inverted.

I tried a new DT with this patch and it appears to work correctly on the
Ultra I have. However, it raises the question why the Max behaves
differently from the Ultra.

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-compact.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-compact.dtsi
index 87090cb98020..ed51a4763318 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-compact.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-compact.dtsi
@@ -4,6 +4,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/pinctrl/rockchip.h>
+#include <dt-bindings/pwm/pwm.h>
 #include "rk3588-orangepi-5.dtsi"
 
 / {
@@ -62,13 +63,13 @@ &hym8563 {
 
 &led_blue_pwm {
 	/* PWM_LED1 */
-	pwms = <&pwm4 0 25000 0>;
+	pwms = <&pwm4 0 25000 PWM_POLARITY_INVERTED>;
 	status = "okay";
 };
 
 &led_green_pwm {
 	/* PWM_LED2 */
-	pwms = <&pwm5 0 25000 0>;
+	pwms = <&pwm5 0 25000 PWM_POLARITY_INVERTED>;
 };
 
 /* phy2 */

JE


