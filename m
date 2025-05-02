Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68B3BC3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 10:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CtsSgTJXGapsZiIyWX9A+s/wE2QFs3U8FxXWY4U190Q=; b=jYEvINkWP8c8fihqHFWpFnm92p
	twcgVlZ5mhTM25VV0aky3R/qFs/5/TS9SUDN1STpIVBYiWAbnrDZ8r7zkl+INJQgwM1MCOGrEmM5Q
	U3soTLP9bZIJx+7vRyTZM1JhRQ151vpe9++Sbkih56nP9FeBjjmrxP1OYAO8AlOXvAedsMF1E4t0z
	CwnAHbMMvGxWmWllWX5u/J64UOLInsmDjQUQRAYIfMBYBkIezx7dkvi4OgL2e/KeDM4spdbbqVFRS
	1BCu8TWvVxrD+/7gQaZQgcJuy0CKEQh1e1iPrulytyokw1RVd7cyNYTf1iEpxgBpbuD6ZW1y9E6Du
	l4bKFz1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAnnU-00000001dTD-2XgV;
	Fri, 02 May 2025 10:39:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAnkN-00000001cbH-11k1
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 02 May 2025 10:35:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=CtsSgTJXGapsZiIyWX9A+s/wE2QFs3U8FxXWY4U190Q=; b=mXL3HQfMHwtTa/RbqnQTId6exQ
	EKVk6yvWlxAejLtTD8y1jEBC+Mu4o8OwEodq/DwuB57libubYoEsuw8DhAU9cUgLd7buzvqaLrQpT
	RmS2reh+NE/nKmeGe4EXPjjs9IgQsEGYPlLzhk2AFDcDs7pdFCkAqtYYYeOvHbz4clvCkVsOP59dc
	fcWFWLdFwRCGxg6Pqj+k4NY9GxbdpngEVU3wzioHrB610wMO4gdWzd0aADHUdp3NhlzTI7vzEYtTX
	FrTTpZKCG/ZUoTGSXUH/H7kHcKjiDmWzODUiso5FRWO7GI8PzCvOXfusSL1xbfxn+4sBXQyvplY6O
	+GrjIITA==;
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uAnkJ-0000000EkvM-2oKg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 10:35:57 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43d5f10e1aaso47715e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 May 2025 03:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746182152; x=1746786952; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CtsSgTJXGapsZiIyWX9A+s/wE2QFs3U8FxXWY4U190Q=;
        b=pTdo+d6vRZco6HvXU31Ohw77f8fIvacat3jmB6CYsccyUaqjEgIDOXvDBZipyG81CO
         1yMavlBXSqVLeXCoYZGPuHbTX8q+v8rf5CNgTUFDEvFwirk2prH0b76biDgG9KT7dqlc
         krmHyfiBLjl7dNvx1Ks+XFr/91PYHliVIG1Gezgdhl2Uf4dZ1VNMPAVtmxOCGzVs3PeS
         z7DuCIOXd0wQ8pKgEKAoq5kEHfEk6qLSDm7n3yu1QwMORIyEJE1G2wZHUJaVwh/N+/Hr
         MIFFxvpXgi+qeOSgsABVT6S97ebPmTwN375VHuFDqMyRRA3aMqU7HRymoI4mbmk0LlXL
         t64w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746182152; x=1746786952;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CtsSgTJXGapsZiIyWX9A+s/wE2QFs3U8FxXWY4U190Q=;
        b=LG8QOQj4VXxJHLplth2RL3a/AS9+RgqpBCYiV7pXpnvmPGVShQE6OffC09AlsCFSOl
         COyI01nLQ+0JRtTnZCUo/+9aEmmTMnjLVT5uxhJcpbS1xOZNnu1ayECyq3LVppimLdtD
         hK7PeJ5gPJ4C67jQo528pNRxc/lm6s2BsfUj7S2ZO86AwBMkDjEOXpbkJhr0B/++yk6u
         4Sdw/4qzLEvvE4Sae73EQgKaMJ145CpUrkWXQzsm4REnW9OFBgntaLS8OIioJAfYVosR
         /24eVfl9WGHHzKUWSGyOjDV5lSJwxjz0/GiyFg+tIUI6KenUIVDY3A+Pco84/Gag7lrt
         4H1A==
X-Forwarded-Encrypted: i=1; AJvYcCUevY0o9L6c9PMrbS13LqPfpOCB0kQxZe01skiGIgnCkFHnLcHt0MHnLqeVCsSYsZsIp2KOJGamtCrfMb/+l5Ur@lists.infradead.org
X-Gm-Message-State: AOJu0YwCgvGRvrFJ4l2LiPHml+2hHf0+PX8hxBYszPR9v64Z7Bgg7ORs
	Xksa+mKaUXON+wUPZoQI2sH5scLVSXQO+IijGm3ZN9ZPy9sAESMBdzgg9xG9jQ==
