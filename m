Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75EBAC44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 14:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1UFXFpEyhH0o78ophoiUhGPEsgEAqoMWoguEg8fSnYs=; b=Z7q7KuLTeXWfbS0f3EWnlyla5f
	57c10BAcMXnd2UaCx2rGhNCCsSeyJzJfH49kPtXzZdTj/celgbKRwU/ClOe3xb7YLYZsbn/IQ5ryL
	FSDETv4UfvUmEiDVuSC79taYo7oqUAMoOGS++QdCO7L9jwIgempU9QZSb08KfdBOzYPhkJb+h7jjd
	OU0u5GVl2utM2JkDlAu32F9U2v/uhcj7DZHIHDHwuZ4Wqu8BRxw8LTT49wQnlKf/tZSzGsnf6bdC7
	loyz9Uj5z/IUvOvh+/a/kpSq8a98ZkVMlXpn+E+IU12F2S5q+Qk/uZiidXY2+p1emyGgkCWJX5Np9
	700sj+Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmXfG-0000000Bzzt-1X0q;
	Wed, 22 Jul 2026 14:11:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmXfF-0000000Bzze-25ni
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 14:11:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 143A543EDB
	for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 14:11:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06CB71F0155A
	for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 14:11:13 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-39c953950dfso96882711fa.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 07:11:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Ro8bdYAAKsJg5PB3g+LOzOmd9GKMxdYRLtFVk2Vp0GCxntgdWriZgrPkyS0vC4Kimf6J5RlY2nDkjAAJx9So66i@lists.infradead.org
X-Gm-Message-State: AOJu0YxKpKx7RoPrOVFuogMeiwOd+3VAuLskxp+U/cVnL0wElFynpjwN
	I4qN7L+4IZxeaWQiQcd/bEg0RvgshUYy/ASRuCVAXh+DxCDoEaunw5ZMEVFglHnVM2sqbmFd7w8
	GgFeGszxxBFC+bk8SBeowoawigCG8d9FFgzALIsH04A==
X-Received: by 2002:a05:651c:1989:b0:39d:560a:fd9 with SMTP id
 38308e7fff4ca-39eb27bfd05mr51615621fa.18.1784729471362; Wed, 22 Jul 2026
 07:11:11 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 22 Jul 2026 07:11:10 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 22 Jul 2026 07:11:10 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <amC7_M-HjVZ3sQuT@linaro.org>
MIME-Version: 1.0
References: <20260721-qcom-qce-cmd-descr-v23-0-1be02deffda9@oss.qualcomm.com>
 <20260721-qcom-qce-cmd-descr-v23-6-1be02deffda9@oss.qualcomm.com>
 <20260721134853.2B2401F000E9@smtp.kernel.org> <amCGXUUd4VmuQRGD@linaro.org>
 <CAMRc=MfBNB0pvv1kPPcswE4Y2m7PXBO49bwJg=v0+aY=JmJKWw@mail.gmail.com> <amC7_M-HjVZ3sQuT@linaro.org>
Date: Wed, 22 Jul 2026 07:11:10 -0700
X-Gmail-Original-Message-ID: <CAMRc=MdnSyPmbK0skMx686=wSe52nnuWgCNJ0uSoKs_=HyAq-Q@mail.gmail.com>
X-Gm-Features: AUfX_mzDtm5YjAae_ksl_tQdx3fXsW-UWLgM9ZMbUilUXBQ6QQqNPU4983jvSLM
Message-ID: <CAMRc=MdnSyPmbK0skMx686=wSe52nnuWgCNJ0uSoKs_=HyAq-Q@mail.gmail.com>
Subject: Re: [PATCH v23 06/14] dmaengine: qcom: bam_dma: add support for BAM locking
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Thara Gopinath <thara.gopinath@gmail.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Udit Tiwari <quic_utiwari@quicinc.com>, 
	Md Sadre Alam <mdalam@qti.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>, 
	Peter Ujfalusi <peter.ujfalusi@gmail.com>, Michal Simek <michal.simek@amd.com>, 
	Frank Li <Frank.Li@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Vignesh Raghavendra <vigneshr@ti.com>, dmaengine@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	sashiko-reviews@lists.linux.dev, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

