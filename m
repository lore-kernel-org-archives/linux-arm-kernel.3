Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EC5ACD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 16:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fW7NqakYneF5bS/bTX0omL7VxFP9NAlhoaqpZHQwX1g=; b=OlPgV0dK+J2zYXMS58Pqtlm7LV
	tEc7tWlylWkoA7Nc0VJtfoyxTIMnWDdh63mHQQxWGpNqKMPzBA9H+wIPUUtSN+KSj+G1SdLGKTKTr
	r/Cpid2zbaL/OeuUmShhALaqjSOpJTF3XQCcArygsMmnSGg8v8yUyAYJJMT9pxeWoA99TXyJZzyXH
	aUAzTZpp2iba7LhSanFeMjXi509knJB5UR1bs3OAzUpkF+8BnhGdJndivzllM8ICRE3E/Kok/hlf4
	DRNIEymjLkFmmiG5vtB6lGw+Vo5K9hIvqlcbJK/V4rU9uE3HuikuUaauIdwq2xVkNdP95w4v1E4xv
	dkrqqqcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIV3-0000000GrCw-1l8F;
	Tue, 05 May 2026 16:19:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIV2-0000000GrCT-1yCi;
	Tue, 05 May 2026 16:19:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=fW7NqakYneF5bS/bTX0omL7VxFP9NAlhoaqpZHQwX1g=; b=dvmFHnkEG7SuPcnlNHUOeztIpF
	MmzzaDUNnCRSInSVvY17xjBwmxe2ykxsEJhTqNaqgI9YKatbdNBFg3vnjcTPj8vgzy7foXrcA2UhW
	fwwe4ljHun392atth9ceWMMHZJEkNlQ3VU+MyZrN9WCzqfEEfPNwaCek4hx9F6hIF/xZrC17wxxi0
	/g8wKBXfvhhg8PaVprUBQw69TxsiPL1iR55tTBk5o4zKmhlb7Iwj5nminRJ+gvy/pr5sUt/jRe+qv
	M3e0AFGAv8U9Hb/VGmQ8iRBB986Ya1OZhHieo/lr/cebXONjZXztnxCjG0pFMVyPeTU1/imUzSdkJ
	I0V+isHg==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIUz-0000000E1Vv-1MbJ;
	Tue, 05 May 2026 16:19:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777997988;
	bh=ct+0LQJfiP0a76ZVpKPMTYaMUAt8WLfizRJsqD8mMFc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=bswlFhwTjjhVxn7wuoKSwCTat2SaFzmZZRz9n8JqyDofy3vc0C1w6W54OR0vH2rj4
	 HoxK+ajljZznWk0E13iQzUn/OmHIf4gDLDGzkVr/9EUr21R1I9p1t0tVcTxxBvfpm/
	 rWvNMRjIDzEGca0fx6JeludtWH9JT2TvffWiBHlKhmOw4322nKUafKC2IylJvCZDck
	 8MJSIf0XV8cfJTFE3cr/ZPGz6Uk1MuRUv0soCOJnZI1tTYdB9lKhB2g6Xf0HDGBUCn
	 5VIJLO43+c2PbUnxHDHhUbnar7zprEiimwj84fSo3rXNaElLQTAFG0gGn/h5/Eea7W
	 hpE8WS1cOsx7Q==
