Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F081C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 10:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e3m3Sg0+bVIJxu2EZBhejSmz5ffY//z82ft5OZBcPQk=; b=mPmxMG6/Qw3oazGr5UZmWZ7zBY
	ygJktniKXAC8+M+Ykl9Nc5QUVn9tmF5NAiyYd69DXAFwnAR/jpc1lvPzB7wRo9SGcv9gqOMcze2a7
	13eit2ZMxZToI0o/Zqh5ZVQZGRp9LApYDmGeNR4HCKniRi2gfn4TR5CDqiV9tvzrzEnC5lSuRsInW
	1ZLj4lfz4enDBAPW1GXApbi6rogU89rW5ngN/9LVNJBwIg36Iy+4U0KvKOa8UhoDbypHwAPEVuESW
	6pa+7+9ZKTnr2Rm5Vyc57++r39GOCPpLlEF5/wX1MCODlpDy653Dvz+mU4YVr8qOiwDHYAiI5aQ0I
	ffAvObdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCc2q-0000000F7Rr-34Wh;
	Wed, 07 May 2025 10:30:32 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCc0M-0000000F6sW-3qvA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 10:28:01 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-ad1e8e2ad6bso156224166b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 May 2025 03:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746613677; x=1747218477; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e3m3Sg0+bVIJxu2EZBhejSmz5ffY//z82ft5OZBcPQk=;
        b=fQvzg4dKATF2rn3BZgRViutCDyNBbiJiot20GjJaWa1hzYhBSg2gESyQ2xYLAycOPp
         Py3f/KihjmB5J+DxgDtETUwqb+m5QM/MpdeBO3lyiXcDKN4vclkUrYrkUcQ8T3bMyXVR
         bM7vr8rrjITi9y0PvfW72Iyi7BeF1jjRfaLjkGtE7xC8arA8Qv2J4rrJv36YWcEf1u0t
         2iQlCYvEnEuD1XI8cQJQ7G6QTdlTtX+pcYRDIm60qaiSeu2+YfQvJRpAvTsJoGpKhprb
         +OHiOfEIRQEptEls+oqz3/zqrYDHlhqu7CU8n6CYslbz9KlC2bG23Yj5qVNfP0zmaDHw
         3kVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746613677; x=1747218477;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e3m3Sg0+bVIJxu2EZBhejSmz5ffY//z82ft5OZBcPQk=;
        b=DF+NXp3rJoPrrCAcsvzNdpETT/2L5x83LBkFSL8Qa+xQkcx1p44EPjh5EGUPOGkvK/
         vTOPmrEHhWn/9AiA4b3uq/V3MhaQDOJtcSrnZw4AUYeGc0SF6jRAHRlmI9ASe6GfRqjj
         DG/d7UEddVbfbv/Z7wHe89uu+6pz4kSvfAx3Z0HD1/aLV11VI4cuU+SbhXoPJDyAxNml
         OHRtuAODnUOiDs2wnVYPkVcb1hOns0JMrBFHPQy4+RlC+PB3LRbKEsZpfeUjucGdSRDv
         MqKbndvBQYo6XkXpleHMLfQ4Pq4J4pKhk2HVTwIfiJQRGKuj3w32rnOCzjaAryysx4na
         pCAw==
X-Forwarded-Encrypted: i=1; AJvYcCUWGV6Nxypx39XmalyuHZWlUkgFP2gcvQTOhpOgDU0QW9OROdmE0DCLCuEmJFSkUek4kqyeF052NruLttoNttGb@lists.infradead.org
X-Gm-Message-State: AOJu0Ywp/y5l29sB1sgxkBK+rCp2grCe3Mb7O4aqBLEzRXTgHOlqTuml
	9v1LtswsV77uWIKYDdrEqKeOFaDk47GuWde8D6TLfN1LrO0G+oh5DMaFi+s/ZrY=
