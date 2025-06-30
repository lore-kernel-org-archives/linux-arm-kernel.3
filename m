Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6BCDC83035
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 13:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vqz5wu4a9+fyxIcUMARw02jDw0fFs9t8Ss/9EgTuY8g=; b=eJ5LKroK40khOUDl5rB9r2eycT
	ZxqsPL0Krf00VaX6N84ZspdpJuyQX5iutqmYNDaKlbioLuLngqW8U0mtGLKN7EVYIqRg7ylWIij38
	I6LJnTOotlcktz0C8yt7kozwRpu6CW/YC8dcHTU+FSLSMMJC14CEg2qfA9GaDmL6UUkrfQYMbjS/2
	KPcpn++QokERVHrQVXDhsvHsWs/JNA+cMLgUqH5hzksEsSCo1URK2dHRn4lacooYlFQNar6p2Dmwn
	3QPm5pE4BXjLyUzce7Q1b7TZrom7DsBbbR6A4+lA0h5epF5xJDyayR5OyFlQu76X1A9ksSP911GO9
	F/PUHN4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWErS-00000002QZE-3FiR;
	Mon, 30 Jun 2025 13:47:54 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWEaQ-00000002Ni5-1pdr;
	Mon, 30 Jun 2025 13:30:19 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-747c2cc3419so4241802b3a.2;
        Mon, 30 Jun 2025 06:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751290218; x=1751895018; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vqz5wu4a9+fyxIcUMARw02jDw0fFs9t8Ss/9EgTuY8g=;
        b=ILP+drC/ASsUF8AbTNbfSUBBHhZfYlGM5/QdPg+1R32ihfEFECkMIxla2oa/snybX5
         0MCVu8hBiqA1vfouBU1DIrRglWGIWZgzcgOIs/e+VfbpTptIKHr8j7+r3jgjXgDveR7l
         ObzThtMy0SSWmmN+KYPgJ536Y16xrdXZOta9/IPTpx2KQlkWSe1Z53afNzZ69kzcQbPY
         jykJKNI8lEFrvfuWYzlCOT6IyRmIO/BWi9n7hCz7RFmfMGoI3hObfoCV2OELC6V067oo
         +yIW3R8SfCEukBd427gxCIq6i9Drd528JV5B2EDcA9gjyr7sJv8a2MJDzLvNww40HuKu
         5frQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751290218; x=1751895018;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vqz5wu4a9+fyxIcUMARw02jDw0fFs9t8Ss/9EgTuY8g=;
        b=oQzHXXVTaOUOWKEhplQ0XgSasBRoiOkOzWYUwjjfY4w/aS9ssBddxe8+Y0ARPp7a99
         65fVNqzS3Zmi3BSgNYqQU1WFYtpeQ/GzAylLTUxrHGpaUm55GDqCVCwwZDszxFrmNFk1
         zi3sSc3VO4qBeyyOh/eyABLxtfHmkDmeF9V9s+VZLfyL6p57DkmQOtLUczjrzW5wzzzX
         g0zdDjtBnkR/xAuj/l2D6hCpMjPVzuA5lyNRTQuM/PPECi64ZdukA7Fxt638EtFtaZsq
         v1z7lJUi2JqlJb31BuMyBzPcJr9DHz3PklBKD6370seSSAuoNbGAzLZVcm6n07l7pca0
         b6Pw==
X-Forwarded-Encrypted: i=1; AJvYcCU3vAr5EEwKvwa+nCzsL91uolxRd/yhPXUmyEqqFzjnqyYrVgKafauvNpGdFOfprHfXlVcsULETBC6rQqTC5Jk=@lists.infradead.org, AJvYcCUEudfZxqLxtMCD4S3pRc1Pvn6U6BglbSWbOrgThLzydJDZasDXFuO/luGYD0HYknLN7uN+EeZ+IMZCy3s28Q0X@lists.infradead.org
X-Gm-Message-State: AOJu0YxXwGlblCnysFuxRzKP6tHMMPJXHjUqPzNeov9275Wn6XSlkk/a
	DkCGAZeFBfad+wWGXDy1Jic1Xpq5RtL9uPizLR1O/6cwnO/KYk+9LNCv
X-Gm-Gg: ASbGncsnVmr9smBr+TzDtkC9su3iUUQ0ZkAob7bXTUA6MGBsmDhYeL4UFjAfkj+6qk/
	atmsn8OyPUINYhBI0mA9ukTNy+6ikQcvRaezSZ7Py7n0he9wcH4N0dx2AJ5H/T3LwOZebtq9/00
	II1eeRuNx7XwG4BpDp0auSZ2lXTYItFNoAJHTFni429Xx9Byt54hbx7obAcAyveBjMSQXqveqAc
	BasTVLEAWatPozXrdkMcA6GRcHVbS4YnsZLyCmmdUrqofE6m1WCSA/Cq24NKSzY5mRGFsy45kzz
	RVPNmcfrP1K+9t43RAMXkaPqEZeZ26+N5LXZ0J7+28fhBHiaNo03enY/paZup6xDD9tTlxux8S0
	h2ML/4kyhsg==
X-Google-Smtp-Source: AGHT+IHsEfXOWrT8Uf27lIFmnKIwzXoqP5mPWVdDMXddwdbdnzqfqiqgg5d8T6nDpFccz1puGjbcBw==
X-Received: by 2002:a05:6a20:c90e:b0:21f:53e4:1925 with SMTP id adf61e73a8af0-220a12dbff0mr19639755637.10.1751290217517;
        Mon, 30 Jun 2025 06:30:17 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b350d81f0ecsm2964147a12.27.2025.06.30.06.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 06:30:15 -0700 (PDT)
Date: Mon, 30 Jun 2025 06:30:15 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: wctrl@proton.me
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v2 05/11] dt-bindings: vendor-prefixes: add JTY
Message-ID: <4c48a544-1252-40fe-8dd7-17ec848f6957@roeck-us.net>
References: <20250626-mt6572-v2-0-f7f842196986@proton.me>
 <20250626-mt6572-v2-5-f7f842196986@proton.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626-mt6572-v2-5-f7f842196986@proton.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_063018_474253_87A685C9 
X-CRM114-Status: GOOD (  14.23  )
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

On Thu, Jun 26, 2025 at 11:53:58AM +0300, Max Shevchenko via B4 Relay wrote:
> From: Max Shevchenko <wctrl@proton.me>
> 
> JTY produced low-cost Android tablets based on various
> MediaTek MT65xx SoCs.
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Max Shevchenko <wctrl@proton.me>

Acked-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index 86f6a19b28ae217643bf7a63a471f74819d18238..517bd129288c96483ffe358127ce8e16f60d902b 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -782,6 +782,8 @@ patternProperties:
>      description: Jide Tech
>    "^joz,.*":
>      description: JOZ BV
> +  "^jty,.*":
> +    description: JTY
>    "^kam,.*":
>      description: Kamstrup A/S
>    "^karo,.*":
> 
> -- 
> 2.50.0
> 
> 

