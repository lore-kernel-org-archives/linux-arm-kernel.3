Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 237AAC44532
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 23:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fvcmYZzoXJ2+AFhLmq8yWDeYXcFpMi5b7436MW8Ch78=; b=Q3fhc0UFqGkURP8fDhJJDRD1SE
	lb1NqeXJxV6Y4oUIfBUOCj38Adu6lHxOAM4ANXuYha7tc7Sc19KcfghYnysj/VQtpoVAY5j7IgPHw
	4CimJqAG8MQDUVJZsO3VEowGl6omEK7vaBMBhNv1K02+SyUZ40oO67vaSS/rqgxuxrHXCAq1QA+Aw
	cQbYkW5vgXXrNqFQd8mWsX/Y2Ife4JppbQlQZVENY0B+h5QMHoQTo56FbxeocespBItkaAUHFzKqD
	/qCm5chX2B7UJwQLYOidZDTNVBYEmSd5SUnYTww1RKc75ENO2MUiVBfM6bsdA8EJ/eB76m9q5tJbV
	BesXhLXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmgpF-0000000CyUn-26Uu;
	Wed, 22 Jul 2026 23:58:09 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmgpC-0000000CyUN-2yCN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 23:58:07 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-ca97d139d8dso47009a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 16:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784764685; x=1785369485; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fvcmYZzoXJ2+AFhLmq8yWDeYXcFpMi5b7436MW8Ch78=;
        b=m6okmG6Zt3buVvG6Bt++9J3G+fTDLy2yLQXlHFIg7HHH2cmlB1nUfZhbLJVpdpIcXA
         zozR/Pt39ASupjGyEZ4VKOH78F8Q6WKGhVNvTb5DV7rk+gDn5A0FqDdoL+CL3XXrNNCp
         qXoSNp0SAWPAtbQxbltol/8Gi+miaJn52GN34=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784764685; x=1785369485;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fvcmYZzoXJ2+AFhLmq8yWDeYXcFpMi5b7436MW8Ch78=;
        b=l3ZE8p/Wxcq+H81r2/MMLznT6XKkXgWZ+GmcsqYC0yeKixXl2gsaoqceG75yPvQNd7
         LlPY5nvf7jVupihlvQuVsAVKJxWxDLBnDk4drErMej3yf8YYXRws51oz0jNrsltaL+uK
         ohN/5k50hpIBBrp7h6hqH+yj97XoFu6+CxHStYSIqHZ1uSTQracGoVvnB9BZ/yI3VAvx
         Z6vaCWsYTuRYC8sGLF/kw8heea/WGqoMd82h0S+wXFhzftC2zHDrhLX0XnqhhxxvS4cz
         VOlC41viwo04DbMlwoPrIu851JA3GXZ7Ux2C4+NmZPgOO1w4sqgzI2TasA/lBMJFsl7w
         7jmA==
X-Forwarded-Encrypted: i=1; AHgh+RqAf51cQLN+VWPSnA65FReAvkJfIa4b4QSDW2vFZWG4Q5dM+UoYOwFjyGgeR9LDlDd24Yn1oJW9YNUTOCvRDbpv@lists.infradead.org
X-Gm-Message-State: AOJu0YxAnUSW5GqO/hOqnAmkrdHEnXcCfrGSdhdGW3SYlZHQ13FZN+HA
	JtZ+E4VQyr/RbzJFL4CcG9eBcx6Ka+dhPQtKNUGbkBxhi5K6ITxUWic1SDUX0wMGvw==
X-Gm-Gg: AR+sD10IoGg4L33Kd4OJLo3yKLCAEUGi71OB2Jz0y0GR3qoYIyc1gu8lWB9BQApEXC9
	2R/16Cyh9nRBfWDhCx02ir3paAacEODmEIWFJPJ67gcjoJfXTAP+3r/H6BA3fLSmYu/rGt6SZEL
	3cFNwEObJ7q7QQRDJRPckhnHz6LC2a2jJbXcBcp3ox+cz6Z0hlyfKxM55I1D5gn5qsWQTrrLVHP
	ThItkaJN8yM7XfhmNbtGwaefBRLAdu2jm23LnBNmYFnHX9oh+oGMEFUQaio5ZkZhhwKO7NN82e+
	W0vwik9PovjuFdHQrcTzTLwY+qAzkv0X0VZrTmTAx3XhxXeR8L1iNrb0a4t7D/0q7awjMcuEH71
	RJoVhYaTcsyplxAfdQvvJDZmcfIrUukIDKa0QWk9FUfmMJMo6kjyXE0OgOIvLzjWmY09iinWl8v
	TWa8gBRavs+qv+G1PWpuZN77sYHPke8kuVVASZym2D
