Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4B8FC678DA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 22:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DmTWmU9NEikrwp3F1QNeTNdfTomvenelOaCl9Z9m7F8=; b=p2pBhOmHnLOqx2wZ4WvGeonqPs
	wJxdUVUzmgCChWkc4G5J0Bowz2ytAfr/9Eq/46tfpytmFd4PJncGSrnEdQJH7cfdWnygsYt785gfY
	fUnKe3RLE0psYITkRcC7qwV0aX345C67rOMqy9mpJJOOSEP5jW/Ew+4qOmJh/rt8aYlpmr0BSnPUj
	GWsUoXwppokj+pzUkVfTGSi6I4ja9ir7Vm3grvRe8WunfgeebD0UsPYiludvIUMEW6thTE+eCwhJr
	ThQSQSY/9GvRo/BNVcK1+Kwr4rK5f31XBnuxsCqu2X3Mt1/B3CY8EgjlNSQYYFA72ZXwtWR5nZWcp
	81kI+Z9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP7oB-00000008Jtu-3lag;
	Tue, 10 Jun 2025 22:51:07 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP76J-00000008B4W-3V8Z;
	Tue, 10 Jun 2025 22:05:49 +0000
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-4a52d82adcaso88633781cf.0;
        Tue, 10 Jun 2025 15:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749593144; x=1750197944; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DmTWmU9NEikrwp3F1QNeTNdfTomvenelOaCl9Z9m7F8=;
        b=iAR04mJ3uJdOhpnz/2WLB+fvbOmb0X+tipY1ClKfl8U7N4tQ7cNceILUMjtFU46xYI
         3CRwiX6h82ZDys5Ot4jPegrRxuJFPcWTEcpmxki5EfpqhlxWD/K6LnnUth0U7o8dXpUF
         x9Xed7tgV7wCn7d2tYrAzKFb9T08JoJ4Sf5Kt9FS/VDje01VphdHnH5Xc7W1BFAYVf5R
         IQOuD4cD0d3oUBsgt6Z94C3h1Pb7eJ2KYLQE5gKv5G5m1cO4fm4XlTcufvW4Suj6FHko
         B9CNEanKhzFxj0i9TgRVHc0LQ+duNIjZ33IK75PB3qrCwRaAfAc040eASl+3UoV7d3eo
         ToFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749593144; x=1750197944;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DmTWmU9NEikrwp3F1QNeTNdfTomvenelOaCl9Z9m7F8=;
        b=jLw6qrEy+sjmm9W/01QAeqxE49AReqRR6vH6mbw1X13oWVjQ/TkqtBcFzNRRcnMKiI
         l9OVdG9FJHlFQhUzZTfd0UBdFbIKdF0CBWySPH98SsBuisWif4xkNFbVnhghBFGt5yjq
         1PxswXGs1IDCsMnMmVK8vy02qBv0XGLFwQoOOfPA+R5gUnhEyJUe3jUivTWZExuVl63q
         nCzo4mNJUelrjBMJVJ7PFxHQDBUE9vY0oizpYrXROiuL13SOs2ZlFWPQslsai+vmxSq9
         CCzW67oQIEfhNLjUn9HHf+6RpU0IcDhQG4XLb/yeLKnPqZqzp0Uun8HeX7pY9aFhLPqx
         dX1A==
X-Forwarded-Encrypted: i=1; AJvYcCUDxHBKGYjoLOE+0oXN3VRftJcOf7I1vxJUBDTbL5tqXXP28mZGEnBj/5rtv9x1vu5Q84m/yW66t2gAa/o=@lists.infradead.org, AJvYcCV1z04PElQAkdDjKshAOoG7TeQ6wzLdwu1U/OoyEyTYRrST8uP0ulzwvccCcehaiA5ymkxMfozb/hAuRZuF4m+1@lists.infradead.org
X-Gm-Message-State: AOJu0Yzi/LlYV0hNqUGwv6PyoANal7ZWExZhLhaftzlV5qUW+Guswecv
	PuhhObs0PNQtjtPBzgyB7Jtd1OigqmTLIKI2vjMmit/3cbkpENKQks6P
