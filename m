Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18AD9C79FAD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 09:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VFYlcyORIFs8zabeR7NUL7zR8wkb27uaRiAiMOJ9v8E=; b=tToaDrQRV174miqqfpg7BR9t7O
	k8ZH+NPxq1A1how+CMN0cBFW18gALm7BHX8LIK9St8X7nrx9ZrqfCVgGdeI1Yt6hqK0BHhjYy2D3S
	ZgRKyhCxd/nWZDCdWhXzHnfw6MrmOAQttDUg2SSDA6MRmnFdIbqxbH32zwT3j9xsFo4CDQRdVJbch
	NqJF5BjSb7gVF6XyPDnpzoZaK/6KKky14HZwumL/HA2buXbt09Mf5INWchc0831jgP+aDwedGaMFT
	IcLTwW5fHWuQpJXa9zRvbUq/LrU60MlFBfSHi8Z2rCWBVOcz6X9HVkub0S6vARKhg3FbKNBnCW1hG
	Uj1yJTrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4F48-0000000BMmy-0Ff8;
	Wed, 09 Sep 2026 09:58:04 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4F44-0000000BMlp-0NMX;
	Wed, 09 Sep 2026 09:58:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788947877;
	bh=yViiyIOoTETpn5qLLltYZZ+RjGHj/8+ZFoZNJ7YZagg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hUjJd9lUgZoybA2t3pdx3sN2JlpK4D+sHHWgF5lPqA3qGYVV/Zy0vZGrfrXv6krzf
	 twkLwSMygFoUaAVxZnSYhHs5iOtQ62Mt8Dtc4bs8NBGu933AUbrpQf0lLsMOmwe5jX
	 MwzwDJS7frXeF/Iuwd+YMgImlK/IE4MK8QVcWpRUwnPeDZ02SNsm9x9xqQGYtwYBFt
	 xluYmpwBYM/9jWVUxXBvFSKUy94t1s3QpA/+4wy5Vd+ev6ZWGSVeDflPgyTwtWQ5I3
	 8zB91b3anH5aiPA5rzZlItcr4Y1xZOECxQcef7zgYdbo+46lPVCFdSW0PHNpo4eDTi
	 IhBnHZJiDYIUQ==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2B4DC17E0945;
	Wed, 09 Sep 2026 11:57:57 +0200 (CEST)
Message-ID: <39494ea2-7fb5-4414-8560-47ddd40260cf@collabora.com>
Date: Wed, 9 Sep 2026 11:57:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] soc: mediatek: cmdq-helper: add legacy GCE ISA
 support
To: rva333@protonmail.com, Jassi Brar <jassisinghbrar@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Houlong Wei <houlong.wei@mediatek.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20260907-6572-gce-v2-0-412a5b037290@protonmail.com>
 <20260907-6572-gce-v2-2-412a5b037290@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260907-6572-gce-v2-2-412a5b037290@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_025800_316982_50B19BA7 
X-CRM114-Status: GOOD (  23.98  )
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

On 9/7/26 20:03, Roman Vivchar via B4 Relay wrote:
> From: Roman Vivchar <rva333@protonmail.com>
> 
> Some SoCs, such as mt6572, have different WRITE and POLL instruction
> encoding. Instead of 16-bit offset and 8-bit subsystem ID, old GCEs have
> 22-bit offset and 2-bit subsystem ID.
> 
> Extend cmdq_instruction struct with additional union and struct to hold
> the legacy format of instruction encoding. Add legacy_isa to select
> legacy GCE ISA when writing instruction. Finally, add special handing
> for legacy_isa cases.
> 
> Also correct comment about PA writes, because it's incorrect for legacy
> ISA. Only v2 (mt8167, 8173) and v3 (mt8168, 6768, 6779, 6785, etc) have
> GPRs and SPRs for PA writes.
> 
> While mt6572 GCE supports 22-bit offsets, the parameter type for offset
> remains 16 bit, because all mt6572 GCE mmsys consumers are in the 0xffff
> range.
> 
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>

Verified in the lab on multiple MediaTek boards.

... but I either need an ack on patch 3/3 from mailbox maintainers, or they need
an ack from me on this patch to pick everything.

I'm fine with anyone picking this, so...

Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Cheers,
Angelo


