Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69055CD3447
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 May 2026 23:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t6tLt4US09DyLso/mhdji9Hp8lkbi3csRWs2bmEy9sU=; b=qStrpD0sxGV01c7FgO3HTRXVIS
	9yx8Dm1E0uX5X8HPcP3V1H8ggqWRxZ6NPzEYlaSsEBLliIIHsuUIvI54OmCd+3gH5my9NRJ+HzWAl
	Rb9rnOk15xRoVX9Bb9+z4a9LOJrEta8eNtm40yNdO7nA0hZXim4gtq0m7zV9mzPQMShFKfncM7uDA
	2HdUEAmMOXNOHh63rPscVr0QZR84Xw0pCzMK/jaN5ugv7vhb1zqsnvT+skeH9no6ZvoKNEMnZ/1RH
	e8bHJaSUKXZ+F4djgSd9Ey+PqoorQSWDmcuavh2M+VLo3jeWyiXBx3BItKeAMJmVZcFfmCl5QM88e
	k2gsV0cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLrC5-00000009pBF-3QNF;
	Sat, 09 May 2026 23:34:49 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLrC3-00000009pAf-130J
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 May 2026 23:34:48 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-50faf8ed9c5so16637361cf.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 09 May 2026 16:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1778369686; x=1778974486; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t6tLt4US09DyLso/mhdji9Hp8lkbi3csRWs2bmEy9sU=;
        b=PWEUVq3IVD2y1eBjDvVOcwhFPma8AdnDm4ybL/CIY/K0mprEHOaQMH+FZ13X2A7e6E
         Zk6gAab9qngOSUK1dmoKEMuEpYlLdOX6hLXD/QNBezeiOUNw2KNLuvC3IuBZ8P6xAPJn
         l+um1KUWVc3XHv9mG4Kooc1Qh6rYux7xOzyxqj+eLOneoS1PI+5qEYs5KI9aVSVXAcgt
         PUe1oK+l9Y8ATGOJAa6p4GFdEHs7P6oJOmqgI7ic7AGeNv34hOOYooIteiPd2pbbIhvp
         zOJ0CKUr5qxDwNc1CsyxNRIkuv+GkGHrNXAvHE/j/0+qgP6pqdbkQljV40n1A6pBokjo
         YO9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778369686; x=1778974486;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t6tLt4US09DyLso/mhdji9Hp8lkbi3csRWs2bmEy9sU=;
        b=SEzWl1JQCaWsmQAHj+jzCIsr+jIYHnPo9FivSY7aVLIUJvfEmouH732h3HQJrquiKH
         fuUJbWuAl5j40GPFfRL00EnidlzAAxgYhx3HkOntS1i3peIMOWfh4Qc+9yMMMu1SxvM3
         Com3dgL4blg1+Q9Cup5dy7yXBCnxLfiwV5tr9cc8VDNvH6SQyzakpQpbYBIHmrumJPHj
         tEjxtkVHrkZFdZif9BmTIj6Y5fWwhZzO8y5+qhLJw5bV/qrKAe9g9PpABdYNHRriW/4N
         If3jWzULXyIyyN2BJ10Fp6vcLZtYCFOxI+mSCHJTfvtqPzGX8DwtLEDp2AyDiwUOBAUq
         xtvg==
X-Gm-Message-State: AOJu0Yxwr9at1yQjKIAiAh42tTgw3psn5PPbqA7sf3mFPE3FLShlWKc8
	7+jiCmSdw+NWIc7yCZSJVuBb/7ieaf36sTObL3uPUzctorI6vPRiihbOuM+76rlc828=
