Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6142C606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Oct 2026 01:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GegTVwkN;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KfOTUZjB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=dZo8YGXipFDOPlk5LjrlXEXfuFOOoXy5+FZD35r1Kog=; b=GegTVwkN9dBbOG
	Ua8bVgSYxhKfrfLI+bpjBGeHA5HiEaK7T25KUY5AKshtDX0AyPBvImEmcBsDsVRSiKZZytPmDJQFB
	cK28xu+kI5cunNZiPK04jQRpf2qgsn4VmL7i4oVQH50PJgf/yjTsL27lPlK5YPVbnCK1KaxzNBpDT
	w/y/KdE3TdrvsOW57MMy98FCUJ8TC3ogOkOMN119uC+rs+Am937DSk/zwQMsELWx8/cTKgFu1gyDM
	e3NE7frrabGt7Vdw5O00/GD6S593etQnXmzokVz6If0xohMhdBI3fgwWoEX1RWwe8oxLOvNuOOlAU
	rfVqLJ9LKut/HTFpWhCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKQ6U-0000000HIVP-2j9M;
	Sat, 24 Oct 2026 00:59:22 +0000
Received: from mail-dl1-x1233.google.com ([2607:f8b0:4864:20::1233])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKQ6S-0000000HIUm-057K
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Oct 2026 00:59:21 +0000
Received: by mail-dl1-x1233.google.com with SMTP id a92af1059eb24-16079d54c17so2916710c88.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 17:59:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792803558; cv=none;
        d=google.com; s=arc-20260327;
        b=fLn58TKVDgsFNYYHXgNvORtXovN68Gg/9rFFK7JQUcfJGaX2x3Qv1Cu3vuG32nGEOL
         6kngc7c+s4sedthLChxQzgCphXDSve9QShkoMENJ7jV6asDqPdHAUz2BnO64KjKl8Gb5
         CNhuZwbew/JJjUJaXqdt7YkHpyDV1fo2FTRDq6RMSpGtFO2hQone3HoFsKZoCcI2lmJG
         jMNOQ+u6AH236CJt6Ec0Km3rekJCuPgfAoIs8viNxCGWshjeZm3iTKGlEA2TQOfsHcK9
         d0cyhI8jXeOBXzoOTq7irvXA4siuDuw3ge9fG0AElUJIt/OS9AOzkSI3utdjYJQvzoif
         1VxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dZo8YGXipFDOPlk5LjrlXEXfuFOOoXy5+FZD35r1Kog=;
        fh=nijVsLR6ZXe6hl3P4Ma4j62WrxopCVup9eyMixO0kSI=;
        b=ihIZrL/eZ9iCCzrfMAmpKn/S4Buc/5sxpTmvMN8l6u67vCQxQCpyXxltsdwoW+XS+I
         TmeYHUykHEfu4ZF45b6TaKXxs2Zud+Yj38FiOJ7Gy20x9w00iI6z+BuZddEln13lHtff
         5ibvf1WivWDbhgFiBxsJ9nAnZi+PEgcPgMoRbYDCM2B/DJu1IMACpLywdt57I6k/3G4i
         gXV+geLuNIh86FHTmClrSNoU2llaLwxegt6IsFxWkdVNwgTLzDQ96TQ53np4rtObcH/W
         Xt9PNZ00RVKyf8lqEdkYEH6y7+1g2YdcJfBIHHoPVL77SYcm5jBliyJJp6oenALBHnpa
         Ux2g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792803558; x=1793408358; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dZo8YGXipFDOPlk5LjrlXEXfuFOOoXy5+FZD35r1Kog=;
        b=KfOTUZjBxvAXROp5gq0rjqdDZBrBmb5nxkyBQx7D9pUio8tFXfMhMBCJejbm45r1LN
         i7OKiY5v4/m1GsFDCpEBQ7zavjHaLrO+kHNGDpij5N9bdnn0r5PTANWt/HUqAPr4PVXm
         /ulmyFfBR+9juQ1fcTNtB/KqHGwIBx43ayAOREX5jnOpV9XSsmkqcoc13Ber9Vp06M4Z
         c7Ggqzd4WKo12a99qUrS3A2m6QF1dOvsPuOcNNAoUDnRBEzZJCUF9Vy9HBTpa1+oUYXb
         jiMbVS0HxQrJGxd4hcW7JTQ1aIQpJp8ugv7Dm61aJK0GoruozQftz9M5+W5ZXDxtLnjd
         CcPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792803558; x=1793408358;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dZo8YGXipFDOPlk5LjrlXEXfuFOOoXy5+FZD35r1Kog=;
        b=NV1aaCkUxW1+q3UYzqzCFVz9G4MVRU2q3XVp9O7cMMrCWsVFhmPBWxPwsrMQGdcij+
         Jnq3AIuLTRc8v5j33y2j5Y0KiOYExRraRO1t7xIq06IKu+LQwE602ZfjEeuvq+eTVRXd
         cJaHYScU8xEji12txv0HOe2kIgV8KgP+FbD6cBAaa8VuUhcWZLUVrdQAQlakJIoSmJoq
         06l4bYMTPIM9N5rfHIFRfTIWQPaNCpT7camj+g8YwXXf9sSB7nscBrulejdwVzvYVWrq
         LzGv8Ar0f6pQYFGBepXU7bT+9dz2Tbs7Mb6CmFwi+rkDf0E3PXLIcynOmT7qxloLeeVN
         rbpg==
