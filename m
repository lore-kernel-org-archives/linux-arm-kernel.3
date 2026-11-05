Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A42F9606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 18:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZTNCGlBg;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nSXyS5vx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=WNyoqfFkSiqIaDnNr0KZB++i/w4miVNCO0u6spo9AfQ=; b=ZTNCGlBg4xvh+NphlJ8pp1LgsN
	/qtQI3eNXuhsMC0Y4CFbkGmdfrrUt7nfIe4A07E2Noh3emgVJOXnWEgr2TCmrqASkkiG6E63w4UfN
	3dtWHJrjQI73h9Cggwxq4oeEkx+TMhQuEg43xcP7GWl4+jp7uKZdEiqIZWEYS1wALrud5Ny+wAOda
	AoQPggB0FhAXImfb/0lXBFZ0lnH5TBHiCt8gU28S3K0qTSC1zmyNdsGee/zkA1w42AXOveDJOxO66
	YoJQBnhPZLYY/R/Y6+EzUgck2Lz73ROVacjFCctie4dBt4qiKTQJ+0fX7rOiFwOfnKWbOg7HY4qle
	gdvtOVUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP1s4-0000000A4W2-2V7m;
	Thu, 05 Nov 2026 18:07:34 +0000
Received: from mail-dy1-x132e.google.com ([2607:f8b0:4864:20::132e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP1rk-0000000A4QL-0ZY7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 18:07:24 +0000
Received: by mail-dy1-x132e.google.com with SMTP id 5a478bee46e88-36cad25b8b0so3241252eec.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 10:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793902031; x=1794506831; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WNyoqfFkSiqIaDnNr0KZB++i/w4miVNCO0u6spo9AfQ=;
        b=nSXyS5vxVeTY2ZRupzPkdO3mQqF+BdMi47R+jap1JApNEFC3rZOwgk8Xv7wxWSGnvq
         FiXWxAG4+C+gD8AOKWUPwihn/hEL+mDRMZlmSTyu/rqn7wSigcijqK+MCiDz4SFry6FY
         AGQqIuZICa9McK34cZm5pk9Qd37PO9vtfNw5OwaTtElRGWj0CUp8sCVZ2Pv+io7bZl5b
         I/t2nfNULBvN8OaLY2FUWU+T7lP/+IJ4YbN74UGQ2xL6/C3c3yRNRO7SCMryfY3M0O22
         DLLqri1KkHwpsvXhGEQjfTtuj7t5/fvw5ZTvfjZRsf8MoxqCguLM6G7e+WGJponUWnid
         41Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793902031; x=1794506831;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WNyoqfFkSiqIaDnNr0KZB++i/w4miVNCO0u6spo9AfQ=;
        b=A0UhoKWDfmLQQd9coqo4cA7ncGgP1kE98cQ+lnuvRBjeKi/G77RxeDXdpgetxkQzdM
         0gbOPX0Z3/KYkuyhdd9S3I7sNSixsLiz+sj5dSHhuN48CfTlZgFG70n9B7sfmAndgEiU
         WrTh9mq2qO9zWFUsN6kRyvmhkbDYiOBp4j33dUBhEfV8K2FFyrVtqfcYzd+bFfHkBNxg
         sbXqpwjqghCcXGphz+A7AFC899vPcyG9gC3dWoR/pQQY3TFfD4IQ3f8CMgbHEucxkhkF
         Urgl50z/Qyqfv2yHUNseS+tjZ6j/0CLJQ5jgA9nY0z00LLrwI8VvyrzY6ir4GoKis6Sy
         Sh7A==
X-Forwarded-Encrypted: i=1; AKwUvBzz+q3ydSXL9cx5t5oXMfYvwhsJL9SgVFxyLVsTixVQYBFzx3jeVzkEvOl1Vg6wBQyKiNzijOt7aKeKTydbTw2B@lists.infradead.org
X-Gm-Message-State: APuU4Z9tn7MSRTND4J451j6R2eIehNCCFHfMX6ByJJeQeP54EWv1kfNd
	kfDCRzP2Sv/mPCK8DhcDaS0xRXUo/aLJCqQEqbLhkOeuLVNvVrXlUqaEptT3xw==
X-Gm-Gg: AYBFou2GldAaJ6YHQfi/a5nPrnYfbGQ9uBESiNupM35fCS4vNnWATHT1qMIfvhOhVn8
	O+CzKSOVm8pzg4sgMAkkymv/2CHXJ1o+Jr41S/UrAA234kMo05gZyn5Gayw8IXbMLmDzCYtg6tH
	R86TtRCE9Ffto08XFPXxEZdLwfqrLQwg9e9zc9Ap8oSDSh1ajAGVxTqg1YXqSO3e0ciZkZ9b6Hr
	YvYKb2X5UBRTiO5JosKcdsygYGHP5/9lVHsBLKwVdCm5+JiMH3snxxBW9MJbcpWpCoJerApc1ZL
	1lB9jfuygvXw9WAjPR+Qrbtqe0NXoFxssq+lo6nlq3VLN09eMD9K5S6hXORMcWFZX54YBbJvGlR
	2fmAnj3ruLcHa51riUoV89sqzB6yxLDcCzy3jwpt8C6dCk2pqETC9KP6qAiG4vGuy/Q47JOGVyo
	sVhCbyLvGM1ju6wNhOZ6qZ+4e8VwLGICDnsm1BXz6MZSR8YRNMzPhPwedN+r7LwMwDgyxqcDRLr
	7/Ickq+KHe2/JjM2WUyIM0bcEuQhOmHcus8jdfzhzyiZkRkJCJnO6NK1k9GjdE0FcuuXfsVDIHj
	amO3D4l81LugqHbS9aqfmbjxhF/rE0TrKGqyH59i9wDAUoIpbLGB/MH7u/fpTs7OuLQ4dA==
X-Received: by 2002:a05:7300:e9cd:10b0:36a:ac68:c745 with SMTP id 5a478bee46e88-36aac68c84amr14869976eec.25.1793902030913;
        Thu, 05 Nov 2026 10:07:10 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:c8f4:b7d9:252f:4483])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36db94376b1sm12512067eec.10.2026.11.05.10.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:07:09 -0800 (PST)
