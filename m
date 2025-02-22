Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23124C021B5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 05:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iY9X8GUgAarcymLQklO62zjT4lj8QHO11p4V9XKDp+8=; b=B/4WLz2nfvygLA3edh4A0VCANl
	ZmZomD5VnX1RklgpMklVFArc3qU6xMSjZI3UvL0qKaA8wQ6mTEPmx1JI44RNRGEITpY5oUe9mlQ0S
	0ZPROkn1QbQZ/s6Le9kUrn3xHJ4v8QLlm1R+OP85zdtq7EZzzJXSt+cGhVwucL6wM65sP8VUpNcvH
	0TZ6KHDzlKfOB0AQa0fGnenj8QAcDcHwf0w9ABz9Mr8ana3+iVweYtygK099F43y6wcMIi9fexMLN
	ty0/RQ9dJ8pAFrYFAJxX0n8CHhOHHVsrgt8f84XWYD2M3eEnHTwadzNPHzzXxYMnHcEoK8THVBuoA
	8Y43lVbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tli7B-00000007U8G-0zqM;
	Sat, 22 Feb 2025 05:31:49 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tli5h-00000007U3F-2nVL;
	Sat, 22 Feb 2025 05:30:19 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-38f265c6cb0so1423391f8f.2;
        Fri, 21 Feb 2025 21:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740202216; x=1740807016; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iY9X8GUgAarcymLQklO62zjT4lj8QHO11p4V9XKDp+8=;
        b=fAY8QimV4PLIKaRAII7lD9MRapHcwwqDRZwCp3a88vdX48WODKgqi/fYpDOEzUAwZ5
         uX7gbkV8JuFh2qfuw/sjnYlqPEGsG633eH9Yq59+LT4sO2fzz0ft9NKWObzYwUCv8tBy
         RTvtM4zJCY81ku3+RyHfee17qJvhmCya3fM2MYW4GzNLrm19I+bJoyXu+9LpJC+uhaLD
         mBn64huDSBpygkHltTqr62F51Djdg4GDwth4g7GQ2D8/l7xniyf4OJRpLWt8HNObdcVd
         yM6mo2+PmmO11+bu+w73wYIpzwAI/hY7POz4CZYXo0ehWrv6LA/XIVSAcdlLa6dKgRNa
         ifxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740202216; x=1740807016;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iY9X8GUgAarcymLQklO62zjT4lj8QHO11p4V9XKDp+8=;
        b=nZRvgs1tXSvS4BFxxw6HwO6PxXpGiLOc2QWO3WsPoaEPjvU7PmVhYaAuM+UxS3cFS8
         2Bs08M9vxqHDO/sowdL/UFi0HN3tMZUvSZ9u5dhwcMbtWfzExRMXc7OHCXBhuPJj62Nu
         MAvfrvOGxt8k7Nis2P+Dmq5alTFxBPZHjKY55/Fg0LT90wmbbm4ObTh03Cf6NPeT6F5Z
         NsGHxB6kDb8CIRyjdpJYt5o0oW32ItX959G5VbSOyZWcnKZKv2Yh3ACrfjQpptNxIdN5
         offuJuDfJ/+W+4FVVxGGa7Ngw2OpGXqPO9B04BHyefXAcgbpDYLn+QpC55p7Fj8irpTD
         gVKA==
X-Forwarded-Encrypted: i=1; AJvYcCUxXShkQt392FCWmtXUazBdLR28r+s1F7xpSDEduRKDaB/6TvVaMuG4MgMD8Yu9PRvq3f5N/zhiBGM2qjne3+bd@lists.infradead.org, AJvYcCWXbujNRmFatJjjhcIiNxBCzekGae8ng7ToyDuJKOpBBbeGaN1jt4F6ma15/2L/rGvLJwBAn3K/MJvqAArXRqE=@lists.infradead.org
X-Gm-Message-State: AOJu0YwJSMctMz0sAICkOSimLlGToQM6aKbu0OhXNvRBi7uCa2X3HCH1
	7hvTq+6I8Vi3W/znSWj07WVfERuv5ieO+9u1ECt+Dd2dZrqWAZZrNttjYG5ECMU7+MPslqz7M40
	aU8PsD97VCyh8WRfizudY4ni7I4Y=
