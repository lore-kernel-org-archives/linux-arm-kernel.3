Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3966D6408B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 21:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GRdQwIjYTXd+4NEuzioQ9bORHEAmWVZm97bkocK9N00=; b=3qW44ME0ZtmlBGdkz0Fq/8ashU
	vLSHmdaJCzBIXMSyXOvOCtJSnu8ojQPPs1uY1bJ0/FuaNcznUk5y/qcMYTizMwVLka+xFeLc/yu21
	pd0O7v29PmXYZ/cZrDLT2Kai7Y4kc25jgI6HTeO67Cg7zk2LJN9Cxn9O6GZ61l3CYYSNKSYAZAGRi
	amGzcUKz8oK8vLsmXQvMx/pLoBls+2XXSqgEkgcvQnLtW15AZEynIaCr+0q5PlxHdoXwo3M6qgH0Y
	mNa9rt4uSZtWbGDZMC2sS0elRQul0xGlRv8sXqe216L3kEj4n8VXpkPZ/RFf+o6VDZ8GOTsAeE7Yr
	D6MS7ZFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9WJh-0000000C0dr-39c1;
	Fri, 08 Nov 2024 21:14:53 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9WHM-0000000C0HE-45hz;
	Fri, 08 Nov 2024 21:12:30 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a9ec267b879so421685766b.2;
        Fri, 08 Nov 2024 13:12:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731100347; x=1731705147; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GRdQwIjYTXd+4NEuzioQ9bORHEAmWVZm97bkocK9N00=;
        b=OrfbKmohOx1wjiUEIynvqntj6rSZnYpykR4VO6im2W/erLZfdkaNlLuT8EksGyouXB
         TnQb+9OFVtztEQUs8DdSsjdR1QbzxH4NYuhEjB8D68ddXJFZkySDnOkAcB3sqrPzEstV
         9DflFiAXfEai5xq9TbdfCQrDZdW9LK4m7nO9Lu+PbZ/WoFR95hLsShgAWo4t9T3U25qQ
         NRIBrUHLQ1YNXc2bh28BUOKI2wMU3bH1f/P6lWr4ItUAbaABlgHR+cixb04v0+L03OrY
         houU28CrQRSKLAw97IlPQdZ641KC1chzeolWN6KP1L6zRcjUlEUUGeida9NNyf+U0EFK
         uSbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731100347; x=1731705147;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GRdQwIjYTXd+4NEuzioQ9bORHEAmWVZm97bkocK9N00=;
        b=d+4BWWqLNbZxuaVA3O20iHICUU30sCaqydeM3EYx09a5jOCSU7dDO4pzi8TfJvtYFO
         iBBijGQnCRS1Td64/HwtW28We36swVSGiU5GExFtUEvBckdIWBSu5/UpxX8PTd7tVA8o
         dc7MLiDqwRHPSNLSc9gD+6pGRO8xImXzT5ljtQEgxfwL8KgNalfJnxUYcPakTeDRYrXo
         J9q1sD57D29tjicKFG2zpHC8oPtpdMCA4YrPDbXBZgVMeTQ5tdTVf1cOOMUtg87Kd7DT
         UajfPrnpKxmK5vCiAl1/xu/ybYWdb33TYQ7deKQYCLTx0iLjgpwhkkBSz3bpZtm8GOQ0
         E8HQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUkOxVFD+jKml7vWtNKSV3tVYNTqZbhZD9PG4r4Vv7qMuDZoG6RkKBkRrzprEeeOKPENZ8qenkuAloMtn/@lists.infradead.org, AJvYcCUrx2aPEfJEWpvufYMz5K6/ojNlSJ0LXRN/40afl9CAQQ/g1av+XQrrCooFPYYThQHykbfkXBmWdZOrRyNWPe6nEg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxAZ5hKS65WCsSCEn8TYikCsojjlJJK2JztzvOhvXiDGM0sGrmK
	QwMBwRFyAKhI5E5BP+LaA1Q5H60rI07wMcozdsOcSeajgyT1H8aP8avnVA==
X-Google-Smtp-Source: AGHT+IHfY3W1P44D/+5X9Mv0Lkn3gsjpDpWQ1OX+M+X9kDBgfznn45mROOfa6ZjrBV4O4N507XYBgA==
X-Received: by 2002:a17:907:1c20:b0:a9a:558:3929 with SMTP id a640c23a62f3a-a9eefff12d2mr426112266b.48.1731100346738;
        Fri, 08 Nov 2024 13:12:26 -0800 (PST)
