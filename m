Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09F28C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 07:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VA1ZRNBjqp7yscOTi3r/FHvrtvUImlYVVtC0tQYvbJ0=; b=sZ3CxssoH/QrOMdAmKsn9Xpc1c
	akz4DeraMBDe9CcZWOlomUCFJO6KkSilHU0NXttsyYzkKiaVqaQfQwjBmIqSv0nZ8Qend000JcxUr
	MzThF4Ee+23rkn4rHIkoHmANrkhl2oeyTQysAqfFvoPVToF3GVhL/0DXnDXzxzPrKmsnclZ9KeizL
	DD4gQ0MWObcQtm+PZABtvEybL5YWxucTZGeiwY3T8ioZTolF3C9OpG9eV1JcwVbTSZHS+cOUf1x56
	e3PEXfI1oFE+Mt1MOL+/oQfjLLPWjNuunoxgdxlqTyxgtOz8dbDxU+zqkp/janXOqRAThosYsrWpq
	ccR5GPRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlNK6-00000004Uhb-0JyR;
	Fri, 21 Feb 2025 07:19:46 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlNIc-00000004UPj-0moX;
	Fri, 21 Feb 2025 07:18:15 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-439a4fc2d65so14892005e9.3;
        Thu, 20 Feb 2025 23:18:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740122292; x=1740727092; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VA1ZRNBjqp7yscOTi3r/FHvrtvUImlYVVtC0tQYvbJ0=;
        b=jWM6eSv5E5Ba9FodcTsniwQhNthHXYCR4FKjyZxHUM+6GgsSO067tFZwvfqsNwM4ck
         chAX+m89byVjAdzhAyfyW5B0feLtGioEcKXvqqPbVRYoE1YTTQyuPUxrulqAjOHsQcn7
         8Vn6jIIYfeJAUsfMTFHwHPCYF8cMqtGUe8r/0V5zdarvnZn+gQ7QRx9pq5Ig961yN92M
         j+ZRax1Ru9xmfSvhoGVkAXdt81Y/eCcphvQy/yfvhRjJuNYIlwQLv90X+hyBlVho4AYh
         HDrz+aljSok8NzUynUOT2iH9V+27GUSeCz2qFH+U7CfpMQbn8mOUiEnWkPcz+QEXBhu4
         p9hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740122292; x=1740727092;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VA1ZRNBjqp7yscOTi3r/FHvrtvUImlYVVtC0tQYvbJ0=;
        b=eyQZOi2+MMKpDtQ3L/3eJdz9V1z9E2gh6ZQP7JVLS9ZZN7SzbakgHq63fD9P6BAwkj
         l1G1eTlgB59OD/bpI6uowM7V61R2q8Kdk7PLx+uvVq1zq0LrXwPv3ODNh9pUxyYfz0VN
         8/oz432nz34T8zSPyVKw2vbVdo7JhVtDqjNe6fnr7ksMgGJRQVc+7B5HASHqD7DnAddP
         Rdqw+dOzTGauPHY1a3i5Lt3QWuQl1W73hheckjK0SRQ9eHQxXHoQ6upmHzXOS0Uql7dA
         Hwhb44PIqtld6Y+az6k1JlNRW5LGD+3SWDE61gbPFgFiph4SbIDoLGoyKm8jG8iy31mr
         ujVg==
X-Forwarded-Encrypted: i=1; AJvYcCWkTDSyNMoAaiLOqTDykftk+9minNzS42zTsw1tL0PnB6nWcupD5D+FsvTZsYB3Q2XAO29ludtloLju5qM34OHu@lists.infradead.org, AJvYcCXhZfXDowufoC8MIFhFSAws3KvZEYnYOH3s1nUGzlM9Xswc8SBn0P95cULhXvq4zHeCtSsmGqL3gN2O@lists.infradead.org, AJvYcCXwUy2bjKHLsnHNcfYiSHPTgO2q5b7Qt4zzx4+zDArPbSHCiqY2+n4qQpyz2KJLzM87bRg61cdth9vEhiZZT0Y=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxnu16ULjbAWOc3GHclnR5iQE3RRwXP7eTaN121UFR3ciP2sCTg
	PfbkwNKAsyw/81ujaSy4XsWVVe468mJ2cFkKrc2jcbzamVUZE58U