X-Gm-Gg: ASbGncujVPF6btTddB7VtJmMp2DD0thg9fuoCRJZkNRbyTyx634LFgx6D3wVbxksXjr
	aaMJVxj6fMHDSef9d12oGNouw8Gn1My65MGXOSJZcJth5sWYp+be3klfhExsZbFJX7CT+pBJJaz
	gpiSO3YnKXEij3eHBoEmD9MzrDux8SX0z9jEwJ4fE=
X-Google-Smtp-Source: AGHT+IFeammiil5a9/1noeru+vi9TIuhuA9Es3u+CYHbT+oSSUHqUhnPVFbUi/71Tubxqhu8oNgM/z1QU2UQ5xLfYG0=
X-Received: by 2002:a05:6000:1a87:b0:38f:3344:361e with SMTP id
 ffacd0b85a97d-38f7079ec17mr4703850f8f.23.1740202215997; Fri, 21 Feb 2025
 21:30:15 -0800 (PST)
MIME-Version: 1.0
References: <20250220041010.3801-1-honyuenkwun@gmail.com> <20250221231340.GS16911@sventech.com>
 <CALWfF7KW8_vAx49nNygKpLHNJQVpjvVdVpzYiTAWgQvSopHikw@mail.gmail.com> <20250222043138.GT16911@sventech.com>
In-Reply-To: <20250222043138.GT16911@sventech.com>
From: Jimmy Hon <honyuenkwun@gmail.com>
Date: Fri, 21 Feb 2025 23:30:05 -0600
X-Gm-Features: AWEUYZkvqmomvYYIvOfXxjg1nDhP9wZ1v_lMYrm-8oH8rdZjoXBX0pnZPrVaYz4
Message-ID: <CALWfF7+uXEh0=VhnqE+dgDww8etuOBKmXUsPcnDNCUW8KKn1jw@mail.gmail.com>
Subject: Re: [PATCH UNTESTED v5 0/4] Orange Pi 5 Ultra
To: Johannes Erdfelt <johannes@erdfelt.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_213017_725959_B608DCAB 
X-CRM114-Status: GOOD (  22.72  )
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

> > > Also, the green LED is constantly lit even when the trigger is set to
> > > none and the brightness is set to 0. This made is a bit harder to
> > > confirm that the blue LED was working. I haven't ruled out a mistake on
> > > my end for this one yet either.
> >
> > Checking the schematic for the Max and the Ultra, they both use
> > PWM4_M0 and PWM5_M1 to control the blue and green LEDs.
>
> Some brief testing makes it seem like the LEDs are inverted.
>
> If I set the trigger for each LED to "default-on", then they turn off.
> If both are set to "default-on", then only the red LED is lit.
>
> Also, "heartbeat" appears to be inverted.
>
> I tried a new DT with this patch and it appears to work correctly on the
> Ultra I have. However, it raises the question why the Max behaves
> differently from the Ultra.
>
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-compact.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-compact.dtsi
> index 87090cb98020..ed51a4763318 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-compact.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-compact.dtsi
> @@ -4,6 +4,7 @@
>
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/pinctrl/rockchip.h>
> +#include <dt-bindings/pwm/pwm.h>
>  #include "rk3588-orangepi-5.dtsi"
>
>  / {
> @@ -62,13 +63,13 @@ &hym8563 {
>
>  &led_blue_pwm {
>         /* PWM_LED1 */
> -       pwms = <&pwm4 0 25000 0>;
> +       pwms = <&pwm4 0 25000 PWM_POLARITY_INVERTED>;
Oh, there is a difference in the vendor BSP. The Max has
GPIO_ACTIVE_HIGH while the Ultra uses GPIO_ACTIVE_LOW.
https://github.com/orangepi-xunlong/linux-orangepi/blob/orange-pi-6.1-rk35xx/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dts#L401
https://github.com/orangepi-xunlong/linux-orangepi/blob/orange-pi-6.1-rk35xx/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dts#L416

On the schematic, the 5 Plus and the 5 Max have 2SK3018s on the LED,
but the 5 Ultra does not have it.

I will separate them out in v2.

Thanks for debugging it.

>         status = "okay";
>  };
>
>  &led_green_pwm {
>         /* PWM_LED2 */
> -       pwms = <&pwm5 0 25000 0>;
> +       pwms = <&pwm5 0 25000 PWM_POLARITY_INVERTED>;
>  };
>
>  /* phy2 */
>
> JE
>

Jimmy

