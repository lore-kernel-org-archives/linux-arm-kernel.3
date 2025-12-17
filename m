Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26514D68BC2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 23:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9V+YJ4gG6ljXsDx4ZRidny7LTj0Q5gQ27k2c7thZUTw=; b=C3CU+zqyON6U3h3O/3/L8wf25U
	HVEHcLty08DGxQp1kbQRYM42IUNNu+hzTL2gYkZjpmneILzadi8RV/QuLyK8M19sBbD04W1b1z4B8
	Erbq5EquKo1wL1vGunxmMnXjQgEZyQTI8CSqFDPVnJmEB7U+54lSMuDlgrXyg4yqGjU3Jmq1RLnZ+
	mOf5U2DMp6quSnxPCe01RX36Mevk4autwAndFu6S9LJYEV8G05gQ/uGK4FUJNOsQHVs+smIckztJt
	UlcFfMdc0fvT3pS7W6kE+/2E/sajarhoAFobmzzpVT87CbIIPUH2qAcx1wxWa0/KoavVSXUsm075y
	RT4VRxWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW15P-00000007YZM-0Pt0;
	Wed, 17 Dec 2025 23:37:39 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW15L-00000007YXN-3l5K
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 23:37:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1766014655;
 bh=9V+YJ4gG6ljXsDx4ZRidny7LTj0Q5gQ27k2c7thZUTw=;
 b=wR3JirHK0McrpR0pys9L0/xmIq1ojlhFsDvt+nSQ9dFiEhW3cXqQMt+exMcToGhsQ9Tqy1HrT
 EeuT7CXIKlo2UGnvN45EDeZGHH96QFIJnxYLkkT/0efC8bVfbR9UZr/zVYMce2qu/8qTFts9qa0
 mpRlj6jA4DJweieGkrcnYgh9Ve1a7DJnDTZo1VVbAl9q/NIs3gFNuHqqw4bB812nCR1bpan86Ln
 mHMr9fz+vTmesHzTvDwtnKg3S4G2TFBrQt4V/12gdM2f5+XKtaHvUW+Ce5tAmyT6knhAKHutSDN
 4u/islUtnHfv4obxNPXiHNKxbEy8duY3YaRqBf1oXKnw==
X-Forward-Email-ID: 69433eb547898a7fd2fef4db
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.0.6
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <47729359-6eb4-494d-9e21-4a3c34cba324@kwiboo.se>
Date: Thu, 18 Dec 2025 00:37:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 09/17] media: rkvdec: Add variant specific coded
 formats list
To: Detlev Casanova <detlev.casanova@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Heiko Stuebner <heiko@sntech.de>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Jonathan Corbet <corbet@lwn.net>, Ricardo Ribalda <ribalda@chromium.org>,
 Hans Verkuil <hverkuil@kernel.org>, Yunke Cao <yunkec@google.com>,
 Hans de Goede <hansg@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Pavan Bobba <opensource206@gmail.com>,
 James Cowgill <james.cowgill@blaize.com>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, Diederik de Haas <didi.debian@cknow.org>,
 linux-kernel@vger.kernel.org
References: <20251217174059.1341784-1-detlev.casanova@collabora.com>
 <20251217174059.1341784-10-detlev.casanova@collabora.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20251217174059.1341784-10-detlev.casanova@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_153735_934194_DE2A554E 
X-CRM114-Status: GOOD (  20.35  )
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

Hi Detlev,