X-Forwarded-Encrypted: i=1; AKwUvBw4bJWLa9wGC1G5DtvRdaKSGH6nsWiYsnaCNZREQDHWLR8ldGDY/i48hNvoEhzCK79O3WV2sKEnkIu5LazsLvHy@lists.infradead.org
X-Gm-Message-State: AFq9FYIncs1MnZMtSsfku147WRZoal+oiEsSMSwN6OB7/ziYTy9Dmkpk
	owRi5bUagZrYMJxUAqDNpyzqchPiOpfD+7mwOOdsM51pX9Bn7Mn04jz4P+EdugHkh7uwgA9XShF
	ajkScESfx8GSJlXEw8hI1P1MPoCHNRaBQvkDa
X-Gm-Gg: AYBFou2iQeOKn+qvn5Vduh1dLzcwQBl0M4vR5846WsBeVLAAxXgA3MYpFToo4ltJ+EJ
	QBHEzrMtRmKJE7qt+GCjfkSvRkbYdGHA4swopp87rTfu6MR0NBHNAGXfQ42HhLFtIUBWZh+WY6/
	ftRTYn+KHmIc7LCZoWnGeObuYKCHVJKGrJhtNEJdWFd5TdD3Du/el0MTJsEoe07dpiWUi+ZLO5l
	Nq2mDjJnMt6ijZrJSNbSkHLIeFDZ2+elws94EC0nJ47XpEOHSX21CJO8zwV3aM1dIm4E8+cGIeS
	7ljRKKkY4Nxaw7+c2Vryn1bUrSo0g0METca9lvfJs7IcmmX8qmFD6WEP9wxSNpZvOdIDZqzfbnh
	5oYvcUytO2cDI7OMP7UnCX4vuP93O3y9Zzn8oDBkwWE5vUF+BEslQYEED/VTmV6mKVZfi
X-Received: by 2002:a05:7022:ea4a:b0:193:9aa3:4748 with SMTP id
 a92af1059eb24-1992a250624mr874553c88.1.1792803557836; Fri, 23 Oct 2026
 17:59:17 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261022-psci-fix-v3-0-9ce2133c5659@gmail.com>
 <20261022-psci-fix-v3-3-9ce2133c5659@gmail.com> <e0becea2-c5a1-46d4-932e-50517311fb96@oss.qualcomm.com>
In-Reply-To: <e0becea2-c5a1-46d4-932e-50517311fb96@oss.qualcomm.com>
From: Reza Kurniawan <imkyufie@gmail.com>
Date: Sat, 24 Oct 2026 07:59:06 +0700
X-Gm-Features: AclHuK805OtpEX04XfOwa7m3QcwJPrF0jSlDAfdHBuylNxB6UZKJYqAFi9tMyjQ
Message-ID: <CAAq9HC7EdA3proF75D9kKa0QFJswV-bFp284u2vUfJi-dcj2_Q@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: msm8917: Use a shallower cluster
 state to fix unresponsive idle
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ulf Hansson <ulfh@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Christian Loehle <christian.loehle@arm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Val Packett <val@packett.cool>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_175920_062139_016272CD 
X-CRM114-Status: GOOD (  19.08  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 22, 2026 at 5:14=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 10/22/26 11:41 AM, Reza Kurniawan wrote:
> > MSM8917 is a single cluster SoC, so powering down the cluster means
> > powering down the whole system. This causes two problems:
> >
> > 1. The system becomes unresponsive, even to common interrupts. Waking i=
t
> >    requires an interrupt from the MPM (MSM Power Manager) or scheduling
> >    the MPM to wake the system later. Linux currently has no way of doin=
g
> >    the latter, so the cluster may never resume operation.
> >
> > 2. Entering power collapse blanks the screen. When the state is entered
> >    and exited repeatedly, this shows up as visible flicker.
> >
> > Even if MPM scheduling were implemented, the second problem would remai=
n
> > and it wouldn't fix the system being unresponsive at idle.
> >
> > Replace the idle state with PSCI mode 4 (dubbed GDHS downstream), which
> > is less aggressive and can wake up from conventional interrupt sources.
> >
> > Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
> > ---
>
>
> https://lore.kernel.org/lkml/20261005-s2idle_state-v1-0-3c402c66f388@oss.=
qualcomm.com/
>
> and
>
> https://lore.kernel.org/lkml/20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0=
d5638@oss.qualcomm.com/
>
> are in flight, you may want to integrate/test them locally!

Thanks for the tip!

>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Konrad

