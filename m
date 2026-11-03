Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C714606EE9D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 09:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=o1l0ybp/wLFt/F4zJKLBbBtJhS+ZACVIUqUnoSjbmw8=; b=2JiczsnH28ma7+tSNZiP82GE8X
	+G8CXvncGUbziwEzPCezJnjUQg/ZPg9TfR9ut9M2onRlFwc2cxwCaqQxW0FLRH4Dymx88tvmcys6u
	GvJa1g6ABQ6SwY6Q4XlqTEoAc4QIXsymOXC4vhiXjOVnWtUL+kPKZQLCp9z/VUtyXWBi1w8GpQo2l
	7P06b2Xx33IE8Ywqn6bhVzB24fGTvFIR34OsPxcV6eFCGRUOH0y2kVfA/NayAPyEbylReN3nhZ2fQ
	Qjy4QRchnD0/DoKJGpBP00CzTOYVlTmqtThrLg8f8bvK88V1UHU5CfMW1TkQ7yxLs6rkikYHcNrwH
	WinJTIIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBHh-00000001rVG-0Roq;
	Tue, 03 Nov 2026 09:58:29 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBHd-00000001rUj-2SXD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 09:58:26 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so3116722f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 01:58:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793699903; x=1794304703; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o1l0ybp/wLFt/F4zJKLBbBtJhS+ZACVIUqUnoSjbmw8=;
        b=Kw93dyJAL/Mil3eHkZ+0QBgyFYwxtRMLWKW4o6YD6FvKAz578G2Q7wFlFO7XdoJyls
         kkmDgIvC94Wv9rmTjr4P1dumVqkhAPvWMuUVSPX/o+dKUTcWRnZGGZsDv6yGgYvILEyX
         1rcyNBDgnEEL7jiJcMAppd3+9usuTWY8FIINaI5j+f+USfAvO9zlC2Bg+J4c+SDcRAxZ
         XhMunekez2SkoIxFNzk2TJXXfVWcHfKazARYbrFJWTacG7McfoE47YL3bbIYVSVhrCTB
         AJTvRLj124fGnxdMSMvwsLCgQOLkFtuCiOrD7Ar7bcOHDtvG0rvSQtY8GzmnZTEleAL0
         FvQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699903; x=1794304703;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=o1l0ybp/wLFt/F4zJKLBbBtJhS+ZACVIUqUnoSjbmw8=;
        b=BK2RhLGTT6Yj3QzjgsleX6AY042QPRyO3ao+rm3EsnbzW2+KpRNeACR2Tm1y/ryxRY
         33U+BkRE3BvGejr2zsbDM6DbkiAMdGOy/F+h10WHlaThK+qc3rfwREzaXC/M0RCBkVcp
         xmZihyvWA2drcNBOtdtPsZL/JSVHcYAVLgDev11AKiPB5ny9BEMyH+DEaH158fM3A+5b
         NrpDdTxo2sUEl+OVL6UfXMWLZYj4kxKkvLNHeOzXIapCe6WLvgdQczY6iUb8ix/iy/CL
         SPE8nrkWzvKn+6z8pMPHmbLDZQ/RWgCwf1tV2PXGL4BxnV2nttpVeyPXAeWY9Zo6qmxC
         vIOg==
X-Forwarded-Encrypted: i=1; AKwUvByda0eze1uP5kED5iUsDGyHFZDInku/gpfrZJNAFWUzc+Fwajy6wa6eS3CPEeOsZO3IkVkeMC7JNTw9SdW1cbwY@lists.infradead.org
X-Gm-Message-State: APuU4Z8//4s1DnVO9mwcC3S7L3uJVZdRQGWv0RnR18j0zJ08Y9r3ARlG
	vMXspAl2rugZZ0mIRgskn+IOCX9c8RLRHu/f6Pm5Nhhv43iG2QU+AquS6ZNuBMoAex0=
