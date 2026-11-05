Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC71606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 12:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0WF+d2Bm;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=T9XQP6Eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=30cvqab0GneMjzQY9b3Yhah4cXyfQoNJoQir3EuyP94=; b=0WF+d2BmKLjzIp
	KY3PUG64r27d0ItPE8MpRd+d3IQeRhrGLC6sIzSEoaa6tciFxhmTnFWib+lUkKqcc+qitKBCBlr9a
	nbl3o/NW/ToFy1eXmIOEvE0uEiUo6hFyrWyL2xLyMcKIW7rKQn9OcIHaFvqjbAXgFK85HMTVFReCt
	aJUdiQcM4apK62z3hJodZJJDDLg4GXiK+R70hxuBB9bEyRxxjfKZXWDDcnua5OnwH+z3blpcqkVQP
	y6E+sOKgom8hgs/iNvkdijYvdvwLsBsTOLVbSOiQVHB8gnyWQeFENTJaHkuPzJvjnuF0WhEPDbkt3
	Dp26Vf62ZUeG4bgtii9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOx3K-000000092Yv-1mIV;
	Thu, 05 Nov 2026 12:58:50 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOx3H-000000092Y4-3aGI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 12:58:49 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so15767505e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 04:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793883525; x=1794488325; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=30cvqab0GneMjzQY9b3Yhah4cXyfQoNJoQir3EuyP94=;
        b=T9XQP6EuVjldm4J5rZhqZGHkMY1tjFrMmAbsDJh3svOhqs54GWc5OztZkuzxHUhXQn
         hSQLs6Y5/Q71kic7ou1I/4gCyK9me1RJwVE/L66msAwNL4q3/kMsXynxe4o4Td4Tuggf
         3e9Yvl/1iqz0D9VzzYyNPF7U5YG69c56ySeI3V4vvq2UOw84o/KHrVvJ0SwWiEhwew5z
         d0EeJXDdJQAr2PHdYcU5TXMVnmEm8tq6lUaNxAc9EGE+qS8Sxq2sNQAtYr5Dx0AaSXQz
         +8vIp8GF9cUbBKauGkrWemOfFWFKAUMsCGn8g8EIrjqJznFwY9CN1jnLSkQCU2k3SA9/
         lbvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793883525; x=1794488325;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=30cvqab0GneMjzQY9b3Yhah4cXyfQoNJoQir3EuyP94=;
        b=OitXWrREKFHp7eJQjjrJLOnJpq+0Tios7gFoqn08FN3sXZeNoBhmJ6d1Tqxj4KCQOD
         wCc75teSmc72OCnvncAFgT1s6Emjhv3tj9hoyH21jOK/hqovo1mzI+r5ThtyQNmyF0m6
         rB3O5SejgGwpiAUoWpSok11+hcBIg41yNWJ6EOaSaj1Jd2MTMbdeMSFE+UFcMdcSZ19p
         Bd2Csk6CemDfIJ7Ni+71yvAZ0KXS0CmpADChuTXzzQt/HK3jhff2Jb2NpS1R95ctK2TF
         JmLUy3Zk0Ovi6HS7TXMlE9+Ii6yTo5Ob6GugscVf3zV3HQcsoauDh3Hb91l+GCJNjvHT
         SAfg==
X-Forwarded-Encrypted: i=1; AKwUvBwCUAiqxssrAJgXPmNHYGXKVc5QJeTLGkYQPRUSnCukPFfvB1SEE0VdZRD6ndvhUC4zMrtvc3IFSMGzLy+l3Fgm@lists.infradead.org
X-Gm-Message-State: APuU4Z9f9S3riRsUJh3U5HpYkOrDspVPgDcbJdDUQJXtIFRxR01n10jI
	01x3KslUMV8ZBrOvx+2WL1AnNoJvk5Lph8VUEdeWRB2lGfpRxrmLsN1zeljhz55sZlo=
X-Gm-Gg: AYBFou2HJpg7P9boxzzYA658bWRzUy0HkU43b4CiQGgAX9ww11nI/ahiAwHM5Xlps+8
	hlTYKDWq2OhDeXFUSakFJ8p7OwsJtGio0AwGw2JoaZ13thfHYPU6tzSgPvOainQ67Bf56Afw69G
	sQRM1CYOlHKG7EJA1IypK1OxxQhrK0Zo0Da2Y6/kpjtQoQrYI+SnydLlV9IXYo1UtNI7lDJwdf3
	0YSJylFxqjOupR//9yynSL+tqOH/EXuNsJBnBeym6O+4iDYjRPxVqqr2AicxwUcXAIgkr3EQJiD
	H64yYgvjxwdqhz9AJ9v2ZyTk3H+fdWhUT844wFQVPOLci4O2gfaDk9oLXhvO6FyaGew42kHw2Uo
	oSWr41kjbVAvUloHS3ut9coKD1F3EXWwQOIqz3o2XBuYSupwXewkY5oFDsWo4G1pFNQDiva93Eh
	As/A2anxhplx5t9W6UTnfVQERUy6TGelTrOdY0Mt71N0V2uKLPZ/jmj0XH+VL4lrvu9xFTJB9Nl
	MlePRLLpC67ZkAIOefADIBt/Q6S9qovdfSedck6KeqO6Hya5RyXSpTRbpHVvQnlVFTie0hLwZRl
	dLjHQWX2/w/WuqvNbsPrmRTT4Xeq7SYx4djI+qyPHYa9wzq4Ux2TJu6f
X-Received: by 2002:a05:600c:6212:b0:4a4:de70:2ad4 with SMTP id 5b1f17b1804b1-4ac17ffa395mr401888755e9.22.1793883525271;
        Thu, 05 Nov 2026 04:58:45 -0800 (PST)
Received: from [192.168.1.62] (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b63863d490sm27861675e9.2.2026.11.05.04.58.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 04:58:44 -0800 (PST)
Message-ID: <56932f47-2e35-4152-afc6-6cd41c8393cf@baylibre.com>
Date: Thu, 5 Nov 2026 13:58:44 +0100
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
 <73888927-18ec-44b1-bb14-72e72860bfc2@baylibre.com>
 <ausPFWOj-usp084X@ashevche-desk.local>
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
In-Reply-To: <ausPFWOj-usp084X@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_045847_906909_1C4C0168 
X-CRM114-Status: GOOD (  11.54  )
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

On 11/4/26 11:55 AM, Andy Shevchenko wrote:
> On Wed, Nov 04, 2026 at 10:38:11AM +0100, Clément Le Goffic wrote:
>> On 11/3/26 12:41 PM, Andy Shevchenko wrote:
>>> On Fri, Oct 30, 2026 at 04:58:42PM +0100, Clément Le Goffic wrote:
> 
> ...
> 
>>>> +	int nr_functions, func, ret;
>>>> +
>>>> +	nr_functions = pinctrl_ops->count_get(pmx->ph, FUNCTION_TYPE);
>>>
>>> Is nr_functions signed for a purpose? Can it hold an error code?
>>
>> No indeed, will fix in v2.
> 
>>>> +	for (func = 0; func < nr_functions; func++) {
>>>
>>> 	for (int func = 0; func < nr_functions; func++) {
> 
> With the above in mind, the type of func has to be adjusted accordingly.
> 

Yes will do

Best regards,
Clément

