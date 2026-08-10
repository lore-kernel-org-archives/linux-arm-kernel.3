Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A25EC5AD7B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 15:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xa0u/zVElWPUOyk4vaPXP1KhKSEfswjdAfWz5D1PLQQ=; b=uAr00M/fcbHey63L8nLJGgstZe
	v/mPWh2+0bliK5gsV6Tocpd6fFXeOi9uyL8dcjzUtm7UbJKlLARDY0VESay8DEYg17QgAOrlR6IAO
	xbw3MuswsuqAuz2wwMnFNMdEoi7r+vDz5DqPuMgmzQI1y454urrVZSRhC9PsyUPPRcUeXVlzTtX62
	UtwI9LldMu7gmMzApUT93kA2SytXyqPS5pTlcgmBugLfuND0f6Zo1OZKK/Tfh4wLn24epu6BRdLel
	UdcgwjYdinBIXrqG343nlxML+9h8E83WLCvKj18JWQM8DlSj8aqoHWiKhrw0y0V1uU9vGGdlLQTrV
	Y6ZM8QMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtS6T-0000000CI2A-3Jrq;
	Mon, 10 Aug 2026 15:39:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtS6S-0000000CI1r-0X0j;
	Mon, 10 Aug 2026 15:39:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Xa0u/zVElWPUOyk4vaPXP1KhKSEfswjdAfWz5D1PLQQ=; b=boJmjtFNAIiCDsn/mt7MzG3j9t
	F586ayjJWGJrhiGdjGbT2QJT+xzTcXAw7tBotxO8W4NBcUZZvfib45neuGri0/BGS9aeeEyyI61C+
	YqeHhFjIUX7GXmFVtba1cMaoE18dTv58HuRnv9AIeLcKdU5lXeqDR+XWX9boM/a49tZlq2B8MmBBz
	WYDIq7EJhrahvwl4p7+1TmVhoK0Pv83el6F8F06e2dN53TU6ZVcaaxmkBD39uTpArE21mLyas80Oq
	DLc5h6cO5oHB/fFVABW74am/Ml10/OUjOIKXAMH1LMq0gVmzgfJgHNUWSaOHIUmPqDn1JCoqn7DU2
	xdGPaXaA==;
Received: from sender4-op-o11.zoho.com ([136.143.188.11])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wtS6O-0000000Dx9C-3TFx;
	Mon, 10 Aug 2026 15:39:51 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1786376376; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=giozI1u7dJ+5r1g+wq/+mQnM0kuAP2V7q7Bw1viy21DzpR7TnCNY2kIAJOosw2vTETYhwWiNUKtHEfvvEoqK4MDFA8wot06MV66T6fe1Xs+kdXf4Zjoo4kUmIb5V7oF/btULdBvCTQ1NeHDC7dsc7BmpmoaOrJ/VjHvehjxMHFg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1786376376; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Xa0u/zVElWPUOyk4vaPXP1KhKSEfswjdAfWz5D1PLQQ=; 
	b=TOM3rwJ3pQPECOrq2OVcyOjWLLhu7l5ghqpYWpUz6FzYJ8wWgZlUl4BZvUA06wgY0JqBRaVj6zTjAJQx9KoOmx874N+WhKMeGmo0ysKLeGJqf/OgTxTnDQ676/KLy3/bcGFR50BrS8DWrtrgSj0Yi6MignUjk73TQsTpYEakLtA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1786376376;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=Xa0u/zVElWPUOyk4vaPXP1KhKSEfswjdAfWz5D1PLQQ=;
	b=iblyMT1kBdXZERWSmIBTW2XN5BgKN2QqST1pFyMxIIXv1uxByjRL9pJjS/cNZRlr
	jXPq/wgTx6+0RijFQX1YNu3riCoIoQtEUT+ZAV0FzpUuLP4XFQ33JapgOtcAgYLgWDi
	QiyRD7ZG6UnHXkFU8KW1E3TLrViVjJ80WWynVh/c=
Received: by mx.zohomail.com with SMTPS id 1786376375087743.4479949557322;
	Mon, 10 Aug 2026 08:39:35 -0700 (PDT)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: Jacob Chen <jacob-chen@iotwrt.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-rockchip@lists.infradead.org
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de, Michael Tretter <m.tretter@pengutronix.de>,
 Sven =?UTF-8?B?UMO8c2NoZWw=?= <s.pueschel@pengutronix.de>
