Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DB8CCAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 16:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nsKPUt3eG1q3iH3bagp9B5OmN4M1u1/cbfqKMwybfCo=; b=D8dqf8tQKFJ51QYLRLgyhcm39c
	GTIMZ9zSYd+Qlq2e8tqWxqVn072lFO7UGlDtpu2r81CzYLv+KuwIxt5movD/O7EW45eJ3J2L+w/Ye
	8OStb5FLiQrSM0Sc1sZyrVoZDqI1PXrPwsdKBqCUKIYUz4xq7KK3WgdAdlx693iaDMnlo7vmdZKry
	FdcgalqSPrMHaSv7ynCRp1rZrOhC5Jz8JUw2++rQ/vPaZv2SjV9PRuXXLERAIqp+fQ60iZREwHa9e
	vCd/hNc+KpENPvWm5uq83h96tVL89BjZoatMiv7zAiivOcKHk0/DwtTY1pnOpgdWGBNpvc7QuiUQK
	EzA6QR0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3GSw-00000002w7v-2gzF;
	Mon, 29 Sep 2025 16:11:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3GSu-00000002w76-09qo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 16:11:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5B21C44B0D
	for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Sep 2025 16:11:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39F6BC4CEF7
	for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Sep 2025 16:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759162263;
	bh=TnRd13LTY/MfKHuFsX9dGJLSiRHknR2IKwuhqq8+DcU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=DFJUZ6ab25RklS9kO8oV+tivtUHwZbSDaUluINK09aygf28NgXYFZ+PI6YaW/JAv+
	 n3z/M3Wo85Nqdoz4psMCxK7E9r03URDojGzc5qPUCdsnXuoF+UDVCDRrNU5gdvvJpY
	 koHbVdbYYxCIuUnxIVJSwwrArrLIfJ8HCqismRwWLlhECRDwGGadxd/RSf55sPK1i7
	 x7VzBbBTmu/EyS9V5qA3ndYOOORON8gyac4qn73YqOt3O7HNOBL3s+vfDb985nLifb
	 WdgxuSM4jEcixnsDoLy2NYcWZ6dPxp9zyNvj1+Kb4bhMdIb2qfqwlPOzbnQVZ6+pPF
	 RnAySxeFdHwrg==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3737d0920e6so2275361fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Sep 2025 09:11:03 -0700 (PDT)
X-Gm-Message-State: AOJu0Yz0m2ir2l8e1wU14FYqK09FRpXXnidBz3MyFvm9vZUM5wsCtY6Y
	ICe2visaRWQ3Fp4zhTS1dj3SjhP6OZ4VMtLnmBGUaNPF0z0Z0ixrTo7gBHVZ4EjB4VvLMv1DG/r
	geEHbJEbO0wvD+4xdvO8SDHbiWjwM6sU=
X-Google-Smtp-Source: AGHT+IETanXcswW69UMb0c9QLJbA83VZbKW5ySv3KY5vq4DrpUIMFVRtBjjjKR6of/ifN5P4H0F2sjZNeyUHIEGCoZI=
X-Received: by 2002:a2e:a917:0:b0:336:9e1b:b640 with SMTP id
 38308e7fff4ca-36f8020caf5mr41859811fa.24.1759162261600; Mon, 29 Sep 2025
 09:11:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250922130427.2904977-1-abarnas@google.com>
In-Reply-To: <20250922130427.2904977-1-abarnas@google.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 29 Sep 2025 18:10:49 +0200
X-Gmail-Original-Message-ID: <CAMj1kXHfDVXXZwFhNk=b25Uz6aVDW-NmNHJdWGOzy6j=YpKsRQ@mail.gmail.com>
X-Gm-Features: AS18NWD4BtMfXpGmuN2UIzHJaQT_CZZXKftd2Kvqw_-tFPRBtvNfc-lJsFN37gc
Message-ID: <CAMj1kXHfDVXXZwFhNk=b25Uz6aVDW-NmNHJdWGOzy6j=YpKsRQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] arm64: modules: Reject loading of malformed modules
To: =?UTF-8?Q?Adrian_Barna=C5=9B?= <abarnas@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Dylan Hatch <dylanbhatch@google.com>, Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_091104_101378_0D656FF1 
X-CRM114-Status: GOOD (  12.24  )
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

On Mon, 22 Sept 2025 at 15:04, Adrian Barna=C5=9B <abarnas@google.com> wrot=
e:
>
> Hi all,
>
> Here is version two of the patches I previously posted here:
>
>   v1: https://lore.kernel.org/all/20250919122321.946462-1-abarnas@google.=
com/
>
> Changes:
>   * Renamed the parameter `is_module` to `skip_dry_run` in scs_patch()
>   * Moved comments to module_finalize() and improve justification
>   * Instead of rejecting all modules with callback, reject those with cb
>     pointing outside core kernel text
>   * Replace -EPERM to -ENOEXEC when rejecting modules with incorrect cb
>   * Fix missing return in apply_alternatives_module() placeholder
>
> Best regards
> Adrian
>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Dylan Hatch <dylanbhatch@google.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
>
> Adrian Barna=C5=9B (2):
>   arch: arm64: Fail module loading if dynamic SCS patching fails
>   arch: arm64: Reject modules with internal alternative callbacks
>

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>