X-Gm-Gg: ASbGncup4cM6wF5hmNhdrgEJ5MAx344EZKpA4ubhsCCJVaCufRIQpx0HgUlsf7b+fXV
	FIOBsWkIOx3dj4PfwFKLDAcxASb+ufIXTsJZ0FYaNeCInNfiQxhMYrH0QwtZ8U2iQleKIvSequR
	fsZpB27Fr6w61K3pR/6RSlrnbnrBT+NzcOo2o+PMop+ZYWELKLFj2Bt+OKcbm3Mi5nr55pZoK9I
	eeNbjcVrnSY4yAWfPS3lluRTv0zBNP7s6Et4ESf9p5mWNeM8QAJWkq8bXpJg4QwltJ5MiLhDIpl
	N1TNJvEbjtBAZ2wkni+o2v0py8MY0V4jnYGZMd0fqBiub8GMeKroVxSWYndEzMG5znZeOx81h1K
	kT+Boll9RoZFvh6LG
X-Google-Smtp-Source: AGHT+IHBpu5+Cieu3gqJ8jXxnE8iNjMiOB9PP9JbLSiZk2YmB4uIxV8AkyqehbOtRxJxY1xSoUA/kQ==
X-Received: by 2002:a7b:cd08:0:b0:43d:5b3a:18cc with SMTP id 5b1f17b1804b1-441b641d324mr1930065e9.2.1746182152313;
        Fri, 02 May 2025 03:35:52 -0700 (PDT)
Received: from google.com (207.57.78.34.bc.googleusercontent.com. [34.78.57.207])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2af2a0csm85602295e9.18.2025.05.02.03.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 03:35:51 -0700 (PDT)
Date: Fri, 2 May 2025 10:35:45 +0000
From: Sebastian Ene <sebastianene@google.com>
To: Per Larsen <perl@immunant.com>
Cc: linux-kernel@vger.kernel.org, catalin.marinas@arm.com,
	james.morse@arm.com, jean-philippe@linaro.org,
	kernel-team@android.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, lpieralisi@kernel.org,
	maz@kernel.org, oliver.upton@linux.dev, qperret@google.com,
	qwandor@google.com, sudeep.holla@arm.com, suzuki.poulose@arm.com,
	tabba@google.com, will@kernel.org, yuzenghui@huawei.com,
	armellel@google.com, arve@android.com, ahomescu@google.com
Subject: Re: [PATCH 0/3] KVM: arm64: Support FF-A 1.2 and SEND_DIRECT2 ABI
Message-ID: <aBSgAScZUp9qIspT@google.com>
References: <20250502092108.3224341-1-perl@immunant.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250502092108.3224341-1-perl@immunant.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_113555_914581_F64877FB 
X-CRM114-Status: GOOD (  20.94  )
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

On Fri, May 02, 2025 at 02:21:05AM -0700, Per Larsen wrote:
> Hi,
> 
> The FF-A 1.2 specification introduces a new SEND_DIRECT2 ABI which
> allows registers x4-x17 to be used for the message payload. This patch
> set prevents the host from using a lower FF-A version than what has
> already been negotiated with the hypervisor. This is necessary because
> the hypervisor does not have the necessary compatibility paths to
> translate from the hypervisor FF-A version to a previous version.
> 
> Support for FF-A 1.2 in the hypervisor is added as a precursor to the
> addition of the FFA_MSG_SEND_DIRECT_REQ2 messaging interface. The bulk
> of this change has to do with the upgrade to SMCCC 1.2 required by
> FF-A 1.2. Additionally, unimplemented FF-A 1.2 interfaces are added to
> the list of unsupported functions.
> 
> Tested by booting Android under QEMU and loading Trusty as the guest
> VM and observing the SEND_DIRECT2 ABI being used successfully during
> guest boot.
> 
> (This is my second attempt at sending out these patches; sorry about
> my broken first try and the resulting duplicate messages.)

Please tag this series with v2 if this is the second one and include a
changelog.

> 
> Thanks,
> Per Larsen
> 
> Per Larsen (3):
>   KVM: arm64: Restrict FF-A host version renegotiation
>   KVM: arm64: Bump the supported version of FF-A to 1.2
>   KVM: arm64: Support FFA_MSG_SEND_DIRECT_REQ2 in host handler
> 
>  arch/arm64/kvm/hyp/nvhe/Makefile |   1 +
>  arch/arm64/kvm/hyp/nvhe/ffa.c    | 235 ++++++++++++++++++++++++++++---
>  include/linux/arm_ffa.h          |   2 +
>  3 files changed, 221 insertions(+), 17 deletions(-)
> 
> --
> 2.49.0
>

Thanks,
Seb

