Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBC14C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 19:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SZzymmmsUuwspRI0dSqBHFmnHJEtQiDmh4Y19RgEygc=; b=u0YjYkf+cRFTEW403vB48iqNjJ
	SW9U8GR2WLt1reMUHhIzXpGhmutKfrJzvRmmPn5Q1ez9eTsX/YquOJCf7cGEvISwmZ9G6ygH1YHeo
	Y4ARx6tCcnyNbwxCRz8bUZ1oLEMm8yx5mFQkkHkGG/GoncEqO2j48HvHKgroGvf9qLEL5Q0FN3siA
	Q/w7ecvL/yDh0tetALITL60UykqdA17Gyh8RdA8KFKb/aatrMhk+AQk1VTy+rxlX/LLMJco/mbNmm
	ori7p5KHgVrsJGkNDvclY4LFsNo5hUheckTEhA/HO9DACrhpUiyzy1XYPvpaKmaVPDdUO3SMaDRVV
	590wH83A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpum5-000000098ED-2OxL;
	Wed, 05 Mar 2025 19:51:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpuAn-000000092Je-3wvs
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Mar 2025 19:12:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=SZzymmmsUuwspRI0dSqBHFmnHJEtQiDmh4Y19RgEygc=; b=cBxvDxbgWnpTn8st7vc5lRwy6C
	Zhz1kKMW3CO/1iNCmkvew2zbX2EGoJcXHy7/I7QhKn52f5tBHJzlWs4fom5FhneuSYe2LMpqZmM1M
	woSdnbq3KXJkcFYxD8gCFye6/MOEnZvU6ZjR1+f8pN96qgraxX7NtQtl1YRVAAkhKkfl1sFocdJa8
	/7CvMUMdSxb9Tkr5lk6TrU/46FJwvknDg9z4l1u7d0DJwfmyXIhHSn+k3bJx0ecByANn41hWBx6T9
	kc8fUt8WLVOXtgEN8cfDANUGYMpx3pKa897eZ11lAV8Kj0LJYfVF7H9tqPuDKWcIJsWRvaeaevbjI
	xZUkd1Ng==;
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpuAk-00000000iNM-44KR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 19:12:52 +0000
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-3d434c84b7eso3020835ab.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 11:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741201968; x=1741806768; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SZzymmmsUuwspRI0dSqBHFmnHJEtQiDmh4Y19RgEygc=;
        b=dt8phTm0xvqOS1w3DVBXds2RmjiasAtq2UnjnTkYU3+lMPvDTtbiblnQzMwapcVQdw
         CZ2cYVKGC1Gh9Frzct4IapvFXZWts4SpbzVMKh14t7g5f1zDPY71Rddm//qLGJrmwXGm
         oGkiy+pE0Xwh9avL1eM0st+Fg7ssmPCRRnKehdEboR+2tDvV9+mxhIEv95Va7651Qfnd
         4ZEi99tOt7HurKAG2wfbTvmy1yka2prYK93jcdilnoQnpj/d0MqwdLkXkNkTXDSDOUOG
         FDmeALotOR5FPEScxRMsa3bks5uDqJMFYRVCAVH/yHrSzkuOwb0N8f471CcdEyDT9sGL
         aFYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741201968; x=1741806768;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SZzymmmsUuwspRI0dSqBHFmnHJEtQiDmh4Y19RgEygc=;
        b=wOWvY1kK2jFjMJu1J9zfdXeryaxOoVmxP80LkEIibO5lYtzs6KWRU3CWzB5aLJ4IAt
         pSxqR1eqPWT5gtzrWD8gEbBBOm2a8htqQyU/T3Pt4f1gZ2smYhrUxchPewYAcBUZkog5
         E6Vg+ozsKV5cT630OjMmb0g+9jrGEj69AuupU/uAWQFFuf/jbTwpnAJIYIEYR728pte5
         sXIK0d/80pypqDEQ+yAGolITiN+YQbQSEGyuVES3u16OzPwy19bkFDHoGZ+ecgwG3v43
         wLmKkKvfdO1xzTB4QNIK1RtC+OaIx93/TesXKzhV9ePS+n55WrJ5kKMRb1DBBn6GJvtm
         DlYw==
