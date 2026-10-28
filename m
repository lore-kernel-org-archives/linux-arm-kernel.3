Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3898F606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 06:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tDxybavc;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uvC00cRL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=upb2yDjK+Sz2Or79oIRzVU6fGyWUl+WecZ9r73Zp7qs=; b=tDxybavcMVyQip
	AGCuu2lXeY9TKRqeirYbV/qbsCt0GLkn+zG5Di8KWkzi1M/p9rEFtxiA+ICtNYk0CzAkQEdHiJ9my
	E2Ei7B7vdG8ecfhMX8qwcOMx+9o/3ljuKQf7P9PLU0UKLHiZjEOjwviN9+h7OdoePR+T6XKjRTHFv
	UsyQGq9agyPi3aDWP2W+5/u6WybG/6P/YpRuKgSuNa1Vj6KNIoovq4bY/TjsL6aqWX852EP0Eiegg
	eYI00guNwggmb2FXcFQK50HWKM5v4MsETKcWJIOW2OTqFDLkwOtpdEXaL2NRFJyCxZSLP5onMOBS1
	5jAJN8dFQRGZSE5v59Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLwxR-00000006Ol9-1md7;
	Wed, 28 Oct 2026 06:16:21 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLwxO-00000006OkW-3gRm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 06:16:20 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5ba35c0df4fso676834e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 23:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793168176; x=1793772976; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=upb2yDjK+Sz2Or79oIRzVU6fGyWUl+WecZ9r73Zp7qs=;
        b=uvC00cRLXCAUX2Ltx5xaekUZscjxsqssy3OCjz8blwEi1ZAPP/5P/yJeIoVjxrPp0W
         IHX6XUNj26+xrKJy4XLyUwkxgpeWmaWFzp6O7EtX0wKe4IIm9Ha3/QGwTSRkxtcjkJQy
         uI/eGSYaDczxHOEKKVvcQ7B43c8yJNkm7mgXO/v2ID+mta0/gIKrtVEwFcLzoQQv+OXd
         bpjqkzMswnDkksTHXfa7ZH/bMDSxjNEK3hDVbAbEL35sAwKAVpTCjIFfQJVOP/XqXffG
         y265bVi+N16hRua2cd/ynwyol9D1xockckZuO3FzeTuqjnFu3IYNxRp1I27QCbEKXdFi
         x6Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793168176; x=1793772976;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=upb2yDjK+Sz2Or79oIRzVU6fGyWUl+WecZ9r73Zp7qs=;
        b=TH7Ixjq0jkr74G2no4DLZOyUr/mJE4pIeH1hi/C3ftE4pixgK/5nLChsNv+JkleSeH
         BOHV6ry7MSpRwaHZQXA9jOp4FVVa2Luo8Xtq0DY5nc5wjZkJgZDMLrOOqbi8A7FF6Zkj
         UtmczzbQkV+scw83bTEVsDiEpwNpJO1j70OjDy6Dm1wNDcgqk1BO5FJ0elnQBOzrs7PD
         ypH56Wt/zBam62NALwo3qv/vjAFpEE/R4FxjHjeFhHelV412RYHaqWWWchwPkQa76a2M
         /8PSdR6/6RKiDPP6M+AFA1TgH/0oigeBhZxRJBHvqryiHh5zZFRJg6jU1DEeE5vQnKbz
         CbbQ==
X-Forwarded-Encrypted: i=1; AKwUvBwQJ5p2SirLgZzBYFpBhFEjPf23qD2Q/buySnda98f9sdQeYLZz2PA1nrpWw+bQE7FBjjz8AiL6picdnxQqKtJv@lists.infradead.org
X-Gm-Message-State: AFq9FYIs50slyAGSVKpEjMAGbS44cFEKETi3XQNuT1fwXSiLvCagprqE
	DlPJaXPXJW0Qs6gbgMAH3x7o3Hdk1+58ATSEuwVLlAl/rCRA4cWweNl9
X-Gm-Gg: AYBFou2zXYI7n/gAlG1fjYc0h3eJykpREPzB5D4yvIf6yS7lHUrXoHBkU3kDTKDKjob
	aDVJPGqFPNoefyag3m6UlZ8haUXO0RjQO9KXD804KkLOc8S+NHX9nWY0QiwDap++zAmZsTJEXGH
	wxtdm/q0Iu7TtSkMTCIqx6uAY3v8s1ykxZscQfeyy9t6eXzVoAZfesYlO1IFcSf3dGsOhLSFLU3
	cfgw/68qUDTWuzw/nOlIQAGmTimNh1seaaSYDcjhfC+hspD0Hp5aiRHf76omf+ONK8K+rKruKxp
	ViPH5hdVVuSc7DeI8xqOWV9WDwxejHp/kLpeoO321M8WFvSREjFOwViLF2Xyyak7kqlKJ/XtxRW
	AF/weORSfeAUBKXsuZsGgTmCbpb41tx5F9PKE4GVQx9aqEuTKAFwyFXn6GDOo5LPRvUiObOjQ19
	euLxQWwYsKe2pB7h97dq9XU8ejxd9bfefeyljw/NeCFA+UfODo6ZRTtXQXPFs1i7TrkIlrgmsmb
	EY4TXCmXLRCxZFMohYHvDfWNr0+1UdnVx31iDkf1nbpZvFzeyFchBpI9UjkUgVWtbYIJSbY+Lpf
	Lu8jzKC9U2u8+u+gM5eIqLeG4zsV/Cjms0wiZeGI0jJacqg7o/W77kEUHdX7k25pzjMhHaMgBMg
	Nf0yHu558mg==
X-Received: by 2002:a05:6512:3a82:b0:5be:4be3:bb8f with SMTP id 2adb3069b0e04-5bfcad787eamr578392e87.19.1793168175751;
        Tue, 27 Oct 2026 23:16:15 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfca47f9f2sm400912e87.8.2026.10.27.23.16.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 23:16:14 -0700 (PDT)
Message-ID: <9e9a2f4b-b6d6-4faf-95f2-e227b41d27eb@gmail.com>
Date: Wed, 28 Oct 2026 08:16:11 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/9] iio: accel: kionix-kx022a: annotate the lock
 helpers
To: Rupesh Majhi <zoone.rupert@gmail.com>,
 Alex Lanzano <lanzano.alex@gmail.com>, Andy Shevchenko <andy@kernel.org>,
 Benson Leung <bleung@chromium.org>, David Lechner <dlechner@baylibre.com>,
 Guenter Roeck <groeck@chromium.org>, Jagath Jog J <jagathjog1996@gmail.com>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Jinseob Kim <kimjinseob88@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Remi Buisson <remi.buisson@tdk.com>
Cc: chrome-platform@lists.linux.dev, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 Marco Elver <elver@google.com>, Bart Van Assche <bvanassche@acm.org>
References: <20261027124954.110697-1-zoone.rupert@gmail.com>
 <20261027124954.110697-5-zoone.rupert@gmail.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20261027124954.110697-5-zoone.rupert@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_231618_944698_F1F83D02 
X-CRM114-Status: UNSURE (   7.66  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 27/10/2026 14:49, Rupesh Majhi wrote:
> kx022a_turn_off_lock() returns with data->mutex held when it succeeds,
> and kx022a_turn_on_unlock() releases it. Annotate both so context
> analysis follows the lock into the callers.
> 
> Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>

Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>

Thanks.

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