On 12/17/2025 6:40 PM, Detlev Casanova wrote:
> Prepare for adding new variants of the decoder and support specific
> formats and format ops per variant.
> 
> Tested-by: Diederik de Haas <didi.debian@cknow.org>  # Rock 5B
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
>  .../media/platform/rockchip/rkvdec/rkvdec.c   | 35 ++++++++++++-------
>  .../media/platform/rockchip/rkvdec/rkvdec.h   |  2 ++
>  2 files changed, 24 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> index 776149f871b0..968982f6e62c 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> @@ -373,15 +373,16 @@ static bool rkvdec_is_capable(struct rkvdec_ctx *ctx, unsigned int capability)
>  static const struct rkvdec_coded_fmt_desc *
>  rkvdec_enum_coded_fmt_desc(struct rkvdec_ctx *ctx, int index)
>  {
> +	const struct rkvdec_variant *variant = ctx->dev->variant;
>  	int fmt_idx = -1;
>  	unsigned int i;
>  
> -	for (i = 0; i < ARRAY_SIZE(rkvdec_coded_fmts); i++) {
> -		if (!rkvdec_is_capable(ctx, rkvdec_coded_fmts[i].capability))
> +	for (i = 0; i < variant->num_coded_fmts; i++) {
> +		if (!rkvdec_is_capable(ctx, variant->coded_fmts[i].capability))
>  			continue;
>  		fmt_idx++;
>  		if (index == fmt_idx)
> -			return &rkvdec_coded_fmts[i];
> +			return &variant->coded_fmts[i];
>  	}
>  
>  	return NULL;
> @@ -390,12 +391,13 @@ rkvdec_enum_coded_fmt_desc(struct rkvdec_ctx *ctx, int index)
>  static const struct rkvdec_coded_fmt_desc *
>  rkvdec_find_coded_fmt_desc(struct rkvdec_ctx *ctx, u32 fourcc)
>  {
> +	const struct rkvdec_variant *variant = ctx->dev->variant;
>  	unsigned int i;
>  
> -	for (i = 0; i < ARRAY_SIZE(rkvdec_coded_fmts); i++) {
> -		if (rkvdec_is_capable(ctx, rkvdec_coded_fmts[i].capability) &&
> -		    rkvdec_coded_fmts[i].fourcc == fourcc)
> -			return &rkvdec_coded_fmts[i];
> +	for (i = 0; i < variant->num_coded_fmts; i++) {
> +		if (rkvdec_is_capable(ctx, variant->coded_fmts[i].capability) &&
> +		    variant->coded_fmts[i].fourcc == fourcc)
> +			return &variant->coded_fmts[i];
>  	}
>  
>  	return NULL;
> @@ -1014,18 +1016,19 @@ static int rkvdec_add_ctrls(struct rkvdec_ctx *ctx,
>  
>  static int rkvdec_init_ctrls(struct rkvdec_ctx *ctx)
>  {
> +	const struct rkvdec_variant *variant = ctx->dev->variant;
>  	unsigned int i, nctrls = 0;
>  	int ret;
>  
> -	for (i = 0; i < ARRAY_SIZE(rkvdec_coded_fmts); i++)
> -		if (rkvdec_is_capable(ctx, rkvdec_coded_fmts[i].capability))
> -			nctrls += rkvdec_coded_fmts[i].ctrls->num_ctrls;
> +	for (i = 0; i < variant->num_coded_fmts; i++)
> +		if (rkvdec_is_capable(ctx, variant->coded_fmts[i].capability))
> +			nctrls += variant->coded_fmts[i].ctrls->num_ctrls;
>  
>  	v4l2_ctrl_handler_init(&ctx->ctrl_hdl, nctrls);
>  
> -	for (i = 0; i < ARRAY_SIZE(rkvdec_coded_fmts); i++) {
> -		if (rkvdec_is_capable(ctx, rkvdec_coded_fmts[i].capability)) {
> -			ret = rkvdec_add_ctrls(ctx, rkvdec_coded_fmts[i].ctrls);
> +	for (i = 0; i < variant->num_coded_fmts; i++) {
> +		if (rkvdec_is_capable(ctx, variant->coded_fmts[i].capability)) {
> +			ret = rkvdec_add_ctrls(ctx, variant->coded_fmts[i].ctrls);
>  			if (ret)
>  				goto err_free_handler;
>  		}
> @@ -1242,11 +1245,15 @@ static void rkvdec_watchdog_func(struct work_struct *work)
>  
>  static const struct rkvdec_variant rk3288_rkvdec_variant = {
>  	.num_regs = 68,
> +	.coded_fmts = rkvdec_coded_fmts,
> +	.num_coded_fmts = ARRAY_SIZE(rkvdec_coded_fmts),
>  	.capabilities = RKVDEC_CAPABILITY_HEVC,

Looks like we could drop the capabilities flags handling now that we
use a per variant coded_fmts ?

Maybe a rk3288_coded_fmts should be added and used here, or in a cleanup
patch that drops the capabilities flag handling.

Regards,
Jonas

>  };
>  
>  static const struct rkvdec_variant rk3328_rkvdec_variant = {
>  	.num_regs = 109,
> +	.coded_fmts = rkvdec_coded_fmts,
> +	.num_coded_fmts = ARRAY_SIZE(rkvdec_coded_fmts),
>  	.capabilities = RKVDEC_CAPABILITY_HEVC |
>  			RKVDEC_CAPABILITY_H264 |
>  			RKVDEC_CAPABILITY_VP9,
> @@ -1255,6 +1262,8 @@ static const struct rkvdec_variant rk3328_rkvdec_variant = {
>  
>  static const struct rkvdec_variant rk3399_rkvdec_variant = {
>  	.num_regs = 78,
> +	.coded_fmts = rkvdec_coded_fmts,
> +	.num_coded_fmts = ARRAY_SIZE(rkvdec_coded_fmts),
>  	.capabilities = RKVDEC_CAPABILITY_HEVC |
>  			RKVDEC_CAPABILITY_H264 |
>  			RKVDEC_CAPABILITY_VP9,
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> index f35f6e80ea2e..aac6cba4c623 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> @@ -71,6 +71,8 @@ vb2_to_rkvdec_decoded_buf(struct vb2_buffer *buf)
>  
>  struct rkvdec_variant {
>  	unsigned int num_regs;
> +	const struct rkvdec_coded_fmt_desc *coded_fmts;
> +	size_t num_coded_fmts;
>  	unsigned int capabilities;
>  	unsigned int quirks;
>  };


