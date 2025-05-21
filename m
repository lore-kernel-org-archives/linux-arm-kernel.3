Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B19E2C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 11:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JWTPeu6guknXgD+xPLbcKD6/R/1DRiGD6zvZeqSl37k=; b=f4ndtEgjEivyZaoO2paoaISJdr
	ZN+shistueY+pgN2z2Nztm3JwWLCJ4zMfNksqAdjg+AhFdTOlxbDhEoemuXYz2vmpqu3KV0Tm43rN
	9UOpiVaqlGMZe/ACIbHglKiB5rz/9w8KtpWam60JmZKDLdlL/Kf3wNWEedU5D+MSAN/JjLzbxXvt3
	0Uyp0CohrD2vDD7yIj4laWSpkN1cNX79vZcOoeptOY9SJ9UV3h9b27J1ExkiknIjJgDOjMmpxhz6O
	yqdaw62WkIkacSPoq9+ig8nAA6Wl2X0LKNzxfuhG2rgKXxX5c6hNfQjvAzks28To7MYLSYktoHjHf
	DXKvPEAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHhhn-0000000FdUM-2DSY;
	Wed, 21 May 2025 11:33:51 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHhdg-0000000FdAl-2q79
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 11:29:38 +0000
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-e733e25bfc7so5865311276.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 May 2025 04:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747826975; x=1748431775; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JWTPeu6guknXgD+xPLbcKD6/R/1DRiGD6zvZeqSl37k=;
        b=Bum4IgXQU26cEvdxfZ3Y7vcApqkyjyyXjqkbMk3wLANs4twdwXLWJazCmzmOoOL1uM
         sh3ho5e9DnEDo/hLtKoz+13muheRl43hczo57nb07oif6nJKCC4MDy+fDm5Iy4zhhKH8
         1M9jNA3nnQz+44JKON+tG86GzlvHAWIfZ822ij7c6NkYmliNcN9b/EqUSjuMEeY3liRy
         9C6sgrdmzjZpToIcrQqlA+hun7qcvW1cqd+an9ibrCmuM/tj4g3Yo8O+e+/8kSfuVyfG
         yxuU1gZhLMX5T8TIWSrSSls/zpJLjEh/ExaMKnFeR12wI+RzwlS+uRL4A1kfwXy/FY+m
         QmdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747826975; x=1748431775;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JWTPeu6guknXgD+xPLbcKD6/R/1DRiGD6zvZeqSl37k=;
        b=A5PjsmtnWeE2CzKD5Wz4ok3rrheCT4QDKC0dJ08gUzz24dTFepf7Wj8aLgtwqAYm65
         AzVIrw8bbmtN5vKd1wS+qlAId08rTrVMp3xJIyg13qUkSBNYLp6Pgn9DEChJgQSjaooP
         zaG/m2tB3hCGLsazreAXV9yLnc5V17AESepOyecD9u2t0hFYE6RWSwM5lXMIhyCRmalW
         Gy5MTXrscIkbXQ2A0zW91OUJl+xpicthwi3Oy6A8lzevu47N4swhrYB+42IZWUQJkms6
         /9e5F0fx3Xz2aHXbn/ES3r9KGPUHixAdMdAmp1L49koy4ka7EKBUX5Tx5mrvDhbUp08P
         t9mw==
X-Forwarded-Encrypted: i=1; AJvYcCVfgoiKXbQid9NiDHO500BXz/5l9erG53L5RHuR40JX1DnrJTBxoldpyj4/m3CvL7YAvPPmHZOn2pAMyqaUe+SP@lists.infradead.org
X-Gm-Message-State: AOJu0Yxls24CbDunsCs7in8lcZHb8+00SCfa0A5rj1WExJ/1AIs0F1y1
	D3m0kbWVmOGc9y/EiNqBjhoKwLlRwp0K8zwnpLPEpuxJv+/be2+dEwsPKxff44pBHVj9PuzaQdc
	8mA1gnISBZRgvLgPpfW+ZZE1E17BMzlAFmTnwGnflCg==
X-Gm-Gg: ASbGncuERgvg2quo3s07MFFew1XVIaJPpkH8Z7t5DVjdmYl9FYAnpe8nmTlWhiymVYp
	I8LISkctBd1WplROgBkcxcflHZpe0oU760rzVYeba6F/EdbKGRkbuf4Gdw/aBGx4Pt/vKTt4Vue
	+qMkPNv7UZZFl5DyjxLRU7qe3HOK17IebOBA==
X-Google-Smtp-Source: AGHT+IGqrJmtGm+y80TfkZ9qC6RzIIVW40VlzSH0k6DOy6nN+ldVjeL4cXPRTWEI/C6+tWZ4/q4Eo/InDg514PrPZMk=
X-Received: by 2002:a05:6902:e02:b0:e7d:5e41:a8a4 with SMTP id
 3f1490d57ef6-e7d5e41bb16mr2195411276.16.1747826975411; Wed, 21 May 2025
 04:29:35 -0700 (PDT)
MIME-Version: 1.0
References: <ab0476382e3342161beda94a45ddadb49b026dcd.1747760015.git.robin.murphy@arm.com>
In-Reply-To: <ab0476382e3342161beda94a45ddadb49b026dcd.1747760015.git.robin.murphy@arm.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 21 May 2025 13:28:59 +0200
X-Gm-Features: AX0GCFsr2OpsfVkwDXkGW00v2KHCahRA4NOOOfoEOLpP7qgAYz-trCH0jo8qvFs
Message-ID: <CAPDyKFpT9B55kfGYHzOmb4_cvE-jDMajXBzqB1HLvVB_D+Nokg@mail.gmail.com>
Subject: Re: [PATCH 1/2] firmware: smccc: Stub out get_conduit()
To: Robin Murphy <robin.murphy@arm.com>
Cc: heiko@sntech.de, mark.rutland@arm.com, lpieralisi@kernel.org, 
	sudeep.holla@arm.com, linux-pm@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_042936_729798_F5B4EAF5 
X-CRM114-Status: GOOD (  16.65  )
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

On Tue, 20 May 2025 at 19:10, Robin Murphy <robin.murphy@arm.com> wrote:
>
> Various callers use arm_smccc_1_1_get_conduit() to guard their
> arm_smccc_smc() calls - since the latter is already stubbed out to
> support optional usage in !HAVE_ARM_SMCCC configs, do the equivalent
> for the former as well to make life easier.
>
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

> ---
>  include/linux/arm-smccc.h | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/include/linux/arm-smccc.h b/include/linux/arm-smccc.h
> index a3863da1510e..97dc4d47c664 100644
> --- a/include/linux/arm-smccc.h
> +++ b/include/linux/arm-smccc.h
> @@ -315,7 +315,14 @@ enum arm_smccc_conduit {
>   *
>   * When SMCCCv1.1 is not present, returns SMCCC_CONDUIT_NONE.
>   */
> +#ifdef CONFIG_HAVE_ARM_SMCCC_DISCOVERY
>  enum arm_smccc_conduit arm_smccc_1_1_get_conduit(void);
> +#else
> +static inline enum arm_smccc_conduit arm_smccc_1_1_get_conduit(void)
> +{
> +       return SMCCC_CONDUIT_NONE;
> +}
> +#endif
>
>  /**
>   * arm_smccc_get_version()
> --
> 2.39.2.101.g768bb238c484.dirty
>
>

