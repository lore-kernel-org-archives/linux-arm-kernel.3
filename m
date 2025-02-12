Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6637FC0219B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 00:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PMXY+b7w1R2zK37gr/dvT3WG1zO8cthqCAH7UbMiDus=; b=N1X6GtOJ949PV/GROl307yo6AD
	aiFl4ZO0jsUWd7Frfa2QPlAjxDTlfH7K0pGKSPG3vSlSWqGDE1+xlwJtujLI//sbMUJDCu7t13j4Y
	fx2AYUcfG/28v55LruwCRHThj6W7xzZ71Tv/Z7in9z+03+wd2XEm4YN7QwsD2g+y3BHcT61GOnX4n
	qEgwtn6e0L7YmNN8sjnL1DSKfuwCH0cMmTRwBDOYpeBPIOsN9IHTKV8sCmcDYqzlIvJarqnL5GNiN
	kixG6oj55JEi+gyQxANevX6yfrNSgosifop8wBAO4iC0pQRyPo9x5BrQ2/S6szC7qrRjzN89OO8CU
	7JhMEWCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti0f6-00000005her-0Pdl;
	Wed, 12 Feb 2025 00:31:32 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti0dg-00000005hSo-0fAM;
	Wed, 12 Feb 2025 00:30:05 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-4719616015fso25769551cf.0;
        Tue, 11 Feb 2025 16:30:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739320203; x=1739925003; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PMXY+b7w1R2zK37gr/dvT3WG1zO8cthqCAH7UbMiDus=;
        b=aURFOt6WDH0ubgSy7XRVcKef6YGeDx4QoUODyjY2RRipyy3bM3CG04WTgaSVYaJD79
         vyNKYOVTDuF58fHwDkz7GbzxrmJsfRaeKpYbJXqtg86/MjTeIfRsuYxEloq7qCcE0ZAz
         tt+PA1E8/hyrCHtRA9wl9zMXwh67Gop+ON5CWubzJi03k9MVG8UkZtqMf/on2C9msy6I
         IxVKaZBFAVC6FkQc69aT3viwoODxcNVIN15uKYwuB7KkDqlm1PrAkhjt8RK3xjQK8vfI
         Y52IgdL0AbYDZnL6OW3+RtxweyBO+HqJaYA5X1xaD//6rfcXtx17qpT03KSFzv/D52fL
         gJrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739320203; x=1739925003;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PMXY+b7w1R2zK37gr/dvT3WG1zO8cthqCAH7UbMiDus=;
        b=PLWMaabb6vRIpZiC7EhXsOxbT36ibDHdBU5Iv92owA+nzUy9q9FoeylParQA+W3yZe
         Ov0RRlBEg67rrrFfAX/nkjLQ+pR8EaK8mahgtQ4AqBFxuU3rbQyYWpJx5hXJi+SkpMNA
         sy8e1GuHaQu3gjcqDRuzjGVbEEks6xIguRtcj3JgcwHUpWZNY3feSQDnJ6voW6/4xGtj
         T56CVU0FV1Ob2llN7ng/JUQ80eI9esAyESS3FsbbMvNFJTDnMVxcIocJ1pIyWSlbmN0K
         Mo1gZZO6NFo1JWEnZr4Cp87+fUVS9v1S98qg0sVdWBc81+Do9UviMaC+AWztxIlPFgn7
         r1Kg==
X-Forwarded-Encrypted: i=1; AJvYcCWRDur2AE+jfbMQm/3PstgDxi+sekH1ylmkwA0rhk2E8D8/NrKAE8q49lZEKBV+aroW1r5LUit8pqBBpv8=@lists.infradead.org, AJvYcCXFX5tWFQNu4qd38311KOpORPm6j9rOIvtL5UQGWZowg7aSr+LElrMZE84rVFAxOUhcdIF0gUieNe2sEiHnaty8@lists.infradead.org
X-Gm-Message-State: AOJu0Yym8rw1cYGQ5nbM6lYi6Xuww6PI9lGdw2Yg9q/gEfJ1HlHa180h
	S1VyNSiu0xCRKxQjxIshy4wBqXk5Pd9JGEnvfD42bIPYMkTlH2GK
