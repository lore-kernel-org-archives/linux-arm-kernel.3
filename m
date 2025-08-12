Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E400ACA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 19:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PtQo1+YnKpPyJJuFIk2dQE6YfNoW6wyzVP6JiM6d+x0=; b=R730ivFTGD6AECqxgECVRnEuws
	8kByPdOfoUSCoAJOmGST54JrSq6eiNUXCldqH5qiYACDBbKRAf+7VwlP+NvV54gD+Lxf3kyhMQn1F
	uOKd96Z1y1Y0erpnYRJpQqgFV/wdLkCCyCuN5OR68BJxIEsiUdgpAXGo6g3YS4ty+RhACaood9E1+
	uCkcMOJQKEoAWs33/U+eIG3AYxvGsdk33BeyUeokBPU3Byss/rHWBtVnJZCNqWpE/pDhDMVdygbg3
	r+M9fz5jBOC3qRuwy//DuikYRDuxhiKrquhRuWTzzIsOsWUPUHFI8Exv8yFHRknUmZuCK/cy31fLT
	iBL/mqeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uluaa-0000000Bmpe-1o1l;
	Tue, 12 Aug 2025 19:23:16 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uloFe-0000000AjAL-1yyC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 12:37:15 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-459fbc92e69so65055e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 05:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755002233; x=1755607033; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PtQo1+YnKpPyJJuFIk2dQE6YfNoW6wyzVP6JiM6d+x0=;
        b=DtfXhC9vTNnephF3iDnVvOeKZxfO7Go8sc2fJK22kAGOYCIGntW9nRE3GIKtB43lcZ
         Dig3O4889tGHp6/Bef09VYw9+XOTt1kldrCtXbKd8rERAY87FGzGqZsrw2vCOhybnuxm
         V0r2GoI5z4R+5h9Gu0D6SvCgEogCttoZ2Eaw/kre3LqllBEs99G4rCPw9j8LxPeIkOwd
         1ggrMrFEKqxDvRJ3rh7f+8crVYV0YtmjfJHitlUqaRChUgllkZhEXqNfbFmB3Y5De1+Y
         SESHZ93lMTk15UOuaaVdlBF1zK0SnC3FX8koW1h3yXXwwnY/L7/PpxYWrjtSJRtvCHwE
         rgCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755002233; x=1755607033;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PtQo1+YnKpPyJJuFIk2dQE6YfNoW6wyzVP6JiM6d+x0=;
        b=vVNHrMsBvH4neLmG2v4Ha5jS2h3hwfN+T4PafIjb3dTqMlHHut3pyGSi4/iEgvgURN
         WLR0Yz77matlQ00VBqD7SsgLQoRhf0hAampdJc0gimXsJU9zvUTzH0D7RN0D6YBM+9z1
         gKwT1R76KJ71iiP4l+AQrpgaJOnq7/Jkmb1pJdxKOn5hV3qYH9ZBTSnH5+ojs5VbedHD
         15O5ikRwLdQmIJUKCpBHem9XHqwKzmTIDzPDM8ot1A+hDFf4a6Yig5Y6PzKhw8oJu8Z5
         cpehCLvkmcSK2dky5YXmy/orGPteRy1ddrTe9CQop6Xfs676/8kb8JzkgTEs/fmu4iz7
         fPmg==
X-Forwarded-Encrypted: i=1; AJvYcCUXyPSbXxzNVh1t8WAoFHX23ubggd+hwhha0ZIQTlhTFVgcw4XUdRUcarGbMDfmT3O3uGfVTALpXgQJNYGdZMVU@lists.infradead.org
X-Gm-Message-State: AOJu0YxpiDze9vQ5MA3WPstOP/8enmmlDCoZfTh84wB8AEvnkK1N21yv
	fYOWowjQ14dwesSASawupMxkwP56BzZMCD4pqG2SLZyF0fzm9jxNOsuae1bEUPw66A==
X-Gm-Gg: ASbGncsliWpLCHGWSP5cUqWvZzGILv8ueCJhSIJqqEzlxj/qwibENAVh7BYS7ypcJKH
	xk6x1Pw7RbsmiOwIxNMWfEnFLxBdQHV8N/Nfrah785E8+Ktp6dIqUWr8UESKlBpQbygnuiET+K0
	+3zNWxYBZ2A/q2m1cC+yUahWvi2cGaYre32A/H0+z5RLNqU4EHy9Tdkvqc+InOs/hqSNq/9JGHN
	ZshbIJ+pjnqxSiliSZ5U017b66CJ2MwFURv3yGErDRENMpF62sO9Cm76npZLiP5EUC1ycWvHREC
	gEk8nHA2nsBrLaxiEPKkyVOS6bWzDCMYzv60gcxky19xE1gSAq9ZHEUVMmzFxtbb8WHvxhLddnv
	ifZjyspXuBt3dxnlRMY/MvM38j9Pyr2YJz3+cENMznnFaY7hH2BpoWP5xA5xx+4kVdQ==
