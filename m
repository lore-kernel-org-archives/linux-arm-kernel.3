Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68BBACD3430
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 09:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1MJ5jvSmy3GosoYN4CBc5oeGoIhzHzzIKBuMNkH0u8Q=; b=2ul5UuLt8pxr/MkT8FH+gXReJ3
	KjLYrlRBObTeb5PmCxAgB3sot57OIRSlrt5LoaL51pdH5k2D208kXX247FMgORt+wfVlaWLs8PXQt
	r2pny7U+m6Ax5HXfhA0ZSRoG9LYWSjY6IvepB+GqmPlQQXt5Th0zlVo9AbbSXtNk54JQqMkEr3Xj+
	yPOiyR9E9gHn11y0Uj1SU1P2LNx78aI5kTd8SJhnLzby9GrtvAuHtjR0f2n5WHMeizv5i5EXo+GGu
	S8OX8pOE4lxq9tWkOHw1faX8uGbEPX7isMdGH5pbSd3bKQkv4BVW4qKr8nRI/yJSMauALQbFZ+1OQ
	0MiiyltA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKBrk-0000000Fd9E-2kGz;
	Tue, 05 May 2026 09:14:56 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKBri-0000000Fd8G-1pD0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 09:14:55 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso36238515e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 02:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777972492; x=1778577292; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1MJ5jvSmy3GosoYN4CBc5oeGoIhzHzzIKBuMNkH0u8Q=;
        b=E7WYd5L9jj4+O/pm8cf05vXh3UpFWwUYfdubhN+5iBPmCVcFism29EmE6gDUISeuZz
         /CHRtN1z9aiaTZNvUMvX0ISu4mAIQCNme9cTBf6g3V0fcxKCFfsHkwyqZX1bWus8scI0
         9z3AgyfPuqlokK7B6Xid13RlsOMJrk70DxH6Z6xCwlv+73PZ3/kcncIXHEu6miycAWwL
         rHeq1W/SVyzOhEjXOndiAFAfyI5+fXkxxff0pGqytE+6HfI56XBSA862uIA9Wv9L3ffN
         WpVSd2gcQayBHR/NfbfICBwxxuK+ImD5s0SwKowaub6msWQto877l8FlEkOesViMYqOF
         3snw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777972492; x=1778577292;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1MJ5jvSmy3GosoYN4CBc5oeGoIhzHzzIKBuMNkH0u8Q=;
        b=gqGtBV2ffE6xv/jtEMtdhacrQddhQ5rfkdPGvakhx6SR2kJWOx9t7Uv9NTUq4XGrNx
         8WC8tjNVfXYW/SoFUG/jpzxWd4ebNSHQDezppyK3bakKmTvxtScJSu7oEReTA5y5Aw7B
         y8YRf/G0MtUgWx/xoTtApA7zDg7Nd0Q4eO1o4l1xSYtr9K4nEiR0Ynu2H0L13//N4J9M
         l+HMODM6wAMg2arHqcl3F87X7/yilxLxzz0iLG+KIjOtaTNzFG1vOkiibeHQp3MFWB4m
         Jy1TpU+KtgBNFpzgXUy1Rhv5iOb6ebtMahWHiHon6O7bXXWQeyRpwYcPuSLV5Y1fh+bX
         fcPA==
X-Forwarded-Encrypted: i=1; AFNElJ+Z7S2NUSre2VvjEb4Q+z/VBBu7a4v1/HgIsOmWRjV3DsW3wkujATva5en6ateERiiQKTUibcRgo5vPti5Lrdf5@lists.infradead.org
X-Gm-Message-State: AOJu0YzYSSWfLvo+sGkDi1xEf8MwOomBZH0AaCyvRzO6jlL/LxX6Adsb
	CdWaMnlLEEScP3reBu8XlwPJY3csO084L7FOAARjKew3yQZ8TK1kHMnYbcZgcShOuuI=