X-Gm-Gg: ASbGncst0PbjdXnV7w94AZrRMhz9RJxUsHknkXetYwRFxJ+NapXC4CMBA7ZlhK4wJ0j
	oQgT7H2ScdeaesZskWBUkHhiMtuAUqvuB7zZdhqE87TtfL5mrXW9VVBMIWJVknp71azhjOBt0Ny
	ywa8jfiaLd6Zt2keU5bx63hGshJ+g4kYBFVsmCizksvON6sFap73UEVg/kVj3+uOgZgBAhAgvlo
	ApeVZOIt9C7jYEVlBxCYxGoMMHR8U+nIvNdhO5kcbjSxmq/21oCq0qtcBwfgM5XJgcquuyWryoP
	kDXP42pe9NkBsKks1loMGVBEmscMo1NKKj43TMlfZw2nQTyGflCbSJJbOZQ=
X-Google-Smtp-Source: AGHT+IGcmqoZKLItFnykBoAs00PCywkh0iIfnYdOfG5YsRkDoJu949fdzfkiJ6sY4SF/q78XHllfvw==
X-Received: by 2002:a05:600c:1991:b0:439:9dec:b7a2 with SMTP id 5b1f17b1804b1-439ae1d7505mr15992725e9.2.1740122291572;
        Thu, 20 Feb 2025 23:18:11 -0800 (PST)
Received: from eldamar.lan (c-82-192-244-13.customer.ggaweb.ch. [82.192.244.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439b02f3e15sm8427205e9.22.2025.02.20.23.18.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 23:18:10 -0800 (PST)
Received: by eldamar.lan (Postfix, from userid 1000)
	id 0F09FBE2EE7; Fri, 21 Feb 2025 08:18:10 +0100 (CET)
Date: Fri, 21 Feb 2025 08:18:10 +0100
From: Salvatore Bonaccorso <carnil@debian.org>
To: Diederik de Haas <didi.debian@cknow.org>
Cc: Valentin Kleibel <valentin@vrvis.at>, Vinod Koul <vkoul@kernel.org>,
	Chukun Pan <amadeus@jmu.edu.cn>, Heiko Stuebner <heiko@sntech.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>
Subject: Re: [PATCH v2 0/1] phy: rockchip: naneng-combphy: compatible reset
 with old DT
Message-ID: <Z7gosm7PJMR0zCg4@eldamar.lan>
References: <20250106100001.1344418-1-amadeus@jmu.edu.cn>
 <173831716590.670164.5196739962949646746.b4-ty@kernel.org>
 <f64ee4ee-7e56-4423-813e-b87e023e893d@vrvis.at>
 <D7VJOFXU540M.2PAC1RFXAH19B@cknow.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D7VJOFXU540M.2PAC1RFXAH19B@cknow.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_231814_226378_C6B8FAB2 
X-CRM114-Status: GOOD (  15.88  )
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

Hi,

On Tue, Feb 18, 2025 at 12:45:34PM +0100, Diederik de Haas wrote:
> On Tue Feb 11, 2025 at 2:03 PM CET, Valentin Kleibel wrote:
> >>> Chukun Pan (1):
> >>>    phy: rockchip: naneng-combphy: compatible reset with old DT
> >> 
> >> Applied, thanks!
> >> 
> >> [1/1] phy: rockchip: naneng-combphy: compatible reset with old DT
> >>        commit: bff68d44135ce6714107e2f72069a79476c8073d
> >
> > Thanks for your work!
> > We found your patch after NVMes stopped working on a rock 3A with newer 
> > kernels and successfully applied it to kernel 6.1.128 (currently in debian).
> 
> FTR: I've reported it in Debian here: https://bugs.debian.org/1098250
> 
> I confirmed it (also) broke on kernel 6.12.8-1.

FWIW, we have several users in Debian reporting the problem, so if it
can be applied to mainline and then flow down to one of the next round
of stable series down to 6.1.y that would be highly appreicated.

Diederik, if you were able to test the fix, you might contribute a
Tested-by (although as I undestsand its not strictly needed at this
point as commit should be on way to mainline and stable series)?

Regards,
Salvatore

