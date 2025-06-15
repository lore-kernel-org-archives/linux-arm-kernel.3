Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42091C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Jun 2025 14:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/1Mnj8BRsec6z6HqD84vADwgxfot8IxmImwLJlUFSEM=; b=2OkweRrgTed3DPHkCe8KYIBP7C
	gSKrQgjbWqbbv1mD3pc8mO68mC6ATq5uR3qVaJMDZQcA4LYoFeirwIAzgOdj5Ut9jxLB9dowsJ6x5
	udks/aLacgx09nXWSHxb6o8Kt958HrElwj54U77g7UyP7gBRLK7wvGK/5kuCLxAGavijZm16D9mTF
	vOQW3oRpxQwN0MT1N9Th2DRSFxOeEgRJt8JevcLznzoYss6ZRTyCiZ4p64kGbpmz1yjaNDcTLQyne
	sXhc1cqeqrp2lC3Bq9V+90IkOsAc/TJvGDzHkgCqgnq5MX0Jxk0B2IC/WOu6pnvwt1V6X+Mp9Jo6s
	5OJsgLkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQoRP-00000002Ynt-1MLb;
	Sun, 15 Jun 2025 14:34:35 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQoPC-00000002YmK-0EzF
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Jun 2025 14:32:19 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-235a3dd4f0dso23316535ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Jun 2025 07:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1749997936; x=1750602736; darn=lists.infradead.org;
        h=autocrypt:content-transfer-encoding:mime-version:message-id
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/1Mnj8BRsec6z6HqD84vADwgxfot8IxmImwLJlUFSEM=;
        b=S6z9XeqhtfCn/paRDW76rNavTF7nrkf2dr5vZjtq4+bCHxext8JXswSzEzg+4+KzlW
         xdf+WAIM5vlbL12ruxCNEaEC7clOSgiSTyUaGeIU62BHQUb14tGHjVliuqKlNdbsXFsL
         OlnvEGnaNqVP/5Q42Q/O0wvvU3UZ5o9ARr3CA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749997936; x=1750602736;
        h=autocrypt:content-transfer-encoding:mime-version:message-id
         :references:in-reply-to:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/1Mnj8BRsec6z6HqD84vADwgxfot8IxmImwLJlUFSEM=;
        b=D6+e3cUgkZK+6+Wpg0eyPEt3XcWm6trcE8hIe4pFVnmw0pPOrXpXkLtP8OrOjH9uiz
         0BPeHZBNxFJg3FqhYpI1o68LLnpvtiBURXwOMoW8vGSY84riZVrJEe4Cq4MU9JVCfqv6
         Mg55vreUZYhp4oUludAuUdPcVD028NeZpoEZY5RnJjc0NpqnSyS7TfGetIgvTralnBpK
         LThsJENYTsZipZo25E3qUVtleV55ziV2ngC4e6U838NyytaoYB0rCy2+mDUPmO8XTZe4
         Zgfa6+OLGcDqlTp1A0lGxOtUsk90q+ZT8Celu4OhY1ORrfMmd9j/KYSPT4/fr9oCs6Pd
         if/Q==
X-Gm-Message-State: AOJu0YxVKp5bSYWg6kr1cHsKf5DDrqD2UgAzGfkm3nf6pth3IU9h0ekI
	e+SX8pdHfDVzlAiPqSHqM3eD17x4aSAqZvSALsdAwfzVmxPP9k5//MZr6McJ42Uerw==
X-Gm-Gg: ASbGncvFGoskBc4NeK7lK95X6nQoYeyQLwnGqBfm3IEg3JJe8oop6wu804vPLnKHG91
	voivUwJ4ecCysi8+0yN1J+z29KH6jkOmudV7Iy39qfwY0VIm5OwpxzIOI1gx9cs/BicPbflGjnS
	eVOcNw/s21j/tKY7OH+q13UclM53BIgaqD1a6DBucW+E8+Kb4IY1rxCr15Oc/ThQ2ZUq9P5L3jI
	buEglzAO31h23ED1dUxZbKdJGaBB8l6EElS0BlxrogiyAz5CP0wtv9V0WP2o0wol06a5/6bm35x
	wvizqga193WjGjd6KperBQR1AyTmmcKoOc32rgxNJJyk0h2FMWTdLDlhjjGCyVYtQrdjnL9qrwI
	=
X-Google-Smtp-Source: AGHT+IEP2Pmx2aDmmrB6WuVIgvwZlLsRnE+dHeJ7evPdUv94cztM9x5UDutRNnWUb+CaxwS7iyTYrQ==
X-Received: by 2002:a17:903:24f:b0:234:bca7:292e with SMTP id d9443c01a7336-2366afe6223mr94975295ad.14.1749997936502;
        Sun, 15 Jun 2025 07:32:16 -0700 (PDT)
Received: from ?IPv6:::1? ([2600:8802:b00:ba1:b7de:b5ca:82a8:83f8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365e0d0bc4sm44451935ad.243.2025.06.15.07.32.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Jun 2025 07:32:15 -0700 (PDT)
Date: Sun, 15 Jun 2025 07:32:13 -0700
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: Stefan Wahren <wahrenst@gmx.net>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>
CC: linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com,
 kernel-list@raspberrypi.com, linux-gpio@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_gpio=3A_raspberrypi-exp=3A_us?=
 =?US-ASCII?Q?e_new_GPIO_line_value_setter_callbacks?=
In-Reply-To: <20250614111216.93677-1-wahrenst@gmx.net>
References: <20250614111216.93677-1-wahrenst@gmx.net>
Message-ID: <841BBEF0-70B6-4166-960B-D91A394EC9FC@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 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
 CsNI/Us=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_073218_248935_EA5AC13F 
X-CRM114-Status: UNSURE (   5.89  )
X-CRM114-Notice: Please train this message.
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

On June 14, 2025 4:12:16 AM PDT, Stefan Wahren <wahrenst@gmx=2Enet> wrote:
>struct gpio_chip now has callbacks for setting line values that return
>an integer, allowing to indicate failures=2E Convert the driver to using
>them=2E
>
>Signed-off-by: Stefan Wahren <wahrenst@gmx=2Enet>

Reviewed-by: Florian Fainelli <florian=2Efainelli@broadcom=2Ecom>

Florian

