Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C594C606A326
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 02:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2BxIqR6+;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wGMiJimf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2y3x5BsFOKR6Xa/PS70Z4WqRPWWkMu4FE9WLs3wjumw=; b=2BxIqR6+QQBapOi1fVwluDEEOm
	fhbO5+9AojyZg47NqHFBRcFB8Rktx4RKn0eOFWko09N19EXbn1HBZ1dHu659qHYSwn4As3eunGtrj
	r913dhxcfR1AmOVyevWvEYNig9jS2Pv62ZDeZxssekvbe4Y4QDJkKi/IGHAHUdXNq6FeZWowGxJsi
	BF4fYC0mLumJSuO/WgCA52P2lPzgpcsQ0rtx0tKAcaqHJ1n4YzkBFsEMlAi7Ua6/sRWnKn5WMWdgC
	euYZGRqztMqE4CHXgR/syfy/fq5B9uE5jyNZMAbJMpfPdEzMUes/63kgBLgU3k81QuihJFFUvPT3a
	ty1fGypQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO4Ht-00000000sR0-0fgR;
	Tue, 03 Nov 2026 02:30:13 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO4Hq-00000000sQH-2Zd7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 02:30:11 +0000
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-91c847584b8so3230366d6.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 18:30:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793673009; cv=none;
        d=google.com; s=arc-20260327;
        b=Ni7Z7kxtyyLP1OeoqrZ18+Q3Uhn8JOMd77qr/jMcDTQ6Pl9Nux9cCZodhUMY1g5sjX
         GVK2fsYERW0/1FuPiyFvv8KbAAq59OnAU8qnrhTYUyc7o8M4wb5wtnpJktChNkpL3loG
         KRFMxYcWYLMsYxwnZKH25ERT673vAzt4fg3mQ0fXR4vxoe6fnf/TLpVvrGlAt9mRsTAI
         dW3PLgiPoy0fQq2ozl/Wcj9E3D6mtDkCiIAS/jnaO2oa6JH8PtdCZTFMovNPXgZJnRen
         VfNj9/HRaOPXrDDTb8JAndD6iBbM70y4Vpb4tiOSWcCcz0ffQlB9lrwf1Nle/jAT92zn
         Hlyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=2y3x5BsFOKR6Xa/PS70Z4WqRPWWkMu4FE9WLs3wjumw=;
        fh=cu1Oa5nkb3WVKYdgAgLv4jijSk397i/NdOIEOvrBAJQ=;
        b=d7HzXvPAaADgJTcH6+dh99Ho2Gwy8NN/C27U3Gdc/6SPN4Pntk5vOKccfjQaLtkL5p
         TwKJ6zoyPWEAOvw+SEEaPKRoKCo5QYD/R4+e9ilRVi4AEYHF10GgVTPwS/GehmykgCaJ
         wiVWQY1segDcyLfDKTJ6HdsykbKHzXSeLywNRSAS/0078DZzA4ViyovxFXy0vyFsN3AX
         xwPVKBxRJWD5PJcjXeCGVqsBz7VSO8/6Zlu3YdcP484FQjIWYo593xLmr+kU7bI2B+hL
         8Zmjw6bwZxx+Ml9wkMDhPgoqmY7N8c+wRGAYVWs9OSA1obJp6xJ6O97i7697hLMtGipN
         UsiA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793673009; x=1794277809; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2y3x5BsFOKR6Xa/PS70Z4WqRPWWkMu4FE9WLs3wjumw=;
        b=wGMiJimf0iUnsvv65vwn19fFE1yor6mplgBGDjojjKbEtYk7Sgqfcng7ffUGnn+lhS
         OZES+WWg32C3WBfLMrQ5E1jmrCs1ki5ukesFjqKVM7n/Y4x/6+aEaQdhXmEccGVuHSAs
         oSwZmdZwrYioCand/f3e3og+vb6u0jo5xquEHGrB2YxDOHpOuRdxZ3R70QopiWG9I/iQ
         XyD0afB0WnxabbhBjnIAaYn62FXVArlV0jUbVZtjsCCFjlanbMdBoD9c1cVsEDU//VeO
         K6KI82mCYGylv/k1L17q8cRAqMszHogSUAZJXBhREjVgqWiHCrtFVl6tRtLddIr84JNg
         fTUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793673009; x=1794277809;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2y3x5BsFOKR6Xa/PS70Z4WqRPWWkMu4FE9WLs3wjumw=;
        b=AJvMS8NJyGGnpc9CQT2K3OHuNnhgQqGk1znK4EIldANdrn8JmBsTA1u41oy3/60bFy
         arTT6PJR3vjGbcP++841eMvrAdHjVA0XmyS+49uOp0XI3LU0dGDNzkbNBChNHOi3oE2W
         R3xnsM2xl6QOUVCQMW+vgyLeyOhMVwqw5/VqEPs1EWCgUzUHXlMa8hj+6PO54e0PCDlK
         lCiGhVFPrTft9dj5jJXzuxAjxeMkhnMx5JJn6qU5epFuh04C4CJVPJHfYtZuPVRovgsi
         ciIa0LcuKcFskSMrU+eaS+abcWk66VLM19jF5lPrzoFw9SwCV8z9RBvqNscc8Zh67BOQ
         yE2A==
