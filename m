Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BBB5D26D64
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 15:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yv4+HiN+yqOKOu3jmdjrQOPhk/51CyYpn99UE5n2Bh8=; b=VV6c5Bfko6+FxEOrM0uFjczBzF
	YEzRO6KTlCB7pPkeqN0qwE70KSPoFNxmgHKxHX4rxq9J5vv9G3saECsPquJWWaKhcJWebId401KHa
	fRredaOQdYSQa79pRTe2Hif7tOWjUeNbcRqGABw4KDjDo5wIdXZbHRcXcY3iQcMF8y4hXbsMmzI2c
	8OR4L3VDQVPWV+UgfrVJW8ewaVYAIfDnwj2Ub0Vl8c9ld1cc8wQQ7pK/iBLXeK8hAHKHzaOrYAOlx
	//5KWep3qeC9JrVDatsOxvH13tHQtvTsSeaifw+icbwvx7Vrtro40A8TZz+oY7TeSa4tH6sdTj52H
	usCBqLkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veE7z-00000002SXj-48yz;
	Fri, 09 Jan 2026 15:10:16 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veE7x-00000002SXM-2zfo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 15:10:15 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-59b834e3d64so566055e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 07:10:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767971411; x=1768576211; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yv4+HiN+yqOKOu3jmdjrQOPhk/51CyYpn99UE5n2Bh8=;
        b=GFwPxSE3xmyEg9+J3KdgqAwLJkIoRrCdPxlpi27j6MjIyN/nx+HNQCCWOOjfBwTRGx
         WCxes5qSwS/8eHCUC+jvkYjmN97G5kxzPcXGUKBzfWbjd7il2o5jXJvxmg7RrJjuqlx8
         z7JtgccxCbzIy88vlgbGoXcuv9Gy7aS01KJYBoIJhnWNRGTW6YEx/YjLvAcs2EYkEZQd
         KJxI+uY06MgE8DWw3E7tjh+F4AZjMc2Z8O1ACk4VantZvGVetQsWia5oojkZVSGHeYVa
         HRExpGeZ156g+2qGZdQGybFHs/IOfTGKR70qdgXxei8Vz6Sm9lrivLd55p4w6ANKMZuR
         GwFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767971411; x=1768576211;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yv4+HiN+yqOKOu3jmdjrQOPhk/51CyYpn99UE5n2Bh8=;
        b=SY3rCm6B60GSCQiY1mRdYRSBOmzkpnVaRj88eOx2zRlL7JcK/iLo6Tslzn0UCS3AyQ
         FSqFbOB/FnnHrYT17YEF/mwBIHHcOerhiHNGKSg/dPb3c73mRPRVNZcwJWPFkbe16Gfa
         ML5O9Uug+SxV13Lb6rPNq39M6CTXVknCVW54NTjaYubPcTKWpSSN7Jnz51YYNn64qs/p
         f1CNtLVZx7y0P/ho8T2xEPh7gcLPJVdEkHFQR/pqOwGgkSCj1WkUmE7Wt7AowwE76AoQ
         PlRUHTvG4Q+xxsUg928tFW4Ozr8QuQMTnrUDRzdZjJfe+WWvpHtxWjPWxkJjwBXSNL8V
         QnvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXg1iIH5l0BpcFy+gPrxeriVlsOWY6MID9nFa2RyQQmnA1bMKrXMYduA3tRTSJmmCxpnW4Hp3mRfbPHKGtFA0lI@lists.infradead.org
X-Gm-Message-State: AOJu0YypBhy4vliDwjwh8qcE9jcfycdkIOpujSXTRzsg0Wu2XcnVWYmt
	eNKhyUgPTeBcP8PtL3F8++0DffhMkIetllZXl9Lp4Waut4pBrYnbfgbuUxkKtX7K5Q==