Received: from [172.20.10.2] ([37.63.10.207])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0dc4ca5sm279171866b.95.2024.11.08.13.12.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Nov 2024 13:12:26 -0800 (PST)
Message-ID: <ce5d812c-9d92-4ad5-8111-106968dbdd70@gmail.com>
Date: Fri, 8 Nov 2024 23:12:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] dt-bindings: clock: actions,owl-cmu: convert to YAML
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Andreas_F=C3=A4rber?=
 <afaerber@suse.de>, Manivannan Sadhasivam
 <manivannan.sadhasivam@linaro.org>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241107143431.728669-1-ivo.ivanov.ivanov1@gmail.com>
 <a4begcrmbtotl2imd3eaxpdveagvwridy6ev5zmwzvjqt3ovfq@wyj2dj73xe3e>
 <d5d3f934-4f1c-43d9-aaf9-8de194d1f3b7@gmail.com>
 <CAL_JsqLkdXKGve5tB_cdO9bG9ge923Hbmkz+1BghLc+KkkDo+Q@mail.gmail.com>
Content-Language: en-US
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <CAL_JsqLkdXKGve5tB_cdO9bG9ge923Hbmkz+1BghLc+KkkDo+Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_131229_037558_37254C29 
X-CRM114-Status: GOOD (  20.35  )
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




On 11/8/24 22:56, Rob Herring wrote:
> On Fri, Nov 8, 2024 at 2:31 PM Ivaylo Ivanov
> <ivo.ivanov.ivanov1@gmail.com> wrote:
>>
>>
>>
>> On 11/8/24 14:16, Krzysztof Kozlowski wrote:
>>> On Thu, Nov 07, 2024 at 04:34:31PM +0200, Ivaylo Ivanov wrote:
>>>> Convert the Actions Semi Owl CMU bindings to DT schema.
>>>>
>>>> Changes during conversion:
>>>>  - Since all Actions Semi Owl SoCs utilize the internal low frequency
>>>>    oscillator as a parent for some clocks, require it.
>>>>
>>>> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>>> <form letter>
>>> This is a friendly reminder during the review process.
>>>
>>> It looks like you received a tag and forgot to add it.
>>>
>>> If you do not know the process, here is a short explanation: Please add
>>> Acked-by/Reviewed-by/Tested-by tags when posting new versions, under
>>> or above your Signed-off-by tag. Tag is "received", when provided
>>> in a message replied to you on the mailing list. Tools like b4 can help
>>> here. However, there's no need to repost patches *only* to add the tags.
>>> The upstream maintainer will do that for tags received on the version
>>> they apply.
>>>
>>> https://elixir.bootlin.com/linux/v6.5-rc3/source/Documentation/process/submitting-patches.rst#L577
>>>
>>> If a tag was not added on purpose, please state why and what changed.
>>> </form letter>
>>>
>>> I cannot add other people's tags - toolsets ignore it.
>>>
>>> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>>>
>>> ...
>>>
>>>> +maintainers:
>>>> +  - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>>>> +
>>>> +description: |
>>>> +  The Actions Semi Owl Clock Management Unit generates and supplies clock
>>>> +  to various controllers within the SoC.
>>>> +
>>>> +  See also::
>>> Single ':'.
>> $ rg --files-with-matches "See also:" | wc -l
>> 110
>>
>> $ rg --files-with-matches "See also::" | wc -l
>> 94
>>
>> Having 94 matches of that out of all 110 definitely leads me to
>> think that this has been done on purpose, and is still being done.
> 91 are QCom and 82 are QCom clock bindings... They tend to be
> annoyingly consistent sometimes with whatever was their downstream
> coding standards.
>
> The double colon is needed in rSt documents to escape a colon. We
> don't need that in YAML though. There were some thoughts on embedding
> rSt into the bindings for generating documentation from the bindings,
> but that's never been more than some experiments. This just looks like
> the first QCom clock binding did this and all the others just
> copy-n-pasted it.

I see, thanks for the explanation!

>> Could you elaborate a bit more? If it's wrong, then shouldn't we
>> clean all the other bindings from that mistake?
> Patches welcome...

Will look further into it the following weeks. For now I'll send a v4
of this patch with the issue fixed.

Best regards, Ivo.

>
> Rob


