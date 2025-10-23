Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F630CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 20:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y4TTOO2cgFz3W+ccXXdCSitozQat0wJ24BVv7Ue1CUk=; b=lsagatHvHlXZwjrRftbti5CT4S
	oYSDyAJdzObNN33FwxrDaEK2Gov0eDDAteYU5BcKCzi/omaml2zPwMK05YOqdxPoD76Kq2vZrX9Dj
	gXfl8tfybcbQOBUoJZ4hdTcXAm5uQmU8bzXu1YC/8A2TOmBMDaOsslVjMscmPrITI+L4wm2AqYyqt
	InhhnWD2Aa1l65ONhM7+/mN49gRKR2KYctLygwsJHsRa5SG6tWKGlQV5oC2aqOILGQ4aWPj9do75a
	fgRtVteA5LXF/W5T7u5ig85zL+JdXhGY1QPDCKc9TDHK1pLvGpdInX6snToYtBK3biAUfl03D2sxg
	NBs9fO6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC1X7-00000007UAP-36VC;
	Thu, 23 Oct 2025 20:03:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC1X7-00000007UA6-0RpL
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 23 Oct 2025 20:03:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=y4TTOO2cgFz3W+ccXXdCSitozQat0wJ24BVv7Ue1CUk=; b=ZgporGv7HRMtjFExLmuAZrbwcl
	15vG1h98kS0U7uUnr505RPGI3esIBtY7Z6ioOGZp5OEFpYNOx0p96TifULmnMqxvEh42T5LPsTcyK
	4wCVDvDHq4YJS93bfJAUb4+nk1eduS9Y08ukiDyHToK/VHNcFM6MZ9c/mniVDEm051OI/1KT8TtZs
	PiaH1Z34g3+szQaSb8D4qk9yYGCIUhsbESeXDIctwdgg3qKRCUSHvQjDAXXLtmVaEi7Dw2rbeYdX0
	DvuI7XVG5GaLhBpPyg/lOPRZqB7DbUeKE+HQJ04nqjF0vcrqbGRjHZO+pRRraX4DhX1oll85qzRZ5
	9VIBDI9Q==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC0ej-00000001hDN-1wKn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 19:08:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761249753;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=y4TTOO2cgFz3W+ccXXdCSitozQat0wJ24BVv7Ue1CUk=;
	b=E2XGvs2959tlE5Irc7FxY3Kz5vPem/jgKlW0/qAtNOKQNCR7NELGDJD5+ix/sm5Wg5mvwn
	13+Lmht31QdnUsafjOImbOL+Z8hv2Zvt00e8tq4dx4AEGR+SaT0QBgKqVQyxly/I26eep4
	z+ae2Ga4vUDp3pIdJ69F8W7oxv7Tzdk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761249754;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=y4TTOO2cgFz3W+ccXXdCSitozQat0wJ24BVv7Ue1CUk=;
	b=a7F8lydaxBfUlNHmzComOl+wfL0hWkpt49sP2fTkH+mQ3OzFBulT7c2UjDu/z+IThubwfw
	CTUGNcV8VFalXJ8/Ghk7X3+3eaLIs+vuSlWpr7m6O2tNL8JG9yuqrSWuk9gZVtBC5CdMle
	XfUILWa/5dBgngd0u5aFsrOIPZWsH8M=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-428-vuPBKgb5OY6nVQzUH3rtZA-1; Thu, 23 Oct 2025 16:02:32 -0400
X-MC-Unique: vuPBKgb5OY6nVQzUH3rtZA-1
X-Mimecast-MFC-AGG-ID: vuPBKgb5OY6nVQzUH3rtZA_1761249751
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-471168953bdso14435685e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Oct 2025 13:02:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761249751; x=1761854551;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y4TTOO2cgFz3W+ccXXdCSitozQat0wJ24BVv7Ue1CUk=;
        b=TfOfvFcvYLdqXM3ufDwch65meWL6fMQDx9e1VuLRzPJhddHzgqVTs8sk2FeGZceOE7
         UzvKiu7S0H39Uqt8FlOJ2Zp+gKgyuQ6WVgzYe2NgNI4HAoXfRhwiDGoyo/AaDy8Eepw/
         h1h5NztXnjLfvKSu+F9DipnDkaY6CoOO4iGzvW89DdAE8rfCYlOHjtbhg1gFasD3KCI/
         OqYole0DdgmIL1kCUUevxWj1UlevIxXSaPPAbJ+XdqK1bZ7j7smbPtQ91QVbQyBhH2Vt
         XpKxsSz//yj5Ak8iqgeS2g9YwLe6UGi6D9aVe2JZQT1e18V3ZKrwGAbd98WBQ1kVJ/9q
         pMAA==
