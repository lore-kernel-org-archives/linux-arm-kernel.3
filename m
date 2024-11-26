Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0322D3B98B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 13:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WOdLJwfSmV0aCnQspw9D3NG4dorlmbOQM0Z/B6lWEPM=; b=JuX5nhQVcMWi8rXV2/WVUifJi5
	1nL+SzoagaUS40mh4dxKjxVp3/71Wz6mKfQoXXBVAYF+sbcDpCHsTtz1KcOwsudP4gxjr9LiTX1kk
	mW1tE8ud6LIAKQVaiMW7dzwe4u+h0YGRlF+7Au+zGzQZgBEGupEa1nlpK+x9mt0p9nUsYY9Qn2LOR
	Vhi4Xxo/RhHzrFMvVyIbesVdJ1ePBEniFNKWw3zyvumwjXemrsDRd1YjVcJr00TcOjyq/CAkTmkWv
	KNtA0VHyidDfSIp7VnYGvr560wkhNEBVkuny7586tuRhPA5yIiPVBXiID545ykF1YuVREzWq8t9vg
	inJ3P+Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFvlt-0000000Akr3-2Q4Q;
	Tue, 26 Nov 2024 13:38:29 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFvkv-0000000Akj4-2SBt;
	Tue, 26 Nov 2024 13:37:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1732628247;
	bh=feL856Z/U/ZJKcQL9qTcJgDYB4dVhf8sRnNbDu/43A4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S+iwmXm2zgbLIiuraQyUO/tZ2d5bScahmmRI2x6Q5US+CxTwuR/hKnMoXa4kN87hw
	 P9JjVeOSQ72XUjReluFbAJIvK4RYuakk8sb7zEj6/sihkEkdcgpFsgvwgXOhubqm1u
	 SgXK2zYPwB4PiJs0dzYeDYp4N7LNpYYl3IiAJfCpgNxEHtbwTucngyeL7LZbswNUXc
	 DdacJtkmfV7WU36E5NIWGwaaChCxTcmaIuCN/dkHzh9MkvygQ9XY7el8RW9fnZwON7
	 BmWoTq3dxg4IqsWWLKk62bFgdHkKoUkA4yEdLHx/a9MWSyh6/+mQTq7muh7Vtj+pOK
	 YqIIt1G/2+lRw==
Received: from notapiano (pool-100-2-116-133.nycmny.fios.verizon.net [100.2.116.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 72C1D17E3686;
	Tue, 26 Nov 2024 14:37:25 +0100 (CET)
Date: Tue, 26 Nov 2024 08:37:23 -0500
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Hsin-Te Yuan <yuanhsinte@chromium.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Balsam CHIHI <bchihi@baylibre.com>, kernel@collabora.com,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Chen-Yu Tsai <wenst@chromium.org>,
	Bernhard =?utf-8?Q?Rosenkr=C3=A4nzer?= <bero@baylibre.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/5] thermal/drivers/mediatek/lvts: Disable monitor mode
 during suspend
Message-ID: <f38e4283-7133-4865-b4fe-eafb6bd30534@notapiano>
References: <20241125-mt8192-lvts-filtered-suspend-fix-v1-0-42e3c0528c6c@collabora.com>
 <20241125-mt8192-lvts-filtered-suspend-fix-v1-1-42e3c0528c6c@collabora.com>
 <CAHc4DNKmGA-MjTWdZhKygiaRwN7mHnMCf8UPUxH_V16uZifzFg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHc4DNKmGA-MjTWdZhKygiaRwN7mHnMCf8UPUxH_V16uZifzFg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_053729_791763_14DD73AF 
X-CRM114-Status: GOOD (  19.27  )
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

On Tue, Nov 26, 2024 at 04:00:42PM +0800, Hsin-Te Yuan wrote:
> On Tue, Nov 26, 2024 at 5:21 AM Nícolas F. R. A. Prado
> <nfraprado@collabora.com> wrote:
> >
> > When configured in filtered mode, the LVTS thermal controller will
> > monitor the temperature from the sensors and trigger an interrupt once a
> > thermal threshold is crossed.
> >
> > Currently this is true even during suspend and resume. The problem with
> > that is that when enabling the internal clock of the LVTS controller in
> > lvts_ctrl_set_enable() during resume, the temperature reading can glitch
> > and appear much higher than the real one, resulting in a spurious
> > interrupt getting generated.
> >
> This sounds weird to me. On my end, the symptom is that the device
> sometimes cannot suspend.
> To be more precise, `echo mem > /sys/power/state` returns almost
> immediately. I think the irq is more
> likely to be triggered during suspension.

Hi Hsin-Te,

please also check the first paragraph of the cover letter, and patch 2, that
should clarify it. But anyway, I can explain it here too:

The issue you observed is caused by two things combined:
* When returning from resume with filtered mode enabled, the sensor temperature
  reading can glitch, appearing much higher. (fixed by this patch)
* Since the Stage 3 threshold is enabled and configured to take the maximum
  reading from the sensors, it will be triggered by that glitch and bring the
  system into a state where it can no longer suspend, it will just resume right
  away. (fixed by patch 2)

So currently, every so often, during resume both these things will happen, and
any future suspend will resume right away. That's why this was never observed by
me when testing a single suspend/resume. It only breaks on resume, and only
affects future suspends, so you need to test multiple suspend/resumes on the
same run to observe this issue.

And also since both things are needed to cause this issue, if you apply only
patch 1 or only patch 2, it will already fix the issue.

Hope this clarifies it.

Thanks,
Nícolas

