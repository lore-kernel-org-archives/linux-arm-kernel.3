Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B42606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 16:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Vwcrzea2;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YSe/wnNo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Je9f2sBUTCO/EZacvnUN8CZNhT1Vz5vHYja71Ddfujk=; b=Vwcrzea2wrEgyohuSuWbMs+ay1
	gcjMSZojk89y77EsWHxdJQDxwwolLjEv9I24fObX3MjTtbacc8LL8GH3Quw5swSdpgUcrwfTQNNSs
	ZQZ0F8VyLx9V+z3BuRSliazWu3XMGv6iHvMn5rqdI8a/pDXFRvnh+HjKC+JHxq6FS81nUe4yxyN53
	hbkx+8uLgOW/x8EntrDXRbr6JDwnY2uJSP7oqsdkodQvSXbZ3ObHlX55rmc0BsCcjV6pB3S2VO3ur
	1VxM4eJ+q9vW891eJNTGIAaTg2XZEE1rTJyVIylU6g8l7ZzYJSdROUpGPu+tFwl+7/hXavZcWjx6i
	BrRED7ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLjwZ-00000005LMg-2nHb;
	Tue, 27 Oct 2026 16:22:35 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLjwX-00000005LM8-43OP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 16:22:35 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-8ac525c1f05so39196487b3.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 09:22:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793118153; cv=none;
        d=google.com; s=arc-20260327;
        b=npt+I+DAK6ST7XuVanAp1Div2wtMBF9H86ydYGvYkeZm1Xl/XveCnPEOOnJR7djWXI
         FyJCR9LdqbIcu1wGQeanwctbhABRSuDv9Hr2pGz9EiChhhHmvDYTBWbFfe9yPQNxvPhj
         k+FmXvb1vzZIeX8fBGEiRlzCQFm95NVtDhd+dtrGJmMmgJSPnkco2C0NP6J0PN0ykQBQ
         w09/NMuI44dTsqLLZe57AHfppNktgeuPORb68LMv4ipP3G10GDE39MaCsKsFjHcnAfGD
         v02LFlpu5gIkiiiuE8z70wTOevEHALIoEB21/qmXxIFSns2bNXkTyVfOCbK7RR85WqCs
         Tc1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Je9f2sBUTCO/EZacvnUN8CZNhT1Vz5vHYja71Ddfujk=;
        fh=7rHK+aFHC6iOsmZjYEWs8m/2j4kU1gDV280k9Y+zbZ4=;
        b=UxzO3YQ3YK5bRXgze3ws/ZAG4JSULu7PrXXpgA18xHmdrEDPQUNd47IDm1DeAAHBie
         d8V6znmOmXRv8ugYwgqex1KaPZmenwEyUCI0e58sS93WTDpvghZ5MBSXcmKOvfCM4zx/
         i3dcUDZR0LE6plVslitQ6IkTxB9XQdGu9fh8RzqVAsbCuM4sFf8QfSEGQ1pqlcjaQKWu
         HkrGOVn2ZmT+UCpipVAa919baG45TbP4rwsVXMSG0VD67XLAuizjgcDZPtHL4GQrr/Uq
         KZpPp4/HuQ2s1VSLrTH7sHnYjVaODpVnHMRAUN4dOA+6H2yOB9hKTV3Rd/dFMHbRZNfn
         cY4g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793118153; x=1793722953; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Je9f2sBUTCO/EZacvnUN8CZNhT1Vz5vHYja71Ddfujk=;
        b=YSe/wnNoVC1pIc4lUagxeQZZTuCAMkDY7y2NtOjFYLFt9Gfi4jnqmYb9RxipHDiF4w
         LaGWAj1EwZe6XSnWw7bH11Fl+fbolfmTl0g0szW8FgepWMIfKZVIUx4MMFvO6tGovpjX
         KyW80yFtKIVUuUqpYXTBdD1yT+n37uUHtqfPzX/gTaZ2o3tdrDX5DtR6cDl2s5D6yiSG
         RIagT3SAFX5j8Sh9yGDIv0DPdIXLLVNB2LDDPE/AmswNTI6HBT0QaCz88f+sodZo/MLp
         U+Zrwmkh5s9B0cLB2fgPHHk/bww1Rn4P+nflNJoXZqN1Xi9IE4hEqLIg4y3AaSNn8Di9
         tr+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793118153; x=1793722953;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Je9f2sBUTCO/EZacvnUN8CZNhT1Vz5vHYja71Ddfujk=;
        b=XaSCgjOprh9xyRdYyiqAHshMdfzBxrotuTYw9wNZLCFNd0RAuVfTAWxrKVL+G0Sj4k
         sBn1ZRSc2nJAS4AiNBHogZPyDcN9U1Tw3pHpccB8SiPpNDO34m8E8qKNWJQwPaeOJY0j
         2BQXK9hZt9JIcBiktAeQulVJN7wb28HBTeOUsPPySw9GC1vSZ76Mz+BacUtU3sBa8Qhv
         L8bH3ckiZ2IneiRT9+wLAe7thkJD+kB405CzYyjhDiR5SOo0+GW3rKi3oGS6MkSPdF3y
         3UFBFfR244RSJrYPMh23Ui9a65QYp3sha9//9XPZ4bjaDBBcACjw4pirzyVeF8A2UeKW
         CdHw==