X-Gm-Gg: AY/fxX5e3kcNUYYHjseJIygRrha0Wz2XbzGINynJ76cN9k9ugSaewAukJuUiPTbLHhz
	17VizI6ODG29afay0lQ4jFn1me3vON2Aadxr1rKs71HUgCVXXhjZIwhLiw2RFo4d8ybyruTojMy
	bZJJg2QXn97/kgTZuiYJ7Wl8lX62lSivgI0SNJ1FWniDNWvFLwRNtSOD8fQ6tIu+eEPPoWn9T3g
	ixVLrD8zdpyUlAB1b0H/Hz4u8891UK6ggz4SKTff7hkot0H3AWpwkRHsnuaSJjmtgReIvhhk/Ot
	DVJUBCFICHfmyOJtV66g893YI8dgXr9DAcGp7wjRpD3KEHbKlLb7Ap8B3XuJXkIc8d5N95HzfQ8
	ieSivdz4IEhWCR3ccGO97AJ7TDnyoTPvx3IiAl9s3XLJiiAlTfl8a1i5MCDXEFCpV7jsPTUgqq/
	q4Jtq5DXgVzex1LRzfWFwb7Jdj/WNYQ9r/9DH+cYRDHt6VOOHKhevZ/KfRKCo=
X-Google-Smtp-Source: AGHT+IF8ZU8/OXrPqqCYUZcC7FlQRUXnd7JW5KZdJvEvqxw8os3Wm5I5Rrtd6HZ/MikKPOBlVL/jBA==
X-Received: by 2002:a05:6512:2308:b0:598:ee5e:d8bf with SMTP id 2adb3069b0e04-59b6f0212c4mr3116876e87.15.1767971411207;
        Fri, 09 Jan 2026 07:10:11 -0800 (PST)
Received: from google.com (228.231.88.34.bc.googleusercontent.com. [34.88.231.228])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65d0d108sm2870289e87.27.2026.01.09.07.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 07:10:09 -0800 (PST)
Date: Fri, 9 Jan 2026 15:10:06 +0000
From: Quentin Perret <qperret@google.com>
To: Will Deacon <will@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Fuad Tabba <tabba@google.com>, Vincent Donnefort <vdonnefort@google.com>, 
	Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH 10/30] KVM: arm64: Introduce __pkvm_host_donate_guest()
Message-ID: <bb6e722uvhqhhaijen6y7arny2qc4jozq34fu5fq27rchlrqye@cg236pt5ztzf>
References: <20260105154939.11041-1-will@kernel.org>
 <20260105154939.11041-11-will@kernel.org>
 <ocpyeygxhp52jt2mcqq4tmdodubrfdwo4xqvbphmr34x4etrkk@f3ag3a7j5fru>
 <aWERFx9PwX1yED9H@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWERFx9PwX1yED9H@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_071013_773977_C29A7B64 
X-CRM114-Status: GOOD (  19.50  )
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

On Friday 09 Jan 2026 at 14:30:47 (+0000), Will Deacon wrote:
> On Tue, Jan 06, 2026 at 02:48:00PM +0000, Quentin Perret wrote:
> > On Monday 05 Jan 2026 at 15:49:18 (+0000), Will Deacon wrote:
> > > +static void handle___pkvm_host_donate_guest(struct kvm_cpu_context *host_ctxt)
> > > +{
> > > +	DECLARE_REG(u64, pfn, host_ctxt, 1);
> > > +	DECLARE_REG(u64, gfn, host_ctxt, 2);
> > > +	struct pkvm_hyp_vcpu *hyp_vcpu;
> > > +	int ret = -EINVAL;
> > > +
> > > +	hyp_vcpu = pkvm_get_loaded_hyp_vcpu();
> > > +	if (!hyp_vcpu)
> > 
> > I guess we should check this is a protected VM here, else a malicious
> > host could donate pages to an np-guest. I didn't try to think through
> > the implications, perhaps it's fine, but it feels unecessary so I'd say
> > let's be restrictive here.
> 
> It's definitely harmless to add the check, but it's also hard to justify
> in my opinion. Can you think of anything that can actually go wrong it
> a malicious host donates memory to a non-protected guest? Generally,
> I think the fewer places where we have to distinguish between a
> protected and a non-protected guest in the hypervisor, the better.

I agree with the principle. Now, we already _must_ check that
host-to-guest shares are not allowed for pVMs, so this would simply make
things symmetrical I think, and this is really a simple check.

Right now a page donated to an np-guest is probably just leaked and
doesn't harm security with the current code, but I'd personally rather
not have to reason about this known-to-be-broken state as we add more
transitions in the future -- I write more than enough bugs just thinking
about the known-good ones :-).

