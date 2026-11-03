Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C90F606A324
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 13:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kEf11ytH;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0R/FIaaY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=on37PXbM7L/a+kn8oZoA/9dm3L7FCQljHg4Hf4R0FgM=; b=kEf11ytHDOJlktCJrky+sG5hIm
	6mSp04RgR0i1KUHimYUFHfljMTphjmqoUYGu369iUyMRO5dzlQzvugovba1o3WOMmPmMUa1BKGCQ0
	eK4Kh33i7xCVSv0bRUlR0P6Rhkx6+gPW+p9fegMeTsLK1jyjzEnEK33msO8yAUhHPLSj6f3QquAe9
	n8m++mKnls+7nqV4ZEKTg8OIWAEnHBL/3wRaKnS6a9a1+rSsnz3S9KqxQ7yHqQcbcZvYh0KIijUoI
	xS2QTCZPYKi3WfnZ8/hTYxVeL/nwlNm1sCK20kPGK0sf22cCrfDm6Sd4m7uUbczNWOnFWtj95ws1n
	8h40dcGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEAH-00000002SJC-0XMB;
	Tue, 03 Nov 2026 13:03:01 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEAE-00000002SHq-1Jwr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 13:02:59 +0000
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-91befe703c4so39807786d6.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 05:02:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793710977; cv=none;
        d=google.com; s=arc-20260327;
        b=b1ulEg+ulNMz/cP2cV2XwSuPojqMkJ6WnPeW4ZnkvSwgJ+8BGySwjug690toALmS3n
         k0LSuZf83sYhDXqM+XHcQtczR5xSJ36+pJ/ru/YT/8BoYzF6jh6291ST3rA+gd5rUrmw
         LJC7+WrLP2cucGDh0we/urAOvDoNGxNtsG69mchYpNHAx4jjiL3MctKkAj191gteYtzc
         nu21wncnBP0ylHdtNGYc6ps89ExOY9r3DsdTEOu4UfYe9t2K41fwqFXi/KunBhV2m3FB
         YWyqHz68FZkAjkwQmSkzMZJsaBuDxnzhRjW/cZleLos6RHJX1jWVcS898gSiDkSa10Zt
         I2KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=on37PXbM7L/a+kn8oZoA/9dm3L7FCQljHg4Hf4R0FgM=;
        fh=QQyfYNfzoatiHXPZEzLyT6S4Br08dFc21EjY5Opd79s=;
        b=f40ka4w3UW8dQ1M9eRzpuBD3oBuTg8ENv0U/KLujlCLkipuPdMNnaKG042Xy7C6Xuj
         oKk+Tz9OfwmCp+Su0lsZWtD+rKYJpdAAJL2D0Vm54rUs9qKHZu1LnSw1ugRk6klp4yJY
         MjDt0AStEo7Wrf9vEawSdPVGwXsvotSsBTdrETw2sQAztQg7lw6Emx7Q5PqAc2nKaGHH
         Iol0MEd8NyJr6dGFdk9GPuvhra00FAFFq4sP5xDWb6lo4MV4BvvLyR8R+b0QKmLhEWws
         1UL40fzhCELUdaY1fBxtJ5ebTy56MMVChr+1hebo0Tj/YIc2X51ED42GuYZdRf/JQjmV
         Z6SQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793710977; x=1794315777; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=on37PXbM7L/a+kn8oZoA/9dm3L7FCQljHg4Hf4R0FgM=;
        b=0R/FIaaYDz4rqAOdyKQCmQbVH9qlG3Bsdkh024YHkRmReqK1mc62Ju4LHpqcldaJd7
         oGomOM/AnRU90AT9gyouJfrBrR/SDR7zUrX51t5D+KxlDS0EfVMsZpsaQbzVB5CnjUpI
         Y8kPBoLw27wqk7lQTXtPKOXdtsrah5F5T4HLXkNzMBJrEPXMgFCtrc0Ic7OfxAw7GuGV
         ym+8YfDIg4tI6WoaYqGcJpZDoPbh5bdTflly6F0M+YsHENBpJUN5Xy9OkMelsMeotDIt
         Bk9RW2B4GRCBvzOZo7J4GBI6hH7sgxyEy3kMTebq/az+Ma8Y/xh8TcIXZEcV70xyK6uJ
         DQXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793710977; x=1794315777;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=on37PXbM7L/a+kn8oZoA/9dm3L7FCQljHg4Hf4R0FgM=;
        b=ACJsDHPzBPK83hQDZeljOauUEpL2U60rkkQFcRVzxDJHsHjrc22FrtYMnk5Lmrvsnc
         gjTw1TbEhvTqFy4hNf7vuiNVzarADKvzwfNt49AOw6jK7EAAH9Y9Z53Kv+LkbwQ2Q+vs
         ObhYwge+1uFsZrfGK6tAFhedgc4uJTiGa9Rr6CYN14LBN0GH1wJUV6Xpn/v/rJ9zvx+2
         fRTaZWBWzk7z7ubm9rYpUiMuYfhOH0UEX9msSXnVULoL535/qZuTwvxcnFluVsMdM9MH
         d+mKsrGWnZ2VyHVL63gcz0ddCpV57MUmTmugF6pHjQAhARWZ/YUIHvMxpYa7R1xLI+Qx
         BWeg==
