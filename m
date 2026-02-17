Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50FFDE68165
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 11:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eIwZCY0zKRfC1+dyqf7bcb8270ONyoPFzl0pET2TSeE=; b=YtBR5gMh6iLJmKtdtILhcW8BcT
	R/8gMR2bH/jIQYGRgoi7IKFvJOYj2tqheoXu4zPv7IfuusysXcPA1+Dkdno1wE9JpWULAPAhJSLuy
	3Q1s7tF5adPuLab0PfzOVbD+Udb3VvqNZwAIac68UPcf87EUPHcwYC6qxuDLMxVM+xHNLjmWb1H/n
	mAcPI8Qkdtq/KMjfAQCibpAon8CdK+hs22q6zI1+YL0rjF6MHzImm8yDwhxlGf7nRmJ7rZSsMpbQO
	KwdmRCHa2X/D8vXGAaAIwfP4I9FOjqhnfks1VgaMutldpvPl2bwy4nE2zaP5kq1WX1o/Yk8RFe2K4
	fN/9SqCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsJ7o-000000086dj-3vFf;
	Tue, 17 Feb 2026 11:20:17 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsJ7l-000000086bj-1a5c
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 11:20:15 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-65c5a778923so459615a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 03:20:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771327210; x=1771932010; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eIwZCY0zKRfC1+dyqf7bcb8270ONyoPFzl0pET2TSeE=;
        b=YNl27kubvIur9ADXTTwVfjBNa0sPlaZPJdz/hvm0OGxq1tHb1UHHltp0/xGmggTXep
         iQv7MuCMbD6FpNVTo5T/2yHKx9sekTzF4/XVHGcdlKUEZhbTz0JbaJkg2ll5eL9a6i6z
         DnGjqhm6spDkJzj9CamYJPoJI2e2UqtnB58eAxSuwWL+uM/n7zsba+fC6btO8qQI6JTm
         St29Cx2gvNOTKOuWt2ZBJ3iYAqNGhNdcIaO7+d0ZSw/lbAhI4x6JC+Ir6zi7dgMYEkJl
         OQheVHqvkUpC1nJ1lAKQ3RbdwPT4BW5n4iSMZB4h9ryauVjofqQKlGajTQ1+kaycgxtW
         M/rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771327210; x=1771932010;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eIwZCY0zKRfC1+dyqf7bcb8270ONyoPFzl0pET2TSeE=;
        b=DOysHzDgMC9HdHYunOvsAC5PHyKHhpOPEx67nMiDLvqxye6CVAFVBuy/gl98zXOa7P
         GquTqtvTx8EMN7hzrG8FKJkV3rHb8bUqHHzbyX5jnNSDbxfse5NjOshHURW/+Ze7LX6F
         Qd0s/i3mWAMd6PaWid2/JhaADdxhWfgMp4NWr+3NcPjYptZet1KWPOOxDXByOgrlxG95
         5cnNhNC1aVGVK6l53JRde0kCsjZfzhI0fgZ3VGVarLjk8KzFboKBNq+0CO+RLk2z0x9e
         o6NW9jPTfLh+kfAL9Jw7JULasUVW2n6nt2CoF2uCsyNWbZfBd/U4lo75fCgzGoPbXFWo
         vdSA==
X-Forwarded-Encrypted: i=1; AJvYcCWsXw6guiVDqiqn6y4T4UlWyAG1uPcjvBHsNmVd1wl4EV094u6F6ZcAYXYJ5MEmkuqinbZJ/2BStfqEYeEOLvg6@lists.infradead.org
X-Gm-Message-State: AOJu0Yxhqcqi0NL2WniUqPQGTg/JM8Apvg1gREY6lgdV3sjR1RFDRm0W
	+rgozuFmFPQEAhByg4whW6+R36pzB2v/92oVynZHYdu9qoeilIwU6UdKnfInLjkRFw==