X-Google-Smtp-Source: AGHT+IFFzsEa9cITaRrgMdyauTFUB3XSIIAjCGeM6bXsRwPoXP8edKN4pm8dt4hrGOEGeaKzytXWkQ==
X-Received: by 2002:a05:600c:1c16:b0:442:feea:622d with SMTP id 5b1f17b1804b1-45a118c8a81mr1414775e9.1.1755002232511;
        Tue, 12 Aug 2025 05:37:12 -0700 (PDT)
Received: from google.com (110.121.148.146.bc.googleusercontent.com. [146.148.121.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e0a24bf1sm317915135e9.1.2025.08.12.05.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 05:37:11 -0700 (PDT)
Date: Tue, 12 Aug 2025 12:37:08 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, robin.murphy@arm.com,
	jean-philippe@linaro.org, qperret@google.com, tabba@google.com,
	mark.rutland@arm.com, praan@google.com
Subject: Re: [PATCH v3 29/29] iommu/arm-smmu-v3-kvm: Add IOMMU ops
Message-ID: <aJs1dMiomjtxVwl4@google.com>
References: <aIt67bOzp6XS_yO-@google.com>
 <20250731165757.GZ26511@ziepe.ca>
 <aIurlx5QzEtjpFLd@google.com>
 <20250801185930.GH26511@ziepe.ca>
 <aJDGm02ihZyrBalY@google.com>
 <20250805175753.GY26511@ziepe.ca>
 <aJNiW48DdXIAFz8r@google.com>
 <20250811185523.GG377696@ziepe.ca>
 <aJsXkidmcSl3jUJP@google.com>
 <20250812121056.GB599331@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250812121056.GB599331@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_053714_550372_18D03A57 
X-CRM114-Status: GOOD (  36.89  )
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

On Tue, Aug 12, 2025 at 09:10:56AM -0300, Jason Gunthorpe wrote:
> On Tue, Aug 12, 2025 at 10:29:38AM +0000, Mostafa Saleh wrote:
> > On Mon, Aug 11, 2025 at 03:55:23PM -0300, Jason Gunthorpe wrote:
> > > On Wed, Aug 06, 2025 at 02:10:35PM +0000, Mostafa Saleh wrote:
> > > > I am not sure I understand, the SMMU driver will register its IOMMU
> > > > ops to probe the devices
> > > 
> > > You couldn't do this. But why do you need the iommu subsystem to help
> > > you do probing for the pKVM driver? Today SMMU starts all devices in
> > > ABORT mode except for some it scans manually from the fw tables.
> > > 
> > > They switch to identity when the iommu subsystem attaches devices, you
> > > can continue to do that by having the paravirt driver tell pkvm when
> > > it attaches.
> > > 
> > > What is wrong with this approach?
> > > 
> > 
> > My confusion is that in this proposal we have 2 drivers:
> > - arm-smmu-v3-kvm: Register arm_smmu_ops? binds to the SMMUs
> 
> No, I don't mean two iommu subsystem drivers. You have only the
> pkvm-iommu driver. Whatever you bind to the arm-smmu does not register
> with the iommu subsystem.

I see.

> 
> > I am almost done with v4, which relies on a single driver, I don’t think
> > it’s that complicated, it adds a few impl_ops + some few re-works.
> > 
> > I think that is much simpler than having 3 drivers.
> > Also better for the current SMMUv3 driver maintainability to have the KVM driver
> > as mode, where all the KVM logic is implemented in a new file which relies on few
> > ops, similar to “tegra241-cmdqv.c”
> 
> I don't understand how you can do this, it is fundamentally not an
> iommu subsystem driver if pkvm is in control of the HW.
> 
> And I still strongly do not want to see a para virt iommu driver hidden
> inside the smmu driver. It should be its own thing.
> 
> The tegra ops were for customizing the iommu subsystem behavior of the
> arm iommu driver, not to turn it into a wrapper for a different
> paravirt driver!!

I see, but most of the code in KVM mode is exactly the same as in the
current driver, as the driver is not HW agnostic (unlike virtio-iommu).
In fact it does almost everything, and just delegates
attach_identity/blocked to the hypervisor.

IMO, having a full fledged KVM IOMMU driver + faux devices + moving
all shared SMMUv3 code, just for this driver to implement a handful
lines of code, is an over-kill, especially since most of this logic
won’t be needed in the future.

In addition, with no standard iommu-binding, this driver has to be
enlightened somehow about how to deal with device operations.

As mentioned before, when nesting is added, many of the hooks will be
removed anyway as KVM would rely on trap and emulate instead of HVCs.

Otherwise, we can skip this series and I can post nesting directly
(which would be a relatively bigger one), that probably would rely
on the same concept of the driver bootstrapping the hypervisor driver.

I am generally open to any path to move this forward, as Robin and
Will originally suggested the KVM mode in the upstream driver approach,
what do you think?

Thank,
Mostafa

> 
> Jason