X-Forwarded-Encrypted: i=1; AKwUvBzxYFfSatr9HPrqspxjnV0NyUmBkiPBTdxiDPG86S6EFzRqfBdwheubqnOS9StSXhg91OoBz/Jvc79QmMHmwmzk@lists.infradead.org
X-Gm-Message-State: AFq9FYIC+RG7uTNIoY21/jCnsPWo6nvxh6xGah5J2Yx6t0ncutwH2+Yc
	LnzbXk+bwMWlq/vI1LblurQWLdNp40Fv9JuaCg/A0tTym0NtcdJveeZITEvJgx4YzMmWp6xot+m
	cjLDpGmrr1VkWLxb0xb+bb5QK5zgZYGQ=
X-Gm-Gg: AYBFou1FjwHAZ/pwgDYe12cTV1bHDVlGdviU5kVL678LvvIbgnnXcH6dyYOL/B9paRu
	WITbo8DTOyzYrnS80UPOEdwvg7HKG2G9HI1t9j5DAzYlAGmkoq9lQvc4LniEzA82U7YJkEExT8e
	/1Z7Oq7l3/4euOlfmDeqFaiNYAwklBOTZCHtSLv0ZqbbvWTBaq8/KPP3HDS5H2c1nkWkUKfGvj4
	bLL3jIITmHZP1aKaLqDGvvZ27AOijpfDwoTly+pQydHdXU/BdeP8CwXNSU+Th5JklRImQuJ7O+v
	ItiqHqISdQFaYQLMcWnogPjEMZKDhtyLTIDkS08zIOQrXbcrmHAZV8Y5lxN6rsnv1ws3VB8cqoz
	I6BiK3qmw5NhkRZp9wGT5p75FmdfkhCWaCk/5
X-Received: by 2002:a05:690c:dd6:b0:8b0:cee8:53cf with SMTP id
 00721157ae682-8b1669cb374mr84387667b3.3.1793118152555; Tue, 27 Oct 2026
 09:22:32 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261027145313.136305-1-lgs201920130244@gmail.com> <f7d242b6-a401-4ea0-bfac-e988f1497bc0@kernel.org>
In-Reply-To: <f7d242b6-a401-4ea0-bfac-e988f1497bc0@kernel.org>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Wed, 28 Oct 2026 00:22:22 +0800
X-Gm-Features: AclHuK9WhSZ_5Xj4ee9jEQ2X-wRviwNJD5dHM2yTu5byUlkX8Eudsa4g1RS5X-w
Message-ID: <CANUHTR_RYcMEOTevXWRF2iS83oNDc4pXqsbBZKLV7QbSUeYh=A@mail.gmail.com>
Subject: Re: [PATCH] media: exynos4-is: fix DMA memory double free
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Hans Verkuil <hverkuil@kernel.org>, 
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_092234_015890_41BE0EE9 
X-CRM114-Status: GOOD (  18.86  )
X-Spam-Score: -1.8 (-)
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,FROM_LOCAL_DIGITS,FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Krzysztof,

On Tue, 27 Oct 2026 at 23:32, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 27/10/2026 15:53, Guangshuo Li wrote:
> > fimc_is_alloc_cpu_memory() frees the coherent DMA buffer when its
> > DMA address does not satisfy the firmware alignment requirement,
> > but leaves is->memory.vaddr non-NULL.
> >
> > Because firmware loading is asynchronous, this error path may run
> > after probe has returned successfully. A later remove can then
> > attempt to free the same DMA allocation again.
> >
> > Set is->memory.vaddr to NULL after freeing the buffer so the
> > existing NULL check in fimc_is_free_cpu_memory() skips the
> > already-freed allocation.
> >
> > This issue was found by our static analysis tool under development.
> >
> > Fixes: db47622c13ae ("media: platform: exynos4-is: remove all references to physical addresses")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> > ---
>
> More of postings by bot ignoring any feedback.
>
> Best regards,
> Krzysztof

Thank you for your feedback, and I apologize if our recent submissions
gave the impression that we were ignoring your previous comments.

We did take your earlier suggestions into account and subsequently
submitted a patch series accordingly.

For the more recent patches, however, since they address issues in
different drivers, we thought it would be more appropriate to submit
them separately rather than group them into a single series.

We certainly did not intend to disregard your feedback. We appreciate
your time and guidance, and we will be more careful with our future
submissions.

Thank you for your understanding.

Best regards,
Guangshuo Li