X-Forwarded-Encrypted: i=1; AKwUvBz8irHwkL2ZdiP4OBXWVdo1L/MPqXTA/QKO9JK3k6myLILWCTZdOy6WZ/L2oHQ89aRRmfjed5ReIJgQ1sB3vxVp@lists.infradead.org
X-Gm-Message-State: APuU4Z//bLSZLy4CW/PJuQnnxBu0a+uteeSkoRpLfDaFk776xXXhhwUu
	Mu9f0K/iJbNyvLup6FqV2ZCe9/fiWM8chnKAu/h0a0wJ4Xo71KsDVccrn4v22JPwumYM4whGiPg
	k6fIrlKrU5mwQAaSIWYsEqf8VHlFmTUx/6ekgLhY9Lqw4
X-Gm-Gg: AYBFou0sCOna0Vq16yv5RHQorId1PT8Tg4T7+CkJ7RUXKmaXbLeudy4iNeeu5IzuVyC
	OF6bDbaRbmoDbm34aewyfFNGyoHrGw/+yIgkhloeebCEg/tyPBwmhujkdh/HH7DdYiGKZL2vCJZ
	F2ifawFQDhF85hFuHlxJSdjRptrsxbk/Bwb1rXFbq7VAsDVjC2E4+uNTEeLFdSdanVoKvhIaGll
	dtqm+0DWeZJByswtgtK/uASdRYqsOX1g96CuWYjhuhkOzm+sWuupCrf1h8IcZGbT9TqQ1DTT3Fm
	zG2/3uPGcYnFYmOrpNoLX8rsIyYbtgGQGXFRYvHK33dxaL/yzeHPSxPUf5HI7up0wmSwWIbIaxp
	2FDWCPzVbQ/mUm7bJd+K67CrYCUP6FwFipdwWyaamLNQgK6oFvKGeNwtVgO2FvOe1FajWz6r860
	jPqs81//zLjTKI+a69hAGKEbTjGHIpJDwIge5N2rKkxL2daqj8ZKQ+MNV3DpndDZJ67ot63ITfA
	6bg096VF4vFm9wBv388jwY=
X-Received: by 2002:a05:6214:4a89:b0:91b:9352:15d0 with SMTP id
 6a1803df08f44-91ca4bad090mr196643286d6.35.1793710976699; Tue, 03 Nov 2026
 05:02:56 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261029123611.1108424-1-ruanjinjie@huawei.com>
 <20261029123611.1108424-20-ruanjinjie@huawei.com> <CAMAsx6c655ZN6YkwCSmgo9rdddUG9sjYQE_1XQi6=J=i=7N_Jw@mail.gmail.com>
 <432a92de-bd62-4d89-b0b8-3e89086660e0@huawei.com>
In-Reply-To: <432a92de-bd62-4d89-b0b8-3e89086660e0@huawei.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Tue, 3 Nov 2026 10:02:45 -0300
X-Gm-Features: AclHuK9p5bXr6svQ6FTPGus5f_ZqQ_8eDBEs8TppHm5Lc6glYTBwkJFMiYpPjIg
Message-ID: <CAMAsx6fCiTLSPpbOPW9nh1rmqLEzy6i-YjK5BzhtmRq4nBykjA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 19/19] Documentation: arm64: mpam: Describe the L2
 monitor events
To: ruanjinjie@huawei.com
Cc: reinette.chatre@intel.com, james.morse@arm.com, ben.horgan@arm.com, 
	corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_050258_359418_B073166C 
X-CRM114-Status: UNSURE (   9.77  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 03, 2026 05:59 AM, Jinjie Ruan <ruanjinjie@huawei.com> wrote:
>
Hi Jinjie,

> This is an outdated message leftover by mistake; please ignore it.

Thanks for clarifying. Will the commit message be fixed in the next
version, or will the patch go forward as it is? I ask because the stale
sentence ("Say why a bandwidth counter is assigned for the life of the
monitoring group...") would otherwise end up in the git history.


Thanks,
Daniel

