Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D0B606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 09:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aHLd+NXM;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=G4VKFj6+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=SgGmwBv2YCkVrgEaoOotmd+kkUUxKWgTOQh7djT+JIo=; b=aHLd+NXMz+6yj/
	bgPz+KzQffXjug1IUMc/5LiEfL/VzK7IpBlQCYsKQgXo8rdRGyr7wuHQHnIc8fxMteofTMZeTUmax
	mV+gnoqKlOyhqblz4nOJGnajQfPHIq3hVbmbxLST4fokdsFuc//jIAsVuDI+DaTg1sQdCnEBoJnY8
	c4l5vOXELGS41UlgUDRpfzpcivM3/UEh3NS50EjgfZTWwjKU8qsxgCLbqm8euoN08dV1iXl98JlvV
	5JMmIWek0gvuUUv1VjlYreKSkmblf+NgQnBts0umFoRqCyjxJ3Zy5TK6YCpGpghZA+VW0Q1Zz+Ga9
	sNcjHorrJMeTcJcUFbSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOXRg-00000004u4B-2EOg;
	Wed, 04 Nov 2026 09:38:16 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOXRe-00000004u2T-0reN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 09:38:15 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-490a0e72588so35501f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 01:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793785092; x=1794389892; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SgGmwBv2YCkVrgEaoOotmd+kkUUxKWgTOQh7djT+JIo=;
        b=G4VKFj6+CmlJkvfHYV2E+fX/JYq/bN73ugC9Lk9Ojt0Zl47jZ9TXOjw+AF/waY1cdD
         buCF2txJBUD5JiSxaIp+sxFvGro7DtKUN1E5dDcND84jHUAwAIDztbyS0okwEVLhSiK1
         RoUBXQ53Kqd7M1UXgJAV7p+mi9LthWfRH6q8WiMXGcXCV2bM330e32T5Uk+sk7BA/3CD
         FRrc1Vno/HBJCfildptev+yC4xX8kO7Lv0BXglkMm9g6RwwZlNtiMMBpqdL77sC/WRWI
         ZWZayRA4HbgcjoudLJtG5GH1S9dCcxNJP7nxJBfj5vSrQO+SqJh7BduwjtfOqpTIEveI
         IHvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793785092; x=1794389892;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SgGmwBv2YCkVrgEaoOotmd+kkUUxKWgTOQh7djT+JIo=;
        b=aIK/jwSsnoa9B9kqrze1oggQKqxkNSi37DKBoARqW8EornWk+7w75J/02NA+MwT229
         AgxmHOxd8Nt45tjbJg2tZWtlbCfMcQ0zJFzeRhCaCJ/eHKroD35l9KuanO1PqunDEcd6
         RITeL/hGOVUgAMAf5sC96CBTmifjisNc+4IrMYO0F2xWOXcXkfg/8+BqlTbYHs1fkioo
         Sb9wvMDIHMbOD8TY6F5hsgIqS2M6+fdBEWLIOX4IHyiYqaG4/bJ7YLKwNNJQ868iTKP2
         ildmJQ5GOW7ybFci5CzbT3dYDzcI2006fVwdnTETgpxL83uw/tmcerXc4lglnqI9w6Qq
         nNFg==
X-Forwarded-Encrypted: i=1; AKwUvBxEZn/lUjtqjJ/RMnLdapAV+nEL4/t8FV3Yo3ZHZhq99ysNMajrxeSW7wovAgUX5HlKgB7Cm58+JymBKonWJ8II@lists.infradead.org
X-Gm-Message-State: APuU4Z9qsqtT9kP2oaUqzNu0yVJ5W7MBM8FWegMr9DBFOL1U4INsdlC8
	vLSXUPlpmHwj6OBN0FGqSP5rGR5mJg4up2eL9RGV9u99fdexkLtxv750agsLG1R9NBs=
