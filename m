Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EBAFCCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 01:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EWYacNbOuERW4OojK9bgZfknBThRIQSN+JVixz2GaWY=; b=xubV7p22QHxbn1JrHjWDIJtUzg
	IUXxzJFer5nTyMVuOBcPaYOJ+gJdDJD6KMQCPMA6V5toR+yAht4FE2pRvg6VoDJh7wkl4etutOb4s
	FdANsj/CQBvrN67G+n//17Tq4YNXNRBHR245RPEwEXC5B3Ec8sfO47hpqeB+VkgkqdaaToNqyxDwY
	CxTC8Uz6tFxRt+IBBzq4iLCGSXh0C6YSzLqh1fWqJOT3/r+IYXlPQztHeR8CulB8+0rsNy/QFZ7dN
	OAk24gt308BSgM+B4M2kz3bDez5tP7A07fOs+p8rtLdvQSMA8rvpMuP1NRpqC0ehJb+Im64CpNo0G
	RMq8k/XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDvD7-0000000Gvxq-14um;
	Wed, 29 Oct 2025 01:42:49 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDvD5-0000000Gvx4-2Usk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 01:42:48 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4710665e7deso35161985e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 18:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1761702165; x=1762306965; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EWYacNbOuERW4OojK9bgZfknBThRIQSN+JVixz2GaWY=;
        b=YoWwKAn/YIR1gLuELdl4LxRZApo/qA9e40maQe+O0vgtEsgwH3kla/kGinhWjgdPFz
         vl4zs7iKpzoMMfrEo7D3tcwcaQrZ8fqB14suO7PDt7JVWx8CBEEG7xJLukHDe/Lweqnc
         7/u2Ouw+q7zSo5vWeCVpQPRlL5zfJt0D3cwy4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761702165; x=1762306965;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EWYacNbOuERW4OojK9bgZfknBThRIQSN+JVixz2GaWY=;
        b=eH4PSrK1hyTATjB8ys5tAFI66d+DpMyhHFKIb6iVOZsM46BatHAKr8kLnH83DjgC33
         N7x8WkQWrgqWLyJKBsOPmp1AhfSid71BMy1QeQmq/BL/dffmOck116Vocm2oo9qqCjZg
         53BOUR53ZpQGFOzPilNjNsGpetkhFQWP2acu/q7PKVHvOUob9s4zijnskFrlfA66wUKE
         1qsnsMyiK5T5rPVthPk1RekitXtRFafymi5gJeUAReoVnHl3jNliSGSdl9a6PzbTm/dm
         7OlWqaCpshWj6whCaJ2Fs09sdRLC69w3jnhQpAX49zd/gAsZM9983kwQZdeShz8rDeKS
         j7DA==
X-Forwarded-Encrypted: i=1; AJvYcCXWOQqxbEJOG1APzBU5X0rxskyG0GJ4HVxd4ua9AxjZkFi+cX7kpZyJ0t1yhL7xkhKPwwxdYg10gKOvFkPgNJeR@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2jLSL6QwXXy5SkG2wHdyhKLISbYD+LRxN4gsfZ+etXzuffUcq
	LPbzV4fl5NLQiSbVt6XFc5NtKWqK/jweh14gNb1Sje7deSHiHxIVNb5y2ZDs3E36BJeicMsleay
	a7IaOJIG7zQ==
X-Gm-Gg: ASbGnctTppEqjfj8e10XswO3RvaWmpjLKo4Udp+dFLiiSMIZ/ts7JpWE2qWXtoQUbIC
	g6QODCtFxYgMmEahHUIyu4iReFrs04Q5n0aVfgK1g6XcLvryiM/mXeLiWlOEpRMipViUKEQr++Y
	nDniWaGI0bWOgg/7kxPv4/kjik5hG0rhzKkTjY397P9v1OJRxV9ldJNZSgah6LP8tkckGmXG1Ek
	SummjDsjQbfW/G4Fyc0nb2zNLhXTLW8KZraQIWgoqPHPUz/258Suu9Xm8pemmqyz9601Ix0MaEr
	NjecQXQcDYyZKnSVp6r+dlydI2wBNahHE/8SeqADroU3zxs2TSiKI9tNJ26tOv8+/Kr2FoNn+6S
	3er3uggovdGgfmGxOW5Z9gn0aZbRfh09Msh17Mc8wPw/SmxcCaVG+ZWcslC2gY2N3tnQ+XD4SV/
	BZ58XnKqGMJUqHEdrspnaeEcZw8t+6y16+rf3QRNB2LQ==
X-Google-Smtp-Source: AGHT+IGqI9jtOex3Utdbx/Z1nQq99SV5FMBT/ydoR0q3MNA+77+i7Qo+Sb3m9MO+Mv1x7c12EQbYmw==
X-Received: by 2002:a05:600c:3b1d:b0:475:dd9a:f786 with SMTP id 5b1f17b1804b1-4771e1f4075mr10435015e9.40.1761702164908;
        Tue, 28 Oct 2025 18:42:44 -0700 (PDT)
Received: from [192.168.1.32] (host-78-149-11-196.as13285.net. [78.149.11.196])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4771e196b27sm21805305e9.8.2025.10.28.18.42.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 18:42:43 -0700 (PDT)
Message-ID: <5bc35f89-1b77-4c0c-b6ea-fe9b2cb74870@citrix.com>
Date: Wed, 29 Oct 2025 01:42:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: torvalds@linux-foundation.org
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, axboe@kernel.dk, bp@alien8.de,
 brauner@kernel.org, catalin.marinas@arm.com, christophe.leroy@csgroup.eu,
 dave.hansen@intel.com, dave.hansen@linux.intel.com,
 david.laight.linux@gmail.com, edumazet@google.com, hpa@zytor.com,
 kuni1840@gmail.com, kuniyu@google.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mingo@redhat.com,
 mpe@ellerman.id.au, npiggin@gmail.com, palmer@dabbelt.com, pjw@kernel.org,
 tglx@linutronix.de, will@kernel.org, x86@kernel.org
References: <CAHk-=wiTN=1Sm5DVnXDtQ-tSiPuz-7QVpgP2vt6LgaEnhbubfw@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] epoll: Use __user_write_access_begin() and
 unsafe_put_user() in epoll_put_uevent().
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <CAHk-=wiTN=1Sm5DVnXDtQ-tSiPuz-7QVpgP2vt6LgaEnhbubfw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_184247_669644_C331B288 
X-CRM114-Status: UNSURE (   8.06  )
X-CRM114-Notice: Please train this message.
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

> Yeah, clac/stac are horrenously expensive on Zen 2. I think they are
> microcoded - and not the fast kind - so effectively serializing.

AIUI, Zen5 is the first uarch capable of renaming the AC flag.

This make STAC/CLAC "lfence-like" in practice on older CPUs, because of
an implementation constraint of not being able to execute speculatively.

~Andrew