X-Gm-Gg: ASbGncuMIGp55VyyEhZr+HkkRho8qKihjNZMgqrHJHPmU2N/peabODB89obmmniILrW
	57Ymmo1sH5eSMFSnscINO7XaqTkKAY8rBiWqf9OSF6PhHO/sWIG+d+AGgIe4vPPt6ZV/B+9/k9x
	5q/wkUq6LD7wzS6eZNXnh9kNw5FIWjvkRzjmPFCoYBugTpLCJ58JtPZgQF3A+E9ifI9lxBak8qr
	3uGKGkIT2bVQIAfZba//oq0hWNbS5KgW5Pz0zvW54Ujhqwk+S5G5X52VtcatvTSq+KcD543fdm3
	0bRNtNPAn4zPDxrAufme58s1AHsEpFeqVgbfKcMMeBvupeYB
X-Google-Smtp-Source: AGHT+IGcySqujnpgP/KzWefd3PmSmn8wVFheaUVYXa/h4ueAk588Gd+cTopnd3x4abbh2j4LBSSshQ==
X-Received: by 2002:a17:907:1c9e:b0:ac6:fe8c:e7bb with SMTP id a640c23a62f3a-ad1e8e2bd6cmr275060366b.55.1746613676715;
        Wed, 07 May 2025 03:27:56 -0700 (PDT)
Received: from [192.168.0.32] ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad18950ad15sm881835766b.154.2025.05.07.03.27.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 03:27:56 -0700 (PDT)
Message-ID: <1331aa82-fee9-4788-abd9-ef741d00909e@linaro.org>
Date: Wed, 7 May 2025 13:27:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH 09/14] genirq: add irq_kmemdump_register
To: Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, andersson@kernel.org
Cc: linux-doc@vger.kernel.org, corbet@lwn.net, mingo@redhat.com,
 rostedt@goodmis.org, john.ogness@linutronix.de, senozhatsky@chromium.org,
 pmladek@suse.com, peterz@infradead.org, mojha@qti.qualcomm.com,
 linux-arm-kernel@lists.infradead.org, vincent.guittot@linaro.org,
 konradybcio@kernel.org, dietmar.eggemann@arm.com, juri.lelli@redhat.com
References: <20250422113156.575971-1-eugen.hristev@linaro.org>
 <20250422113156.575971-10-eugen.hristev@linaro.org> <87h61wn2qq.ffs@tglx>
Content-Language: en-US
From: Eugen Hristev <eugen.hristev@linaro.org>
In-Reply-To: <87h61wn2qq.ffs@tglx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_032758_963367_77B43D94 
X-CRM114-Status: GOOD (  17.20  )
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



On 5/7/25 13:18, Thomas Gleixner wrote:
> 
> $Subject: ... See
> 
> https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#patch-submission-notes
> 
> On Tue, Apr 22 2025 at 14:31, Eugen Hristev wrote:
>> Add function to register irq info into kmemdump.
> 
> What is irq info? Please explain explicitly which information is exposed
> and why.
> 
>>  
>> +void irq_kmemdump_register(void)
>> +{
>> +	kmemdump_register("irq", (void *)&nr_irqs, sizeof(nr_irqs));
>> +}
>> +EXPORT_SYMBOL_GPL(irq_kmemdump_register);
> 
> Are you going to slap a gazillion of those register a single variable
> functions all over the place?
> 
> That's a really horrible idea.
> 
> The obvious way to deal with that is to annotate the variable:
> 
> static unsigned int nr_irqs = NR_IRQS;
> KMEMDUMP_VAR(nr_irqs);
> 
> Let KMEMDUMP_VAR() store the size and the address of 'nr_irqs' in a
> kmemdump specific section and then kmemdump can just walk that section
> and dump stuff. No magic register functions and no extra storage
> management for static/global variables.
> 
> No?

Thank you very much for your review ! I will try it out.

Eugen
> 
> Thanks,
> 
>         tglx


