Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF4BEC54E65
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 07:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0pilOcdT2VkT2U8kVqgqtToKFgXk1Tev6+CBnmTk+fE=; b=At1NHAtzebfQA4Ek3U2m8mY7Er
	gJ52omF6dd29RzqS/PVV0U4uBQr+xWh4vP46vAHYtzEtXC3qAKn6/SJJK7LvZc2yqkluRRQYKOJoA
	6LTvEozfyyAaNKREsdV/pabl04K6E48x8vWX6f6/DinSy25gdYaCA4Cvcp9bfUOgM7M4PI4T08oOg
	1VNGaxQ0hGLonwkd0moRC2kRsxpmVgzssWc4S5XWbsRJi3vikOLsedNB32p6UWaPE3zRyc/TDMbtw
	rgTMeKbAMERfK2pXFHiJk4ghZ9vg2xnqINY349Qh6zlMFZPrFZ6bq0Ex1cKA3ShAa/+U0oklh8Emq
	STi2qaPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHeDF-0000000F6OX-3EqU;
	Wed, 21 May 2025 07:50:05 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHe9u-0000000F5z3-0D7V;
	Wed, 21 May 2025 07:46:39 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-742c9563fd9so2967582b3a.3;
        Wed, 21 May 2025 00:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747813597; x=1748418397; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0pilOcdT2VkT2U8kVqgqtToKFgXk1Tev6+CBnmTk+fE=;
        b=nPCrwx1sAEfBH6jkOym9FFsYsCfU7sL1vENN0AimLTH7y9bYCHx3Vy8hkf1+gCLNyH
         v7/pniBRI0PB7CoBwClw6+nh5om2XmD4sTHTUHnQvcRGLIHeT4A/o9ETFdsMPw7CYtTV
         FS/IixchO/iFWIODYrZnPohrAcSqfTJ7aEKFcAB6qyp//Q/IK7xokWJ97lqwoPIS2h57
         nJJvozevI+e43OC9EvF5xeDKP7c+FhmAgEFaHRNIJpGfWreCyCur5AgWySStn/n1Aoju
         ZlJca9lFWCDb4a6a5K2zAfMLr955ORGipgRyMgqckmXY1d0aIjIjwHT9zeaNRGyapZGz
         YhtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747813597; x=1748418397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0pilOcdT2VkT2U8kVqgqtToKFgXk1Tev6+CBnmTk+fE=;
        b=ktjPXHAK14qYTvtOJ8aDD7416kXlg65kfcAyhrlZog0YoFegnXlCCGPBzoqAafX8Z1
         RKlbhKwKgYAa762Sb9WtkBKLF6wg9edo889aSKvplaHR7Nn4mIji7uwD1p6xF1sBnJpR
         1o3zb0+v2jdNDu//0n8Z8vq4dqKJbNj1fBLICExtEKPWoyKHP00Bv1LwcwAQHt/Blv/E
         4l7wpe+s6qT3jdRDI9x/MEKwHCZddMiAW55Q7FXdB2dQY4dd+YgczccTsrH8nvwUS8rX
         wBTluWOvHStQJ1oSyQkS0Wt9H7MsiQdG6+woWLfbzyJgSzKdWzEmXrPxULVPWKejy8Yt
         qsSw==
X-Forwarded-Encrypted: i=1; AJvYcCUAR+k/DN5Ep9jsS22jOwglhmfTiEaaDafMukx3hoR2s+/enhr45caNsuw0NCkIUN/zcDE41kX5LksSobbGzrPV@lists.infradead.org, AJvYcCUXrlv20iA81rh6wuoriHP0yZov4hmkXL4NJfvbpHwV9tab7Inma+CjsgxpVGineXkTTf/5L5pJaRTiHcs=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6KTkJWgOij4Rf34jFj+TgVsvFb5HGMSJGUqfKo8OjKAZvU6jT
	CFglJANoNnpyzZHcfA7SGs3HCQ29NSdLgOAgAz/UzF2Mvt6m57NkiPyX
X-Gm-Gg: ASbGnctaP4tSBgFt0i2cXMcX+/TBoTVbchokHb5v+LVwiMlcf6LGtFeK16UcYwOVAFi
	6sEnsaiwebr13tOafaEhoLon7bbowPd8cinD6KYZIUcCMIOa4L5zyyLe7/ZV56Jg9h6NYMeTE7Z
	oF9/UIw35bjGtJRe5SXeBn6LnYSpLSHK6w8kSbxZ9SeccEacQQ4oyO1xir0xchlxL4C7RBqmx8y
	lDzYGiT/LIHSDiGrtHXQ6q1wT97PguvL3UUdjh1p5hvDdRid92br00Q1BDyupv8FEOmRZSSq5YP
	RV2A7JGX5WGUKyCIXavubffT2F0w7UgDjt/R4zaisUuz
X-Google-Smtp-Source: AGHT+IH93EkCLEEdKAJhbPek7T8TIC1hOKN/VmJI8xmXdKi9w+hCClmhOIHGlFmoeRJeKlWx3PgC8Q==
X-Received: by 2002:a05:6a20:734c:b0:215:f723:81b2 with SMTP id adf61e73a8af0-2170ccb39c2mr29076396637.21.1747813596705;
        Wed, 21 May 2025 00:46:36 -0700 (PDT)
Received: from gmail.com ([116.237.135.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a96de111sm9030991b3a.3.2025.05.21.00.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 00:46:36 -0700 (PDT)
From: Qingfang Deng <dqfext@gmail.com>
To: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Himanshu Chauhan <hchauhan@ventanamicro.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Xu Lu <luxu.kernel@bytedance.com>,
	Atish Patra <atishp@atishpatra.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 3/4] drivers: firmware: add riscv SSE support
Date: Wed, 21 May 2025 15:46:26 +0800
Message-ID: <20250521074627.4042832-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250516152355.560448-4-cleger@rivosinc.com>
References: <20250516152355.560448-4-cleger@rivosinc.com> <20250516152355.560448-1-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_004638_086262_95157412 
X-CRM114-Status: GOOD (  10.96  )
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

Hi Clément,

On Fri, 16 May 2025 17:23:41 +0200, Clément Léger wrote:
> +static struct sse_event *sse_event_get(u32 evt)
> +{
> +	struct sse_event *event = NULL, *tmp;
> +
> +	scoped_guard(spinlock, &events_list_lock) {
> +		list_for_each_entry(tmp, &events, list) {
> +			if (tmp->evt_id == evt)
> +				return event;

`event` is not being updated by the loop and therefore is always NULL.
Did you mean to return `tmp`?

> +		}
> +	}
> +
> +	return NULL;
> +}

<snip>

> +static int __init sse_init(void)
> +{
> +	int cpu, ret;
> +
> +	if (sbi_probe_extension(SBI_EXT_SSE) <= 0) {
> +		pr_err("Missing SBI SSE extension\n");
> +		return -EOPNOTSUPP;
> +	}
> +	pr_info("SBI SSE extension detected\n");
> +
> +	for_each_possible_cpu(cpu)
> +		INIT_LIST_HEAD(&events);

`events` is already initialized.

Qingfang