X-Gm-Gg: AYBFou1aKSTbILZPVRNfQcdBute/Z9XOSSY8GYUuzMRwWryEVJEjz3Rauv4pK03YQdJ
	11dqTayK218UgiYizFUds2eyCNPLXhmssagcZj2cA4LZqKWmlnAOZtULImw1EdCo06OmDeOiIc1
	qByzJTCw/cE+B8lwKC+Pniz1E/0kKQ09EX9guPt7eSOiQ5U0+Yd8uw9O/uvg4WczeBeW9IEmhvL
	i1t/97AgVq4VllK0ZQvqqTRRc0DxI/9hnem6URF1uTlcC2yDQT9pkznX2UMNrWtjeMpz/3dcdqr
	VblRuIZnVSxDYUJ6PdqFq8teKnbdkVf7frhWRKhTaEg94fnH8046Tdalrg6yERFzoKCtHGpFSfE
	hDfxiYjeC6D9iYqVH01Fh/awzDwEZ3XCJLFwCETc3dw6OH7mwJos2bVNeT0oN7Gwhq1GjjLs/ie
	DV3L8gYs76V/odsSMt88NW25+fxUSOVJU2yPzuJG99yqy0zqdHmbSg/Ic5vAm5NcuR65Wp6MEWy
	RpbCXKNVyRevp90v3VWXHNTub55vPtHbMuoe+pMUia3NZo/y99DeO2/3QFWvOdJfB7/CN8Yvwxt
	nViS9XB+/OhQQW1qfS8fuYzPPDIKu5yyncg0euSYhn/FXuzYIMFDwv6m
X-Received: by 2002:a05:6000:46c6:b0:487:40d:af33 with SMTP id ffacd0b85a97d-48e6e2fa518mr22336653f8f.13.1793785092319;
        Wed, 04 Nov 2026 01:38:12 -0800 (PST)
Received: from [192.168.1.62] (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feeb5196esm2605410f8f.58.2026.11.04.01.38.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 01:38:11 -0800 (PST)
Message-ID: <73888927-18ec-44b1-bb14-72e72860bfc2@baylibre.com>
Date: Wed, 4 Nov 2026 10:38:11 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/11] pinctrl: scmi: select the GPIO function on GPIO
 requests
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
 <20261030-clegoffic-pinctrl-scmi-gpio-v1-11-52d92843ad97@baylibre.com>
 <aunIVW4JeM_P2WOa@ashevche-desk.local>
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
In-Reply-To: <aunIVW4JeM_P2WOa@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_013814_276421_E272FDCB 
X-CRM114-Status: GOOD (  17.49  )
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

On 11/3/26 12:41 PM, Andy Shevchenko wrote:
> On Fri, Oct 30, 2026 at 04:58:42PM +0100, Clément Le Goffic wrote:
>> On a GPIO request, select the GPIO function of the pin, on the pin for a
>> pin-only function or on its single-pin group. Without a GPIO function the
>> mux is left as it is.
> 
> ...
> 
>> +static int pinctrl_scmi_gpio_mux_set(struct scmi_pinctrl *pmx, unsigned int pin)
>> +{
>> +	const unsigned int *elems, *pins;
>> +	unsigned int nr_elems, nr_pins, i;
>> +	bool pin_only, gpio;
>> +	int nr_functions, func, ret;
>> +
>> +	nr_functions = pinctrl_ops->count_get(pmx->ph, FUNCTION_TYPE);
> 
> Is nr_functions signed for a purpose? Can it hold an error code?

No indeed, will fix in v2.

> 
>> +	for (func = 0; func < nr_functions; func++) {
> 
> 	for (int func = 0; func < nr_functions; func++) {
> 
>> +		ret = pinctrl_ops->function_flags_get(pmx->ph, func, &pin_only,
>> +						      &gpio);
>> +		if (ret)
>> +			return ret;
>> +
>> +		if (!gpio)
>> +			continue;
>> +
>> +		ret = pinctrl_ops->function_groups_get(pmx->ph, func, &nr_elems,
>> +						       &elems);
>> +		if (ret)
>> +			return ret;
> 
>> +		for (i = 0; i < nr_elems; i++) {
> 
> 		for (unsigned int i = 0; i < nr_elems; i++) {

Ack

> 
>> +			if (pin_only) {
>> +				if (elems[i] != pin)
>> +					continue;
>> +
>> +				return pinctrl_ops->pin_mux_set(pmx->ph, func,
>> +								pin);
>> +			}
>> +
>> +			ret = pinctrl_ops->group_pins_get(pmx->ph, elems[i],
>> +							  &pins, &nr_pins);
>> +			if (ret)
>> +				return ret;
>> +
>> +			if (nr_pins == 1 && pins[0] == pin)
>> +				return pinctrl_ops->mux_set(pmx->ph, func,
>> +							    elems[i]);
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
> 

Best regards,
Clément