> ---
> This change doesn't bring any functional change for mt6572. mt6572 uses
> subsystem ID 0 for display, alongside with 16-bit offsets, so layout is
> still compatible with v2/v3 GCEs. However, it's better to properly
> describe layout.
> ---
>   drivers/soc/mediatek/mtk-cmdq-helper.c   | 57 ++++++++++++++++++++++----------
>   include/linux/mailbox/mtk-cmdq-mailbox.h |  1 +
>   2 files changed, 40 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
> index f8ee6c9ade89..fb82f2a85a21 100644
> --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
> @@ -31,18 +31,27 @@ struct cmdq_instruction {
>   		};
>   	};
>   	union {
> -		u16 offset;
> -		u16 event;
> -		u16 reg_dst;
> -	};
> -	union {
> -		u8 subsys;
>   		struct {
> -			u8 sop:5;
> -			u8 arg_c_t:1;
> -			u8 src_t:1;
> -			u8 dst_t:1;
> -		};
> +			union {
> +				u16 offset;
> +				u16 event;
> +				u16 reg_dst;
> +			};
> +			union {
> +				u8 subsys;
> +				struct {
> +					u8 sop:5;
> +					u8 arg_c_t:1;
> +					u8 src_t:1;
> +					u8 dst_t:1;
> +				};
> +			};
> +		} __packed;
> +
> +		struct {
> +			u32 offset_legacy:22;
> +			u32 subsys_legacy:2;
> +		} __packed;
>   	};
>   	u8 op;
>   };
> @@ -86,7 +95,7 @@ int cmdq_dev_get_client_reg(struct device *dev,
>   		client_reg->subsys = CMDQ_SUBSYS_INVALID;
>   
>   		/*
> -		 * All GCEs support writing register PA with mask without subsys,
> +		 * GCE v2/v3 support writing register PA with mask without subsys,
>   		 * but this requires extra GCE instructions to convert the PA into
>   		 * a format that GCE can handle, which is less performance than
>   		 * directly using subsys. Therefore, when subsys is available,
> @@ -219,10 +228,16 @@ int cmdq_pkt_write(struct cmdq_pkt *pkt, u8 subsys, u16 offset, u32 value)
>   {
>   	struct cmdq_instruction inst = {
>   		.op = CMDQ_CODE_WRITE,
> -		.value = value,
> -		.offset = offset,
> -		.subsys = subsys
> +		.value = value
>   	};
> +
> +	if (pkt->priv.legacy_isa) {
> +		inst.offset_legacy = offset;
> +		inst.subsys_legacy = subsys;
> +	} else {
> +		inst.offset = offset;
> +		inst.subsys = subsys;
> +	}
>   	return cmdq_pkt_append_command(pkt, inst);
>   }
>   EXPORT_SYMBOL(cmdq_pkt_write);
> @@ -459,10 +474,16 @@ int cmdq_pkt_poll(struct cmdq_pkt *pkt, u8 subsys,
>   {
>   	struct cmdq_instruction inst = {
>   		.op = CMDQ_CODE_POLL,
> -		.value = value,
> -		.offset = offset,
> -		.subsys = subsys
> +		.value = value
>   	};
> +
> +	if (pkt->priv.legacy_isa) {
> +		inst.offset_legacy = offset;
> +		inst.subsys_legacy = subsys;
> +	} else {
> +		inst.offset = offset;
> +		inst.subsys = subsys;
> +	}
>   	return cmdq_pkt_append_command(pkt, inst);
>   }
>   EXPORT_SYMBOL(cmdq_pkt_poll);
> diff --git a/include/linux/mailbox/mtk-cmdq-mailbox.h b/include/linux/mailbox/mtk-cmdq-mailbox.h
> index 07c1bfbdb8c4..9fcebc4ca864 100644
> --- a/include/linux/mailbox/mtk-cmdq-mailbox.h
> +++ b/include/linux/mailbox/mtk-cmdq-mailbox.h
> @@ -72,6 +72,7 @@ struct cmdq_cb_data {
>   
>   struct cmdq_mbox_priv {
>   	u8 shift_pa;
> +	bool legacy_isa;
>   	dma_addr_t mminfra_offset;
>   };
>   
> 