X-Gm-Gg: AZuq6aIc3ZHBv/IzIVNFQUzDxNax7eiQJdjeyOHSgRk5qHFxES4DbUZv34Bp40p8bvd
	GFPKuSWYfMDEq9Jp+7sAQatqmIkWeddxcK+LXQAViP6oqDmMzRFZP5jFsAbEPNt3kvNpzXjELkh
	T5clZfKvoPQbwjgVl02RenNIf03udDKQyr/3jGH5G1Qcb8AJKqVkIn8DgqmCGzNyE/68hUno1Wm
	PHjs4mMasxuUVOraG5a+hJMQsslaijSeFgSiSaVlofUOe+1UMPLj+t/U4GEQdTRGKzgzx+zjvmU
	IGWu0cUJVHd8w+82xcp+ND0R1zMngyFdea6ILuBOXYNjqLLT4r+qDgNVeyrt2GYHrlG8qVFDm2u
	bopp4qIAUA04hEfv8N0pipQl1Eq6JdSapS6MUpAsyZd2Jbep8NEEkMSWooDtJKFUqtzm3+BLMbB
	YDOIsYyjXugcSjZOcjqYF+/NMAd1LLLOobty2gk+1LRSqLqoAxMD8UgtWLztY4
X-Received: by 2002:a17:906:6a17:b0:b87:6af7:c186 with SMTP id a640c23a62f3a-b8fc3d30cb2mr612995466b.54.1771327209938;
        Tue, 17 Feb 2026 03:20:09 -0800 (PST)
Received: from google.com (105.165.204.35.bc.googleusercontent.com. [35.204.165.105])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc735d185sm331579366b.14.2026.02.17.03.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 03:20:06 -0800 (PST)
Date: Tue, 17 Feb 2026 12:20:02 +0100
From: =?utf-8?Q?Pierre-Cl=C3=A9ment?= Tosi <ptosi@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: will@kernel.org, suzuki.poulose@arm.com, maz@kernel.org, 
	corbet@lwn.net, yee.lee@mediatek.com, ascull@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	ptosi@google.com
Subject: Re: [PATCH] arm64: Optionally disable EL0 MTE via command-line
Message-ID: <p7wloz3ospiwaytzzns43hbyfrxfjoca6ljols3dq4hpha5y2v@weadvhpdng7a>
References: <plslbeuzfag5dfizunxmhyw5axxbuz7r3jdlhjluzdwrm4rtzk@bm5xmxzmy6v3>
 <aZRIHZ2Wq81S-FZY@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aZRIHZ2Wq81S-FZY@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_032013_437543_5DA3B406 
X-CRM114-Status: GOOD (  23.61  )
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

Hi Catalin,

On Tue, Feb 17, 2026 at 10:51:24AM +0000, Catalin Marinas wrote:
> On Fri, Feb 13, 2026 at 12:51:07PM +0100, Pierre-Clément Tosi wrote:
> > Although it is currently possible to fully disable MTE on MTE-capable
> > CPUs (with arm64.nomte or id_aa64pfr1.mte=0) and to only use MTE in
> > userspace (with kasan=off), there is no way to limit the use of MTE to
> > the kernel because CPU capabilities are traditionally exposed directly
> > to userspace.
> > 
> > To address this, introduce a new cmdline argument (inspired by the
> > existing arm64.nomte) to only expose the MTE capability of the CPU to
> > the kernel. Combined with KASAN, this results in only the kernel using
> > the feature, while HWCAP2_MTE and the corresponding MSR ID_AA64PFR1_EL1
> > field are hidden from userspace.
> [...]
> > +	arm64.nomte_el0	[ARM64] Unconditionally disable Memory Tagging Extension
> > +			support for userspace
> 
> Why would we need this? It's a user-space choice whether it uses MTE or
> not. It's not like the kernel is forcing it onto the user processes.

Correct. This patch is useful when working with a pre-compiled distribution to
ensure that a MTE-enabled userspace falls back to untagged allocations, without
the need to introduce system-wide policies (and ABIs) for said distribution,
which would also be inherently less robust than this kernel-level gating.

In Android, we can simply append the flag to the kernel cmdline instead of
relying on sysprops (or similar early userspace concepts) and hoping that all
users are properly gated on that sysprop, etc. This can be used for A/B testing
of the feature or as a highly-reliable "remote kill switch", for example.

I should have mentioned this in the commit message and will in an eventual v2.

> 
> -- 
> Catalin

-- 
Pierre