X-Gm-Gg: AYBFou18KJAUxTiQC8FaXwQ/T62FO7B5uSTwW4bf3fQyYtn9wocbifvLVkTjjGS1i8w
	O70y0tVn6HuJKoEGqWks6B0lX/Sb/OqA4QJCrlyAUIPXiE08B1xF7mI0ABBuBZ8Vz7At+yD5cKx
	YbdWN0CKgN4+ryCZf176jwrZzWnCE16LcywvlLrm9faXAUKbQhSNUZ0ohQ8WojqoWJBjxhPZZ+B
	CL+p4r5OqBN3Ww851pYMd50ZznQgugcusE63VYbySU1dTnH3/fBqk0oxMPrmZ46l9sa5x7Moy1E
	oK3CkrOR38tvFI501TNDROOYZ97a/223k9fEYr3suqxqbo0QdEwAyldGM3qjrsYRU4hsrcXAx/2
	zzGvuNWClO4LzPW2ktJLFUYTkGmWBPRtmDDc7Fa8NUHcLBD3RjpaqTe/OXSRMNdIyenGf8WpopT
	IZhzanHe4M0inYhq/fQVXf+MbywvFR/dVX+khvnxlsDJP97OAu8wolBy5JtMcLXd7L81SwjTID9
	uWHG0hFNEmo7Y+70tQ8UtJY+j3AX20LNlvuvjpu+LMbj9JBsd5Hc/mO5imDPOPNgOnGQDWCHlNX
	Q2TJfPEducbUviGZgZFFhwiiuwbyUiRufjYTyNqSMpKnfea86nTwc2i+CxiZFNHDEO+eyqUYa7B
	fD44wVmE=
X-Received: by 2002:a05:6000:2b0e:b0:48d:eae3:b9df with SMTP id ffacd0b85a97d-48e6e50c88bmr21777860f8f.35.1793699903396;
        Tue, 03 Nov 2026 01:58:23 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:95a2:4869:9f46:45f0? ([2a01:e0a:106d:1080:95a2:4869:9f46:45f0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b723bfsm22710550f8f.15.2026.11.03.01.58.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 01:58:22 -0800 (PST)
Message-ID: <cf6437a4-b7ee-4b4b-acd2-bac3ea3f14fa@linaro.org>
Date: Tue, 3 Nov 2026 10:58:22 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 3/4] Input: goodix-berlin - set default resolution before
 parsing properties
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Hans de Goede <hansg@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: Val Packett <val@packett.cool>, Hendrik Noack <hendrik-noack@gmx.de>,
 Ferass El Hafidi <funderscore@postmarketos.org>,
 Sasha Finkelstein <fnkl.kernel@gmail.com>, Jeff LaBundy <jeff@labundy.com>,
 linux-input@vger.kernel.org, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261103044708.2461481-1-dmitry.torokhov@gmail.com>
 <20261103044708.2461481-4-dmitry.torokhov@gmail.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20261103044708.2461481-4-dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_015825_665589_409974C8 
X-CRM114-Status: GOOD (  17.93  )
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/3/26 05:47, Dmitry Torokhov wrote:
> goodix_berlin_input_dev_config() currently configures the default
> 10 units/mm resolution on ABS_MT_POSITION_X and ABS_MT_POSITION_Y after
> calling touchscreen_parse_properties(). This unconditionally overwrites
> any axis resolution calculated by touchscreen_parse_properties() from
> touchscreen-x-mm and touchscreen-y-mm device properties.
> 
> Set the default resolution before calling touchscreen_parse_properties()
> so the default resolution remains in place when physical dimensions are
> not specified, while allowing touchscreen-x-mm and touchscreen-y-mm to
> override it when present.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>   drivers/input/touchscreen/goodix_berlin_core.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/goodix_berlin_core.c b/drivers/input/touchscreen/goodix_berlin_core.c
> index b0938a4f3fec..5cf453427eeb 100644
> --- a/drivers/input/touchscreen/goodix_berlin_core.c
> +++ b/drivers/input/touchscreen/goodix_berlin_core.c
> @@ -626,8 +626,6 @@ static int goodix_berlin_input_dev_config(struct goodix_berlin_core *cd,
>   			     0, SZ_64K - 1, 0, 0);
>   	input_set_abs_params(cd->input_dev, ABS_MT_TOUCH_MAJOR, 0, 255, 0, 0);
>   
> -	touchscreen_parse_properties(cd->input_dev, true, &cd->props);
> -
>   	/*
>   	 * The resolution of these touchscreens is about 10 units/mm, the actual
>   	 * resolution does not matter much since we set INPUT_PROP_DIRECT.
> @@ -636,6 +634,8 @@ static int goodix_berlin_input_dev_config(struct goodix_berlin_core *cd,
>   	input_abs_set_res(cd->input_dev, ABS_MT_POSITION_X, 10);
>   	input_abs_set_res(cd->input_dev, ABS_MT_POSITION_Y, 10);
>   
> +	touchscreen_parse_properties(cd->input_dev, true, &cd->props);
> +
>   	error = input_mt_init_slots(cd->input_dev, GOODIX_BERLIN_MAX_TOUCH,
>   				    INPUT_MT_DIRECT | INPUT_MT_DROP_UNUSED);
>   	if (error)

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

