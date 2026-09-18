Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A14E8C982D6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 10:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TAR8zhCOEVqWXPt6vBsjOMeeQmFuBz9UsZFbgyML5lo=; b=4gu6lgORh/kFu1V2b0QQ7URV1v
	XRbOHJPxh2eViqwUWW2WQIiM3HPqx9zS/LUucGJAegJlmcBaMo30zWLUwbl2VjFDuHpXHMiNkxj43
	kkNlM8HOjk/+2blMOen6EV3ZTDCwF9BhP1FIKfjlWs0X5DMkEH9qWLm/bzghlbxZqamynn1HbBbDi
	jyiBfv+TLKbmhEDa5+K45GUl2ZSvenrbAycaIPrg2ZMFIMwY9Y3eNGqd56+i/LM1tbearNZm5isBq
	JqdnVPyiSaq6Piovo2mR0jTvrlaKzCk3Sjd2DoBt6ZBhSeG+rYJE+verwHXx4dAPImDcMOAssjHrr
	Rii+3XJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7WE4-0000000E9kQ-0PWn;
	Fri, 18 Sep 2026 10:53:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7WE2-0000000E9k0-2Mv9
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 18 Sep 2026 10:53:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=TAR8zhCOEVqWXPt6vBsjOMeeQmFuBz9UsZFbgyML5lo=; b=Ps2YLlJe05O1fdwgiuwOXVoT1g
	9Rs5uaMFfckQPEGyrtzAkPqr3rysQxkBgfikFxiOCIWXcZcpRwxYsTN+zFIyI4lWyix3WFZNVuQ2w
	HVrYe83bFrW0KjXAQMbfOmp4hN51pQSFtG1OSFsyp91SeJlaVYU+Xj+fYO/VcvT0wU4RgQ9mg46Fg
	mzTYrBj4RHayDNL9hyyXnFoKMPa3G9ohhn1w0dTjGLLulX1zLXf5olhY01l7yjlPlQaIiMtTKUABy
	a76uMUTUcUUX+V2KWS82oZquEBKvj3qoVH9dxeXFpyqI7nmV1zyPMxrEQZ8mCgz6ckPWMyQkl50/5
	CE5kmn6Q==;
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x7WDz-00000009xTi-2YHb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 10:53:49 +0000
Received: by mail-pl1-x644.google.com with SMTP id d9443c01a7336-2dd1dcdcf95so3986685ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 03:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789728825; x=1790333625; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TAR8zhCOEVqWXPt6vBsjOMeeQmFuBz9UsZFbgyML5lo=;
        b=NP/AXqZEBj4qh+4CQoloMtTZi3ddfXJFlqPMZ0oDBg7PkRd+q6vW4a50xIMU9kbhmX
         BNr9EX5qrPfvt0AeaeVCKF2xI+kog61j0KQy1ZSq9RtEbunjGBnfJpQ8zc6SoicDKZpj
         cjcDaez3qtzhqDD3cKBKerPbK6KbDqNXNoF8sN4R1Wq7L3A2GEuWD+QnYDAR4V+/5t3s
         m76eNR5thSI4VkiH22Ki2teykprAAAX5Fb/CsNNJLimbdgLgTNtB/giTaIg9GWan+ISr
         ua+RlZU6+F6gImvNbMEzI2JNWJY51dRLkTvq+VUJpgFGm1e9MSXZhVfm9+sMIWGaltOK
         K9og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789728825; x=1790333625;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TAR8zhCOEVqWXPt6vBsjOMeeQmFuBz9UsZFbgyML5lo=;
        b=netAXtO2jm/IftKSUqev7cIf5IuNJPsay3nGioIiJpkNh1Ivg931Yo9v8q9pGebfBk
         fhZYOkUoqD8qH+pFaPgB5otbBD8LXHNU82GCZENHbMCiVzbfkx6QF4pcj0CJxkNcGSw0
         JfEROWhN4x2eTBWROubeV2avYmE+PJVX6oLofvJL5zc23brv2vYnbFK+zAhw0ZhrY5Ud
         Tmn3mIF6Edv+4ytTYklCeL4FR4wIMITU0WA2/e12vpVg8JqpSzESmrdPFF1mZQi2aVqL
         sbGBarzmo3Ol8+7XhM/kITJTKRt0MKXwA3Zqs+ljgSq7nqxyqIWXHmhq+p9DIR1SB7tw
         L3Og==
X-Forwarded-Encrypted: i=1; AKwUvByuJi9DmyXUkeCinYp5/WcinfJudS87fgnbm8KwmMpyIccqC/ladvAQqro3nrbcslY9HPX0jznTW+wAqaqR8kBz@lists.infradead.org
X-Gm-Message-State: AFuF++kdhz393NwtDsz0y0/8ANKzFuZWuLEG/oEFIwyurNj/lm2gbmZ7
	7dvGYx5wR14Vt1YvS4qXmJTyoB+f85pysLVuimW71Ft69Tg7Sd42BDmq