X-Forwarded-Encrypted: i=1; AJvYcCVyZk6LBj7FekrWqRRiOx0IIMoigSekw34s5cCBgKvmn8S46VNPq3mHb/9O1j+5phS/aEZeB0CJogcmtfqQXajo@lists.infradead.org
X-Gm-Message-State: AOJu0Ywj54wWz/8ccGGZ6maXwrAA3UN2/6jb5FKcRLSvGFa2D3Pxa4Lp
	Lfmf6Dgrgw+9co/z5cK2taGfZAQL/lnApHx1nD1yuHkl4cTPz8CAM11Bq+0kl5Jln3mTxDQKzJa
	fPZcFCMO31MdoiZo1viJHWbxYFDE=
X-Gm-Gg: ASbGncvGPwzTzos//GkWTSdyfXxRgHHDV0+akk+fx4WiZIxZ5bCsBGMpGxGsjhLXMhk
	VyYzR7A/OUedT+aKi6P6gB6Tgk3eS4vrpLTfviG8IL/1wZUXthzKQ7PJqnFEF5JPoTSJMvsWUUK
	EgrZwCzotQoH0tDIkxk1eESCIsqA==
X-Google-Smtp-Source: AGHT+IHlEINA/jfl2bBPP1ul53oTsOP5ym9Trq3jpGpB8Vm7TzTmI2nqJcEmRK+XL9G3vhk3sJwn4J0bQLvJBmoMCFg=
X-Received: by 2002:a05:6e02:188c:b0:3d3:d28e:eae9 with SMTP id
 e9e14a558f8ab-3d42b890630mr57345765ab.7.1741201968293; Wed, 05 Mar 2025
 11:12:48 -0800 (PST)
MIME-Version: 1.0
References: <20250304-msm-gpu-fault-fixes-next-v4-0-be14be37f4c3@gmail.com> <20250304-msm-gpu-fault-fixes-next-v4-3-be14be37f4c3@gmail.com>
In-Reply-To: <20250304-msm-gpu-fault-fixes-next-v4-3-be14be37f4c3@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 5 Mar 2025 11:12:36 -0800
X-Gm-Features: AQ5f1Jo4BXeEdaC2izHqFmQ2gL7iBiicL-43RgNDhM5BByTDG8vBtJ6rU6EziYc
Message-ID: <CAF6AEGsi1s4rO0_HSy44ikFGXNJAkBxfBMucRyGA+xokzOsP_A@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] iommu/arm-smmu: Fix spurious interrupts with stall-on-fault
To: Connor Abbott <cwabbott0@gmail.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, iommu@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_191251_089352_86B4DE34 
X-CRM114-Status: GOOD (  33.84  )
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

On Tue, Mar 4, 2025 at 8:57=E2=80=AFAM Connor Abbott <cwabbott0@gmail.com> =
wrote:
>
> On some SMMUv2 implementations, including MMU-500, SMMU_CBn_FSR.SS
> asserts an interrupt. The only way to clear that bit is to resume the
> transaction by writing SMMU_CBn_RESUME, but typically resuming the
> transaction requires complex operations (copying in pages, etc.) that
> can't be done in IRQ context. drm/msm already has a problem, because
> its fault handler sometimes schedules a job to dump the GPU state and
> doesn't resume translation until this is complete.
>
> Work around this by disabling context fault interrupts until after the
> transaction is resumed. Because other context banks can share an IRQ
> line, we may still get an interrupt intended for another context bank,
> but in this case only SMMU_CBn_FSR.SS will be asserted and we can skip
> it assuming that interrupts are disabled which is accomplished by
> removing the bit from ARM_SMMU_CB_FSR_FAULT. SMMU_CBn_FSR.SS won't be
> asserted unless an external user enabled stall-on-fault, and they are
> expected to resume the translation and re-enable interrupts.
>
> Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> Reviewed-by Robin Murphy <robin.murphy@arm.com>

Reviewed-by: Rob Clark <robdclark@gmail.com>

> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 15 ++++++++++-
>  drivers/iommu/arm/arm-smmu/arm-smmu.c      | 41 ++++++++++++++++++++++++=
+++++-
>  drivers/iommu/arm/arm-smmu/arm-smmu.h      |  1 -
>  3 files changed, 54 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/a=
rm/arm-smmu/arm-smmu-qcom.c
> index 186d6ad4fd1c990398df4dec53f4d58ada9e658c..a428e53add08d451fb2152e3a=
b80e0fba936e214 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -90,12 +90,25 @@ static void qcom_adreno_smmu_resume_translation(const=
 void *cookie, bool termina
>         struct arm_smmu_domain *smmu_domain =3D (void *)cookie;
>         struct arm_smmu_cfg *cfg =3D &smmu_domain->cfg;
>         struct arm_smmu_device *smmu =3D smmu_domain->smmu;
> -       u32 reg =3D 0;
> +       u32 reg =3D 0, sctlr;
> +       unsigned long flags;
>
>         if (terminate)
>                 reg |=3D ARM_SMMU_RESUME_TERMINATE;
>
> +       spin_lock_irqsave(&smmu_domain->cb_lock, flags);
> +
>         arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_RESUME, reg);
> +
> +       /*
> +        * Re-enable interrupts after they were disabled by
> +        * arm_smmu_context_fault().
> +        */
> +       sctlr =3D arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_SCTLR);
> +       sctlr |=3D ARM_SMMU_SCTLR_CFIE;
> +       arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_SCTLR, sctlr);
> +
> +       spin_unlock_irqrestore(&smmu_domain->cb_lock, flags);
>  }
>
>  #define QCOM_ADRENO_SMMU_GPU_SID 0
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/ar=
m-smmu/arm-smmu.c
> index 498b96e95cb4fdb67c246ef13de1eb8f40d68f7d..284079ef95cd2deeb71816a28=
4850523897badd8 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> @@ -466,13 +466,52 @@ static irqreturn_t arm_smmu_context_fault(int irq, =
void *dev)
>         if (!(cfi->fsr & ARM_SMMU_CB_FSR_FAULT))
>                 return IRQ_NONE;
>
> +       /*
> +        * On some implementations FSR.SS asserts a context fault
> +        * interrupt. We do not want this behavior, because resolving the
> +        * original context fault typically requires operations that cann=
ot be
> +        * performed in IRQ context but leaving the stall unacknowledged =
will
> +        * immediately lead to another spurious interrupt as FSR.SS is st=
ill
> +        * set. Work around this by disabling interrupts for this context=
 bank.
> +        * It's expected that interrupts are re-enabled after resuming th=
e
> +        * translation.
> +        *
> +        * We have to do this before report_iommu_fault() so that we don'=
t
> +        * leave interrupts disabled in case the downstream user decides =
the
> +        * fault can be resolved inside its fault handler.
> +        *
> +        * There is a possible race if there are multiple context banks s=
haring
> +        * the same interrupt and both signal an interrupt in between wri=
ting
> +        * RESUME and SCTLR. We could disable interrupts here before we
> +        * re-enable them in the resume handler, leaving interrupts enabl=
ed.
> +        * Lock the write to serialize it with the resume handler.
> +        */
> +       if (cfi->fsr & ARM_SMMU_CB_FSR_SS) {
> +               u32 val;
> +
> +               spin_lock(&smmu_domain->cb_lock);
> +               val =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_SCTLR);
> +               val &=3D ~ARM_SMMU_SCTLR_CFIE;
> +               arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_SCTLR, val);
> +               spin_unlock(&smmu_domain->cb_lock);
> +       }
> +
> +       /*
> +        * The SMMUv2 architecture specification says that if stall-on-fa=
ult is
> +        * enabled the correct sequence is to write to SMMU_CBn_FSR to cl=
ear
> +        * the fault and then write to SMMU_CBn_RESUME. Clear the interru=
pt
> +        * first before running the user's fault handler to make sure we =
follow
> +        * this sequence. It should be ok if there is another fault in th=
e
> +        * meantime because we have already read the fault info.
> +        */
> +       arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, cfi->fsr);
> +
>         ret =3D report_iommu_fault(&smmu_domain->domain, NULL, cfi->iova,
>                 cfi->fsynr0 & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE =
: IOMMU_FAULT_READ);
>
>         if (ret =3D=3D -ENOSYS && __ratelimit(&rs))
>                 arm_smmu_print_context_fault_info(smmu, idx, cfi);
>
> -       arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, cfi->fsr);
>         return IRQ_HANDLED;
>  }
>
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/ar=
m-smmu/arm-smmu.h
> index 411d807e0a7033833716635efb3968a0bd3ff237..4235b772c2cb032778816578c=
9e6644512543a5e 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> @@ -214,7 +214,6 @@ enum arm_smmu_cbar_type {
>                                          ARM_SMMU_CB_FSR_TLBLKF)
>
>  #define ARM_SMMU_CB_FSR_FAULT          (ARM_SMMU_CB_FSR_MULTI |        \
> -                                        ARM_SMMU_CB_FSR_SS |           \
>                                          ARM_SMMU_CB_FSR_UUT |          \
>                                          ARM_SMMU_CB_FSR_EF |           \
>                                          ARM_SMMU_CB_FSR_PF |           \
>
> --
> 2.47.1
>

