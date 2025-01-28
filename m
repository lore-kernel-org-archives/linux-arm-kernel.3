Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA1AFC02192
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 08:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yaGWsF28qt5Jmz9b8bZehMWnKFK742c5atFbL/t08ns=; b=lvifdv2FX/FnhP5wk1pl/KGuOM
	IqHGffeTFLunPkui449U9CNk3vAGUEhpmje54981jLvFOReFGsyPQKGJ4Ma4VROacpqM4AbEmRCk5
	cXPsHYPOFz1ieNpfuqmauHWvtbQopa+yi6t2Hir2vG9T5o9HTfSJnNLGd8OIXsl8PGwZF94euk9/w
	G+qXo6X+otKj6OM5NZZkUxmIjJbK4eSL1fyqH2q+ghAA4dflxt13zXoX2atEqpunBpKqFFt7PSJtm
	ywtcXBBrWwI/zEo/mLAdYzQ/43kXZxvtalc0avNsfQZ5FT06KX5r87G9URPRJGXsnMGW7T+af+0qf
	85+dpY0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcgpb-00000004Mjd-22vk;
	Tue, 28 Jan 2025 08:20:23 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcgnj-00000004MSu-17i1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 08:18:28 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2163dc5155fso95701705ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jan 2025 00:18:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738052306; x=1738657106; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yaGWsF28qt5Jmz9b8bZehMWnKFK742c5atFbL/t08ns=;
        b=A2IwRiulPVKt6ykdRei5Y1pZxJ+i2yhbibwuTajWswm1fzjM+vUIADYmUwiGdkCX52
         KhhclieX9rokiSSfiECvHzyX/4vyUhfLkmvJm5i8w7DILgdJvP06BZUzSjajOPYAbL8v
         JSwmrThhzqogmoUc6pfoH6YwFE+qXrzN44nUX0APHv1RlVIaecbjjAudc5qlSqg3RML8
         Y7Pd48s7G5JNONcgmXhlCnk2/LWuomI4tuLS2UCWRGW2LG4ld563HMYFJVAY2qawzlyU
         7G+nV+rIDO4ejf23zo26QAc+Wf5RBbaDZgUpaHEH8PSOHR9gsRWSDOhjqs4sNuBbT5q1
         Pz6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738052306; x=1738657106;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yaGWsF28qt5Jmz9b8bZehMWnKFK742c5atFbL/t08ns=;
        b=ktHd2yt8D0KtjsMbv/lHa+oQsDvMrDO5X/pluI9etTBbWVxrBtHyGEwEWdZynDpA7r
         qEdezM2wAbBD66sAX7IrOIZb/U934snk15zMytMuM0jQ/2mm5MdhFyc2U/FGuw8h6Hqu
         mHpwEoWsTrFyBo/02DSAHttsmYrNwsiE1ITfWPhBUYrXvO5rn4AnuQtEO1LUq1NHmdBL
         3jyLMGZIbEbHJ9ccISyfjpGMAZuBGZatF2jvsJJkab705qf1X2aCcHTBpHEw2LULHTD6
         X9sGz8/z+C5FYMo/baDrOj/CmbkCneYznJS33odX11lRXzdULcXS+r7jYJHtkWO89UZv
         UEpw==
X-Forwarded-Encrypted: i=1; AJvYcCW409We78QsAVTBUEM+jBJmxT1nhly+iThrn5bmgEkxQ75r/yLaLNn1kafieQmyOCvUNBIQVE4wT1PBvA0EC59/@lists.infradead.org
X-Gm-Message-State: AOJu0YzP5vNUe5hDNCEJWpYeaIH81lZgHk6FH/fnG0LoXi8GU5HIPs14
	+A/6CCimLaUTYp+Mk4wsLBjNbDRt+NZR0iD90eEz521sipydL8WXLaUpOcPaMKE=
X-Gm-Gg: ASbGnctxe9OzM20UOcbk3wnVxTl0X8w356E7e8/W6s6vQdbGFadm4XshFf0Jwq5X0Z0
	HUvo8sRSI7kECIkUq8QfRVRuZez2AXBHhzknsc+hCrcRjTu3GzJyFQSdCfHswFut2/uDDE4by/j
	fZOvW111gcBIJTHpQC7m6fLY87/lsBQn4sv7fiS+JTjirEDC63sLf7uZ0R1eSQFTdgIRpDUD2Np
	bE7kIo5vtfb2nl7TeU1l++44biJzDawvN8f8lyzssG1FJEANChdhXlAYSGOsBz91lgQqT26IEAc
	EgPj1Z9666llZ8HIsg==
X-Google-Smtp-Source: AGHT+IGj3rys8L7y0l7miRYjcb7aG2QGL5B/s2BFTMx0JDHVuuzvFof9j5Q6SVAnylyyKwg07DUgog==
X-Received: by 2002:a17:902:d583:b0:215:4d90:4caf with SMTP id d9443c01a7336-21c353e700fmr725778565ad.14.1738052306076;
        Tue, 28 Jan 2025 00:18:26 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da3d9c55dsm76592135ad.10.2025.01.28.00.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 00:18:25 -0800 (PST)
Date: Tue, 28 Jan 2025 13:48:23 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Beata Michalska <beata.michalska@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org, ionela.voinescu@arm.com,
	sudeep.holla@arm.com, will@kernel.org, catalin.marinas@arm.com,
	rafael@kernel.org, sumitg@nvidia.com, yang@os.amperecomputing.com,
	vanshikonda@os.amperecomputing.com, lihuisong@huawei.com,
	zhanjie9@hisilicon.com
Subject: Re: [PATCH v9 1/5] cpufreq: Allow arch_freq_get_on_cpu to return an
 error
Message-ID: <20250128081823.o3q6gjcjca5ju3u6@vireshk-i7>
References: <20250121084435.2839280-1-beata.michalska@arm.com>
 <20250121084435.2839280-2-beata.michalska@arm.com>
 <20250121104706.2gcegucb6hcuksrd@vireshk-i7>
 <Z4-52JUmR7A-7NJP@arm.com>
 <20250122061250.kxdpkkvce4g5nar2@vireshk-i7>
 <Z5K4aDaZIbhRCbOP@arm.com>
 <20250124033333.jrqbhuyd6qtogn2c@vireshk-i7>
 <Z5iQ02AIDalsUXe-@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5iQ02AIDalsUXe-@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_001827_311862_B8E4B23B 
X-CRM114-Status: GOOD (  21.14  )
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

On 28-01-25, 09:09, Beata Michalska wrote:
> On Fri, Jan 24, 2025 at 09:03:33AM +0530, Viresh Kumar wrote:
> > On 23-01-25, 22:45, Beata Michalska wrote:
> > > That would mean we are opting for presenting '0' value (whatever that means)
> > > instead of trying alternative ways of getting 'current' frequency ?
> > > This is still the scaling_cur_freq.
> > 
> > A return value of 0 should typically mean something went wrong
> > somewhere and didn't return the right value to us.
> If smth goes wrong, an error should be returned, shoulnd't it?

Right, but what if no error is detected and still a value of 0 is
returned somehow ? That's what I was talking about.

> > - For the print message, I think we should just print the value
> >   instead of UNKNOWN. Let the user / developer decide what to do with
> >   it.
> Are you refering to the x86 show_cpuinfo behaviour altered by this patch ?

Yes

> > - As for trying other mechanism to find the frequency now, maybe you
> >   are right and looking for an alternate way is the right way to go.
> >   And that would be consistent with existing behavior too.
> > 
> That would mean that changes to show_scaling_cur_freq are fine ?

Yes.

-- 
viresh