X-Gm-Gg: AeBDietEYWGLVe1ZdcbcwWM9btPKviz7uNGt3n+zY0IA/AkYW4rRL9BBaB4kCFUFt5D
	07B+CtH8FmFJ2DU5XY8UwrPfOCLby90iOD2OgEpOHducpW2OkIn3PG4SRFtq3y81l2xne0lL+lB
	vJNoSSgGN0KELK05fiCD/3I9Oyn/SOEpOSHAI0+UOx+1SndruTzh3QoGkoCuZzcNPafy1P9+hdZ
	7Ei2dVAyPLf6wKII4T4Mu02qOyr+3KwJ5wSTwaEwQntv/Tt0X5ZhKgFW77Kv2praGgfxsrqe5m8
	4WO3L7D6/xCD/Vp4SJceArDj3HE6lteJ5+M1XAcGxs02aGOw+fdc6anQQf/f12ttjGra1BJWYV/
	jRRGhFbyNLSailDILmV+mWz12CCuZtzz19PGFW9jdANALU00oYKZbVTT3FbzYR/TomSFA5bIdii
	rwzkXdaZXKmrlWCMGh2IpGlmF0p1JVGq4YYBNV1VB5Nqs=
X-Received: by 2002:a05:600c:4f48:b0:487:59c:2bb8 with SMTP id 5b1f17b1804b1-48a988ccc94mr241921645e9.27.1777972492118;
        Tue, 05 May 2026 02:14:52 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48d17708195sm19352525e9.3.2026.05.05.02.14.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 02:14:51 -0700 (PDT)
Message-ID: <cc973c62-4e33-4055-8059-dfc454447d0e@linaro.org>
Date: Tue, 5 May 2026 12:14:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/7] firmware: samsung: acpm: Fix cross-thread RX
 length corruption
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org,
 andre.draszik@linaro.org, jyescas@google.com, kernel-team@android.com,
 stable@vger.kernel.org
References: <20260504-acpm-fixes-sashiko-reports-v4-0-529246be6b2b@linaro.org>
 <20260504-acpm-fixes-sashiko-reports-v4-1-529246be6b2b@linaro.org>
 <8e5ad1bc-e404-4247-8a38-aa2a51df24bb@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <8e5ad1bc-e404-4247-8a38-aa2a51df24bb@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_021454_535421_0190DCFC 
X-CRM114-Status: GOOD (  13.54  )
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



On 5/4/26 9:36 PM, Krzysztof Kozlowski wrote:
> On 04/05/2026 12:15, Tudor Ambarus wrote:
>> Sashiko identified a cross-thread RX length corruption bug when
>> reviewing the thermal addition to ACPM [1].
>>
>> When multiple threads concurrently send IPC requests, the ACPM polling
>> mechanism can encounter responses belonging to other threads. To drain
>> the queue, the driver saves these concurrent responses into an internal
>> cache (`rx_data->cmd`) to be retrieved later by the owning thread.
>>
>> Previously, the driver incorrectly used `xfer->rxcnt` (the expected
>> receive length of the *current* polling thread) when copying data for
>> *other* threads into this cache. If the threads expected responses of
>> different lengths, this resulted in buffer underflows (leading to reads
>> of uninitialized memory) or potential buffer overflows.
>>
>> Fix this by replacing the boolean `response` flag in
>> `struct acpm_rx_data` with `rxcnt`, caching the exact expected receive
>> length for each specific transaction during transfer preparation. Use
>> this cached length when saving concurrent responses.
>>
>> Consequently, ensure that `xfer->rxcnt` is explicitly zeroed in driver
>> helpers (e.g., `acpm_dvfs_set_xfer`) for fire-and-forget messages to
>> prevent uninitialized stack garbage from being interpreted as a massive
>> expected receive length.
>>
>> Cc: stable@vger.kernel.org
>> Fixes: a88927b534ba ("firmware: add Exynos ACPM protocol driver")
>> Closes: https://sashiko.dev/#/patchset/20260420-acpm-tmu-v3-0-3dc8e93f0b26%40linaro.org [1]
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> 
> I think parallel credits for Titouan Ameline would be suitable here.

I agree.

> If there is going to be new version, please also add:

There's going to be a new version, will add. I have to admit I'm
impressed by sashiko's review skills.

Cheers,
ta