X-Forwarded-Encrypted: i=1; AKwUvBy6sCXP8dvzTm0XVxIobpZqdiHTTKsyRDldRuBXOcpYHxpUfFdCALdHS0xDH46f2c3rAd31/HAln7kiI6jWjZiG@lists.infradead.org
X-Gm-Message-State: APuU4Z9k8ZdcZuMO5hKrVVUpxQpOKSX8zAu23UF/IK3yVlMLJMk0Zef0
	1i0gnoqhrpxgXCMawyze/eDxt8I96jNPdjH4N1Vwwcasu/o8fpJGe9YlmohokileA/2cPNMUvhr
	+PbEX4i920JpygwA+CYjpEmbMo6VNfnI=
X-Gm-Gg: AYBFou3oGwsEKIcp9V5ThuLrjaEnLF3OSyQtEZ4WmFeyS3FrPQLua9/pJ318f/SU6I8
	O45MvVWDhWDVXOrr1VtyXmVvTCycC7OEfskO5BI00vgCfPub3zoxzndppV6dl6nbbnLJIMNL1cI
	n6sNbkz6RYPVrux4QYv/FnduEaJfCk8ULuIC9VR2kQ/EMAAuU0WL55Ul1WGf3G9F9xgxyZpeFgQ
	+xw4WGeH7Hfkt0ImLr/3ud+WWfV1G0DMu76/5v/wDEwFOSK8bsGTlhLRKOwwvFpXEE8yPyk2/ua
	qX7QD5yriPhT+iZc1xw0t5A8E06enOvWi/Z1ACSJdX78+H/BWlk+AAtI/kbmhfbkJ3ehf4Te3PW
	x6pke+cYlVp/vfOomwBq09jw77ctoKhrzif4xZPdCp1J3ASY2ti/xUpv3ePmg6HRCpEbkCV+/N/
	zoqbR2dcaE7mOFsiGYQA9JRq4FMXfGJ6+f2YbE3q+vcV+CHyF+Cc38B24GbCl0mN3b227F0/Ih1
	Z91gMBXIsxLITRy7+YZGcIO+Q==
X-Received: by 2002:a05:6214:4992:b0:91b:bcf5:a733 with SMTP id
 6a1803df08f44-91ca4a134famr184970506d6.2.1793673008933; Mon, 02 Nov 2026
 18:30:08 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261029123611.1108424-1-ruanjinjie@huawei.com> <20261029123611.1108424-20-ruanjinjie@huawei.com>
In-Reply-To: <20261029123611.1108424-20-ruanjinjie@huawei.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Mon, 2 Nov 2026 23:29:58 -0300
X-Gm-Features: AclHuK_BJkt9xZLgswfj_Tbr6PqRdG4bSgV7lCXrKm_Oe95ue9Eiht-hTCdNBWs
Message-ID: <CAMAsx6c655ZN6YkwCSmgo9rdddUG9sjYQE_1XQi6=J=i=7N_Jw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 19/19] Documentation: arm64: mpam: Describe the L2
 monitor events
To: ruanjinjie@huawei.com
Cc: reinette.chatre@intel.com, james.morse@arm.com, ben.horgan@arm.com, 
	corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_183010_663840_C5779E92 
X-CRM114-Status: UNSURE (   7.55  )
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

Hi Jinjie,

> Say why a bandwidth counter is assigned for the life of the monitoring
> group: rewriting its filter restarts the count.

I could not find this explanation in the diff. Is my analysis correct,
or was the paragraph left out of this version?

Thanks,
Daniel