X-Gm-Gg: ASbGncus2pljdN3yz8evAhrFewXkTlpFhn3XHqZmNlT/3M59OtdrbNHbyXf0bHsCaFS
	73nQbp2JCoOnCxotXVlP277GMdJ/Cal+2d7SIYZcCDoQlQaucua3rW9cUKDQ0TKMCfC9jexC7kJ
	Tr5n+6NCcg3ej7c6Z/8FqI2ZgEALo1d3jVCt2N5u+WpzqrHzP0l1A0uR2pVR3LA3mKt7hSq5Wp0
	Q/xCPuLIsWhH6LywSEZ3i0i7+tw/cpZo68UqIWNC2vjKaf7UKsfWDucfiAQQFwfckU=
X-Google-Smtp-Source: AGHT+IEycbQbC8PQDQpHssIWlJbqaUfQDH5H7e9AlKziotBrsNh5hQbOfp7wttz1fsHAHfvTcMGspQ==
X-Received: by 2002:a05:622a:1b91:b0:471:ae33:b362 with SMTP id d75a77b69052e-471afed77b9mr13923621cf.40.1739320202786;
        Tue, 11 Feb 2025 16:30:02 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-47153bec10esm67114951cf.74.2025.02.11.16.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 16:30:01 -0800 (PST)
Date: Wed, 12 Feb 2025 08:29:54 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Yixun Lan <dlan@gentoo.org>
Cc: soc@lists.linux.dev, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@outlook.com>, Lee Jones <lee@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, Haylen Chu <heylenay@outlook.com>, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 00/10] arm64 support for Milk-V Duo Module 01 EVB
Message-ID: <prrsy34bv6xskxu7afgmpdwc7lefdh7l2gtm2ejzcwk74zh6lr@23x3llxy662z>
References: <20250209220646.1090868-1-alexander.sverdlin@gmail.com>
 <eoeyutuu4mrpsu7snkk5ll6kmm4344qsgbnncss6gerlcvvea7@usuf5v7w5ffp>
 <77c0db160bcaa7c2a68c04a0d33a561b2834f764.camel@gmail.com>
 <ccadcdf720d6b1055165f1404fafca9b1c6c54f7.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ccadcdf720d6b1055165f1404fafca9b1c6c54f7.camel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_163004_199323_70A9AD02 
X-CRM114-Status: GOOD (  27.90  )
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

On Tue, Feb 11, 2025 at 08:37:01PM +0100, Alexander Sverdlin wrote:
> Hi Inochi!
> 
> On Mon, 2025-02-10 at 21:55 +0100, Alexander Sverdlin wrote:
> > > > It would probably make sense that the whole series would go into SOC tree,
> > > > even though technically nothing prevents the reboot/reset driver to come
> > > > in PM/reset tree. If everything would come together, `reboot` command would
> > > > work out of the box.
> > > > 
> > > > [1] https://milkv.io/docs/duo/getting-started/duo-module-01
> > > > [2] https://github.com/milkv-duo/duo-buildroot-sdk-v2/releases/
> > > > [3] https://github.com/sophgo/sophgo-doc/releases/download/sg2000-trm-v1.01/sg2000_trm_en.pdf
> > > > 
> > > 
> > > This reboot implentment across the RTC and 8051 domain, which is
> > > still a big problem to be upstreamed. This should be designed 
> > 
> > Now I've got it. The problem is not in the reboot procedure, but
> > rather how to model this thing in the DT, because of all these
> > unrelated functions brought into two HW address spaces...
> > 
> > > carefully and needs further discussion. Adding these two syscon
> > > compatiable may be not a good idea and cause some problem. I invite
> > > Yixun to this talk and he may give some useful suggestions.
> > > 
> > > At last, I prefer this goes to an separate patch series, and
> > > implement with rtc device.
> 
> Thanks for your hints!
> I've completely missed the RTC driver in progress [1].
> I will provide a patch registering the reboot handler on top of the driver
> as soon as it's accepted.
> 
> [1] https://patchwork.ozlabs.org/project/rtc-linux/patch/20240428060848.706573-3-qiujingbao.dlmu@gmail.com/
> 

As far as I know the RTC patch is no longer maintained. Maybe you can
pick it up?
The patch states can be found on:
https://github.com/sophgo/linux/wiki

Regards,
Inochi