X-Gm-Gg: Acq92OGYkiJCsOVxBRwcWZnY7l0VHzGs7azvMNbqbWzJF7OLbLEDUnEdAmrBEEosowk
	c3HamRjCF4LXx23/2Gu7vyXPMwZZUhvD43jU4Y657ci9nNdvOUStPzRpYdr3GnkG+0xw/2K8HJl
	q73ZXFnOFLjRvLu+kCUvUKYflLhMBE/U7UCUTG4Z/6XxTRvCEZzFJ8MW0+VKI0ioibbnU6Hs9yF
	3O2lGSrRNK59PsTx0gI9Y5CzaMsB54eI+0q42Tj+0rLawaCS9kjFbiYBHi5blHe0B7nOhd9KSXi
	PeyaoFnVk++00FrsAv3Kipxq/VOTMKrJxcIcK5kISLyvsIDR5TyiSsTV2HdoJ/FHBCk3Xr6OwEu
	Q90xoHhxQDTUj/cj52jI41vBkU4INIErfIstVro8sEmhSGNaWuZONUl3uYozUJRp82FnKy4e41E
	sAEo4fIe7wFfizd77v/DSjF7TK1Z9xsDvoekPCGgdbFd7z40SrpjsOdnn8PHxCI4/kKKV1uyhyR
	m0sEg3HK+lJowV2
X-Received: by 2002:a05:622a:5a9b:b0:50e:6139:492b with SMTP id d75a77b69052e-51461c3620dmr247096161cf.23.1778369685834;
        Sat, 09 May 2026 16:34:45 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5148e7e3d90sm51028881cf.20.2026.05.09.16.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 16:34:44 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wLrBz-00000002ONN-38VG;
	Sat, 09 May 2026 20:34:43 -0300
Date: Sat, 9 May 2026 20:34:43 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org,
	mark.rutland@arm.com, qperret@google.com, tabba@google.com,
	vdonnefort@google.com, sebastianene@google.com, keirf@google.com
Subject: Re: [PATCH v6 05/25] iommu/arm-smmu-v3: Move IDR parsing to common
 functions
Message-ID: <20260509233443.GK9285@ziepe.ca>
References: <20260501111928.259252-1-smostafa@google.com>
 <20260501111928.259252-6-smostafa@google.com>
 <20260501124716.GD6912@ziepe.ca>
 <afiODW2sVMeOj3Ag@google.com>
 <afoagb/wVBJD1IX+@ziepe.ca>
 <afofSPQbepd_fpom@google.com>
 <afsQTwO3eW+Ks2fe@ziepe.ca>
 <afxlufh3t3hRe4-G@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <afxlufh3t3hRe4-G@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260509_163447_325945_E3DAF5E1 
X-CRM114-Status: GOOD (  22.13  )
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

On Thu, May 07, 2026 at 10:13:13AM +0000, Mostafa Saleh wrote:
> > I was thinking more like
> > 
> > #define arm_smmu arm_pkvm_smmu
> > 
> > Before the pkvm compile of the shared code. 
> 
> Oh, so we rely on arm_pkvm_smmu and arm_smmu having the same field
> names and types?

Just for the shared code, yes.

For instance this patch would require the features field be present in
both, and then all you do is directly copy all the smmu->features
logic into the shared file and that's it.

> I don’t think that’s better for maintainability, I can look into it
> if Robin and Will are OK with that.

I think maintainability here means pkvm minimizes how much it changes
the code of the main driver.

Copying a bunch of functions into a shared .c file exactly as it is,
then compiling the shared file with some #ifdef'ery at is going to be
long term better than trying to mangle the whole thing to avoid using
any of the core types and not directly share the code, IMHO.

Like my tlbi point for instance, it is not a good idea to rip out a
little bit of the invalidation logic then open code a pkvm
version. Use the exact driver code. But to do this you need to pass an
arm_smmu through to to the pkvm specific queue management functions.

> > How does pkvm compilation work anyhow? Is it all rolled into a unique
> > link, or do you have to worry about symbol conflicts with the main
> > kernel?
> 
> All pkvm symbols are prefixed with __kvm_nvhe_ in the main kernel.

So automatically with objcopy or something like that during the build?

Jason

