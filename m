Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF594C021B5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 01:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yhpklwBnBdF83FBre0/tkR3DVtuVLWezPApNRpdK4qw=; b=UydFRxWIzB2AAIvJ4dyFfj+G5C
	dHlAOhJHLDHtrSUrxpb643L7HcNJafF8cxsTB0gWGSDzcYFA2FGf+wnXjpTDhq05Zil3Tc1o5PzWY
	t2/yg6cKuZojxiDHrvamZ+2D78TWQgfIHOgtMoN7TzOU8+1ulLSJuDXZ26eEaiJA8Ygt4Y31mFX7I
	O6AKQEF/hoNzZGhQREOsD7zN15PUIrhrnBYjXU0aRtFLsWfOtOAKyOT6A/3aZ4hpB7iWOWtu3eH2W
	MDFxfqde7pkQl5s/n4Rzz6gJhtg77somea15T0iktcmqP44MILTl2LidaQSI0H8uZaQDIQcjy0bwZ
	ISysUL7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tleGZ-00000007Hpm-3d0U;
	Sat, 22 Feb 2025 01:25:15 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tleF6-00000007HjQ-0n2h;
	Sat, 22 Feb 2025 01:23:45 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-38f31f7731fso1340513f8f.0;
        Fri, 21 Feb 2025 17:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740187422; x=1740792222; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yhpklwBnBdF83FBre0/tkR3DVtuVLWezPApNRpdK4qw=;
        b=QiXAgX5ZuT2yPL1K2eMcz65/cifrgaFmQeS9r7CpMANlq2CnjVd4ZcBH/M9OEMDAA+
         A9++Th4Q4evM0+LU86eLS8OWMfo5EiLZ8PgHztwhSit4FiY0AH2qOC/mOpzQIbT6dv77
         xu7HlZn+8jO68bmZOaS5fHfA6qVQ/RFRulpOfEBtMfj7mm7ltePh7rJR7w4GernezGr7
         1jdNlSGRDiAhw4rEi9tzHMCv6U/WW5U937tnqgmgJHPPaimhm6NOrFZGZA9jamXnF4p+
         yETpW0dJMCYl56ZITcLPG9I9mCdiCGAEUmFq7lnsnBnQIPyTRxENJC67df8Ww9xXWvF3
         tvlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740187422; x=1740792222;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yhpklwBnBdF83FBre0/tkR3DVtuVLWezPApNRpdK4qw=;
        b=lg/0ZmmgdWsWKv/53D1TOOVH8FWV1/FQH+Ycbg0ZhBcjkjQ93iMJx0/MUfcH6IBJRz
         M/y0S8VDFS3lrjB/pFUYmxujqtAkko0Oly6PBGJZv2BDL5p7HMPhuz6flN4lEbggpQVz
         pku2lcJ+BpuS+rg94Y6fmZ9zlkPoV5liqeeqI/hmQFh9j4HBf1jH0GoUMI5xxok6X2H4
         RDTycpTv5J/H3Z1rrHOoZK3cDCgpsg/MfM5wZ26O8CMfu/oxxk7sJgOYXEjb2nvWcMre
         8sG4hN6na2jUXlmX4whZAb/D9OQIl1pNqkCWn5kRD2gl7CN8wyJwPS+76RiMGXI29RXx
         3jlw==
X-Forwarded-Encrypted: i=1; AJvYcCUGBzZtP6uZTycCITSQ7b9oQJTVjaH2UxF+QhDOsnjTFWx7tWvuSV0MYa2rv9w9DYpCTNN8vWxT+kuH/W9sa7M0@lists.infradead.org, AJvYcCWM7mIFjcpOqmd1IjI9Q7yYI7lelkpwrPp0fKuctQHpFA04E9uWO3gFQAhSGXrYqetHCWR7PjEUwUrOWKrL0rM=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywo/qKFWY/z0JzqdPz8MGvyEYu4h/2f35+6U5XVV0qwr9sn4niL
	bTB/OP89MaLqRbltqwNVr/VkU73BAy/9zpppzdxpVJf/N3YQnj6TiRTISnlkF12165vM/i8wVB5
	4jriJT4d3GCatmM8l2lBvsUDvZWU=
X-Gm-Gg: ASbGnctcI5XKECae/s3zZcSjr7mdbtFry0jDDgdp6717sTvhN2xdV3ZU1CBRU/r3hlW
	CRqEKntnhshGC3bTu4/vnVZ2p4jPED8+yaf8yzu5DHbc3luS+Y6LlHfqu4I+cY4EEf6SONheNLN
	6Ftew8CeJ/1y0G9uOiBLdJOBbrjimx/cKgJopHVAU=
X-Google-Smtp-Source: AGHT+IG6BhZoWxIICbyhwCocwO6xXPSTdwoF7JNw6rq6Z7HpxVUaKQWpWlNOEVmxHVYRzUrHtcVK/scClbl6g5MFXm4=
X-Received: by 2002:a05:6000:1f83:b0:38f:2193:f8c2 with SMTP id
 ffacd0b85a97d-38f6e979541mr4649885f8f.31.1740187421737; Fri, 21 Feb 2025
 17:23:41 -0800 (PST)
