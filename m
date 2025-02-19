Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61811C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 05:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FRInsltroDfnSviS90CirrNU28rUPlNtIher41yQK9w=; b=Q/SSBS3MtDI7meYzeRRKtMSG/c
	oBnumKcxGH5rwPGT5oNoXkQczlhP8p22g2jpmPtQnP+/AoKxHt0jh2h+p3BW5T5j4UtG882HdeMZF
	TBM76bO5waQHu9zaFqa+Jo7UOpYYoyEXeqxSOSlEjQSM0/zxAUr+kNcoacPIGN6okLIzuOwt21Ram
	IevM5Hy1fX7TGNLmaHeoBTLcPJESMYWUoTK0DNJpWDqEgccKL0Irz+teZlSnpUt+axtOYuGk8Zw18
	T+d072ZHXBHFksz6MEyer1pEAA0WU4xOCkIKL3SyjEvog7lUjKl+1OUVBnwYQHMRsir/oYROBK9DS
	KpGW+FZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkcvW-0000000AwvP-35fJ;
	Wed, 19 Feb 2025 05:47:18 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkcu2-0000000Awk0-1lix
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 05:45:48 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2fa48404207so12655238a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Feb 2025 21:45:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739943945; x=1740548745; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FRInsltroDfnSviS90CirrNU28rUPlNtIher41yQK9w=;
        b=Yt/WmwDPTDB7MDX6+kSrSTphf+v4iacAfdFhl3LHPjrzGIu6lwx2AA1SM6y5eIgtYR
         V5oqAwGKIl4vVndinF9x8/I+keiPE+5NepKyVU+5fXhvVEEmNCBPtAyFkGdJrHotiU+I
         8MZd8GqThYB1vCmItMPR3/7INYSbO45P5X8tcgwPTdrDIBXcufg5K+jsUK3cl3wEJy6M
         7PNbR/XDBukxafsGCI5SxpqRPW5PPO/8MDbnmBCjO5rnfiT8RdnU6L/uQl9tqGpbqfnW
         erpqAwdNdbQhLRLv1FBkkOC5lg4rFcaxHOHSfaGeAqZ1gSMkYidGKbyQ0dvHG6n5JUaI
         +YQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739943945; x=1740548745;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FRInsltroDfnSviS90CirrNU28rUPlNtIher41yQK9w=;
        b=j+S5IgkPh4pKsCmlP5YqgH/55TAR8go1xUmh2MDkn6GscOJH+pRvXjvXldag0oWkvU
         v4wnj4WDEaNUg2DyVd/GARX+87edw1S0InLmNoNA+os4tmdFWWBVaTAleWS/nNzICnC1
         MAcBddXTUTu2aqcSIlqAAIh5i/cxrqtWRKqjjQI2DOL6CpbVoHSVVJxmq9OIaWHtI6Y8
         vsR63XPc9UaiJPlntlEpfFnIVgNK6z7Si0ei1KP2L9bRT+7QMvSJO08hOFLQhpvcRlZd
         B5AdfmAG5E26oK8TcMiJZaoNvJONXdSzu1Bf6kLCcr5mWKQhLZlaAu5ooKwZHueC4Ad6
         Kdww==
X-Forwarded-Encrypted: i=1; AJvYcCVLWinM5m1klWvJaJIk6gMqNu4wUVSZ5ARHMFKwrDb3xFEG4FRmDH4nTxuW3WdarKA+YoWd6cIQ8ThUkTVdcN06@lists.infradead.org
X-Gm-Message-State: AOJu0YxNcPzkInV6zIqM62kqw+SWVC72pbLaGM4flq1ByjS8X6dXbScb
	A+XuZvdMp0zl+X0HEP+O0IBZApOD+0LL6M1CFCRGjNz+2MZgCoEpLz9rAIEduWc=
X-Gm-Gg: ASbGnctjddUK+pgxzkQyjtcpbt5H0NO3Jq5sKjQwnVfoXk1GcB14JDKqgAzYsW828Ir
	sZhIX4mqesEW69KxXGZNiieI+R9X3lzcG0Y9o826k23WCDsJfnkp1K/bvcGIU804bzP0PsmMtjg
	E9H+5Vw024uAntefkXPDs59kmWV5kh2F7UOKW2fEG6qdQbU52RyOxtTo5mT1vPiNus3ZcM+gAW/
	L+AGxqtUvonX1O1A8nxXmw5YWppeIKnsa2sk5a+1oRaWMwxRLxkSqoYUWwa3Tf6m5qu9VPmwJA0
	O4T56NJPhuf7hznfQQ==
X-Google-Smtp-Source: AGHT+IFDzea3Pp7rZ2dMCaYzxs9nrys/cZznA9NmmSQBwBK5duGLQELrvaTllazoUHAnVNqWR3kPyQ==
X-Received: by 2002:a17:90b:2fc3:b0:2ea:b564:4b31 with SMTP id 98e67ed59e1d1-2fc40f21c49mr24036277a91.19.1739943945616;
        Tue, 18 Feb 2025 21:45:45 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fbf9757365sm13106540a91.0.2025.02.18.21.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 21:45:45 -0800 (PST)
Date: Wed, 19 Feb 2025 11:15:43 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Mark Tseng <chun-jen.tseng@mediatek.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v3 2/3] cpufreq: mediatek: Add CPUFREQ_ASYNC_NOTIFICATION
 flag
Message-ID: <20250219054543.4xt4tixsauwoqpst@vireshk-i7>
References: <20250214074353.1169864-1-chun-jen.tseng@mediatek.com>
 <20250214074353.1169864-3-chun-jen.tseng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250214074353.1169864-3-chun-jen.tseng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_214546_461267_41775D24 
X-CRM114-Status: GOOD (  11.61  )
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

On 14-02-25, 15:43, Mark Tseng wrote:
> Add CPUFREQ_ASYNC_NOTIFICATION flages for cpufreq policy because some of
> process will get CPU frequency by cpufreq sysfs node. It may get wrong
> frequency then call cpufreq_out_of_sync() to fixed frequency.

That's not why CPUFREQ_ASYNC_NOTIFICATION is used. It is used only for the cases
where the target()/target_index() callback defers the work to some other entity
(like a workqueue) and it is not guaranteed that the frequency will be changed
before these helpers return.

I don't think your patch is required.

-- 
viresh

