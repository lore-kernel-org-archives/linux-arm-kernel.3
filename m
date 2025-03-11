Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BF7BC2BA1B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 20:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3D7DcqzXtXay65MOmV9DzhULAHuxDLESiJA/LkHgEnQ=; b=irytC+KkcRUpi9hIhtrj6hy8wK
	BIaD1gLd7GXOmaQBmY8g+gkHRinRpHy30+jfJO2Z8nNkploqiX174RIPYi//ibvhnz3lZlCvveTuR
	EWOOAvYvnqRnvyIrxaFGTMjWbuWAWI4aXyET6Mhih1LVux+Ra5NDdLDhfhzSiSHo7VmFRHWYuItQd
	4gMU/PQURskdsaWNXZfxvs+HfwoxLG9F4BIY/q48n5oV3fpN4zh+v3H0P3ywmtIMjepBSwgCkNOrE
	u2IQa4ShreBrpXPYvHdzByyzH763w9gzkYW7sWYOOo+bY8NO2GygU+1BO6cd042urYffL/dskWyX8
	yGsUc5lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts65h-00000006usJ-1P5h;
	Tue, 11 Mar 2025 20:20:41 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts54p-00000006kYD-0ltL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 19:15:44 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so22709705e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Mar 2025 12:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741720542; x=1742325342; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3D7DcqzXtXay65MOmV9DzhULAHuxDLESiJA/LkHgEnQ=;
        b=eyfvhhCRfrgpYBZqgbP0TneBy59iGuGiA2IEK/vmBZzOhppiJx1Kzf1SNQFeBzkKS7
         mRGe5mbyN3LdyaBc8LB8xttRdWM4+Jead9wc7W5LFkbTbDIeqS91s9I5fo4c711NNcl4
         dTFrvaJo24PeFqLNHDxmUt1v8tiofW6Yyb3oRvU9fTIiKnDxBYY27iE3jkzHCHsXAkVt
         QL8FFV+mMlVxvNTeiHJQIheRIPrDGfGciKaerjA+KdPdUasNKpXWHoezmu/uwidaGfK2
         0pIeZyvVb/RT4P5hu04uBOkRKCoGpCEmY5GyhobkegKqjB8ulE113t1w7epDriSIOMGf
         uJTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741720542; x=1742325342;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3D7DcqzXtXay65MOmV9DzhULAHuxDLESiJA/LkHgEnQ=;
        b=hRYsFfPnKAak0rsYwO/rfPU0rLftKH7uH36L0Dr9+RgBQxbcY2rLE7xcrYX7Wpz9Ch
         ZczuwQoYcV/05iGcqnyqtkLZtb9tcCbc7+5+XZjYIu3KoW67cTrkOpKH11LVfqdGClsv
         yCh8Bq+AkPB9sU06BpkwkQyAuOLjGkZorTIPFHaBh3VwcelZN9OMCdyf5z7FKQYBB1d9
         Y/4H0Y3ZGJ//xD/OT+6XJJm3pMUxtkRRjvggPMlMZI/etKDt98l0DcaKIYP7kuK6mna2
         RPHk//cSzAKz1SM84pHkc8MVj2ymmWt03Vzb5oZMbkY/C7I41bo+RvAPdK99PL67o96b
         GUTw==
X-Forwarded-Encrypted: i=1; AJvYcCV91f/2YBaeezMWXSckBVxMu9vtRDhP/liiwp6xWx9fRfYXHeBYaofd7HW68w2VhDt/yQc1At0XRXQxqwJsHUh8@lists.infradead.org
X-Gm-Message-State: AOJu0YwgW4OUPuqMUDyx1w+aRzRt8rhLBUX7xSUXEs3AKeE0bpcrlwJR
	k31/FZI4zjgiP10anMsNIWhHiA61PiDKk4rzEKkxVAibE2Gf7nvAsTYgLJ8lhhSo+nvNUeVNrlT
	6iEUlmgLHp4/1ah6Z5AzX+7xay2tKAcUE9unkT/tA5hrkzPpdIjqpom+1
X-Gm-Gg: ASbGncvR/hURsmFvqgWeqBJan17B2Bus289pAa17dO8nC1Y8yg+l1Ja0KXHKgNpNCzT
	jE2hqdjVcY2rzku2yGUAxnMq0Yd1x4++UMlnJCJ6YC6DhIzK7WxKj7fQD229jKhi/t+rxzvcg58
	54McUz8Pl8XnB/FYUSBF+H977mrFI=
X-Google-Smtp-Source: AGHT+IEKaY3f/jwf8rjJ6P4i1mXmye8xaJcsyi8fySc9Crm9HPFFdA+QVKIx8M9phSTEfNJutY9OZDhw/KDAR0n/sLc=
X-Received: by 2002:a05:600c:4f0c:b0:43c:eec7:eabb with SMTP id
 5b1f17b1804b1-43ceec7ee09mr102106865e9.8.1741720541648; Tue, 11 Mar 2025
 12:15:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250311-wip-obbardc-qcom-defconfig-interconnects-builtin-v1-1-675b6bc57176@linaro.org>
 <CACr-zFC=mPNeeHMp9XnSby+cMQaPWt_3s8iUiCN+EnVPeGad8Q@mail.gmail.com> <uljqxwfgl26txrfqvkvzzpj6qurgmwcbuot7gu2u6rwjaqgncb@jeuyi4mexjff>