X-Forwarded-Encrypted: i=1; AJvYcCWg1WIcW2Vc9IziiTfFo2tpkPuT8XxJ81J++j4cef+o1+jyfNLBY+/Mz5PoBWFFO690rOZnBDMf+0TXlPR73tXy@lists.infradead.org
X-Gm-Message-State: AOJu0YxjDKMAEv03Y4Rvw5E3BSsVxLt/iGLQj0Csrq1z0NSbLAZFExXn
	W396mdr69T/J8gtckOpvLWMiyKUKuNAlGud8laV1AYOQhtrAV0r7Ssus5MMvKiSFXWy4svuecnd
	zs2YcBez1wiFlAYP4mNX+tOZmD1PKy/dew23Yt8WSHkYaScJjVFFVutYu00Ap87ktHFUl1dhmIE
	Jn
X-Gm-Gg: ASbGncusZrk3rCxvKExkpFQKiTauNg4trcz+X6o8/0wkjKq+Y/I/ZmbuJzRo+2QpgjQ
	vmrBuAkwhKa06BKvODRvCLZHc6J9XjcxJFqTH0JOvKj3OZNliOy7sVwQ/pX7Bw9NVI8FA823efs
	Z5rOZKqItQOumtrMIuz+g7JzCBJpyiGeYiLOhWEnh5jukvGO3XbAE7sq7YtYZVeKVdR0gxjNkK0
	wHxyt82TtmeGa6lDgNgo9R6Ar/Xasnsh+Le7jRbMdECnA7iwcqOpDI//S3TA/93Esy2kEjCJxCf
	h+Bnfgo0RdR6+b8G7Rg7XtPuyR95/I3l6dJY8wmK7lfBCmg7DdhPSLXT3Z84eTmgVVvJC6snLkA
	2fVjRytDnKie3jIlVYWWw4HibGAkJHxDyrWBfLhBHvJU6qdLYV+YtAxWpmWxVum4qVO2EG7+l7L
	XADFhli4iNkcOizJkj4zKLJ2nNiQI=
X-Received: by 2002:a05:600c:1f13:b0:46e:3b58:1b40 with SMTP id 5b1f17b1804b1-475d24125f6mr1089495e9.4.1761249751036;
        Thu, 23 Oct 2025 13:02:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMw+Op04CJGmhD/YPV6zz3oVUY6+u4w9wry9vJKgjouN71r54k9F5kFdt15tjjDg/5cU58MA==
X-Received: by 2002:a05:600c:1f13:b0:46e:3b58:1b40 with SMTP id 5b1f17b1804b1-475d24125f6mr1089255e9.4.1761249750674;
        Thu, 23 Oct 2025 13:02:30 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3? (p200300d82f4e3200c99da38b3f3ad4b3.dip0.t-ipconnect.de. [2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475caea0468sm54964965e9.8.2025.10.23.13.02.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 13:02:30 -0700 (PDT)
Message-ID: <8d5243ec-3edd-49a6-ab51-16643a709d84@redhat.com>
Date: Thu, 23 Oct 2025 22:02:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/13] powerpc/mm: replace batch->active with
 in_lazy_mmu_mode()
To: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>, "H. Peter Anvin" <hpa@zytor.com>,
 Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>,
 Juergen Gross <jgross@suse.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner
 <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251015082727.2395128-1-kevin.brodsky@arm.com>
 <20251015082727.2395128-10-kevin.brodsky@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <20251015082727.2395128-10-kevin.brodsky@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hcz6_VkYFHUZfd0tiEIgKQe-buXE0vWUan0gLSboGr0_1761249751
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_200759_450727_8FC9E18B 
X-CRM114-Status: UNSURE (   9.16  )
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

On 15.10.25 10:27, Kevin Brodsky wrote:
> The generic lazy_mmu layer now tracks whether a task is in lazy MMU
> mode. As a result we no longer need to track whether the per-CPU TLB
> batch struct is active - we know it is if in_lazy_mmu_mode() returns
> true.

It's worth adding that disabling preemption while enabled makes sure 
that we cannot reschedule while in lazy MMU mode, so when the per-CPU 
TLB batch structure is active.


-- 
Cheers

David / dhildenb


