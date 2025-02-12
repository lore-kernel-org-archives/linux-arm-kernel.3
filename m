Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27E2EC02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 15:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6lBUw25J3aG4YuuDsQwkeYgRv1vrc7t3xa9HzM9MOvw=; b=2BOG8khFK2oLi2th9raraPyUf2
	yqh0U+8JMbF9IdIOKY7Tz5zX8dwLEnPxOQ7AYFOj6M2slbU76LyLgftQGSixUDX85+c54+EBl1riQ
	LdSVcZEus0HhZcBVchlLj6SDNfWkRuyxxv/llDhkQZeIN9Uj0W4anZIFJFbs4cC4xWefFk+nAIuBe
	KAXNoVo/QwtJ+du5ixmc9407e+ZUAfY5j8CFnKAnaCqCikOIxZz4RJq5iIR3W+pp+FhZQ+C4k5ehC
	RZPITSQbXEa/Mu6QRfJVaqep6W0LmwP571/WiiROsGtQ2rA6Kd/fja6cDMX9qwDQMtVTMTgnJg0nt
	jEi412lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiEfG-00000007qw0-0Q8r;
	Wed, 12 Feb 2025 15:28:38 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiEdn-00000007qaS-3rzL;
	Wed, 12 Feb 2025 15:27:09 +0000
Received: by mail-oi1-x22b.google.com with SMTP id 5614622812f47-3f3d2afce71so249708b6e.0;
        Wed, 12 Feb 2025 07:27:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739374026; x=1739978826; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6lBUw25J3aG4YuuDsQwkeYgRv1vrc7t3xa9HzM9MOvw=;
        b=N8N/EeoKu7iQt2SSqLa61sChsqVzz4XhTB5hYQVUwPxBHtwsNjHQWs3xLMOr3jSm1z
         cgHn+lvifyoYjklZcRG2Rj8uiOQ4LrrVKVF7nPVyC07+AVlt7pSHN9x3G1P+1ZIWjOq8
         /KFRI+ZPqQCpL+XoKp+Lf42ZcXzxOj+6WE3zbYDqZKCHlqkz98kudpeVRquVVYA0HwKX
         m1HVxFYeUML+UcdgwBwzNp+e72uENbPnRQGhVLMmNgGWZYCjXxhkf59bpZ8ttdYyoyx2
         UnENfk/h8AAuWdYXYVqSsmTjk9xGxIUL0kFvs54MFrdsyzHdCShthE6gHqY1NCKLP7cr
         QNgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739374026; x=1739978826;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6lBUw25J3aG4YuuDsQwkeYgRv1vrc7t3xa9HzM9MOvw=;
        b=SFN+vXiw0t87OPz3vQfwI5L03nFLwyG9OVDNDsdMXE+jToaD/RnFNjExRM8QykdG+T
         2Y3Af47Vibxx91WCvQpNpEsYAyT8XWmUJzhZyAWetpb7aTriLGuFG8gL660Ng/1vfUhw
         gQ3Kj3JNrQ7d421hPc3J2UDVcGpO25Z2BPLOR2FTIHr0MgkajCiCCdFeZK+9w75jzD8Y
         lf2f/f4CG0sIfREnVUct91z63h/srGCkC7+uBfkdaomhtMUUxFT7mFRViAGziBGfNIZI
         23n4P9eyErx6Gp7rzOwtx5NMqj5s/29xCT/tmT3SSVdFPxbxoAL++IMnkbaE02yCySkY
         zjOw==
X-Forwarded-Encrypted: i=1; AJvYcCUEOgJORZBw6DNglrBqqj/ztfVeZZVTYWIhkxCDKmSqj8S62Y5mSXD1ilip71gUQpYFM6RE4ZEfxHxh+2RFcaGL@lists.infradead.org, AJvYcCVbw2PYYdHM0+0LQpirUD/lgxhKvcT0th8J0/YvjkW018QUy+rhLYrKK7gX35QXfZSWCNLBkHlaP+rM6JI=@lists.infradead.org
X-Gm-Message-State: AOJu0YxM2nbg8QzZUfELtj/qCdKCm1JJzMr3+uNRbGsELIvHxZElN55R
	lNn/4/l8NxwRJJyPZAcWSVtaKhLKXBH6Kr/pUdYLTcWSdV3Ev/M8
