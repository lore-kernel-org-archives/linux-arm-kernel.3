Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 138A9CE7A9B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 09:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pd73wBFyyUNvYgyA+5MSeqwQ3lzEyj6rxja0X5/ve+c=; b=Mzba3qRvxhtqO05LZD7PHVsU7D
	6sJdBTvB69B9IsJ9XvsFR26VVRdc/qVwZLCBVpPFFOdevhD7QBAc3sSgMRtHdPyww7jjijgaEGe/J
	BmlJB6MlrTWDawFdNFilxZnIz7lVwvNOc5JVy1zGRIJOhYeB6ZeJb1GQ1a2+o3xholyTbViwqP/y2
	JA8hSkjEMf08MKr1ER7hIbx8Kre0okpMYY/L2vP+XMeasG+hAR7DJzG2fPJ+gTe7fBRgaYG26tbvU
	C1Y32XVwizjy8c2+dQaci1M1fN49loA6gcpLxfx9lPDQ2eBiXtpfV7MrwoOEdPr6GRMfyxSkoIAVS
	FQ/jItEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJqBn-0000000BvL4-0vT2;
	Fri, 14 Nov 2025 09:33:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJqBk-0000000BvKa-2Zfo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 09:33:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EEDF2403D7
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Nov 2025 09:33:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2386C19425
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Nov 2025 09:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763112831;
	bh=XiBSb7FH3zCffmam4wmviNPr+VJUJFbNKxuRVSO+b6c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mxIQ7nEHzjsxQdMRshxNt+UIWas9tEbtWQpDPuS9r9P9w5r+aQ1IliZWD+q6cp7hz
	 NuC8VBdXusy42n9K1n91JdSsBxfo4+hROidIy2YEiUI5Hg/xMEeRgeyBIQcHMEJiCz
	 WtxijWja5bz7ykie8W03bayTvXz5X8KeWcCLu0WQ1RJ/yBqcx8y3oVuEGhQmOUwcrS
	 E9PW5PPsLlTyallIkP7ZH8nfc2Kh0dAtqTzWf7SSvcGTa5FCTJDRIUX+PiiZQBMNAM
	 hMr6m+di0a7VDho2tNl9ZOwDpRhofYVf8JbNBGul/sV7dxOla551HhyJbYxhGW8Roa
	 JTq/oiD6jQWqw==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-594330147efso1584426e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Nov 2025 01:33:51 -0800 (PST)
X-Gm-Message-State: AOJu0Yybzl9+zA3qcYqDwtk4014pBuaWSlMMe2eaQRdBQlO7I9asd74z
	2tJLCyAxFRmrp7i+WEmo971d9ZSrRClaypSckAPNLAVx5oF1DgxmldB4adVdcbsOE5/3/Gp3jc0
	Sbf1k8RTBGjdg0/NQyIjTqmeTyC/riD0=
X-Google-Smtp-Source: AGHT+IGujLpOpLR83xupoHypQEytbFSL4y9j6Fw3w9j/upVEUGIaFlG0mTpVZsRWJhHZ7VHr6/NDwhAoVLJgrSeOE/4=
X-Received: by 2002:a05:6512:10cb:b0:591:ec83:3183 with SMTP id
 2adb3069b0e04-59584228369mr894551e87.57.1763112830189; Fri, 14 Nov 2025
 01:33:50 -0800 (PST)
MIME-Version: 1.0
References: <20251114085058.2195900-1-sumit.garg@kernel.org>
 <20251114085058.2195900-3-sumit.garg@kernel.org> <CAMj1kXE4Fo3i9f3npB0MBSOZP0x7HgF4A0KX_aUSBEBmar=NpA@mail.gmail.com>
 <aRb2_OmkRTD46vnx@sumit-X1>
In-Reply-To: <aRb2_OmkRTD46vnx@sumit-X1>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 14 Nov 2025 10:33:38 +0100
X-Gmail-Original-Message-ID: <CAMj1kXFpi1fMuAhuaBbMSd57F79E7Z0u4okzkKL+_6eKfGUKXA@mail.gmail.com>
X-Gm-Features: AWmQ_bndnOT6-BvSjcKok_Oi36VTIAD_k4KIdOomr4Jh-VHDQmhl9S7HHNsrKwY
Message-ID: <CAMj1kXFpi1fMuAhuaBbMSd57F79E7Z0u4okzkKL+_6eKfGUKXA@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: efi: Pass reboot cmd parameter to efi_reboot()
To: Sumit Garg <sumit.garg@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org, 
	mark.rutland@arm.com, andersson@kernel.org, konradybcio@kernel.org, 
	dmitry.baryshkov@oss.qualcomm.com, shivendra.pratap@oss.qualcomm.com, 
	leif.lindholm@oss.qualcomm.com, linux-kernel@vger.kernel.org, 
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_013352_694235_6B1E7BB5 
X-CRM114-Status: GOOD (  24.22  )
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

On Fri, 14 Nov 2025 at 10:31, Sumit Garg <sumit.garg@kernel.org> wrote:
>
> On Fri, Nov 14, 2025 at 10:26:03AM +0100, Ard Biesheuvel wrote:
> > On Fri, 14 Nov 2025 at 09:51, Sumit Garg <sumit.garg@kernel.org> wrote:
> > >
> > > From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > >
> > > EFI ResetSystem runtime service allows for platform specific reset type
> > > allowing the OS to pass reset data for the UEFI implementation to take
> > > corresponding action. So lets pass the reboot cmd parameter for the EFI
> > > driver to determine whether it's a platform specific reset requested or
> > > not.
> > >
> > > Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > > ---
> > >  arch/arm64/kernel/process.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
> > > index fba7ca102a8c..51784986c568 100644
> > > --- a/arch/arm64/kernel/process.c
> > > +++ b/arch/arm64/kernel/process.c
> > > @@ -136,7 +136,7 @@ void machine_restart(char *cmd)
> > >          * ResetSystem().
> > >          */
> > >         if (efi_enabled(EFI_RUNTIME_SERVICES))
> > > -               efi_reboot(reboot_mode, NULL);
> > > +               efi_reboot(reboot_mode, cmd);
> > >
> >
> > I agree with the general principle. However, there are already
> > existing callers of kernel_restart() that would end up passing a
> > random string to efi_reboot(), resulting in platform specific reset
> > with undefined result.
>
> Yeah true but the UEFI spec says:
>
> "If the platform does not recognize the EFI_GUID in ResetData the platform
> must pick a supported reset type to perform. The platform may optionally
> log the parameters from any non-normal reset that occurs."
>
> So, in these cases the UEFI implementation can fallback to normal reset
> optionally logging the reset data being passed. Does that sounds
> reasonable to you?
>

What the UEFI spec says might deviate from how real platforms in the
field will behave when being passed a reset type that nobody ever
tried passing before.

