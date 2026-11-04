Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15710606A326
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 09:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HL+dAbVP;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Q/Kt3ywu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=SkhmiTU3L0W+PtMKZoljzuVT2by2BnJf0VMN53m+45o=; b=HL+dAbVPMz9mz/
	j4grEM/nP8tqT8aiWLlQ5tt6AS5JnT3j1MftwPvATwghExzPTON/Ns0UwR+JY3tWIHwdYvbY5iOIt
	nbYUnJI75znaJ/AK7r3T0PI6lLZbKdoJ8J74uguLX5cG7ZTEDMU3p9EscpxzuMzNaCnnn8FhgbmeW
	HFqpTRWEA9UA3P2qAKyrk0W799hXlCjXEyeHyfFnKsQbmklQMA0rPpEOF8tztVW5oqfCVtHeb3Kji
	Moa0GVhzEravcZzXq3VYWQ5dIf+L14ztAypJG3iLg6hBwwBuNzSrTseMNvP2bMvKhI5b0F7IVTqZg
	xKwAFMIcmw+K9Q1K0/7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOXMV-00000004tLH-3U6R;
	Wed, 04 Nov 2026 09:32:55 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOXMU-00000004tKp-0Aoa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 09:32:55 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4a215e64962so4427895e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 01:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793784772; x=1794389572; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SkhmiTU3L0W+PtMKZoljzuVT2by2BnJf0VMN53m+45o=;
        b=Q/Kt3ywuR8urWhjexhP7yBXnRI2ehIyCoWl1MTMvuh9CqzUWvXxuFDodIJXC7G5RkR
         d9QgIhu8+wOf8bOAkGzipvXntL93WTNTronW1HZYbvX+EuNNAOO73IGtZH4MsRbKPNkb
         rIQRY1SaOXTroYwiIYLU2BQlJNc9ys1+KKr83A6nWXvlPWgSeyMlpi64DQlw0dzB+3SR
         6yx5cXro1ie/U2HbfHr8SocpqggDa6qFzWkeZ4Sib6eWn485Y6N5mbr7H63f03rgPx/I
         1gXfa1RhwflLLJD0f6mRbr908Am4xOGv1vIxJ5J1xj8SEv0yTSGCtVjhYXoKsCq+9PDv
         geYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793784772; x=1794389572;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SkhmiTU3L0W+PtMKZoljzuVT2by2BnJf0VMN53m+45o=;
        b=tCEr06jJxxLiXDTV6rGuUC76lLjlBFYULqwWB00hslsJzmLxnmToZVZ7JBi2JBlVqU
         US++JN6JWxq75uuO+/6A2bNXEqWv5W/o7bmu42IhMttANuOCpvkFwA4jOl+cPK/Oiza7
         sJw1tFrywOoqOEaUxOa5HKz0SvQI1RJX9uOq7Z7KMzzlfeZJsRSGqumBwGr+qChbzOl4
         iF6IloAPCGFlIY5eLtNBpkC/EL9+1jHYhh1Ywr4n5dHeG02flqTc8PdDf4TTuscohlkR
         v2xebCRO9cWZg7BBNtQIjEFJhAwnvZpPB+WF/tn0aZawAUyEqhp1fbLeUmAsj2rfle1f
         5L5g==
X-Forwarded-Encrypted: i=1; AKwUvByZowzdw8NWJUcYLZm+NXZJdn2mBiXmSsPvU1MEePT0oAb89I27n3kIwnPa/y/v+VXsdUMZP8JqNXXIcClS5QPx@lists.infradead.org
X-Gm-Message-State: APuU4Z/mZrF+qcSOG89NtmAZ5FtdDdo1rKtNgW/rwS0Pmouw5ogjQrOL
	hodXNE3awJSKelTZ3rnhz/6XWVwZs+xyFU8mH4Ohom3XO6IVFZ9Cc3UaFHfOU0V6yOSoLJ1zYX3
	/O/Vq