X-Gm-Gg: ASbGncs1ok9hByT2MTU6BFwjm8j2dUH9AExbvIIP5SWQFyuXeshwtX7ZhD7KQ/Uquzl
	fgJ7g1jDhlhMU7WAfnJMve0/kX9HjIjwR/jq/hZ6qpIaCxqqfOAWaE40toWlBBxLSmU5h0OOGui
	0OIWTqYy9+XMVFRWaLQxVjhjfO0eJl836t78HOgru7NTHwmtghSwwDqZvw6WIVQjgW6lIrdvEPY
	CguV6QCpZtlV7ygEk9RfG9r04vvTKrSMNOKXjNnEFssk1XfgR6pxiASEDXw6N8a71O7xt30KnTW
	fSrN/o2foCfoPfYbKS9RfHKQYhLQP7/XSNFt5fzmESJjxUtx
X-Google-Smtp-Source: AGHT+IEDJpOYkGfTUyYs1FXlXzDYqJOyu0jNJBu7zkL7VpiJWuUnOT+hGZ2ALGAVCMSkNmIUlRsQhQ==
X-Received: by 2002:a05:622a:558e:b0:476:8f75:b885 with SMTP id d75a77b69052e-4a713c45603mr18755041cf.44.1749593144531;
        Tue, 10 Jun 2025 15:05:44 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4a619853048sm79911851cf.47.2025.06.10.15.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 15:05:44 -0700 (PDT)
Date: Wed, 11 Jun 2025 06:04:37 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	sophgo@lists.linux.dev, soc@lists.linux.dev
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Jisheng Zhang <jszhang@kernel.org>, Haylen Chu <heylenay@outlook.com>, 
	Chao Wei <chao.wei@sophgo.com>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 3/6] arm64: dts: sophgo: Add Duo Module 01
Message-ID: <h3vnwdlmzdjdm2nfpg3rvbck22pgvpweqphuwy67a5ny2wkhen@d2vmojc23pli>
References: <20250610201241.730983-1-alexander.sverdlin@gmail.com>
 <20250610201241.730983-4-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610201241.730983-4-alexander.sverdlin@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_150547_871766_D7BF856F 
X-CRM114-Status: GOOD (  16.36  )
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

On Tue, Jun 10, 2025 at 10:12:16PM +0200, Alexander Sverdlin wrote:
> The Duo Module 01 is a compact module with integrated SG2000,
> WI-FI6/BTDM5.4, and eMMC.
> Add only support for UART and SDHCI.
> 
> Reviewed-by: Inochi Amaoto <inochiama@gmail.com>
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> ---
>  .../sophgo/sg2000-milkv-duo-module-01.dtsi    | 85 +++++++++++++++++++
>  1 file changed, 85 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01.dtsi
> 
> diff --git a/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01.dtsi b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01.dtsi
> new file mode 100644
> index 000000000000..bb52cdad990a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01.dtsi
> @@ -0,0 +1,85 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +
> +#include <dt-bindings/pinctrl/pinctrl-sg2000.h>
> +#include "sg2000.dtsi"
> +
> +/ {
> +	model = "Milk-V Duo Module 01";
> +	compatible = "milkv,duo-module-01", "sophgo,sg2000";
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

> +&pinctrl {
> +	sdhci0_cfg: sdhci0-cfg {
> +		sdhci0-cd-pins {
> +			pinmux = <PINMUX(PIN_SD0_CD, 0)>;
> +			bias-pull-up;
> +			drive-strength-microamp = <10800>;
> +			power-source = <3300>;
> +		};
> +
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
> +	};
> +
> +	uart0_cfg: uart0-cfg {
> +		uart0-pins {
> +			pinmux = <PINMUX(PIN_UART0_TX, 0)>,
> +				 <PINMUX(PIN_UART0_RX, 0)>;
> +			bias-pull-up;
> +			drive-strength-microamp = <10800>;
> +			power-source = <3300>;
> +		};
> +	};
> +};

Please move this slice to the board dts, only configuration related to
the module itself can be left in this dtsi file.

Regards,
Inochi

