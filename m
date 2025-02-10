Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A36DC02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 05:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1ifdBl3NrYJonu6r4KpHBlucrHJcYm6tgOGSrXK8TmU=; b=onRCbU8WT7oi0QPiirKY8Cb3mr
	gR3lC9jHzEkQ746wJwc+Y/s0eBVtWMBJ+pXUZTcedkWWD2xcL02QtyhcAq4dgmekT3kFg35x5bpwF
	ulfbjXFu12hbeLMM1PavqJyC1KDc5p2joTaWENE5X+Lc3K0x7F3SzTeQO0zh5MEokFioZBoEpHQNO
	AF+JZgozgsHlWQsm0vtqfcZknVXhgpo3IKHr3W5659FvGMZUhbLU7XIbmJIVbERUqmyOmgVmNYfRy
	gdQiyNtGUGXnqX5FSlaUvLIYkfcqfdpRZoAQqoLdLJ5wrD2sMQEg4H9/tziZjKEttH77JeTvG0poA
	Vl7Tmmxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thMUN-0000000GI19-13ia;
	Mon, 10 Feb 2025 05:37:47 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thMSy-0000000GHpx-0aDs;
	Mon, 10 Feb 2025 05:36:21 +0000
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-7c0590fdae5so186806185a.0;
        Sun, 09 Feb 2025 21:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739165779; x=1739770579; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1ifdBl3NrYJonu6r4KpHBlucrHJcYm6tgOGSrXK8TmU=;
        b=esw89FmPXgpT5MmHQIrKLQs0fUuTdOupuzY+/CzzGeGXB/aIEKdWvlkU6RxItOf9Ok
         mmF9WnWgRxKE+skF9csvYm4SIIQgHUHz1tCxxyzRHIt2WJkwZy739inPqTj52wtV4RbF
         ESlzlaJYqO9oxguE5ocGfuE4riTToZ0sfTS2c+vio8ZyRwjvtebC0Z8sg5GjUWk/nfev
         4YB7nfb+BQyskQiUBJmdbtpRBj4CNXV49IcSEVZ8E2w7EdcvJAVaelL36LvjUiHGqVui
         k/T1jQJMvdLwIn/bb7iXBJEp27rL9HrpdXSD8+Yxzpgk8JskK2R89Lbox1WLrDqY1cGu
         7Naw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739165779; x=1739770579;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ifdBl3NrYJonu6r4KpHBlucrHJcYm6tgOGSrXK8TmU=;
        b=saT0lwwqOAS0rh1LZvoe8Q8+0+Fk+k4JQKgeMT19I6czCS5xQ8cYhn5u8ySKoZfvkX
         LGBG9cCyKEzVSoHJpzcOI8Z9sa3OLWDQhGjIwhBJqYO1saArzcDChci2AqE1K4HHnSc3
         QO9RhrBjcs+5Uc2HqCDTIKkkgt5w59La1v5Hpsa7EhRa7nhV23hRNmPLLvXmaeg1W98k
         /CLuV779muflVx6cqVyLmg2Y9KeLUeZM31twHhLm1Z4rcAK+dZv6Z1KeoF3F6NXudJGE
         Zp7ImEP9KIAE1ThuEUl+OF/Fa23VORSF3SUHpSSz6985LzWMI3mn+inY30hijRGPlXtm
         D4sg==
X-Forwarded-Encrypted: i=1; AJvYcCU+K30Z81q+stzCFZV77GgixFunTMLotxwrRpBIqzs9ye9z6Xh3mXg8tLmjegiIb7gBuUpAbLDWSdL+Se4=@lists.infradead.org, AJvYcCXacWWp8ugCs1qSBrkxbpLqR1DMV1Pn6smJtuBH79WAiL8ZHcLnl5DKk1frU9Lfj27W4bTKIEncYolMhkvmso3m@lists.infradead.org
X-Gm-Message-State: AOJu0YymcmjuG1HvErcP2YqhWZrnED9GqgZzsZCJxHtNmv6VKzvrEiza
	aTxHK1nDoxo4yHb9LBhUSOpeMiJJ6K3T9Ayb7vUXiNP9J1KLM2Gq
X-Gm-Gg: ASbGnctINHich33bSxXawLXw83uXC68xTJIZ/1+jpw3Yub/g2QCPiVGuLBru3V4fSmR
	zWzEwUkyysN3P1GeD3XEHtClsmm2p+xo7YFQzXYUtJ0sxPunb3eQAC7Ms6hzR56wrDzO12ksAuJ
	qU30S2zOU9sHxp7FsieQMuSPcRY2OknY37HpREK+cpyKDpaHb15QjSbgPftm6vgicExaP0SEGQt
	AQ/o4qp/GfdFn0fStyZ7DvLbZ8OX3h6R2SYkkUHHxjplj/vfMhwZzrq38Zty5ROxHM=
X-Google-Smtp-Source: AGHT+IEWqO2pMAus1b90+jEl0xBixTJRuApL2Dml4vzHcusAiiCC0HuddoHfUyCUVXV1B1ACw5vOWg==
X-Received: by 2002:a05:620a:2893:b0:7af:c60b:5acf with SMTP id af79cd13be357-7c047ba6b65mr1800335285a.10.1739165778925;
        Sun, 09 Feb 2025 21:36:18 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c041e9f4basm484915585a.67.2025.02.09.21.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 21:36:18 -0800 (PST)
Date: Mon, 10 Feb 2025 13:36:12 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>, soc@lists.linux.dev
Cc: Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@outlook.com>, linux-pm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, Haylen Chu <heylenay@outlook.com>, 
	linux-arm-kernel@lists.infradead.org, Sebastian Reichel <sre@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Subject: Re: [PATCH 07/10] dt-bindings: reset: sophgo: Add CV18xx reset
 controller
Message-ID: <dlvmfdkxws6daxteiukdmce5rjr5vpcfey4tcpodq7d32rbj76@ikhlepkb26k7>
References: <20250209220646.1090868-1-alexander.sverdlin@gmail.com>
 <20250209220646.1090868-8-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250209220646.1090868-8-alexander.sverdlin@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_213620_176365_9CDFC4AA 
X-CRM114-Status: GOOD (  17.60  )
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

On Sun, Feb 09, 2025 at 11:06:32PM +0100, Alexander Sverdlin wrote:
> Add DT bindings for CV18xx reset controller. The power/reboot driver is
> going to use only 4 bits from two different MMIO regions which can be
> potentially used by other subsystems/drivers, therefore the resources
> are not being claimed directly by the device/driver, but via syscons
> instead.
> 
> Link: https://github.com/sophgo/sophgo-doc/releases/download/sg2000-trm-v1.01/sg2000_trm_en.pdf
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> ---
>  .../bindings/reset/sophgo,cv1800-reset.yaml   | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/sophgo,cv1800-reset.yaml
> 
> diff --git a/Documentation/devicetree/bindings/reset/sophgo,cv1800-reset.yaml b/Documentation/devicetree/bindings/reset/sophgo,cv1800-reset.yaml
> new file mode 100644
> index 000000000000..4f058f99df5f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reset/sophgo,cv1800-reset.yaml
> @@ -0,0 +1,38 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/reset/sophgo,cv1800-reset.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Cvitek CV18xx/Sophgo SG2000 Reset Controller
> +
> +maintainers:
> +  - Alexander Sverdlin <alexander.sverdlin@gmail.com>
> +
> +properties:
> +  compatible:
> +    const: sophgo,cv1800-reset

Please use cv1800b, not cv1800. And this is a reboot device
not reset device. Refer other bindings to write yours.

Regards,
Inochi