Subject: Re: [PATCH 05/17] media: v4l2-mem2mem: support running multiple jobs in
 parallel
Date: Mon, 10 Aug 2026 11:39:32 -0400
Message-ID: <f1RqEsL3T-SFEBZFuL9s-A@collabora.com>
In-Reply-To: <20260606-spu-rga3multicore-v1-5-3ec2b15675f7@pengutronix.de>
References: <20260606-spu-rga3multicore-v1-0-3ec2b15675f7@pengutronix.de>
 <20260606-spu-rga3multicore-v1-5-3ec2b15675f7@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_163949_352644_8BF4F3E7 
X-CRM114-Status: GOOD (  35.47  )
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

Hi Sven !

On Friday, 5 June 2026 18:06:51 EDT Sven P=C3=BCschel wrote:
> Add support for running multiple jobs in parallel for SoCs containing
> multiple identical devices. An example is the Rockchip RK3588 SoC,
> which contains two identical RGA3 devices. Therefore it is desirable to
> have the kernel schedule the work across all available devices and only
> expose one video device to the userspace.
>=20
> Previously the curr_ctx member of a v4l2_m2m_dev was used to track the
> currently running context. But the currently running context will always
> be at the top of the job_queue. As the TRANS_RUNNING flag can be used to
> check if the queue head is already running, the curr_ctx member can be
> completely dropped
>=20
> To avoid queueing too many parallel jobs, the
> v4l2_m2m_set_max_parallel_jobs method is added. It allows a driver
> to set the number of parallel jobs and avoids calling device_run when
> the given number of jobs is already running. This is set to 1 by default
> to prevent parallel job runs. Drivers with the need and support for
> scheduling jobs can adjust this value accordingly.
>=20
> Note that this change doesn't allow a context to be used multiple times
> in parallel. So a single stream won't be able to utilize multiple devices
> at once, but N streams can utilize up to N devices. This is caused by the
> fact that a context is not added multiple times to the job_list and also
> holds the job_flags to distinguish if it's currently running.
>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>
> ---
>  drivers/media/v4l2-core/v4l2-mem2mem.c | 89
> ++++++++++++++++++++++------------ include/media/v4l2-mem2mem.h          =
 |
