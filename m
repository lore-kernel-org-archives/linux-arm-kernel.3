Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32AE8C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jul 2025 18:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PbKaHcS3QJn7SdNwNE2YWZWoy+MjFIGdTIwG2Oc9+s4=; b=SfTmwgaywIoYSeoNJv0wCNXO2W
	rkHlfvlGI/BgfMyU2UkSB0YqzaAxYsG4NzQ2xwqDwDjVpMoCizVGsxDUd8jIc/+ltyotqHZNuo2l2
	GYe3Dk2tqKmvLBOdWX4sfYIlcDR83ewEJKqxKquePZh2Td6M/+EoIGko2S82GCISDIpmj9MovEo1R
	P6rNQA7OXKDIZNmFIz2pGuYTyUsVXRIGTrJXrfxFMA4maCO0YM1RZ0uyc0AHIfIZ+ziHj8Y5d/mFj
	OC9Nju1sjCpXk2jzbk0VvCRk1TAa4oJfR9cAPEL+PTvQ5FCmc6MUyoqyC9eR6dajdlaecRdDKX0Qm
	/qxoFZrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ub1cq-00000000Vor-1z0d;
	Sun, 13 Jul 2025 18:40:36 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ub1aR-00000000VlY-1lPl
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Jul 2025 18:38:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=PbKaHcS3QJn7SdNwNE2YWZWoy+MjFIGdTIwG2Oc9+s4=; b=Z4rqyT6oeXVUU+yARVsY1Y7lOC
	zrx7ehdRpmQ51udCGGb56OomStd2puSS2vP35h6hi05meF0+GAuBHh6PMLcWFJk7MX/DT/itDzWVo
	DJ+NVcoqKasOFO0I9iW5f/9WWcR1wWmnsQUnqGnupLoqKvLdT+RiY2g4cHid/QAZAd72qEqc1ET35
	JjVxh8rIFpawWEZaylVTZK7JvEy+Xd/mbUVKyrKZMidOJuXJEU+tsSVmFA1xbS+r6oAXvEqXtYLj4
	fbXHUnWl+P4o4V1LBvnOnszIQGIgVjSBV2HT2qNIlDkhMo/ErdmeuYTi6Y5iXyVSjCAqw2C6z6Kbm
	jqWsvy+g==;
Received: from [187.36.210.68] (helo=[192.168.1.103])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1ub1aE-00G92m-4h; Sun, 13 Jul 2025 20:37:54 +0200
Message-ID: <5a211d35-c634-4700-a8f7-29015fe83730@igalia.com>
Date: Sun, 13 Jul 2025 15:37:47 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] Revert "staging: vchiq_arm: Improve initial VCHIQ
 connect"
To: Stefan Wahren <wahrenst@gmx.net>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
 linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com,
 kernel-list@raspberrypi.com, linux-staging@lists.linux.dev, stable@kernel.org
References: <20250711154031.24178-1-wahrenst@gmx.net>
 <20250711154031.24178-2-wahrenst@gmx.net>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20250711154031.24178-2-wahrenst@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_113807_764548_7624B1A5 
X-CRM114-Status: GOOD (  18.52  )
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

On 11/07/25 12:40, Stefan Wahren wrote:
> The commit 3e5def4249b9 ("staging: vchiq_arm: Improve initial VCHIQ connect")
> based on the assumption that in good case the VCHIQ connect always happen and
> therefore the keep-alive thread is guaranteed to be woken up. This is wrong,
> because in certain configurations there are no VCHIQ users and so the VCHIQ
> connect never happen. So revert it.
> 
> Fixes: 3e5def4249b9 ("staging: vchiq_arm: Improve initial VCHIQ connect")
> Reported-by: Maíra Canal <mcanal@igalia.com>
> Closes: https://lore.kernel.org/linux-staging/ba35b960-a981-4671-9f7f-060da10feaa1@usp.br/
> Cc: <stable@kernel.org>
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>

Reviewed-by: Maíra Canal <mcanal@igalia.com>

Best Regards,
- Maíra

> ---
>   .../interface/vchiq_arm/vchiq_arm.c           | 28 ++++++++++++++-----
>   .../interface/vchiq_arm/vchiq_core.c          |  1 -
>   .../interface/vchiq_arm/vchiq_core.h          |  2 --
>   3 files changed, 21 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> index 5dbf8d53db09..cdf5687ad4f0 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> @@ -97,6 +97,13 @@ struct vchiq_arm_state {
>   	 * tracked separately with the state.
>   	 */
>   	int peer_use_count;
> +
> +	/*
> +	 * Flag to indicate that the first vchiq connect has made it through.
> +	 * This means that both sides should be fully ready, and we should
> +	 * be able to suspend after this point.
> +	 */
> +	int first_connect;
>   };
>   
>   static int
> @@ -1329,19 +1336,26 @@ vchiq_check_service(struct vchiq_service *service)
>   	return ret;
>   }
>   
> -void vchiq_platform_connected(struct vchiq_state *state)
> -{
> -	struct vchiq_arm_state *arm_state = vchiq_platform_get_arm_state(state);
> -
> -	wake_up_process(arm_state->ka_thread);
> -}
> -
>   void vchiq_platform_conn_state_changed(struct vchiq_state *state,
>   				       enum vchiq_connstate oldstate,
>   				       enum vchiq_connstate newstate)
>   {
> +	struct vchiq_arm_state *arm_state = vchiq_platform_get_arm_state(state);
> +
>   	dev_dbg(state->dev, "suspend: %d: %s->%s\n",
>   		state->id, get_conn_state_name(oldstate), get_conn_state_name(newstate));
> +	if (state->conn_state != VCHIQ_CONNSTATE_CONNECTED)
> +		return;
> +
> +	write_lock_bh(&arm_state->susp_res_lock);
> +	if (arm_state->first_connect) {
> +		write_unlock_bh(&arm_state->susp_res_lock);
> +		return;
> +	}
> +
> +	arm_state->first_connect = 1;
> +	write_unlock_bh(&arm_state->susp_res_lock);
> +	wake_up_process(arm_state->ka_thread);
>   }
>   
>   static const struct of_device_id vchiq_of_match[] = {
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> index e7b0c800a205..e2cac0898b8f 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> @@ -3343,7 +3343,6 @@ vchiq_connect_internal(struct vchiq_state *state, struct vchiq_instance *instanc
>   			return -EAGAIN;
>   
>   		vchiq_set_conn_state(state, VCHIQ_CONNSTATE_CONNECTED);
> -		vchiq_platform_connected(state);
>   		complete(&state->connect);
>   	}
>   
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
> index 3b5c0618e567..9b4e766990a4 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
> @@ -575,8 +575,6 @@ int vchiq_send_remote_use(struct vchiq_state *state);
>   
>   int vchiq_send_remote_use_active(struct vchiq_state *state);
>   
> -void vchiq_platform_connected(struct vchiq_state *state);
> -
>   void vchiq_platform_conn_state_changed(struct vchiq_state *state,
>   				       enum vchiq_connstate oldstate,
>   				  enum vchiq_connstate newstate);


