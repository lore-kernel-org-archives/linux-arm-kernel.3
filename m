Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11382C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 05:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o5akprXzWeq2raV9J15rlbOJ4MBBYAkz6WZ7uy1VgM4=; b=aQzHZBGOFlbaNHFn4tlWe0A/Ij
	DEag33JVxEQC9Ra2USUhfYRvp2lS8P5wq8dIYqfs/2l8YB0HBhJdIgCYSHS0E7+b6pdS18xPK+Oj/
	FvZUHZtp/KIjBVU/We5u0qOrIGs9GFqUh57CwwZtEmBmUMgKwPKKMdsMVxibOyF08PPEezZT2CsqF
	SunjsWT/kR3W0b4t/TYiqk7plKvtBt100x1plU29WPXaxIy1TpeC8eeegXy8TYCznFisvb4ce3AP9
	phMPOIhXyGp93ZOgx0S9AeGMFV47R5G2zcffwVVbmimcuUUOxo2qXLYYvIsEALY51eRzFeuFTldCz
	d+MxZIMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thMME-0000000GHBh-0oA6;
	Mon, 10 Feb 2025 05:29:22 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thMKK-0000000GGo6-0pJr;
	Mon, 10 Feb 2025 05:27:25 +0000
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-6e440e64249so43816736d6.3;
        Sun, 09 Feb 2025 21:27:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739165243; x=1739770043; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o5akprXzWeq2raV9J15rlbOJ4MBBYAkz6WZ7uy1VgM4=;
        b=GAHwBfvP9yqTH3gjB8U8SJE30q4GorCXGPH7Yle+XKg5Yhr4txPidFvxnunXU72h8B
         ILFguEAvBit0J2QXhCBcNuNV287Feftl19srSJmLvNvqVzBA0oCHWMZusIHQkDCA+Pec
         C/VTdNnz+Ss7rg7Wm1A4B2OrVDu0RkxulQstjZMl76/B20u7rbKDKK+u/EbhkDJC+qME
         Y9DWz0jv/acSMCC2rjZhlztJ/5m8hKzP+YpH0CxbFBGJm2EbrLEU6jtHSBc6P8zQ12p/
         +z/bAc/NDNGJqMoS2sfE7ld4MKj4VCjUR6AlUTlt/Fl80CqFioBFjaaRVm3jcWo6RtyU
         1+1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739165243; x=1739770043;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o5akprXzWeq2raV9J15rlbOJ4MBBYAkz6WZ7uy1VgM4=;
        b=EBtS90vgdRWpVUlR1HzMLWZm57p9wjBMYm9zNCZo+9o6ZU7tX8xSCbyfGzAcTNG5Vw
         3WBUh4BQMAL120BGnUHGmezNFcPxDqvW/BwcfmXTmi1AyC6msQ8potxThWWpLXpBYw4q
         G2fhhrxT23TOu57q6hugwM1ZrAA+sVbQVy34RYETyfXVC/jwgDF6LEXs0i7rrfq1WzRW
         Y3A/DdDUR1JkpY9PC8FTp7U7EuoiS/sN8NbPEWSE0jKALkagClAFDcnVVRWLrtMrEmte
         sl9MLMArjX+EsupGoQY/A+W1t8mb3iFfQ3PEbqc+A/jNyolk3UGYJsgqWAyn/ya5T0jP
         tEbA==
X-Forwarded-Encrypted: i=1; AJvYcCVSkpdXeErrUiIJoAn+7xWI8KBw44aYpNvTzvGTqYeTXurCARaU7DjRUccN9kbJoJtY3wrwAW8KlbFEkZU=@lists.infradead.org, AJvYcCWEIUjU4ARXL1dUvfZtw2KgftSux1auz60GcfD36hUd43h8KbFRCYK59XGOLY1FBD5vOzk9yG0ohuUsAbK+9WHS@lists.infradead.org
X-Gm-Message-State: AOJu0YxGXW1UGegX8wi5nwU6llNzdI7cU5iVJZ5+C4SCehoRn4EtF+Fd
	SoT0G9S2JaNYNTJ4qwNv2eX60H6zn4QjjosDcwYcWjhI977UXX6J
X-Gm-Gg: ASbGnct8zwOlepL4a7vg5CTCL3TMEErRUYQTjPJOBoizsAjDslUIHUUBORZLldfhI6x
	kVwsT8LT+Z1m+43RhfK0hA3G/6vC9YnSUXd7Mdc/XIS0TPLu2kaK3Fi4j4zh8cw6rEoEvqE5gQ0
	UWLeo/d6eGyqmxpTm3EcxjTAmCyArgyV8H5JOUVXv987xVxQtnqPNP7Vn3VXRWE2tLJ8924kIY8
	E1DxmDXcORbZn7ATOh264wx8Mleh9OOC2wsKPvlK/bLPdxDzlyxTA5IPJsEH56xb8E=
