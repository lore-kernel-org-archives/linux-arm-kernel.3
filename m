Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FEF5CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 22:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+1xezh5zigs0Eh1IHXpsvZxf5v0NNa8iAaWLGnBO56k=; b=obXlOY1oUDRc4u58+OQpnfasSl
	4ER1WZ9rBOY9zLEb1OMgoocO9zkT49xan2qV1KKz4UjSlb/NAHQZ7d0wLHIW+nJDUERoAud+bH01u
	lWLtGkS6gi/Hvqz2n0POfa1ctey6w59a+cv5Odw18LOyll97oAEw9B5MvQWSrxeYrYa/xLtMPSK+d
	OJO+reNuf5VowMgeztHgEcT5en1oxPG0vlAkh7zQx4+DDHvATLOpKCwmK8WMTN44ZVVyoyWVq5xSo
	qJ2OC+R5mngwRwo3mocuGVzAFonKzwHJFqO/tfs4RlaD1k95t8uJKGDLFHQ9sD6sqxg/Sn7QtezlC
	VCfsHjig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulacx-00000009D9A-2VCc;
	Mon, 11 Aug 2025 22:04:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulXgA-00000008qci-3S16
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 11 Aug 2025 18:55:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=+1xezh5zigs0Eh1IHXpsvZxf5v0NNa8iAaWLGnBO56k=; b=lIZD3dFeilQTR4LppsWvBbofwa
	UHZ2SlbDrHwxi/IF7S654+DNhnb4peRn6XS+fSBNP6IDWRwow4Dsfcqh2t+AB4U+LHAPnFFWX7ekv
	P1hylFVt++YZ9mJlBaNVExOTNmlUSY9vUv20VBmQVJKfbnFoV8dLSabfMwfl/F4lxi5oxon4jiMQk
	RDjH9x52c3whq6JHaUF0Y58KsEStmduIoPYRPKradhx9A1x0636Sx7kdkuQtMY8lwAyR+AJdaaTwH
	L2RQlpOPezZsjWW/X7Rj1XFhHwn/VeH8cRMmi57rTq+dLLLEnAWM5y6DUXE/fWwGyow3vqxxco1dE
	2ZI8U/yA==;
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulXg7-0000000FU42-3OrL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 18:55:29 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-4b07d2136c0so41648221cf.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 11:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1754938525; x=1755543325; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+1xezh5zigs0Eh1IHXpsvZxf5v0NNa8iAaWLGnBO56k=;
        b=nI6bP3rNAkQENzIkHWKZea2A5b4I9rGqlbtH5JXg+QTQuBrhRNZkXxAvfJ7MxKuuG/
         9Tgepg2coxQSnBjf+F1NlmWL/Rg0ZH2HkXpCsWZon2hpPIrdk6QT/evAUQD8xtO+xDaU
         okqurcoL+6JwYA8Njm+qE7pXPTiECD3mTMLB4Ir749pAdURZ+7PudAhetufWKhCQ8xMq
         VNfzjjlf3lW0N8U+mTK3D0BpBW0zPvXnzkhAHn3vXYmc4HFAQdWg1xV/NhQJ4hP2A2EX
         AVEpvid1+2HACFk8yzxLXolKBcU17dQguCCZHrJjo8e5Rc0tM7doLkr4BAQjA0XYTupl
         SXkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754938525; x=1755543325;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+1xezh5zigs0Eh1IHXpsvZxf5v0NNa8iAaWLGnBO56k=;
        b=DhB+e+BNTt73VGX1py4Wf2S27jtkPbKy7Pr9Wn+j/JAKjbLiVQ2Jd4EjVTdjfp7k4E
         vQ4MWvLvBXEiQuUpNtpEIoRe+LxG4UIZ4y4giHobVKop0tLTCL1S/24wjAv0gSAk0ZYd
         SXcBBdOH84/VN0Q0IANuWRK+EFnWFv6JfsLM8cfDNBNjltAGyj5QcoXqrRzL52JR+jpr
         JZQiP7qQXZfVyFZ2Zdlx1+T+6Du+fraInShCouuX8NFxXPy29EMwRVLsNigsJF8x7gOB
         M4kFyHlKRHbO2zLQ9INZGQb+pYklFdbTSlxTU+HZlKYJObJJSuQV+RbjUESM+wii/Ymg
         NFPA==
X-Forwarded-Encrypted: i=1; AJvYcCVplP9/bfToqNhsaaGWziDN11KIyFamNTbx7Iv2zRL2AUVimOQgxWPR1JsNGDt4W7AdClnIKfo/RqiLS7Wcdhp0@lists.infradead.org
X-Gm-Message-State: AOJu0Yxu7XE+jvoCb7zbtPLLu6IB0q4rDNYesZrjqLnkcc19rcPGg8Bh
	NosQYZGMzkTEGwQMH0POxORLwmlXH+WXRr09RNuIvDAM0EFfmUxE8Q9NtnVr6dBwdCE=
