Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E1B2CE7A8E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 09:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HTjNItyJzdi6aRlma1eXXSNHWN/M8LVqo85tNrTUpck=; b=Pin/YH1vxUgg6cYfXJ1uiNOZNI
	GO+I+6uTVplTkooC7TkNqq+Hqi86g2SXfjc7T1GAGtUQqVfyef8yXN9ASkYlozPzJeE6R3+SZBsX1
	Z/7SCXwXF7gJIrex7fWoscylLD5nmUp/SChlnCf0DbWtgjZWkkZI3+aFJBg4YWL4c4uw3EpZ1ISPH
	mMArOejb34KKhzWnvYPtbyAa7iezTk/pqWK5EIS8ShiuZJPtUdbuIr46mqTOfDHU3cB6/HdzfN54d
	BAkjRfqsUnTQCzGwy515TQka8w6lTHsSmhNayQV8iPBjinnCtQ74GIAxDuTKNyJLAFXUhkgVJeR8o
	3HARAAMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJq4T-0000000Bugq-1jF9;
	Fri, 14 Nov 2025 09:26:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJq4R-0000000BugC-1A9W
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 09:26:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0D37143EF5
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Nov 2025 09:26:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDD22C4AF0D
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Nov 2025 09:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763112376;
	bh=js4PA5bRCJWVaJiozlPfhPnR8+xdEJIPSZQez/38S70=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QdznabUlT/StywBayjXvsvVLHQgGlheD4oYLACQPlAKcEWyDHmIOBF0d6rJsWvQYg
	 cXS1UdN72VyMhEa992f3xCe1/oKmhDLjeZXtXqkXQoorF0ZBh6t1Tj1g9Nq2cvPTqJ
	 5Ib3wp47AVPo+lFJ3l8Bx+Vu/lhd+mlYrWWyAXx0Hiyys0toe7x13YRNDkCVYE57wY
	 69VBCyK5hB1AWBnPsz8ArX55bpDxaqsIJMn8+pxlGapxODdi0fzGdIPjOiCVAedVS3
	 Cu0sbRNkT71sr3sDFcfmq2cDXUsiuRcDGMCCcXDZoLsjpJf5GQxE2OlitnzxzZ6g3q
	 4ypK9qeVx053A==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5957db5bdedso1713624e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Nov 2025 01:26:16 -0800 (PST)
X-Gm-Message-State: AOJu0YyuzHYb/EWgPL9XSRbpK/RgEWdtBB9LfaBZ9zdNzN/wD2fuW26I
	BMeydMOIay+Fgl6eKb7bj00LB/np7jrzvz2p3UPZ7zipw8laTZcoTNIn+dD8MJQuRkOViYb1k5p
	Erun/vkThhOawZi7nNxCW3X2+bo65wuQ=
X-Google-Smtp-Source: AGHT+IF3tFmwAcyyqBFAGn65NZXYkgHv33xvrkudgQL42Yr2p2jyMiQqIYBJjDBFA4Hy8YCD1Q4u+g7Fy/whFgTICHY=
X-Received: by 2002:a05:6512:239d:b0:595:7ed0:9c7e with SMTP id
 2adb3069b0e04-595841a8136mr801860e87.3.1763112374934; Fri, 14 Nov 2025
 01:26:14 -0800 (PST)
MIME-Version: 1.0
References: <20251114085058.2195900-1-sumit.garg@kernel.org> <20251114085058.2195900-3-sumit.garg@kernel.org>
In-Reply-To: <20251114085058.2195900-3-sumit.garg@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 14 Nov 2025 10:26:03 +0100
X-Gmail-Original-Message-ID: <CAMj1kXE4Fo3i9f3npB0MBSOZP0x7HgF4A0KX_aUSBEBmar=NpA@mail.gmail.com>
X-Gm-Features: AWmQ_bkj4pWjMOHYgOZPEajb9wd6GCv0LCKBd1STFSWl45rYWURYaKvi9YfNTsw
Message-ID: <CAMj1kXE4Fo3i9f3npB0MBSOZP0x7HgF4A0KX_aUSBEBmar=NpA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20251114_012619_352993_6E41E2FB 
X-CRM114-Status: GOOD (  18.69  )
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

On Fri, 14 Nov 2025 at 09:51, Sumit Garg <sumit.garg@kernel.org> wrote:
>
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
>
> EFI ResetSystem runtime service allows for platform specific reset type
> allowing the OS to pass reset data for the UEFI implementation to take
> corresponding action. So lets pass the reboot cmd parameter for the EFI
> driver to determine whether it's a platform specific reset requested or
> not.
>
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---
>  arch/arm64/kernel/process.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
> index fba7ca102a8c..51784986c568 100644
> --- a/arch/arm64/kernel/process.c
> +++ b/arch/arm64/kernel/process.c
> @@ -136,7 +136,7 @@ void machine_restart(char *cmd)
>          * ResetSystem().
>          */
>         if (efi_enabled(EFI_RUNTIME_SERVICES))
> -               efi_reboot(reboot_mode, NULL);
> +               efi_reboot(reboot_mode, cmd);
>

I agree with the general principle. However, there are already
existing callers of kernel_restart() that would end up passing a
random string to efi_reboot(), resulting in platform specific reset
with undefined result.

E.g.,

$ git grep kernel_restart\(\"
drivers/md/dm-verity-target.c:          kernel_restart("dm-verity
device corrupted");
drivers/md/dm-verity-target.c:  kernel_restart("dm-verity device has
I/O error");
drivers/memory/emif.c:                  kernel_restart("SDRAM
Over-temp Emergency restart");


>         /* Now call the architecture specific reboot code. */
>         do_kernel_restart(cmd);
> --
> 2.48.1
>