On Wed, 22 Jul 2026 14:47:56 +0200, Stephan Gerhold
<stephan.gerhold@linaro.org> said:
> On Wed, Jul 22, 2026 at 02:34:52AM -0700, Bartosz Golaszewski wrote:
>> On Wed, 22 Jul 2026 10:59:09 +0200, Stephan Gerhold
>> <stephan.gerhold@linaro.org> said:
>> > On Tue, Jul 21, 2026 at 01:48:52PM +0000, sashiko-bot@kernel.org wrote:
>> >> Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:
>> >> - [High] State leak causing hardware misconfiguration on channel reuse due to uncleared `lock_scratchpad_addr` and hardcoded direction.
>> >> - [High] Channel state corruption when `bam_slave_config` fails validation.
>> >> - [High] Infinite BH workqueue loop and unratelimited log flood on memory allocation failure.
>> >> - [High] DMA API violation: `lock_ce` buffer shares a cacheline with frequently CPU-modified struct members.
>> >> - [Low] Unused assignment of `hdesc` in IRQ handler.
>> >> --
>> >>
>> >> --- Patch [6]: [PATCH v23 06/14] dmaengine: qcom: bam_dma: add support for BAM locking ---
>> >> commit 8b44c5e4935cbb61832adb3262df00b3b606a283
>> >> Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>> >>
>> >> dmaengine: qcom: bam_dma: add support for BAM locking
>> >>
>> >> This commit adds support for BAM pipe locking by prepending and appending
>> >> dummy command descriptors with LOCK/UNLOCK bits when starting DMA on a TX
>> >> channel. It uses a peripheral-local scratchpad address communicated via slave
>> >> config for the dummy writes.
>> >>
>> >> > diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
>> >> > index f3e713a5259c2..411c60c4433e2 100644
>> >> > --- a/drivers/dma/qcom/bam_dma.c
>> >> > +++ b/drivers/dma/qcom/bam_dma.c
>> [...]
>> >> [ ... ]
>> >> > @@ -1064,6 +1197,7 @@ static void bam_start_dma(struct bam_chan *bchan)
>> >> >
>> >> >  	lockdep_assert_held(&bchan->vc.lock);
>> >> >
>> >> > +	vd = vchan_next_desc(&bchan->vc);
>> >> >  	if (!vd)
>> >> >  		return;
>> >> >
>> >> > @@ -1072,6 +1206,24 @@ static void bam_start_dma(struct bam_chan *bchan)
>> >> >  		return;
>> >> >
>> >> >  	while (vd && !IS_BUSY(bchan)) {
>> >> > +		/*
>> >> > +		 * Open a LOCK/UNLOCK bracket around each fresh sequence.
>> >> > +		 * Sentinels inserted by bam_setup_pipe_lock() are skipped: they
>> >> > +		 * already have bam_locked set and must not trigger a second pair.
>> >> > +		 */
>> >> > +		if (!bchan->bam_locked) {
>> >> > +			ret = bam_setup_pipe_lock(bchan);
>> >> > +			if (ret) {
>> >> > +				dev_err_ratelimited(bdev->dev,
>> >> > +					"failed to setup the pipe lock, deferring transfer: %d\n",
>> >> > +					ret);
>> >> > +				queue_work(system_bh_highpri_wq, &bdev->work);
>> >> > +				break;
>> >> > +			}
>> >>
>> >> [Severity: High]
>> >> Does requeuing to a high-priority BH workqueue upon ENOMEM cause CPU
>> >> starvation? Because system_bh_highpri_wq executes in softirq context,
>> >> requeuing immediately without sleeping prevents the memory reclaim needed
>> >> to resolve the GFP_NOWAIT failure, leading to an infinite spin loop.
>> >>
>> >
>> > It looks like my suggestion to queue_work() again in the error path of
>> > bam_start_dma() wasn't great if we end up causing an infinite spin loop.
>> > We do need to retry somehow or report an error though, I don't think
>> > aborting and leaving the desccriptors completely unhandled is an option
>> > either... :(
>> >
>> > One option would be to try to avoid the allocation and write the lock
>> > descriptors directly into the FIFO, but this will probably get really
>> > messy as well, since you would need to carefully modify the FIFO
>> > management in several functions ...
>> >
>> > I don't have a good spontaenous idea how to solve this right now. :/
>> >
>>
>> Pre-allocate the lock descriptors (if needed) in bam_prep_slave_sg()? As in:
>> call bam_make_lock_desc() in bam_prep_slave_sg(), store the descriptors and
>> make bam_setup_pipe_lock() return void as it will no longer be possible for it
>> to fail? It would just grab the preallocated descriptors.
>>
>
> I considered suggesting this, but how do you know which descriptor needs
> it in bam_prep_slave_sg()? It's just the allocation, afaict it doesn't
> tell you anything about the order in which they will be submitted. :/
>
> We could always allocate the extra lock descriptors and waste the extra
> memory for the descriptors that won't need it. That should work, but is
> also not great ...
>

Oh, I was thinking about having pointers to lock/unlock descriptors in struct
bam_chan and to just grab them in bam_setup_pipe_lock() when needed and then
next time we enter bam_slave_prep_sg(), we see we consumed them so let's
re-allocate them. And of course: don't do it at all if pipe locking is not
supported.

Bartosz

> I was hammering at the code a bit earlier to try the "write the lock
> descriptors directly into the FIFO" approach. It has some advantages,
> but also makes the FIFO management quite a bit trickier, hard to get it
> right without full concentration. :')
>
> I _think_ it could potentially work, but if you have a simpler idea I'm
> also happy to throw away the mess I started. :-)
>
> Thanks,
> Stephan
>

