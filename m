Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10470C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 23:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RyR0FYZGAu+xAAQgW5Lj3KzVHDYOKQScbDJUXmm3HlY=; b=tAcPLWiKUjTNApXyD+qWCF4YTi
	rin5NIvvjguD/r5zc8TxdH+2jLW6ixeNQwQBXz/Q+RS7P/gGYSnL/m0E5tdIDaROXj30VMHFw1+IR
	DLRocbuse6Hvuqhwx32buFq6ss492fU/rrGP5LvCcnL5oHI6p0L+yXr6T8MSVETLjqDW4Dg+xyq/M
	QhADqNw7hom8cytPzMV9RbplgHaxa537mWacPDvPuZoIIQmWmfxTcGAqQYocB73grbkxLGePNnkgk
	gJA8r38dXV15q9pKjskEINaDGXdBf+yIlOCgrJLpbyu6Tf81z7FFo3/1wPgR5Vwq/r4/P6sRJJx8C
	wDEeqTVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUZ7Q-0000000A9KB-0IMq;
	Wed, 25 Jun 2025 23:01:28 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUZ09-0000000A7pW-2yF8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 22:53:58 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-60780d74c85so488206a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Jun 2025 15:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750892035; x=1751496835; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RyR0FYZGAu+xAAQgW5Lj3KzVHDYOKQScbDJUXmm3HlY=;
        b=P0XQaQWWC0CC2aMGx89WqpB/YbELycGE/XdKIbg5gGnwGaX1uK9nHp4lwfa0Lsi8Aa
         jgyiG4ApwMjaXPVIrsQgcQyF/RU+4QORqumbBKz2xwsZHtMb+mxW34LxQSdWCb8uXnwy
         yAn/aQ10jArIRlvllyDl7GykEAF5M0vJEyYl8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750892035; x=1751496835;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RyR0FYZGAu+xAAQgW5Lj3KzVHDYOKQScbDJUXmm3HlY=;
        b=mknz+BL/+8szi/4eMVJyAp38+BwVTzbShoF5v/mDCc8tsJ7CVrGsr0SR55zPAjuz/E
         Eij5YBF+zD8VoLf+bSw4ux+BEYqO2cU6anCc/REo0JeEx/m/MThLKALDIBLkZtv2tt+6
         +jBnXnVish5cQ49iBNrE6RQt3oKYKNyd79ZZuFP8fQTBzMr2a3kQ4jcwZVExwAfUKW6z
         xtRkU5NbJ1t0iTv5hHXRYNCapvx5366JJ6c/ysMiQzzZayh1dShIS6fIj4/4gQimi6k5
         4WCSLxPDZAOAyMBs4IReKf3nEW4+I5lXT4fNmcNzvxkuGcCnhciJqs8YcayOc78l2Gv+
         Fquw==
X-Forwarded-Encrypted: i=1; AJvYcCVgPvHkx98eFmP18eHZaX3toqjduUxDvltNaqT0ri39KfC2TpAPdwL/YnGcnRiuW/J43VEXGQ8Nb6lYS8We8KzB@lists.infradead.org
X-Gm-Message-State: AOJu0YzAgMk5EnCWFS3MKql+eGQ4316Q8P8hAgQwemD1AFZapuDD1KHs
	Nqd0WiNYNWj4Ti2BYI0O//3IAeYD3VXcrv9lb4nHcHUFgWPAXPmH/M7lvP/gYnE3O3VP9fxuBWB
	ks8xn4cdI
X-Gm-Gg: ASbGncvFQYKaq/xrS3+y1K3pT8WoUp6ZRIYPnxyzt5MBiw6WbFo7yGbzc9/AecyOvnJ
	xQ9ffHOtuyXNh8m9znFuRJk8Mid88O61kW3r6U1vMi4kB8cAqPRmZ7b5x1Sa8bQwyiBlGJP3y0W
	diJQvvFW+uwVVdaxcXS3mcgCG2NM3GvC8JHK1bki5end5zfeHw30Ilwbylpshu4qBLb9Z9TX5bs
	woHpgZiVilph1+f/l6K20qhtanzDbkK/HnxLytNNjjx+LmQ4LYLJYLdG88rojzCLb6GDSqZrjQR
	9at/FaWMQaUEYODLnovSKl/+tTiwvEtDSqUnZg26dTdEBaorIeyvyczMOVz9vAJbGPxa4gvDpmq
	Ew6p+nyhQVgfo4R8HrDXbHkiaxOQDjLDPjp1Z