X-Gm-Gg: AYBFou3yBYh+POn3WNB985JGjtzHydyJ12NmBV4Ph54yzVvlvanCtNWjaOjsqM4v8pG
	OiS0mrdYnd0D6j7FWJmwc5HEmHxvrDIhrpjunJMclU0Th6CfVzJj1kTOj2RF4V6DDbfwmtyHVXy
	VhC9l4VOCCOv1jof+7HjQ3SUkqIeOdLl6uITq9w/ULV88P/lNWkA5H26Lb7386WJJcd7LkaUnG8
	gV1W9AXGeTYOMSdpLwzl3M85p3xs9+GA/+Qb0HM01gKnBtIv4YHtAhlIWbFeXvqhseGv0GLfY06
	WGzL2VficeoFFSxAmWflc/qtnSVNw87WXyBXTKa7U6W06iEWHAN+/cw6HlC6/HWhfRqn1cAClrw
	lPAEZjYm984bh48LmkfgL44m6/fuB8m7hoxk0rSD+9Aw4bA9/C+0Jsbw/gU8yvOJTQcNYK3Wzgk
	MmQ2RWXD3RIy98wDmNqPKs+L6QiMTQFYx6qHsO5ibCyoRrtntiaApU0sL92011pC7/zvMQFS1OI
	Y1zSA==
X-Received: by 2002:a17:902:cecc:b0:2d8:d4d2:d139 with SMTP id d9443c01a7336-2dd9ca3f088mr93269015ad.21.1789728825328;
        Fri, 18 Sep 2026 03:53:45 -0700 (PDT)
Received: from [10.125.112.20] ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddb7525b2asm5835555ad.19.2026.09.18.03.53.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 03:53:44 -0700 (PDT)
Message-ID: <1a47d5de-fb68-4c10-a199-f0d274689cdc@gmail.com>
Date: Fri, 18 Sep 2026 18:53:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/10] kdump: reduce vmcore size and capture time
To: Baoquan He <baoquan.he@linux.dev>
Cc: catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org,
 pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, tglx@kernel.org,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
 robh@kernel.org, saravanak@kernel.org, akpm@linux-foundation.org,
 rppt@kernel.org, pasha.tatashin@soleen.com, pratyush@kernel.org,
 m.szyprowski@samsung.com, mark.rutland@arm.com, kernel@xen0n.name,
 alex@ghiti.fr, hpa@zytor.com, ruirui.yang@linux.dev, robin.murphy@arm.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, kexec@lists.infradead.org, linux-mm@kvack.org,
 iommu@lists.linux.dev
References: <20260902073116.802752-1-chenwandun1@gmail.com>
 <aqzznOgILX2pZg7b@fedora>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <aqzznOgILX2pZg7b@fedora>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_115347_723729_D040FF58 
X-CRM114-Status: GOOD (  13.68  )
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



On 9/18/26 16:17, Baoquan He wrote:
> On 09/02/26 at 03:31pm, Wandun Chen wrote:
>> From: Wandun Chen <chenwandun@lixiang.com>
>>
> ...snip... 
>> ACPI systems already filter reserved memory out of the vmcore through
>> their existing path; only DT-based systems currently fail to filter these
>> regions, which is what this series addresses. The flag lives in memblock
>> itself rather than in a DT-only structure, so the mechanism is generic and
>                                                                  ~~~
> The patchset itself looks goot to me, while I am concerned if it's
> really generic. I raised that in sub-thread talking with Wandun. Imagine
> I tried to exclude many driver regions and split memblock regions into
> hundreds, cma could yell out: cma_declare_contiguous_multi()?

Are you concerned that setting the MEMBLOCK_NODUMP flag could split a memblock
region into many smaller regions, which might then prevent
cma_declare_contiguous_multi() from satisfying a multi-range allocation?
If so, IICU I don’t think that applies here.

MEMBLOCK_NODUMP is currently only set on memory that has already been reserved.
These regions are excluded when iterating over free memory, so marking them NODUMP
does not increase the number of free regions seen by CMA.


Before marking NODUMP:

  memblock.memory:    [ free ] [ reserved ] [ free ]
  memblock.reserved:           [ reserved ]

Now, for memblock.memory, it is one region that contains free and reserved memory.


After marking the reserved region NODUMP:

  memblock.memory:    [ free ] [  NODUMP  ] [ free ]
  memblock.reserved:           [ reserved ]

for memblock.memory, it splits into 3 regions, 2 free regions, 1 nodump region.

Although the memblock.memory array may be split internally, it does not create additional
free ranges for cma_declare_contiguous_multi() to process.


> 
> IMHO, withdrawing the claim can fix the nit concern. If I am wrong,
> please help point it out to let me learn more.

I will revise this description to avoid any misunderstanding.

Best regards,
Wandun


> 
> Thanks
> Baoquan
> 
>> both ACPI and DT systems can benefit from it (suggested by Rob, thanks) [1].
>>
>> Since the reserved memory regions are filtered out, the vmcore is
>> smaller in size and faster to produce. 
>>
> ...snip...


