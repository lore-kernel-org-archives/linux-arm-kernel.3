Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18268606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 16:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PtmnL6pN;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=New0SUjJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=YZcts4qcYFLKUzeEZmCB29OAtaKV7wlY2duix3l+9sA=; b=PtmnL6pNuyuzYae+HMGg7LUWD8
	6Fh+SL92yFSjBDK0aF2LNSLyA+EjXZMqEim+YzppkK+YUQ3/Hokx+8aFU/4FqksxVyEUEg+Q0ystY
	b2scjbSkCJCP+pjJY5Ig/V30sTbiXr9q3xvqqsJLYBuQ4d1+wXmIpY7pBwiXKBuIWmlwjPawB3zW+
	a2/mP5M0QU/cZjtR79AqsB+coz+uY3a0AjqUZ+d0IGUABEtX9sZx1ToFuqA4kmDnjpS+uMMwTyrvW
	0TtuGJRpW+kIUnHAJciNDiRHbNgjE8MH4COaOogYYJtoHqhCQpbugq7Ddvt9YDcw/pKmaTU9Lu2oG
	l9Ggb8YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM6Dj-00000007Vbm-2AaB;
	Wed, 28 Oct 2026 16:09:47 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM6Dh-00000007Vae-0IO5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 16:09:46 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4a208d93758so12252325e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 09:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793203782; x=1793808582; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YZcts4qcYFLKUzeEZmCB29OAtaKV7wlY2duix3l+9sA=;
        b=New0SUjJuXNGyaD+4ph8+jLdBxu7of8lMM6gGyS1XU2uDnp0h3QsH97I0vwjiJNx7I
         HdkMrGCrEoxWTjxXD4fMv4PNJD+Cn1KgpBtiFireoBgUW/+uwE48z5UlfwjbRCTCJb89
         nLL0Bk7HwvJGvhXUjRha+pxANxjBY02v/tGH74pEG9i3l3YTM0TIMERHDvyNWrG+ehch
         OZ2UxeLEM0AfMaK83qyAtoiEV7pxY7uMWHM/0Q/KmbCwZwuvqcFZxIM5UMJ4Kw2AJ7mO
         ynO09ok+8uUMkk9ozR5y7q14PVGGbLvhP/9qRj8y3N/jkExZwnG7vmAYOo2S+qPzQIo9
         rmBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793203782; x=1793808582;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YZcts4qcYFLKUzeEZmCB29OAtaKV7wlY2duix3l+9sA=;
        b=chN2kwTOwtTYrCjO7kuxNnx0fAhgmP5AKVYtf/x5TgCk978kigfljJ8egi5KRtV7g3
         5qqL34bgFJPFxvSu9zswcIkPJwzPguLdrzIrF9+DwsHJXt810V/bjakmYivsdH9XIDx3
         SB96iJTQwgeGdNSiFYCpTwzHYw+/Yr6MWQkiEehFiqJwxlenZbv/r306yVnLq3/Zuxfs
         Mos0uNHm6mkNr8ViDRGNkDvmdize+RPhF9Bc/q0QGS5/X5WPZO8+tVbk7nC9AmZZRpR3
         cwyASQZLbmTX2lK/K5YS7xGP1gJpbeBV7IXTz03xXpF6KZxhUl3CDsgJNtxerZEvYpYu
         jZdQ==
X-Forwarded-Encrypted: i=1; AKwUvByVifaxv8+5BZR2flr3JLlNxEhnz9dcofPSt0RfbXbZMo1460gH1exjTH/WVg48034xlKsB1Ra/Gw42/xQaZAsx@lists.infradead.org
X-Gm-Message-State: AFq9FYJvL47MhD55UeL/01tB3hZkJumtsF4WnbBo4K8Ahs/9p3eTYrQh
	FcFL6CGb0QirnzZn1OwtWVoDq9NaKhg1RFm2a/0l0VNyxj/ysEZThh/WSb1DJE5t2NI=
X-Gm-Gg: AYBFou3AKHW8woVlWYL/js4BuQntjrGuQMZPhJBLvFivb+WRa+ev7DYrGng4wY7spVL
	oXry2IWqu1Zm2jcrVQWWwohHWZrYwX1+zHY2ffzP3dTmbaUTV9efxhWVtIWj7eunS335KLn9GtO
	UclTsUlwwKUVQihkjsnkYapHca6u9AZbnSCuj/MIn9Wsi+6yjmynEGQN9PbdIWeCg55z2VIZxrj
	5mXaOlQWWQYILISz3F4FgOz4ec6VXAIshOSyLThqC87MocOr7mGoWTGSQ5BYdbPTQBAR/grcnPV
	W9YaX0waoFQ2y372sC0tZ0qY7xCPUXr6ZAuab2VvXwnMbiZINamFm8vc9nab+vmgQDPQ2y9gUdq
	J2s0N4SSt5GiS7eDxDn3AUwydOJskfFtK4hh5oCInZG+KJSVUtPNINxg2dH5/WZxKvs1Yozq7g/
	SZCZM9jwFPhdGIGDqAIcyxse2rCNNLuAnJih0G8OgVXOthykkDJcyBU3XCXtbasir3jQQgEcMEA
	3pYuWxVFrhMbjf1wy6kFMVpkA0fob6N1FpBehEApDQ0a8AE5zxQ5vKCfvuVNW0jSIGfwFFPpByj
	Mb1JbpXKs4DDYYVEOiY04RWcv1Timg==
X-Received: by 2002:a05:600c:4f89:b0:4a1:c6fd:4db0 with SMTP id 5b1f17b1804b1-4a966c41836mr68052215e9.19.1793203782221;
        Wed, 28 Oct 2026 09:09:42 -0700 (PDT)
Received: from localhost ([82.192.120.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa8213ead6sm1572025e9.14.2026.10.28.09.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 09:09:41 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Wed, 28 Oct 2026 17:13:35 +0100
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Gregor Herburger <gregor.herburger@linutronix.de>,
	Stanimir Varbanov <svarbanov@suse.de>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-pwm@vger.kernel.org,
	Gary Guo <gary@garyguo.net>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH RFC 3/4] hwmon: Add driver for Raspberry Pi RP1 fan
 tachometer
Message-ID: <auIfL4ZGdfNDUZxO@apocalypse>
References: <cover.1792748690.git.andrea.porta@suse.com>
 <0d2249a66732bfce38a2260bee08cd1ba4097e51.1792748690.git.andrea.porta@suse.com>
 <auGdsv0OVG4iLjZV@monoceros>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <auGdsv0OVG4iLjZV@monoceros>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_090945_130697_D134E6B1 
X-CRM114-Status: GOOD (  11.22  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 08:02 Wed 28 Oct     , Uwe Kleine-König wrote:
> On Fri, Oct 23, 2026 at 12:15:56PM +0200, Andrea della Porta wrote:
> > +#include <linux/platform_device.h>
> > +#include <linux/mod_devicetable.h>
> 
> Irrespective of how this patch set evolves: Please don't add new
> includes for <linux/mod_devicetable.h>. <linux/platform_device.h>
> already provides of_device_id without introducing a batch of unneeded
> dependencies.

Ack.

> 
> Best regards
> Uwe