>  3 ++
>  2 files changed, 62 insertions(+), 30 deletions(-)
>=20
> diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c
> b/drivers/media/v4l2-core/v4l2-mem2mem.c index a65cbb124cfe0..14ac9c85803=
d1
> 100644
> --- a/drivers/media/v4l2-core/v4l2-mem2mem.c
> +++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
> @@ -84,16 +84,15 @@ static const char * const m2m_entity_name[] =3D {
>   *			v4l2_m2m_unregister_media_controller().
>   * @intf_devnode:	&struct media_intf devnode pointer with the interface
>   *			with controls the M2M device.
> - * @curr_ctx:		currently running instance
>   * @job_queue:		instances queued to run
>   * @job_spinlock:	protects job_queue
>   * @job_work:		worker to run queued jobs.
>   * @job_queue_flags:	flags of the queue status, %QUEUE_PAUSED.
> + * @max_parallel_jobs:	max job_queue instances number marked as running
>   * @m2m_ops:		driver callbacks
>   * @kref:		device reference count
>   */
>  struct v4l2_m2m_dev {
> -	struct v4l2_m2m_ctx	*curr_ctx;
>  #ifdef CONFIG_MEDIA_CONTROLLER
>  	struct media_entity	*source;
>  	struct media_pad	source_pad;
> @@ -108,6 +107,7 @@ struct v4l2_m2m_dev {
>  	spinlock_t		job_spinlock;
>  	struct work_struct	job_work;
>  	unsigned long		job_queue_flags;
> +	u32			max_parallel_jobs;
>=20
>  	const struct v4l2_m2m_ops *m2m_ops;
>=20
> @@ -123,6 +123,12 @@ static struct v4l2_m2m_queue_ctx *get_queue_ctx(stru=
ct
> v4l2_m2m_ctx *m2m_ctx, return &m2m_ctx->cap_q_ctx;
>  }
>=20
> +void v4l2_m2m_set_max_parallel_jobs(struct v4l2_m2m_dev *m2m_dev,
> +				    u32 max_parallel_jobs)
> +{
> +	m2m_dev->max_parallel_jobs =3D max_parallel_jobs;
> +}

This needs to be exported so that drivers can use it even when compiled as=
=20
modules.
+EXPORT_SYMBOL(v4l2_m2m_set_max_parallel_jobs);

> +
>  struct vb2_queue *v4l2_m2m_get_vq(struct v4l2_m2m_ctx *m2m_ctx,
>  				       enum v4l2_buf_type type)
>  {
> @@ -229,14 +235,22 @@ EXPORT_SYMBOL_GPL(v4l2_m2m_buf_remove_by_idx);
>  void *v4l2_m2m_get_curr_priv(struct v4l2_m2m_dev *m2m_dev)
>  {
>  	unsigned long flags;
> -	void *ret =3D NULL;
> +	struct v4l2_m2m_ctx *first_ctx;
>=20
>  	spin_lock_irqsave(&m2m_dev->job_spinlock, flags);
> -	if (m2m_dev->curr_ctx)
> -		ret =3D m2m_dev->curr_ctx->priv;
> +	if (list_empty(&m2m_dev->job_queue)) {
> +		spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
> +		return NULL;
> +	}
> +
> +	first_ctx =3D list_first_entry(&m2m_dev->job_queue,
> +				     struct v4l2_m2m_ctx, queue);
>  	spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
>=20
> -	return ret;
> +	if (first_ctx->job_flags & TRANS_RUNNING)
> +		return first_ctx->priv;
> +	else
> +		return NULL;
>  }
>  EXPORT_SYMBOL(v4l2_m2m_get_curr_priv);
>=20
> @@ -252,13 +266,11 @@ EXPORT_SYMBOL(v4l2_m2m_get_curr_priv);
>  static void v4l2_m2m_try_run(struct v4l2_m2m_dev *m2m_dev)
>  {
>  	unsigned long flags;
> +	struct v4l2_m2m_ctx *ctx;
> +	struct v4l2_m2m_ctx *chosen_ctx =3D NULL;
> +	u32 running_jobs =3D 0;
>=20
>  	spin_lock_irqsave(&m2m_dev->job_spinlock, flags);
> -	if (NULL !=3D m2m_dev->curr_ctx) {
> -		spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
> -		dprintk("Another instance is running, won't run=20
now\n");
> -		return;
> -	}
>=20
>  	if (list_empty(&m2m_dev->job_queue)) {
>  		spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
> @@ -272,13 +284,30 @@ static void v4l2_m2m_try_run(struct v4l2_m2m_dev
> *m2m_dev) return;
>  	}
>=20
> -	m2m_dev->curr_ctx =3D list_first_entry(&m2m_dev->job_queue,
> -				   struct v4l2_m2m_ctx, queue);
> -	m2m_dev->curr_ctx->job_flags |=3D TRANS_RUNNING;
> +	list_for_each_entry(ctx, &m2m_dev->job_queue, queue) {
> +		if (!(ctx->job_flags & TRANS_RUNNING)) {
> +			chosen_ctx =3D ctx;
> +			break;
> +		}
> +
> +		running_jobs++;
> +	}
> +	if (running_jobs >=3D m2m_dev->max_parallel_jobs) {
> +		spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
> +		dprintk("Maximum number of parallel jobs reached\n");
> +		return;
> +	}
> +	if (!chosen_ctx) {
> +		spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
> +		dprintk("All jobs already running\n");
> +		return;
> +	}
> +
> +	chosen_ctx->job_flags |=3D TRANS_RUNNING;
>  	spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
>=20
> -	dprintk("Running job on m2m_ctx: %p\n", m2m_dev->curr_ctx);
> -	m2m_dev->m2m_ops->device_run(m2m_dev->curr_ctx->priv);
> +	dprintk("Running job on m2m_ctx: %p\n", chosen_ctx);
> +	m2m_dev->m2m_ops->device_run(chosen_ctx->priv);
>  }
>=20
>  /*
> @@ -469,15 +498,14 @@ static void v4l2_m2m_schedule_next_job(struct
> v4l2_m2m_dev *m2m_dev, static bool _v4l2_m2m_job_finish(struct v4l2_m2m_d=
ev
> *m2m_dev,
>  				 struct v4l2_m2m_ctx *m2m_ctx)
>  {
> -	if (!m2m_dev->curr_ctx || m2m_dev->curr_ctx !=3D m2m_ctx) {
> +	if (!m2m_ctx || !(m2m_ctx->job_flags & TRANS_RUNNING)) {
>  		dprintk("Called by an instance not currently=20
running\n");
>  		return false;
>  	}
>=20
> -	list_del(&m2m_dev->curr_ctx->queue);
> -	m2m_dev->curr_ctx->job_flags &=3D ~(TRANS_QUEUED | TRANS_RUNNING);
> -	wake_up(&m2m_dev->curr_ctx->finished);
> -	m2m_dev->curr_ctx =3D NULL;
> +	list_del(&m2m_ctx->queue);
> +	m2m_ctx->job_flags &=3D ~(TRANS_QUEUED | TRANS_RUNNING);
> +	wake_up(&m2m_ctx->finished);
>  	return true;
>  }
>=20
> @@ -544,16 +572,19 @@ EXPORT_SYMBOL(v4l2_m2m_buf_done_and_job_finish);
>  void v4l2_m2m_suspend(struct v4l2_m2m_dev *m2m_dev)
>  {
>  	unsigned long flags;
> -	struct v4l2_m2m_ctx *curr_ctx;
> +	struct v4l2_m2m_ctx *ctx;
> +	struct v4l2_m2m_ctx *ctx_safe;
>=20
>  	spin_lock_irqsave(&m2m_dev->job_spinlock, flags);
>  	m2m_dev->job_queue_flags |=3D QUEUE_PAUSED;
> -	curr_ctx =3D m2m_dev->curr_ctx;
>  	spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
>=20
> -	if (curr_ctx)
> -		wait_event(curr_ctx->finished,
> -			   !(curr_ctx->job_flags & TRANS_RUNNING));
> +	list_for_each_entry_safe(ctx, ctx_safe, &m2m_dev->job_queue, queue)=20
{
> +		if (!(ctx->job_flags & TRANS_RUNNING))
> +			break;
> +
> +		wait_event(ctx->finished, !(ctx->job_flags &=20
TRANS_RUNNING));
> +	}
>  }
>  EXPORT_SYMBOL(v4l2_m2m_suspend);
>=20
> @@ -896,10 +927,8 @@ int v4l2_m2m_streamoff(struct file *file, struct
> v4l2_m2m_ctx *m2m_ctx, q_ctx->num_rdy =3D 0;
>  	spin_unlock_irqrestore(&q_ctx->rdy_spinlock, flags);
>=20
> -	if (m2m_dev->curr_ctx =3D=3D m2m_ctx) {
> -		m2m_dev->curr_ctx =3D NULL;
> +	if (m2m_ctx->job_flags & TRANS_RUNNING)
>  		wake_up(&m2m_ctx->finished);
> -	}
>  	spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags_job);
>=20
>  	return 0;
> @@ -1194,12 +1223,12 @@ struct v4l2_m2m_dev *v4l2_m2m_init(const struct
> v4l2_m2m_ops *m2m_ops) if (!m2m_dev)
>  		return ERR_PTR(-ENOMEM);
>=20
> -	m2m_dev->curr_ctx =3D NULL;
>  	m2m_dev->m2m_ops =3D m2m_ops;
>  	INIT_LIST_HEAD(&m2m_dev->job_queue);
>  	spin_lock_init(&m2m_dev->job_spinlock);
>  	INIT_WORK(&m2m_dev->job_work, v4l2_m2m_device_run_work);
>  	kref_init(&m2m_dev->kref);
> +	m2m_dev->max_parallel_jobs =3D 1;
>=20
>  	return m2m_dev;
>  }
> diff --git a/include/media/v4l2-mem2mem.h b/include/media/v4l2-mem2mem.h
> index 31de25d792b98..e6177d0eaf637 100644
> --- a/include/media/v4l2-mem2mem.h
> +++ b/include/media/v4l2-mem2mem.h
> @@ -594,6 +594,9 @@ static inline void v4l2_m2m_set_dst_buffered(struct
> v4l2_m2m_ctx *m2m_ctx, m2m_ctx->cap_q_ctx.buffered =3D buffered;
>  }
>=20
> +void v4l2_m2m_set_max_parallel_jobs(struct v4l2_m2m_dev *m2m_dev,
> +				    u32 max_parallel_jobs);
> +
>  /**
>   * v4l2_m2m_ctx_release() - release m2m context
>   *





