Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EF58C87FC5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 13:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p9N4kKF1ybQ5CXgh1GBlu4OfVzelg+1wad03LAF0VVI=; b=zPDp1HmWuy8kC3738mj+bxwxVt
	twGNUM4ekSLjQ5yaDX9kRei6WHEQYKpn1RMgICVBHIHvBmkRyXtMeHazEUgD4YnP774D79q217mSJ
	y/HG8z1ljnJXYV2VqCXnlNjIrtwxlUSN4Z7hBf6W7f4Kjc7YXohNptVvvJkaP+isvZJ69BBxbxdZl
	saiAAGUp5L0KrksTkM+eGxNznPBJAj8WEWovC5NLXHOi8U7RiJpN2gMTooLjR9XKxx9X7uMwA6QnL
	GQZyHIvxb7G0DnOR3ziFwMPH92ceCXCC5ndLyihTH8IFxA9uG0VBlixIHlSo0/DdQOuVwaRDvL5qQ
	b0nEDXiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewMy-00000007YwW-2wZM;
	Thu, 24 Jul 2025 13:52:24 +0000
Received: from out-173.mta1.migadu.com ([2001:41d0:203:375::ad])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uesvl-00000007Aeh-2cXo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 10:12:07 +0000
Message-ID: <ff106cec-7e63-4475-a0e6-452bfcb823b3@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1753351799;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p9N4kKF1ybQ5CXgh1GBlu4OfVzelg+1wad03LAF0VVI=;
	b=KT+7+EMiLruXAUoUM3EAPX6VEEuwHxr71sLBL9KEsUx/rQCdAEU7Ar1IUZ5DUhU8Byfm4z
	JK+8WatmU+6FhG/+atS/1qr9O/p9vm9keg/LSGw9cFa8enrGbUqsiKmcMJWVVDAEtxFcCj
	HL6W46KKPKBUZAkjlraCt+uufSgtjCQ=
Date: Thu, 24 Jul 2025 11:09:56 +0100
MIME-Version: 1.0
Subject: Re: [PATCH net-next v5 3/7] net: airoha: npu: Add wlan_{send,get}_msg
 NPU callbacks
To: Lorenzo Bianconi <lorenzo@kernel.org>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Simon Horman <horms@kernel.org>, Felix Fietkau <nbd@nbd.name>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org
References: <20250723-airoha-en7581-wlan-offlaod-v5-0-da92e0f8c497@kernel.org>
 <20250723-airoha-en7581-wlan-offlaod-v5-3-da92e0f8c497@kernel.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <20250723-airoha-en7581-wlan-offlaod-v5-3-da92e0f8c497@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_031205_798938_66FCF908 
X-CRM114-Status: GOOD (  15.23  )
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

On 23/07/2025 18:19, Lorenzo Bianconi wrote:
> Introduce wlan_send_msg() and wlan_get_msg() NPU wlan callbacks used
> by the wlan driver (MT76) to initialize NPU module registers in order to
> offload wireless-wired traffic.
> This is a preliminary patch to enable wlan flowtable offload for EN7581
> SoC with MT76 driver.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>   drivers/net/ethernet/airoha/airoha_npu.c | 58 ++++++++++++++++++++++++++++++++
>   drivers/net/ethernet/airoha/airoha_npu.h | 21 ++++++++++++
>   2 files changed, 79 insertions(+)
> 

[...]

> @@ -131,6 +147,12 @@ struct wlan_mbox_data {
>   	u32 func_id;
>   	union {
>   		u32 data;
> +		struct {
> +			u32 dir;
> +			u32 in_counter_addr;
> +			u32 out_status_addr;
> +			u32 out_counter_addr;
> +		} txrx_addr;
>   		u8 stats[WLAN_MAX_STATS_SIZE];
>   	};
>   };
> @@ -424,6 +446,30 @@ static int airoha_npu_wlan_msg_send(struct airoha_npu *npu, int ifindex,
>   	return err;
>   }
>   
> +static int airoha_npu_wlan_msg_get(struct airoha_npu *npu, int ifindex,
> +				   enum airoha_npu_wlan_get_cmd func_id,
> +				   u32 *data, gfp_t gfp)
> +{
> +	struct wlan_mbox_data *wlan_data;
> +	int err;
> +
> +	wlan_data = kzalloc(sizeof(*wlan_data), gfp);
> +	if (!wlan_data)
> +		return -ENOMEM;
> +
> +	wlan_data->ifindex = ifindex;
> +	wlan_data->func_type = NPU_OP_GET;
> +	wlan_data->func_id = func_id;
> +
> +	err = airoha_npu_send_msg(npu, NPU_FUNC_WIFI, wlan_data,
> +				  sizeof(*wlan_data));
> +	if (!err)
> +		*data = wlan_data->data;
> +	kfree(wlan_data);
> +
> +	return err;
> +}

Am I reading it correct, that on message_get you allocate 4408 + 8 byte, 
setting it 0, then reallocate the same size in airoha_npu_send_msg() and
copy the data, and then free both buffers, and this is all done just to
get u32 value back?