Received: from fedora (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1C9E717E0F07;
	Tue,  5 May 2026 18:19:47 +0200 (CEST)
Date: Tue, 5 May 2026 18:19:42 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Ketil Johnsen <ketil.johnsen@arm.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Jonathan
 Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Sumit
 Semwal <sumit.semwal@linaro.org>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>,
 John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Daniel Almeida
 <daniel.almeida@collabora.com>, Alice Ryhl <aliceryhl@google.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Florent Tomasin <florent.tomasin@arm.com>
Subject: Re: [PATCH 5/8] drm/panthor: Minor scheduler refactoring
Message-ID: <20260505181942.317f5205@fedora>
In-Reply-To: <20260505140516.1372388-6-ketil.johnsen@arm.com>
References: <20260505140516.1372388-1-ketil.johnsen@arm.com>
	<20260505140516.1372388-6-ketil.johnsen@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_171953_505771_61DE6924 
X-CRM114-Status: GOOD (  22.41  )
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

On Tue,  5 May 2026 16:05:11 +0200
Ketil Johnsen <ketil.johnsen@arm.com> wrote:

> From: Florent Tomasin <florent.tomasin@arm.com>
> 
> Refactor parts of the group scheduling logic into new helper functions.
> This will simplify addition of the protected mode feature.
> 
> Remove redundant assignments of csg_slot.
> 
> Signed-off-by: Florent Tomasin <florent.tomasin@arm.com>
> Co-developed-by: Ketil Johnsen <ketil.johnsen@arm.com>
> Signed-off-by: Ketil Johnsen <ketil.johnsen@arm.com>

Glad to see this big tick_ctx_apply() function split into smaller
pieces.

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/panthor/panthor_sched.c | 135 +++++++++++++++---------
>  1 file changed, 86 insertions(+), 49 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index 5ee386338005c..987072bd867c4 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -1934,6 +1934,12 @@ static void csgs_upd_ctx_init(struct panthor_csg_slots_upd_ctx *ctx)
>  	memset(ctx, 0, sizeof(*ctx));
>  }
>  
> +static void csgs_upd_ctx_ring_doorbell(struct panthor_csg_slots_upd_ctx *ctx,
> +				       u32 csg_id)
> +{
> +	ctx->update_mask |= BIT(csg_id);
> +}
> +
>  static void csgs_upd_ctx_queue_reqs(struct panthor_device *ptdev,
>  				    struct panthor_csg_slots_upd_ctx *ctx,
>  				    u32 csg_id, u32 value, u32 mask)
> @@ -1944,7 +1950,8 @@ static void csgs_upd_ctx_queue_reqs(struct panthor_device *ptdev,
>  
>  	ctx->requests[csg_id].value = (ctx->requests[csg_id].value & ~mask) | (value & mask);
>  	ctx->requests[csg_id].mask |= mask;
> -	ctx->update_mask |= BIT(csg_id);
> +
> +	csgs_upd_ctx_ring_doorbell(ctx, csg_id);
>  }
>  
>  static int csgs_upd_ctx_apply_locked(struct panthor_device *ptdev,
> @@ -1961,8 +1968,12 @@ static int csgs_upd_ctx_apply_locked(struct panthor_device *ptdev,
>  	while (update_slots) {
>  		struct panthor_fw_csg_iface *csg_iface;
>  		u32 csg_id = ffs(update_slots) - 1;
> +		u32 req_mask = ctx->requests[csg_id].mask;
>  
>  		update_slots &= ~BIT(csg_id);
> +		if (!req_mask)
> +			continue;
> +
>  		csg_iface = panthor_fw_get_csg_iface(ptdev, csg_id);
>  		panthor_fw_update_reqs(csg_iface, req,
>  				       ctx->requests[csg_id].value,
> @@ -1979,6 +1990,9 @@ static int csgs_upd_ctx_apply_locked(struct panthor_device *ptdev,
>  		int ret;
>  
>  		update_slots &= ~BIT(csg_id);
> +		if (!req_mask)
> +			continue;
> +
>  		csg_iface = panthor_fw_get_csg_iface(ptdev, csg_id);
>  
>  		ret = panthor_fw_csg_wait_acks(ptdev, csg_id, req_mask, &acked, 100);
> @@ -2266,12 +2280,76 @@ tick_ctx_cleanup(struct panthor_scheduler *sched,
>  	}
>  }
>  
> +static void
> +tick_ctx_evict_group(struct panthor_scheduler *sched,
> +		     struct panthor_csg_slots_upd_ctx *upd_ctx,
> +		     struct panthor_group *group)
> +{
> +	struct panthor_device *ptdev = sched->ptdev;
> +
> +	if (drm_WARN_ON(&ptdev->base, group->csg_id < 0))
> +		return;
> +
> +	csgs_upd_ctx_queue_reqs(ptdev, upd_ctx, group->csg_id,
> +				group_can_run(group) ?
> +				CSG_STATE_SUSPEND : CSG_STATE_TERMINATE,
> +				CSG_STATE_MASK);
> +}
> +
> +
> +static void
> +tick_ctx_reschedule_group(struct panthor_scheduler *sched,
> +			  struct panthor_csg_slots_upd_ctx *upd_ctx,
> +			  struct panthor_group *group,
> +			  int new_csg_prio)
> +{
> +	struct panthor_device *ptdev = sched->ptdev;
> +	struct panthor_fw_csg_iface *csg_iface;
> +	struct panthor_csg_slot *csg_slot;
> +
> +	if (group->csg_id < 0)
> +		return;
> +
> +	csg_iface = panthor_fw_get_csg_iface(ptdev, group->csg_id);
> +	csg_slot = &sched->csg_slots[group->csg_id];
> +
> +	if (csg_slot->priority != new_csg_prio) {
> +		panthor_fw_update_reqs(csg_iface, endpoint_req,
> +				       CSG_EP_REQ_PRIORITY(new_csg_prio),
> +				       CSG_EP_REQ_PRIORITY_MASK);
> +		csgs_upd_ctx_queue_reqs(ptdev, upd_ctx, group->csg_id,
> +					csg_iface->output->ack ^ CSG_ENDPOINT_CONFIG,
> +					CSG_ENDPOINT_CONFIG);
> +	}
> +}
> +
> +static void
> +tick_ctx_schedule_group(struct panthor_scheduler *sched,
> +			struct panthor_sched_tick_ctx *ctx,
> +			struct panthor_csg_slots_upd_ctx *upd_ctx,
> +			struct panthor_group *group,
> +			int csg_id, int csg_prio)
> +{
> +	struct panthor_device *ptdev = sched->ptdev;
> +	struct panthor_fw_csg_iface *csg_iface = panthor_fw_get_csg_iface(ptdev, csg_id);
> +
> +	group_bind_locked(group, csg_id);
> +	csg_slot_prog_locked(ptdev, csg_id, csg_prio);
> +
> +	csgs_upd_ctx_queue_reqs(ptdev, upd_ctx, csg_id,
> +				group->state == PANTHOR_CS_GROUP_SUSPENDED ?
> +				CSG_STATE_RESUME : CSG_STATE_START,
> +				CSG_STATE_MASK);
> +	csgs_upd_ctx_queue_reqs(ptdev, upd_ctx, csg_id,
> +				csg_iface->output->ack ^ CSG_ENDPOINT_CONFIG,
> +				CSG_ENDPOINT_CONFIG);
> +}
> +
>  static void
>  tick_ctx_apply(struct panthor_scheduler *sched, struct panthor_sched_tick_ctx *ctx)
>  {
>  	struct panthor_group *group, *tmp;
>  	struct panthor_device *ptdev = sched->ptdev;
> -	struct panthor_csg_slot *csg_slot;
>  	int prio, new_csg_prio = MAX_CSG_PRIO, i;
>  	u32 free_csg_slots = 0;
>  	struct panthor_csg_slots_upd_ctx upd_ctx;
> @@ -2282,42 +2360,12 @@ tick_ctx_apply(struct panthor_scheduler *sched, struct panthor_sched_tick_ctx *c
>  	for (prio = PANTHOR_CSG_PRIORITY_COUNT - 1; prio >= 0; prio--) {
>  		/* Suspend or terminate evicted groups. */
>  		list_for_each_entry(group, &ctx->old_groups[prio], run_node) {
> -			bool term = !group_can_run(group);
> -			int csg_id = group->csg_id;
> -
> -			if (drm_WARN_ON(&ptdev->base, csg_id < 0))
> -				continue;
> -
> -			csg_slot = &sched->csg_slots[csg_id];
> -			csgs_upd_ctx_queue_reqs(ptdev, &upd_ctx, csg_id,
> -						term ? CSG_STATE_TERMINATE : CSG_STATE_SUSPEND,
> -						CSG_STATE_MASK);
> +			tick_ctx_evict_group(sched, &upd_ctx, group);
>  		}
>  
>  		/* Update priorities on already running groups. */
>  		list_for_each_entry(group, &ctx->groups[prio], run_node) {
> -			struct panthor_fw_csg_iface *csg_iface;
> -			int csg_id = group->csg_id;
> -
> -			if (csg_id < 0) {
> -				new_csg_prio--;
> -				continue;
> -			}
> -
> -			csg_slot = &sched->csg_slots[csg_id];
> -			csg_iface = panthor_fw_get_csg_iface(ptdev, csg_id);
> -			if (csg_slot->priority == new_csg_prio) {
> -				new_csg_prio--;
> -				continue;
> -			}
> -
> -			panthor_fw_csg_endpoint_req_update(ptdev, csg_iface,
> -							   CSG_EP_REQ_PRIORITY(new_csg_prio),
> -							   CSG_EP_REQ_PRIORITY_MASK);
> -			csgs_upd_ctx_queue_reqs(ptdev, &upd_ctx, csg_id,
> -						csg_iface->output->ack ^ CSG_ENDPOINT_CONFIG,
> -						CSG_ENDPOINT_CONFIG);
> -			new_csg_prio--;
> +			tick_ctx_reschedule_group(sched, &upd_ctx, group, new_csg_prio--);
>  		}
>  	}
>  
> @@ -2354,28 +2402,17 @@ tick_ctx_apply(struct panthor_scheduler *sched, struct panthor_sched_tick_ctx *c
>  	for (prio = PANTHOR_CSG_PRIORITY_COUNT - 1; prio >= 0; prio--) {
>  		list_for_each_entry(group, &ctx->groups[prio], run_node) {
>  			int csg_id = group->csg_id;
> -			struct panthor_fw_csg_iface *csg_iface;
> +			int csg_prio = new_csg_prio--;
>  
> -			if (csg_id >= 0) {
> -				new_csg_prio--;
> +			if (csg_id >= 0)
>  				continue;
> -			}
>  
>  			csg_id = ffs(free_csg_slots) - 1;
>  			if (drm_WARN_ON(&ptdev->base, csg_id < 0))
>  				break;
>  
> -			csg_iface = panthor_fw_get_csg_iface(ptdev, csg_id);
> -			csg_slot = &sched->csg_slots[csg_id];
> -			group_bind_locked(group, csg_id);
> -			csg_slot_prog_locked(ptdev, csg_id, new_csg_prio--);
> -			csgs_upd_ctx_queue_reqs(ptdev, &upd_ctx, csg_id,
> -						group->state == PANTHOR_CS_GROUP_SUSPENDED ?
> -						CSG_STATE_RESUME : CSG_STATE_START,
> -						CSG_STATE_MASK);
> -			csgs_upd_ctx_queue_reqs(ptdev, &upd_ctx, csg_id,
> -						csg_iface->output->ack ^ CSG_ENDPOINT_CONFIG,
> -						CSG_ENDPOINT_CONFIG);
> +			tick_ctx_schedule_group(sched, ctx, &upd_ctx, group, csg_id, csg_prio);
> +
>  			free_csg_slots &= ~BIT(csg_id);
>  		}
>  	}


