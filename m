Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 859F5C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 16:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=stjouTnv41obxBgX2Jr5Nggfpjmbw9/xN8oNI4sNVwc=; b=s7+LvN01Y/beR59mpMfw6hOre1
	3HN/gm17OnH8zc56TQFQ7BkNUsZPbNeJkwcTA3462UVyQuPHPYxnnfmMxitscZH8xAWctlGnmmSo6
	J+Z5PekiAIWuj3Wr1POjIOoubZv50fUHLNUz0Cg3LZ47QJTtK+lUI1QxP5H0GDylXJgk4PeWh1UMS
	TO4Xcm80Wf2409XySyiL+PyqpboNtghUpzBde0QPboCkeAU1ytzfAJaQYlZtXBA8sU2cB0nRyy1G2
	Hke6bPC6RYYJX4xGUs3pY0zvr851U5zRmZeD5kZ/nIFDE2zQBa4GXUKaCrHidWaIkfmM4orpboG7c
	oALPVMRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHmSZ-0000000GTuw-1QQv;
	Wed, 21 May 2025 16:38:27 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHmQO-0000000GTkE-3rfB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 16:36:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9F0FAA4F1B1
	for <linux-arm-kernel@lists.infradead.org>; Wed, 21 May 2025 16:36:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EAC0C4CEF3
	for <linux-arm-kernel@lists.infradead.org>; Wed, 21 May 2025 16:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747845371;
	bh=stjouTnv41obxBgX2Jr5Nggfpjmbw9/xN8oNI4sNVwc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=vDLKdPbEIU26V6KMz3z56YmwIdivFxoektboJeuUtpxwxCMa4CctHRYjXkRSVdAPM
	 9Ap6NH7r2VFPRm8S7ZI82Y7b3F/cOA/etal8VMnPn9FToe/mn9jlVKtBXZRNrhnP9g
	 olH9yzEWrPPAxNrvrMJdw+k4bp7oNzDl8KE95d7gH17mJuVvTU/+/oGngErwaYl6rq
	 Tddf29gaoDbwxw/eK/ui0TJLnlmNx5ikWgb8KVVA+ojtYhpIPb2dW/Kavmvtd4HCAU
	 RnO+ilku3BiPS023TjgRjhUumyAImKZRVnwGNGpmH7j1s1CR/g1JlGNbX9bL36j5gL
	 g8i5/MdPnulZQ==
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-477282401b3so76135571cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 May 2025 09:36:11 -0700 (PDT)
X-Gm-Message-State: AOJu0YxZCgA6uCZr+U7IeAPePrzY2fqdYnkf/q3DLSBJT2ShiNdawonc
	sErkplF41/hXjOVwOyacjCuzcAMJAyKT8xYgB7ETWZrA1t1kEC/oReERCFCOylW3T6ab4wem0+B
	YHz6UA9rdlWCikf6PCqLkNedfwh7fNWY=
X-Google-Smtp-Source: AGHT+IGyh00A3mWyVANHITaMtbIel7e5S066XRZnxKBJkbXNpdZjwMjgOzjc/fL2tuyzW2TJCVsZfJq+3vsse3D7gYc=
X-Received: by 2002:ac8:5fca:0:b0:494:b1f9:d677 with SMTP id
 d75a77b69052e-494b1f9dbe3mr270777971cf.48.1747845370341; Wed, 21 May 2025
 09:36:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250521111000.2237470-1-mark.rutland@arm.com> <20250521111000.2237470-2-mark.rutland@arm.com>
In-Reply-To: <20250521111000.2237470-2-mark.rutland@arm.com>
From: Song Liu <song@kernel.org>
Date: Wed, 21 May 2025 09:35:58 -0700
X-Gmail-Original-Message-ID: <CAPhsuW7C0Efu5PB8QKtOLM7yuE=NzNpZbnM_Yn56iTENj9gKHQ@mail.gmail.com>
X-Gm-Features: AX0GCFsUpTu85P307gw4zinTlAbyNsZvOSFEnWi_mt2apNOhLnL8DNMMObdam50
Message-ID: <CAPhsuW7C0Efu5PB8QKtOLM7yuE=NzNpZbnM_Yn56iTENj9gKHQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: stacktrace: Check kretprobe_find_ret_addr()
 return value
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, andrea.porta@suse.com, 
	catalin.marinas@arm.com, jpoimboe@kernel.org, leitao@debian.org, 
	linux-toolchains@vger.kernel.org, live-patching@vger.kernel.org, 
	mbenes@suse.cz, pmladek@suse.com, will@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_093613_027834_78ED511F 
X-CRM114-Status: UNSURE (   9.75  )
X-CRM114-Notice: Please train this message.
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

On Wed, May 21, 2025 at 4:10=E2=80=AFAM Mark Rutland <mark.rutland@arm.com>=
 wrote:
>
> If kretprobe_find_ret_addr() fails to find the original return address,
> it returns 0. Check for this case so that a reliable stacktrace won't
> silently ignore it.
>
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> Cc: Andrea della Porta <andrea.porta@suse.com>
> Cc: Breno Leitao <leitao@debian.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Josh Poimboeuf <jpoimboe@kernel.org>
> Cc: Miroslav Benes <mbenes@suse.cz>
> Cc: Petr Mladek <pmladek@suse.com>
> Cc: Song Liu <song@kernel.org>
> Cc: Will Deacon <will@kernel.org>

Reviewed-and-tested-by: Song Liu <song@kernel.org>

Tested with livepatch changes [1][2] and modified kpatch
framework.

Thanks,
Song

[1] https://lore.kernel.org/live-patching/20250320171559.3423224-3-song@ker=
nel.org/
[2] https://lore.kernel.org/linux-arm-kernel/20250412010940.1686376-1-dylan=
bhatch@google.com/

