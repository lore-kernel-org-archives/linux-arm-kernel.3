Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AA6ACD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 13:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XydIKcKEN1f8CDYCbBpZkqLXM7ghEeBzqIONwAcRzBw=; b=qzTv9TYHxFWNEuvklXn881SFNJ
	P83vxUkqEfZPEVFqQerEgmEdmq1lacKwklCbDbklIiduFnvvds1VUKjvJu5runGzKIgKcLqRbtnzU
	8KDpczDBk/ph5p67372NX59jxRT/FF1hbkutYt2IegZXMT8C2alfRJwLi5TJ3noCsCWN7fruyPV1o
	v5pSDT73vkwsVpoj9KYKN9h3ufwDeabIul+kl5xx0qTJjEOWwDKuki81uFp1/2isZSBlq29fFiwGX
	I1qoqawVWRzsB6hVq59xT2iQ1mRzYr8hl0FwJaCzLLtAWFBYZOKyZwEg1jhwJvdp6LsPVAnSr+oWA
	vna6aHlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPh8u-00000004hgn-0DHF;
	Wed, 20 May 2026 13:39:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPh8s-00000004hgS-3zJj
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 20 May 2026 13:39:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=XydIKcKEN1f8CDYCbBpZkqLXM7ghEeBzqIONwAcRzBw=; b=TglQjgV3ORQBO+No8naB525Nsr
	iYfqpYMymEP0eIhkLae31hC6yBCZdwpT15qhrYqaUDt4ls05+61GZrnMdkC985K5cO/b5psRqPdyo
	ED1Uknu90yf1Jzy6lncDDy5M/AGYAUk5HMOHnGhe3XkntIsyRAMlG37a8CW2RyxNLSzSUtlFgZBId
	fGM1FMF9ruFNiIgkoQ89xFEQjMHZd4F0SWPUr1MbezICGkIn0xflcjyMod5dxtSFs2OPTtHgt3t0p
	n8ayjzIuk98ZKRt2TVm+7+o4c6JhmrxeIM/KPqqcYuxJ6MlT6dk64ChpsDYdkq/zq4cLAW7ME2O2G
	onpZqEhQ==;
Received: from mail-dy1-x132e.google.com ([2607:f8b0:4864:20::132e])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPh8o-0000000Gwx4-1R72
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 13:39:20 +0000
Received: by mail-dy1-x132e.google.com with SMTP id 5a478bee46e88-304106b1204so1292534eec.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 06:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779284356; x=1779889156; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XydIKcKEN1f8CDYCbBpZkqLXM7ghEeBzqIONwAcRzBw=;
        b=OKHSjCIDV8Y5QBZhAvve6lzFUeXJDKiglaptPdwqxjoYo9vTItjhMOqEgsTt9Iu4yj
         n7wEmfb4fO2kWs+FTYlHQ6MFJHIhHFQzgmuNoXe0z2BlMh7gnKd3rfXotMeeSUOyM+KK
         5jBPTr8bHysFPnvDFExtY0Jnx1r3f/04XjOahC2L6ZqIL8udh/81QLbDzphZKdbYXW89
         +8yHu0TpNtuvbQ9KTmywuMH/5oIN7AydamIwYdqSBjBxW0T8XPt/7jC7xvWxVlEdh3PH
         KqD+5pEa8J3O2J14w8AnUntcZOtEh1W0oM3uUPB993nG0C+gO/8KW/Qp1JRmc3b2hl5w
         iUxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779284356; x=1779889156;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XydIKcKEN1f8CDYCbBpZkqLXM7ghEeBzqIONwAcRzBw=;
        b=CY3tC8yjDU5q5r56iwvrB97bu+wefVRqUKvtWdvQuW8mGIVzU75hV81HhNlrq66JRi
         N+FTwmtBpiJphtb4neXOaLeFuBv1eL9tRYb5wPTTMuRTEXCnWX8N0U1c+L4kpU47CDtY
         n8wfbrII5emx1/pBYaGjwcMhzZzgywEQwqz6JNh5qEEO9V9wDdNb5w+pg2q8gT5G3g8j
         0pYZpxIuRzD3flYiEM5VGsGy5eJYhCs+fnC+tiMFsz3bKc9dSF/t7Sau155uwCgtBNlN
         /msAZNdv/O+J3CavKrwPLGGYIF9DRrBNSPHVVZ25WG/D2Blyn6LHu+14eXdIz2IPxvwb
         sZIg==
X-Forwarded-Encrypted: i=1; AFNElJ+8q9nnrr/ZRuz678gq5+5KZiKNswp6WFyylOMK9xG2u0Aabe9HrizJMw3oDqSZ/OHi4AZ6Jygid4XlFYs06bvO@lists.infradead.org
X-Gm-Message-State: AOJu0YxIbAAURFznDyx+b4PmXtyBzGLoWxjRfhvymsOlPyEJuyGUhaVD
	ug3oSAlGDeO7jkfs0u4gKnw9IMi/v7cXSSUBRosr94wlRVjM78KO4P7E
X-Gm-Gg: Acq92OEl0dGe3/P/znmZfYAmWzObNP2/vSaV0IslsjZksjnO/l1aMdQ2ou8GbW1eqZQ
	BJi0JRIfmViGwlaCLp/ryGt6FDkpqJ8SfrbsGItMAP4MtwoGLe3hRXZIv2t7MjCX771rISl3G6J
	QcphWy236u+dM9f6i7VhR/FOQH5RLS9GAOPk1bRxmuHYZycd49wywXEqII77syOIkvSLEeDv/WI
	YBkWY/sLhEuE0HOhmxiSSXZFYTFeKSKqtAPlRUfbmNIzmAlQ57q0u8AywhRUKYiX6yiNpnTRg04
	IQXy3DyOX+keaeThn404dtOy7RDBjUEtuOmPeNdrCeTAWjP7Gq0AaUSI445u2DOXOcvOQ1jp+YS
	XNQ6M0XbYpPrvldkKdcGKLtSDU7pmiiGZjYKW1V6HunmcrxVHMGZfwUPFXrK6aBW04AdrahINgh
	X77lDAI9GjBs3YWc0FnOVu+OceKRHX+aFcHK8G
X-Received: by 2002:a05:7300:a907:b0:2c5:220c:5670 with SMTP id 5a478bee46e88-3039818eec3mr9988056eec.2.1779284355819;
        Wed, 20 May 2026 06:39:15 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302978ad18asm18456851eec.26.2026.05.20.06.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 06:39:15 -0700 (PDT)
Date: Wed, 20 May 2026 06:39:14 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] hwmon: raspberrypi: Fix delayed-work teardown race
Message-ID: <f1b970b8-1785-4f96-ac79-d3bb79c53101@roeck-us.net>
References: <20260516164407.25255-1-chakrabortyshubham66@gmail.com>
 <20260517080445.103962-1-chakrabortyshubham66@gmail.com>
 <20260517080445.103962-4-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260517080445.103962-4-chakrabortyshubham66@gmail.com>
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

On Sun, May 17, 2026 at 01:34:45PM +0530, Shubham Chakraborty wrote:
> The delayed polling work rearms itself from the work function, so use
> explicit delayed-work setup and cleanup instead of
> devm_delayed_work_autocancel().
> 
> Initialize the delayed work with INIT_DELAYED_WORK() and register a
> devres cleanup action that calls disable_delayed_work_sync() during
> teardown.
> 
> This addresses the concern raised during review about the polling work
> being able to requeue itself while the driver is being removed.
> 
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>

Applied.

Thanks,
Guenter