X-Received: by 2002:a05:6a21:e8c:b0:3a2:7ef4:81df with SMTP id adf61e73a8af0-3c44affc928mr723987637.26.1784764685561;
        Wed, 22 Jul 2026 16:58:05 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:f3fd:a899:78ad:64d4])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-3147df09a9dsm12945475eec.19.2026.07.22.16.58.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 16:58:04 -0700 (PDT)
Date: Wed, 22 Jul 2026 16:58:02 -0700
From: Brian Norris <briannorris@chromium.org>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Linus Walleij <linusw@kernel.org>,
	Drew Fustini <fustini@kernel.org>, Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org,
	soc@lists.linux.dev, Douglas Anderson <dianders@chromium.org>,
	Juan Yescas <jyescas@google.com>, RD Babiera <rdbabiera@google.com>,
	William McVicker <willmcvicker@google.com>, kernel-team@android.com
Subject: Re: [PATCH v2 0/5] Add Laguna/Tensor G5 SoC and Frankel, Blazer &
 Mustang boards
Message-ID: <amFZCkt1EXtOjOYW@google.com>
References: <20260722-contrib-pg-pixel10-initial-dts-v2-0-3abae9717feb@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260722-contrib-pg-pixel10-initial-dts-v2-0-3abae9717feb@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_165806_752607_4E81DD87 
X-CRM114-Status: GOOD (  19.29  )
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

On Wed, Jul 22, 2026 at 10:55:51AM +0100, Peter Griffin wrote:
> Hi folks,
> 
> This series adds initial basic support for Laguna (Tensor G5 SoC)
> found in Frankel (Pixel 10), Blazer (Pixel 10 Pro) and Mustang (Pixel
> 10 Pro XL) phones.

...

>       arm64: defconfig: enable Tensor G5 SoC family

I'm not able to apply this one cleanly in my tree, although resolving
the context conflict is trivial.

> 
>  Documentation/devicetree/bindings/arm/google.yaml  |  48 ++-
>  .../bindings/serial/snps-dw-apb-uart.yaml          |   1 +
>  MAINTAINERS                                        |   1 +
>  arch/arm64/Kconfig.platforms                       |   8 +
>  arch/arm64/boot/dts/Makefile                       |   1 +
>  arch/arm64/boot/dts/google/Makefile                |   6 +
>  arch/arm64/boot/dts/google/lga-blazer.dts          |  15 +
>  arch/arm64/boot/dts/google/lga-frankel.dts         |  16 +
>  arch/arm64/boot/dts/google/lga-mustang.dts         |  15 +
>  arch/arm64/boot/dts/google/lga-pixel-common.dtsi   |  23 ++
>  arch/arm64/boot/dts/google/lga.dtsi                | 423 +++++++++++++++++++++
>  arch/arm64/configs/defconfig                       |   1 +
>  12 files changed, 539 insertions(+), 19 deletions(-)
> ---
> base-commit: 17c7841d09ee7d33557fd075562d9289b6018c90

I don't find this base commit in Linus's tree. I only found it in
linux-next after fetching this hash directly -- it's a linux-next tag
from 20260507? Seems like an odd old choice. Might be worth refreshing
your base.

Apart from that and a small note on patch 4, it works for me:

Tested-by: Brian Norris <briannorris@chromium.org>
Reviewed-by: Brian Norris <briannorris@chromium.org>

Thanks!

> change-id: 20260710-contrib-pg-pixel10-initial-dts-49f5ec657b66
> 
> Best regards,
> -- 
> Peter Griffin <peter.griffin@linaro.org>
> 