Date: Thu, 5 Nov 2026 10:07:06 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, mfd@lists.linux.dev, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] mfd: wm831x: Support software nodes for DCDC
 regulators
Message-ID: <auzFQkIPZScADEeb@google.com>
References: <20261024-samsung-kp-v4-0-e21253295e68@gmail.com>
 <20261024-samsung-kp-v4-1-e21253295e68@gmail.com>
 <20261104181429.GE1650678@google.com>
 <ad02069b0cdede7ae191e4a3df57f33a@gmail.com>
 <20261105085321.GG1650678@google.com>
 <85817548-28f8-45ed-987d-a4996c2bc4ce@app.fastmail.com>
 <auy4Qbxg-pW_X37E@google.com>
 <ad9ec396-aab1-4950-8ea6-dd72d8938464@sirena.org.uk>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad9ec396-aab1-4950-8ea6-dd72d8938464@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_100713_788706_77479960 
X-CRM114-Status: GOOD (  28.13  )
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 05, 2026 at 05:19:30PM +0000, Mark Brown wrote:
> On Thu, Nov 05, 2026 at 09:12:38AM -0800, Dmitry Torokhov wrote:
> > On Thu, Nov 05, 2026 at 02:43:17PM +0100, Arnd Bergmann wrote:
> 
> > > As far as I understand the situation, wm831x was used on the
> > > reference board (Samsung smdk6410, removed in 2019) in addition
> > > to crag6410 but never anywhere else upstream. The question
> > > then is whether we'll ever see a DT conversion of crag6410.
> > > This would require finding someone willing to actually do
> > > the work, and coming up with a way to handle the autodetection
> > > in mach-crag6410-module.c so the correct spi/i2c codec
> > > child devices are probed.
> 
> > So I guess the question then: do we need to keep this board at all? Or
> > it is time for it to go the way of the dodo? And then we could drop some
> > more drivers as well.
> 
> I don't really have a great replacement for it.
> 
> > My goal for the series was to move along legacy gpio API conversions, as
> > well as move away from the GPIO lookup tables (ideally I want them gone
> > now that we have software nodes supporting describing GPIOs).
> 
> It is a bit hard to get enthused about software nodes :/

Hopefully you do not need to pay too much attention to them as they are
hidden in the legacy board code.

The benefit is that using them makes the driver exercise the same code
paths as it would on DT system (unless you insist that the driver is
very special and should only use of_* API) and allows dropping support
for bespoke platform data (in most cases).

Thanks.

-- 
Dmitry