In-Reply-To: <uljqxwfgl26txrfqvkvzzpj6qurgmwcbuot7gu2u6rwjaqgncb@jeuyi4mexjff>
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Tue, 11 Mar 2025 20:15:31 +0100
X-Gm-Features: AQ5f1JogDXTrmR57agoVvLVzDGF-kWOnB5039Wi_AANd56pvT-_X7Ug39zfiuvE
Message-ID: <CACr-zFDSFizYmrVN-dV334n1kq17UB9k4FxrV20NNQCQMhzrwg@mail.gmail.com>
Subject: Re: [PATCH] arm64: defconfig: Enable Qualcomm interconnects as built-in
To: Dmitry Baryshkov <lumag@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_121543_235170_F4CB960A 
X-CRM114-Status: GOOD (  32.40  )
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

Hi Dmitry,

On Tue, 11 Mar 2025 at 19:58, Dmitry Baryshkov <lumag@kernel.org> wrote:
>
> On Tue, Mar 11, 2025 at 07:10:06PM +0100, Christopher Obbard wrote:
> > I sent this patch to start the discussion, some things I found:
> >
> > 1) Some interconnects are missing from arm defconfig. Should they be =y too ?
>
> No, unless those are required for the UART console.

OK, that makes sense. FWIW the cryptic (to me, at least) commit log on
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=6eee808134ecf1c1093ff1ddfc056dc5e469d0c3
made me think that the interconnects should be built-in on all devices.

Of course, the real problem here is RB3gen2 not actually finding the
UFS/eMMC device due to no interconnect driver.
Until now, I have been building that into the kernel. I will
investigate instead shoving into the initrd (in both debian and
fedora) which should solve my issue and render this patchset useless.


Thanks,

Chris

>
> > $ grep CONFIG_INTERCONNECT_QCOM arch/arm/configs/qcom_defconfig
> > CONFIG_INTERCONNECT_QCOM=y
> > CONFIG_INTERCONNECT_QCOM_MSM8974=m
> > CONFIG_INTERCONNECT_QCOM_SDX55=m
> >
> > 2) Some interconnects are missing from arm64 defconfig (which should
> > probably be in there) (I have included just two examples):
>
> I think `git log -S CONFIG_INTERCONNECT_QCOM
> arch/arm64/configs/defconfig` will answer this question. The drivers are
> enabled on the premises of being required for a particular device, not
> because they exist in the Linux kernel.
>
> > $ grep CONFIG_INTERCONNECT drivers/interconnect/qcom/Makefile
> > obj-$(CONFIG_INTERCONNECT_QCOM_QCS615) += qnoc-qcs615.o
> > obj-$(CONFIG_INTERCONNECT_QCOM_SM7150) += qnoc-sm7150.o
> >
> > I can handle these in follow-up or v2 of the patchset as follow-up
> > commits, please let me know what you'd prefer.
> >
> > On Tue, 11 Mar 2025 at 19:03, Christopher Obbard
> > <christopher.obbard@linaro.org> wrote:
> > >
> > > Currently some Qualcomm interconnect drivers are enabled
> > > as modules which isn't overly useful since the interconnects
> > > are required to be loaded during early boot.
> > >
> > > Loading the interconnects late (e.g. in initrd or as module)
> > > can cause boot issues, such as slowdown or even not booting
> > > at all (since the interconnect would be required for storage
> > > devices).
> > >
> > > Be consistent and enable all of the Qualcomm interconnect
> > > drivers as built-in to the kernel image.
> > >
> > > Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
> > > ---
> > >  arch/arm64/configs/defconfig | 6 +++---
> > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> > > index 219ef05ee5a757c43a37ec9f8571ce9976354830..6582baee2ab02ecb2ff442c6e73aa6a23fee8d7f 100644
> > > --- a/arch/arm64/configs/defconfig
> > > +++ b/arch/arm64/configs/defconfig
> > > @@ -1656,11 +1656,11 @@ CONFIG_INTERCONNECT_IMX8MN=m
> > >  CONFIG_INTERCONNECT_IMX8MQ=m
> > >  CONFIG_INTERCONNECT_IMX8MP=y
> > >  CONFIG_INTERCONNECT_QCOM=y
> > > -CONFIG_INTERCONNECT_QCOM_MSM8916=m
> > > +CONFIG_INTERCONNECT_QCOM_MSM8916=y
> > >  CONFIG_INTERCONNECT_QCOM_MSM8996=y
> > > -CONFIG_INTERCONNECT_QCOM_OSM_L3=m
> > > +CONFIG_INTERCONNECT_QCOM_OSM_L3=y
> > >  CONFIG_INTERCONNECT_QCOM_QCM2290=y
> > > -CONFIG_INTERCONNECT_QCOM_QCS404=m
> > > +CONFIG_INTERCONNECT_QCOM_QCS404=y
> > >  CONFIG_INTERCONNECT_QCOM_QCS615=y
> > >  CONFIG_INTERCONNECT_QCOM_QCS8300=y
> > >  CONFIG_INTERCONNECT_QCOM_QDU1000=y
> > >
> > > ---
> > > base-commit: b098bcd8278b89cb3eb73fdb6e06dc49af75ad37
> > > change-id: 20250311-wip-obbardc-qcom-defconfig-interconnects-builtin-258fcc961b11
> > >
> > > Best regards,
> > > --
> > > Christopher Obbard <christopher.obbard@linaro.org>
> > >
>
> --
> With best wishes
> Dmitry