X-Gm-Gg: ASbGncsex6JMG2tUwhDu0av9ny49pcxdzZCx8e1KZpD8Nyc7nUb5IYqmGlqPjsowtjG
	3SV/NpT13+swzfZBnBt4d1PQdeimfR0LIA/6iHAfRFtMjEN6jVubk8vPrsU/qZetOVZVjZ2Qcx2
	40lBIZxyJUy6XaAEYKGiAPkWkbs9O8CzbBZ8U+fpaJkqA/oSIHPEHHUFFOSPmNEMi9DGnLX5064
	Vojw7Dj+3G4TTHbC9gCuW3IZbYjNrAZ4n+3ikyatslE6Bll7vNaPdiu/coE4PanhG+lj6eHdIX+
	/u4bJuChIowu/K/aan+TZRTY+f6l5Su1rZ4xSR/taBev2X6fs/zcJJ3lwXI/i6zh9Gv9BnOkZK/
	wzbnmhjf/F+0diPTtFOh31pdVaE0nJQw8mz6EuebeeREncEMmu9j/0frIU2vcvO0sXKI0
X-Google-Smtp-Source: AGHT+IGgJZJcKTKM3XxOf4YsuboP55lfsrq1eYtf1kTos3YrkSFpLqpnWNoLYcx3tr3obv49p1pGYQ==
X-Received: by 2002:a05:622a:2507:b0:4b0:7b80:4761 with SMTP id d75a77b69052e-4b0ecc76dbdmr9999781cf.37.1754938524860;
        Mon, 11 Aug 2025 11:55:24 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b08cfbc7b9sm81757831cf.23.2025.08.11.11.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 11:55:24 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1ulXg3-00000002V2t-2HW8;
	Mon, 11 Aug 2025 15:55:23 -0300
Date: Mon, 11 Aug 2025 15:55:23 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, robin.murphy@arm.com,
	jean-philippe@linaro.org, qperret@google.com, tabba@google.com,
	mark.rutland@arm.com, praan@google.com
Subject: Re: [PATCH v3 29/29] iommu/arm-smmu-v3-kvm: Add IOMMU ops
Message-ID: <20250811185523.GG377696@ziepe.ca>
References: <20250730144253.GM26511@ziepe.ca>
 <aIo1ImP7R7VhRpVE@google.com>
 <20250730164752.GO26511@ziepe.ca>
 <aIt67bOzp6XS_yO-@google.com>
 <20250731165757.GZ26511@ziepe.ca>
 <aIurlx5QzEtjpFLd@google.com>
 <20250801185930.GH26511@ziepe.ca>
 <aJDGm02ihZyrBalY@google.com>
 <20250805175753.GY26511@ziepe.ca>
 <aJNiW48DdXIAFz8r@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aJNiW48DdXIAFz8r@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_195528_010941_E7225695 
X-CRM114-Status: GOOD (  35.51  )
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

On Wed, Aug 06, 2025 at 02:10:35PM +0000, Mostafa Saleh wrote:
> I am not sure I understand, the SMMU driver will register its IOMMU
> ops to probe the devices

You couldn't do this. But why do you need the iommu subsystem to help
you do probing for the pKVM driver? Today SMMU starts all devices in
ABORT mode except for some it scans manually from the fw tables.

They switch to identity when the iommu subsystem attaches devices, you
can continue to do that by having the paravirt driver tell pkvm when
it attaches.

What is wrong with this approach?

> > > Also I am not sure how that
> > > looks from the kernel perspective (do we have 2 struct devices per SMMU?)
> > 
> > I think you'd want to have pkvm bound to the physical struct device
> > and then spawn new faux, aux or something devices for the virtualized
> > IOMMUs that probes the new paravirt driver. This driver would be fully
> > self contained.
> 
> I think it’s hard to reason about this as 2 devices, from my pov it seems
> that the pKVM HVCs are a library that can be part of separate common file,
> then called from drivers. (with common ops)
> Instead of having extra complexity of 2 drivers (KVM and IOMMU PV).
> However, I can see the value of that as it totally abstracts the iommu ops
> outside the device specific code, I will give it more thought.
> But it feels that might be more suitable for a full fledged PV
> implementation (as in RFC v1 and v2).

Maybe, but I'm feeling sensitive here to not mess up the ARM SMMU
driver with this stuff that is honestly looking harder and harder to
understand what it is trying to do...

If you can keep the pkvm enablement to three drivers:
 - A pKVM SMMU driver sharing some header files
 - A the untrusted half of the above driver
 - A para virt IOMMU driver

And not further change the smmu driver beyond making some code
sharable it sure would be nice from a maintenance perspective.

> I had an offline discussion with Will and Robin and they believe it might
> be better if we get rid of the kernel KVM SMMUv3 driver at all, and just
> rely on ARM_SMMU_V3 + extra hooks, so there is a single driver managing
> the SMMUs in the system.

> This way we don’t need to split current SMMUv3 or have different IOMMU ops,
> and reduces some of the duplication, also that avoids the need for a fake device.
> 
> Then we have an extra file for KVM with some of the hooks (similar to the
> hooks in arm_smmu_impl_ops we have for tegra)
> 
> And that might be more suitable for nesting also, to avoid the bind/unbind flow.
> 
> I will investigate that and if feasible I will send v4 (hopefully
> shortly) based on this idea, otherwise I will see if we can separate
> KVM code and SMMU bootstrap code.

Maybe, not sure what exactly you imagine here.. You still have your
para virt driver, yes?

This especially is what bothers me, I don't think you should have a
para virt driver for pkvm hidden inside the smmu driver at all.

And if we have a smmu driver that optionally doesn't register with the
iommu subsystem at all - that seems unwise..

Jason