MIME-Version: 1.0
References: <20250220041010.3801-1-honyuenkwun@gmail.com> <20250221231340.GS16911@sventech.com>
In-Reply-To: <20250221231340.GS16911@sventech.com>
From: Jimmy Hon <honyuenkwun@gmail.com>
Date: Fri, 21 Feb 2025 19:23:30 -0600
X-Gm-Features: AWEUYZmVkmKF-0YNx_3i9PYhg9DTepHiFBL2v1CGPi2zlflcOJAt316mjfq3NKU
Message-ID: <CALWfF7KW8_vAx49nNygKpLHNJQVpjvVdVpzYiTAWgQvSopHikw@mail.gmail.com>
Subject: Re: [PATCH UNTESTED v5 0/4] Orange Pi 5 Ultra
To: Johannes Erdfelt <johannes@erdfelt.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_172344_234203_D9A477A4 
X-CRM114-Status: GOOD (  20.14  )
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

On Fri, Feb 21, 2025 at 5:13=E2=80=AFPM Johannes Erdfelt <johannes@erdfelt.=
com> wrote:
>
> On Wed, Feb 19, 2025, Jimmy Hon <honyuenkwun@gmail.com> wrote:
> > This patchset is looking for testers. I do not have the hardware to tes=
t.
>
> I do have hardware and I gave your branch[1] a test.
Thanks for the test results

>
> The following things tested successfully for me:
> - Kernel boots
> - Ethernet
> - SPI NOR
> - Micro SD card
> - eMMC
> - Bottom M.2 M-key slot (using an NVME drive)
> - USB 2.0 ports
> - Blue LED (using heartbeat trigger at least)
>
> I did not test:
> - RTC
> - UART
> - HDMI1
> - HDMI IN
> - Analog audio
> - Mali GPU
> - Heat sink fan
>
> However, neither of the USB 3.0 ports work. There are no XHCI messages
> during boot. I confirmed my kernel config does build XHCI. I haven't
> ruled out a mistake on my end yet.
Does your kernel config have CONFIG_PHY_ROCKCHIP_USBDP?
Both USB 3 ports on the Max/Ultra ports are wired to the usbdp
controller and not combphy2_psu controller.
It'll be set if you're using the arm64 defconfig.

On my Orange Pi 5 Max, dmesg | grep xhci will show (e.g. io mem)
[    0.769699] xhci-hcd xhci-hcd.4.auto: xHCI Host Controller
[    0.769919] xhci-hcd xhci-hcd.4.auto: new USB bus registered,
assigned bus number 1
[    0.770062] xhci-hcd xhci-hcd.4.auto: hcc params 0x0220fe64 hci
version 0x110 quirks 0x0000808002000010
[    0.770119] xhci-hcd xhci-hcd.4.auto: irq 89, io mem 0xfc000000
[    0.770351] xhci-hcd xhci-hcd.4.auto: xHCI Host Controller
[    0.770585] xhci-hcd xhci-hcd.4.auto: new USB bus registered,
assigned bus number 2
[    0.770602] xhci-hcd xhci-hcd.4.auto: Host supports USB 3.0 SuperSpeed
[    0.770837] usb usb1: Manufacturer: Linux 6.14.0-rc1-2-rockchip-ARCH xhc=
i-hcd
[    0.770844] usb usb1: SerialNumber: xhci-hcd.4.auto
[    0.772069] usb usb2: Manufacturer: Linux 6.14.0-rc1-2-rockchip-ARCH xhc=
i-hcd
[    0.772076] usb usb2: SerialNumber: xhci-hcd.4.auto
[    0.792369] xhci-hcd xhci-hcd.5.auto: xHCI Host Controller
[    0.792640] xhci-hcd xhci-hcd.5.auto: new USB bus registered,
assigned bus number 3
[    0.792781] xhci-hcd xhci-hcd.5.auto: hcc params 0x0220fe64 hci
version 0x110 quirks 0x0000808002000010
[    0.792826] xhci-hcd xhci-hcd.5.auto: irq 90, io mem 0xfc400000
[    0.793058] xhci-hcd xhci-hcd.5.auto: xHCI Host Controller
[    0.793311] xhci-hcd xhci-hcd.5.auto: new USB bus registered,
assigned bus number 4
[    0.793327] xhci-hcd xhci-hcd.5.auto: Host supports USB 3.0 SuperSpeed
[    0.793530] usb usb3: Manufacturer: Linux 6.14.0-rc1-2-rockchip-ARCH xhc=
i-hcd
[    0.793537] usb usb3: SerialNumber: xhci-hcd.5.auto
[    0.794703] usb usb4: Manufacturer: Linux 6.14.0-rc1-2-rockchip-ARCH xhc=
i-hcd
[    0.794710] usb usb4: SerialNumber: xhci-hcd.5.auto

>
> Also, the green LED is constantly lit even when the trigger is set to
> none and the brightness is set to 0. This made is a bit harder to
> confirm that the blue LED was working. I haven't ruled out a mistake on
> my end for this one yet either.
Checking the schematic for the Max and the Ultra, they both use
PWM4_M0 and PWM5_M1 to control the blue and green LEDs.

Have you tried booting the vendor BSP 5.10 or 6.1 kernels? What's the
behavior on those kernels? It's using GPIO pins there, whereas we're
using PWM to be able to control brightness.

>
> I'll also see if I can give HDMI a test.
Please report your results when you do. This is one of the differences
from the Orange Pi 5 Max. The HDMI1 pinctrls does not use the default
pinctrls like other RK3588 boards (including the Orange Pi 5 Plus).

>
> JE
>
> [1] https://github.com/jimmyhon/linux/tree/integrate-6.15
>

Jimmy