X-Google-Smtp-Source: AGHT+IFCSIiSt+DVvHsYBaHmni6WvyaMuHu673YlTyqG9YMcMBhZoIcAyE9+aTQB+S+qpAvgeSHNFw==
X-Received: by 2002:a05:6402:42d0:b0:60c:4bc0:453e with SMTP id 4fb4d7f45d1cf-60c4dc5250cmr3816687a12.2.1750892035195;
        Wed, 25 Jun 2025 15:53:55 -0700 (PDT)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com. [209.85.221.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c2f1b1ffbsm2987735a12.19.2025.06.25.15.53.53
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 15:53:53 -0700 (PDT)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a6cd1a6fecso291274f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Jun 2025 15:53:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXCEFvOP02Sbbuc0na39eOQ6GspXnPb3PcsXwi4f3q3M7Iafw6gfY8nXMlL3vLFoUadNzxNcPb1Au+2YFOo0a9C@lists.infradead.org
X-Received: by 2002:a17:906:4fc5:b0:ad8:85df:865b with SMTP id
 a640c23a62f3a-ae0bee4f81bmr465882166b.33.1750891606630; Wed, 25 Jun 2025
 15:46:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250619114805.16968-1-yangyicong@huawei.com> <20250619114805.16968-2-yangyicong@huawei.com>
In-Reply-To: <20250619114805.16968-2-yangyicong@huawei.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 25 Jun 2025 15:46:31 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UQd5EdSgTb4Lu6wkGYFYudmeaoPgAvpjbSnG19xLj+dg@mail.gmail.com>
X-Gm-Features: Ac12FXzwMfrDuJBkf-A63dUtZVuZncvA5PWl27qreB9HtJeESXtbkwvo-HXMsB0
Message-ID: <CAD=FV=UQd5EdSgTb4Lu6wkGYFYudmeaoPgAvpjbSnG19xLj+dg@mail.gmail.com>
Subject: Re: [RESEND PATCH v2 1/2] watchdog/perf: Provide function for
 adjusting the event period
To: Yicong Yang <yangyicong@huawei.com>
Cc: catalin.marinas@arm.com, will@kernel.org, akpm@linux-foundation.org, 
	sumit.garg@linaro.org, kernelfans@gmail.com, lecopzer.chen@mediatek.com, 
	tglx@linutronix.de, song@kernel.org, linux-arm-kernel@lists.infradead.org, 
	jonathan.cameron@huawei.com, zhanjie9@hisilicon.com, prime.zeng@hisilicon.com, 
	yangyicong@hisilicon.com, linuxarm@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_155357_765205_89613BCC 
X-CRM114-Status: GOOD (  14.14  )
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

Hi,

On Thu, Jun 19, 2025 at 4:48=E2=80=AFAM Yicong Yang <yangyicong@huawei.com>=
 wrote:
>
> From: Yicong Yang <yangyicong@hisilicon.com>
>
> Architecture's using perf events for hard lockup detection needs to
> convert the watchdog_thresh to the event's period, some architecture
> for example arm64 perform this conversion using the CPU's maximum
> frequency which will be acquired by cpufreq. However by the time
> the lockup detector's initialized the cpufreq driver may not be
> initialized, thus launch a watchdog with inaccurate period. Provide
> a function hardlockup_detector_perf_adjust_period() to allowing
> adjust the event period. Then architecture can update with more
> accurate period if cpufreq is initialized.
>
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> ---
>  include/linux/nmi.h    |  2 ++
>  kernel/watchdog_perf.c | 23 +++++++++++++++++++++++
>  2 files changed, 25 insertions(+)

I looked at v1 a long time ago and my nit has been fixed, so:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