X-Gm-Gg: AYBFou2goyZv8Trgvw2LH87rAEyccWYwgRHtUlMUJGF+BT4Mi2+XOi6+uG8U5CwdYXk
	mBUBJXIEEg6zYlKQbUns+6UBfARjl5CCGqcTHeaPlofULPomKv1BlFECIf6GHszcjMobv2ib2BI
	O/zddLc7avArxTN2zKIP7Q2qU/FQO13NhZBepMecRGy73Yhcb369ylmWne4bzYw1mUPqeO0IZ0j
	wuxNQyZOvG4UUa3GluFNPhQCdPMEz+L/m6PUoD8mQfaJ59HUlnkWevBxuYtoGvdoa5g8HbgpxkU
	AFYo/W4G4z9T4UHsXNlyfXEKWWq00I+Y3D18L1TPo2GyjITxiVSAt2DXxcxWkXwp2z/0CWzcCLY
	WEcqCRL8O7tDhWVLNj9avYKcBKXvr2pgg9ZauNhKC+ENMznsykLVBTrX+9gohMQ5rAQov+Hfgeb
	e7MRvli1G/dMxpHw7gP5U7njvG4eKjRhis4vn1mvwEromSvhuMNWx7SQ7VT8nJG6wk+5vDBhWpY
	qRmnqYX/hTIdEjxKhKnghg27wlrtHyefb0xElZBdTmEO8pSzVwswqXVaJKOi50HtmWHcCvabA0b
	5nE+ME1DOLfvaH4HY/8B87HbJitjIyVVIhzI/0S5DhpisSVOzqap+yM6yHdgQ2o1TWWpShqCOYi
	syg==
X-Received: by 2002:a05:600c:840e:b0:4a1:813f:2a60 with SMTP id 5b1f17b1804b1-4ac17d168b1mr393740865e9.11.1793784771558;
        Wed, 04 Nov 2026 01:32:51 -0800 (PST)
Received: from [192.168.1.62] (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fedc09675sm2799433f8f.55.2026.11.04.01.32.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 01:32:51 -0800 (PST)
Message-ID: <1995c873-084e-462c-83eb-5bc454882c18@baylibre.com>
Date: Wed, 4 Nov 2026 10:32:50 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/11] pinctrl: scmi: report an off setting as not set
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
 Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>,
 Bartosz Golaszewski <brgl@kernel.org>, arm-scmi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
 <20261030-clegoffic-pinctrl-scmi-gpio-v1-4-52d92843ad97@baylibre.com>
 <aunHoe9PfumHp0Gh@ashevche-desk.local>
Content-Language: en-US, fr
From: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Autocrypt: addr=clegoffic@baylibre.com; keydata=
 xjMEafx9bxYJKwYBBAHaRw8BAQdAtc85GIwDXLz0rh9thWXC80Lji0otVDVncXT4qaS4j1fN
 K0Nsw6ltZW50IExlIEdvZmZpYyA8Y2xlZ29mZmljQGJheWxpYnJlLmNvbT7ClgQTFgoAPhYh
 BJjMiHuM4ZUwFqUPr36EW4KtCh6TBQJp/H1vAhsDBQkJZgGABQsJCAcCBhUKCQgLAgQWAgMB
 Ah4BAheAAAoJEH6EW4KtCh6Tt+sA/jVC35rY1npFlOy7YnncTdrID8Qf855JA78IzXgvzpGp
 AP9FkuuT80m66PP3DvgYX9kVnG17mSDKO0+v2W18v6ZgCM44BGn8fW8SCisGAQQBl1UBBQEB
 B0DMwF4u//aQyzsFlO8rPJ/cqsAuPH80IeIA3HOEo5mlVgMBCAfCfgQYFgoAJhYhBJjMiHuM
 4ZUwFqUPr36EW4KtCh6TBQJp/H1vAhsMBQkJZgGAAAoJEH6EW4KtCh6TdSgBAMDS0MiWCivt
 LjzZc9bs+P/xdXywUjDKq3lpQGJ6vZ0GAP9vI6DnN7vwVK6jt6/+0aBGkog5Ura9+WwRFEdM
 vLfPDQ==
In-Reply-To: <aunHoe9PfumHp0Gh@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_013254_096017_EF82598A 
X-CRM114-Status: GOOD (  13.91  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Andy,

On 11/3/26 12:38 PM, Andy Shevchenko wrote:
> On Fri, Oct 30, 2026 at 04:58:35PM +0100, Clément Le Goffic wrote:
>> A get of a setting that is on or off, the flags and the pulls, returned
>> 0 as a value, so every one of them showed as set on every pin. Return
>> -EINVAL when the platform answers 0, which is how pinconf reports a
>> setting that is not active.
> 
> ...
> 
>> +static int pinctrl_scmi_map_pinconf_arg_get(enum pin_config_param param,
>> +					    u32 *value)
> 
> I would dare to keep it on a single line.

Alright, I'll do it here and wherever in the serie.

> 
>> +{
>> +	if (pinctrl_scmi_pinconf_inactive_flag(param, *value))
>> +		return -EINVAL;
>> +
>> +	if (param == PIN_CONFIG_DRIVE_STRENGTH)
>> +		*value /= MILLI;
> 
>> +	return 0;
>>  }
> 

Thanks,

Best regards,
Clément