X-Google-Smtp-Source: AGHT+IE+4sZLu/ZxMSYESF6iMKxthKb6gyHQ9A7BzIRccL53896Gfbs6sUnMwwUwzuOES/UrXfTjtg==
X-Received: by 2002:a05:6214:1bcc:b0:6e4:4164:8bb2 with SMTP id 6a1803df08f44-6e4456d242bmr180675586d6.29.1739165243086;
        Sun, 09 Feb 2025 21:27:23 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6e4437ddc85sm36220296d6.87.2025.02.09.21.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 21:27:22 -0800 (PST)
Date: Mon, 10 Feb 2025 13:27:17 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>, soc@lists.linux.dev
Cc: Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@outlook.com>, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	Haylen Chu <heylenay@outlook.com>, linux-arm-kernel@lists.infradead.org, 
	Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Inochi Amaoto <inochiama@gmail.com>
Subject: Re: [PATCH 04/10] arm64: dts: sophgo: Add Duo Module 01
Message-ID: <pwf6xgylo5fd7j5akkuau2v6p7r4print4fxekkwmxqtumjifk@hoqbsiwedwhz>
References: <20250209220646.1090868-1-alexander.sverdlin@gmail.com>
 <20250209220646.1090868-5-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250209220646.1090868-5-alexander.sverdlin@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_212724_236007_84B295EE 
X-CRM114-Status: GOOD (  16.56  )
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

On Sun, Feb 09, 2025 at 11:06:29PM +0100, Alexander Sverdlin wrote:
> The Duo Module 01 is a compact module with integrated SG2000,
> WI-FI6/BTDM5.4, and eMMC.
> Add only support for UART and SDHCI.
> 
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> ---
>  .../sophgo/sg2000_milkv_duo_module_01.dtsi    | 84 +++++++++++++++++++
>  1 file changed, 84 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/sophgo/sg2000_milkv_duo_module_01.dtsi
> 
> diff --git a/arch/arm64/boot/dts/sophgo/sg2000_milkv_duo_module_01.dtsi b/arch/arm64/boot/dts/sophgo/sg2000_milkv_duo_module_01.dtsi
> new file mode 100644
> index 000000000000..7edcc4d03cc4
> --- /dev/null
> +++ b/arch/arm64/boot/dts/sophgo/sg2000_milkv_duo_module_01.dtsi
> @@ -0,0 +1,84 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +
> +#include <dt-bindings/pinctrl/pinctrl-sg2000.h>
> +#include "sg2000.dtsi"
> +
> +/ {
> +	model = "Milk-V Duo Module 01";
> +
> +	aliases {
> +		serial0 = &uart0;
> +		serial1 = &uart1;
> +		serial2 = &uart2;
> +		serial3 = &uart3;
> +		serial4 = &uart4;
> +	};
> +};
> +
> +&osc {
> +	clock-frequency = <25000000>;
> +};
> +
> +&emmc {

> +	/delete-property/ status;

Override it with status = "okay";
This suggestion applies to all you dts patch.

> +	bus-width = <4>;
> +	no-1-8-v;
> +	cap-mmc-hw-reset;
> +	no-sd;
> +	no-sdio;
> +	non-removable;
> +};
> +
> +/* Wi-Fi */
> +&sdhci1 {
> +	bus-width = <4>;
> +	cap-sdio-irq;
> +	no-mmc;
> +	no-sd;
> +	non-removable;
> +};
> +
> +&pinctrl {
> +	uart0_cfg: uart0-cfg {
> +		uart0-pins {
> +			pinmux = <PINMUX(PIN_UART0_TX, 0)>,
> +				 <PINMUX(PIN_UART0_RX, 0)>;
> +			bias-pull-up;
> +			drive-strength-microamp = <10800>;
> +			power-source = <3300>;
> +		};
> +	};
> +
> +	sdhci0_cfg: sdhci0-cfg {
> +		sdhci0-clk-pins {
> +			pinmux = <PINMUX(PIN_SD0_CLK, 0)>;
> +			bias-pull-up;
> +			drive-strength-microamp = <16100>;
> +			power-source = <3300>;
> +		};
> +
> +		sdhci0-cmd-pins {
> +			pinmux = <PINMUX(PIN_SD0_CMD, 0)>;
> +			bias-pull-up;
> +			drive-strength-microamp = <10800>;
> +			power-source = <3300>;
> +		};
> +
> +		sdhci0-data-pins {
> +			pinmux = <PINMUX(PIN_SD0_D0, 0)>,
> +				 <PINMUX(PIN_SD0_D1, 0)>,
> +				 <PINMUX(PIN_SD0_D2, 0)>,
> +				 <PINMUX(PIN_SD0_D3, 0)>;
> +			bias-pull-up;
> +			drive-strength-microamp = <10800>;
> +			power-source = <3300>;
> +		};
> +
> +		sdhci0-cd-pins {
> +			pinmux = <PINMUX(PIN_SD0_CD, 0)>;
> +			bias-pull-up;
> +			drive-strength-microamp = <10800>;
> +			power-source = <3300>;
> +		};
> +	};
> +};
> -- 
> 2.48.1
> 

