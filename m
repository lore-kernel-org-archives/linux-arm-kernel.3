Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96760C02180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 07:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZS/zLNoMtbOmAlXztUQxM70zl6Vh6C5NkcTxONG7DqM=; b=gJw3n02VA38CR/WV2DyAuumC4A
	KQDW8yyR1bzkIy1EdlFwokPtPKnoSPwy5r+30pZbUzIBhFQO7QFqB48twCjXLokMJ7RTuiYtCDlA7
	LfK4iZGL6x8ChDB903DOjFx4gfUSddsl66m7FIDRfNhl7c+PX1szRNHhhOz+hopkyZqyhIcFVF/wc
	ApkNRrZLs9AXzipqtJ2SbGe61GoEQqBMFlCAma9g1l5JeQxV+6EWrMhOUvgTC56+uXbMT02rtE9vt
	4NS1tGma921dGuM+UkftB4+cdRuLAynLGaDm/aTSFdiPLp2uHNhIip5onsvBjv2Yau2SVq22fISuJ
	z21Angfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYJv6-0000000E0OP-2dOF;
	Thu, 16 Jan 2025 07:04:00 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYJtR-0000000E0Dz-1VMi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 07:02:18 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-21a7ed0155cso7791515ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 23:02:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737010937; x=1737615737; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZS/zLNoMtbOmAlXztUQxM70zl6Vh6C5NkcTxONG7DqM=;
        b=S31+CS+qFweKu8/cDgdeCCQtPNZeMOJEW4ZGzS9THB+f5FoXrCZDb+srQ8OdryrHIT
         9tvSe8HLDympqCZ/+asmTHHky4N0muh1hXGXfhv7MA+ZaE3+oputtGmLTo0D/7WwBi6E
         ezlHw6S/meVAobuiV0qbY99johpB7ks3nqdLsnxlBgtMMLNc38Y28xXbc0s7/ULb/gPv
         oQRGspqr6GSj1Edc/e9oryRR7Rf5XW5SKxHzZzCaViagoCOkhsSm5BXI3uap/OKqVUlD
         iyKC+XSDfnu+QKltEfiMjOWd/kCD7vbLy6I+jYrdS0Pu0vRDDb080qv0Fy2vOyLxdzYX
         DcSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737010937; x=1737615737;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZS/zLNoMtbOmAlXztUQxM70zl6Vh6C5NkcTxONG7DqM=;
        b=ehAmJ/eXhLGKSmJOKAOq76xwqb6xqvlARdQHxrrGO5HFqu5ER5MY3Cj9+WiM0lqG0S
         nk2belZ4sMFGgwxddS9TY7rw63KCWzxL62Xn8neMgyH++DBkge4/0FjfJxFFWl4qZl86
         Z3MZT0BOh6pM+IHO9D84YJwIoQuKdnmJmYLZ4kP0wdbMn+ErktyJHQS4TG2ufxesZUcV
         ZltnCZ7fMBdMENIHPMEV90mYX0L8GGteucQgjwbThQcu+ZYI9h3G4dGevUHskJhXAGOg
         t/4BI9uShLs2kKSLRRECq8A4mZNE9nii8RJU0mDwKxnbyaOMOhdnPa1FNyqrUvXtP7ZL
         34xw==
X-Forwarded-Encrypted: i=1; AJvYcCVn5C3U/oKJ7g6LBrGYmHGKJTGmSfwI+A9I6w/zNQB6H6SMlhRroFxwWtvyhA/FI3yvj4RmGybWYydLd+SZPcaW@lists.infradead.org
X-Gm-Message-State: AOJu0YxK8+LWOuXqMHRJH+6L04ySPuUprqSYhX+yolg7gJt8ouJ325qa
	WFmXMZioQDR8olXDVh5HzFtR95T4nA5ffRWVpoWvK3vhcoYCKvz45Ns+AZY2h10=
X-Gm-Gg: ASbGncuhNgEHkoYEDayCkuxWD+l1e5sCdSMrSr3pioXAXDgn7DcQCPAMR9zG+b9ftd3
	s/bQPJJ0vB7Vrel0DrAVwwTQREpoecG8Gf+2th2YBO/ogAoUKkDL42nQbFyFtpzlzyhhqGktwOL
	hpfVKMQIBP3WA0A3oC9+W4qdePH/LtDAy6/DK/DkZBh4BGep/6Ql7NXxNekWN3QWPyQ1uMEpl7D
	s1H6Mqc3D9xD+qInAaKjzW3eCqLvvXwKdJ5kowi9zXg2L/0Kxv2z323nmc=
X-Google-Smtp-Source: AGHT+IFlzrBcdUY0bs4/8Sj7xVrCBP3SbPdaZMKXeURQBEhXHLuZJom44Aw7mHBQtMkoxQPSA6dA9w==
X-Received: by 2002:aa7:88cc:0:b0:71e:4930:162c with SMTP id d2e1a72fcca58-72d21f4ac63mr45499683b3a.6.1737010936743;
        Wed, 15 Jan 2025 23:02:16 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d40549322sm10135399b3a.8.2025.01.15.23.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 23:02:16 -0800 (PST)
Date: Thu, 16 Jan 2025 12:32:14 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, upstream@airoha.com
Subject: Re: [PATCH v10 1/2] pmdomain: airoha: Add Airoha CPU PM Domain
 support
Message-ID: <20250116070214.vdnbyyqnciifngha@vireshk-i7>
References: <20250109131313.32317-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109131313.32317-1-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_230217_406436_8436783B 
X-CRM114-Status: GOOD (  13.37  )
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

Ulf,

On 09-01-25, 14:12, Christian Marangi wrote:
> Add Airoha CPU PM Domain support to control frequency and power of CPU
> present on Airoha EN7581 SoC.
> 
> Frequency and power can be controlled with the use of the SMC command by
> passing the performance state. The driver also expose a read-only clock
> that expose the current CPU frequency with SMC command.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
> Changes v10:
> - Depends on HAVE_ARM_SMCCC
> Changes v9:
> - Fix compile error targetting wrong branch (remove_new change)
> Changes v8:
> - Add this patch
> - Use SMC invoke instead of 1.2

Any inputs on this ?

-- 
viresh

