Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C74B9C54F4C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 15:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zJDHrOTu5wskyv8HvN/sjdV2FXLFkA7DU9ndSmw5AW4=; b=RJRrcvGYFBRB3vSZh2rXkrKduN
	j6HEOvXu0qOrm0QtBOTEisI6galfnIR0YGtcGDTx4nqIWjQjJXqW+EijVp1LABBnB4rspTvCt+IlP
	SXJq1lOFQv7KIEE4gb41BynDImXis32tt26rgQOdhIdU93CckPQvdDU53O7GRfQqDXk8DGJj2LHtU
	uCCp/ktSnYstd8fpzu5eF64O8kjUadZmSB6FUM8lOOb3zP3KJnZCrPxSA3N7qR+jiMQbiH5YCWvHE
	QfQ8KjGx2F9ydoYriem7kQpSBlXMRvSeOT3iD1U+Wu6VUp5w4MzAyNgr9Qs+XZ8CPcwcBOfKenRzc
	QmoGTxBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wojQJ-00000005azK-01CV;
	Tue, 28 Jul 2026 15:08:51 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wojQG-00000005ayR-2L5n;
	Tue, 28 Jul 2026 15:08:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785251325;
	bh=pv+sMQ7GV/BnoPnLcF7CThx/aHByigCq7f8z/q+RkXU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jMc24RtiUREB/82DNYfJcM5dY+xEDaQlG7GAJPfC1oS47ek37AIlHr74JVk181Z5S
	 7ql5VYRMJiPMPTRKq4FOf/VGXP1V7Lbyyce+KAA3BZ3tO6S4ONPw1kF3tc9BxgtFMl
	 ammRPNjem9KtzJPnqKE6Mfj+anwj4msj1OXTm/FQA8mDvnPHvcudYGJTZY7SAw6Zum
	 fequVaM+7ZEUJkxjPpBN5keA2qu7GWHOKvKOXKpIy+zKCy9ujmFLqJiGpp5mWzpJvF
	 0gTBbMJm8dCUOd13FCoj/v5jWUTKRVrfczH0nDOkG8smA99+pw+ZE8Z+pyjpkP7icd
	 jMeGT5eA4B1AA==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3C34617E028D;
	Tue, 28 Jul 2026 17:08:45 +0200 (CEST)
Message-ID: <ebf419fc-24a8-472f-8996-a134ece69f21@collabora.com>
Date: Tue, 28 Jul 2026 17:08:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] soc: mediatek: cmdq-helper: add legacy GCE ISA
 support
To: rva333@protonmail.com, Jassi Brar <jassisinghbrar@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Houlong Wei <houlong.wei@mediatek.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20260728-6572-gce-v1-0-750bba32689e@protonmail.com>
 <20260728-6572-gce-v1-2-750bba32689e@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260728-6572-gce-v1-2-750bba32689e@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_080848_761887_F73C5DFA 
X-CRM114-Status: GOOD (  19.78  )
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

On 7/28/26 11:42, Roman Vivchar via B4 Relay wrote:
> From: Roman Vivchar <rva333@protonmail.com>
> 
> Some SoCs, such as mt6572, have different WRITE and POLL instruction
> encoding. Instead of 16-bit offset and 8-bit subsystem ID, old GCEs have
> 22-bit offset and 2-bit subsystem ID.

What about poll_addr, mask, write_s, write_s_mask and others?

Not sure that this will actually work reliably (though I'm sure you're not
creating any regression).

> 
> Extend cmdq_instruction struct with additional union and struct to hold
> the legacy format of instruction encoding. Add legacy_isa to select
> legacy GCE ISA when writing instruction. Finally, add special handing
> for legacy_isa cases.
> 
> While mt6572 GCE supports 22-bit offsets, the parameter type for offset
> remains 16 bit, because all mt6572 GCE mmsys consumers are in the 0xffff
> range.
> 
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>
> ---
>   drivers/soc/mediatek/mtk-cmdq-helper.c   | 55 ++++++++++++++++++++++----------
>   include/linux/mailbox/mtk-cmdq-mailbox.h |  1 +
>   2 files changed, 39 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
> index f8ee6c9ade89..094732405080 100644
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