X-Gm-Gg: ASbGnctGP7ibUHTO6mYX9KnescZAmct89FiCdpCuIfPBln9oPaQHZYFrtZI5i6xYwKu
	V3X07Dd3tEZF65mpvJR/WjI2SfTxnMiv7zXebwJE7PAArDrnWbhqY2nLAo+i1bGSEf16b+JWgty
	5QGxoy7hhhReCQRRBOdZxF4knoPvQ8yY+a0zsC26qVA5Hl0hHlUsEVyrP2mX7DRhuLFV0hBTYSP
	Gi9AcNeK7J/I1q3qsmcEUvN0OsP3Qi2xOAUqpQN7S4sB13BbkUScSMC6dwsgNHg1ruo7WcIUzLD
	xjecgoe6ameJFAtZui+KZg==
X-Google-Smtp-Source: AGHT+IHo4moDm0XlC/zbhfkvivNmDn6gThhjx1PDMEofy79uK89Vl0WpOwwZ4GUyPbza40pljwyLmQ==
X-Received: by 2002:a05:6808:2518:b0:3f3:bb75:1706 with SMTP id 5614622812f47-3f3cd5cbae2mr3016870b6e.9.1739374026359;
        Wed, 12 Feb 2025 07:27:06 -0800 (PST)
Received: from neuromancer. ([2600:1700:fb0:1bcf:511b:97aa:dc6:7ad4])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3f392481cbfsm4066579b6e.39.2025.02.12.07.27.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 07:27:05 -0800 (PST)
Message-ID: <67acbdc9.050a0220.11fcb1.a43a@mx.google.com>
X-Google-Original-Message-ID: <Z6y9yNpdsVUZ1Q4k@neuromancer.>
Date: Wed, 12 Feb 2025 09:27:04 -0600
From: Chris Morgan <macroalpha82@gmail.com>
To: Aleksandr Shubin <privatesub2@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cheo Fusi <fusibrandon13@gmail.com>, linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v10 0/3] Add support for Allwinner PWM on D1/T113s/R329
 SoCs
References: <20241011102751.153248-1-privatesub2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241011102751.153248-1-privatesub2@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_072707_958680_B0060A23 
X-CRM114-Status: GOOD (  20.09  )
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

On Fri, Oct 11, 2024 at 01:27:31PM +0300, Aleksandr Shubin wrote:
> v2:
>  - fix dt-bindings
>  - fix a remark in the driver
> 
> v3:
>  - fix dt-bindings
>  - fix sunxi-d1s-t113.dtsi
> 
> v4:
>  - fix a remark in the driver
> 
> v5:
>  - dropped unused varibale in the driver
>  - fix dt-bindings
> 
> v6:
>  - add apb0 clock
> 
> v7:
>  - fix a remark in the driver
>  - add maintainer
> 
> v8:
>  - fix compile driver for 6.8-rc
> 
> v9:
>  - fix a remark in the driver
>  - fix dt-bindings
>  - rename apb0 -> apb
> 
> v10:
>  - fix a remark in the driver
>  - fix compile driver for 6.12-rc2
> 
> Aleksandr Shubin (3):
>   dt-bindings: pwm: Add binding for Allwinner D1/T113-S3/R329 PWM
>     controller
>   pwm: Add Allwinner's D1/T113-S3/R329 SoCs PWM support
>   riscv: dts: allwinner: d1: Add pwm node
> 
>  .../bindings/pwm/allwinner,sun20i-pwm.yaml    |  84 ++++
>  .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    |  12 +
>  drivers/pwm/Kconfig                           |  10 +
>  drivers/pwm/Makefile                          |   1 +
>  drivers/pwm/pwm-sun20i.c                      | 379 ++++++++++++++++++
>  5 files changed, 486 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml
>  create mode 100644 drivers/pwm/pwm-sun20i.c
> 
> -- 
> 2.25.1
> 

This patch has been idle for a few months, would you mind if I took
over shepherding it to mainline? While I don't have *this* hardware
to test it with I have an H616 which has a similar pwm controller (and
for which I was going to add support for once this made it to
mainline). Otherwise, I can just wait patiently and then tack on my
additions once this has been accepted.

Thank you,
Chris

