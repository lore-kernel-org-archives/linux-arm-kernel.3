Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F684C79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 07:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MrLpIp1acmyTAI4L2SHOu8K6ZKZANO6L3ezTi+riST4=; b=YuQa4SGmunTyaLiTIQuHmpy6s3
	atg5qtsB9XuCcYOSMZwPP0w2aXzMdjUzmCbfiCP9wYuwwXWc6kCxD7DIiaerdBXZ1Uo4lnDN5kaya
	/QyWJImOVtheUMRNC00QtsR0rRSxepeOHKkynWmTcWBLrecR/i+Ow8u709mp+VZFoc58SjekzZ6W6
	2ZI6Ym4DHJHWhkfTDgB2gPqLd7kOOGJ4hnTCKrYxkJP06fnHewlg832Py8QK6STZFb8ykQAv/S+Xg
	VU3P+vVg+uoIaY/dWOF+CA0riQNyMmKabKQgi+DxoWXAegmZV+FIp9THPtK6MBpSfvKLVN9Qp6c22
	4GuU5Xuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ppV-00000008E1r-3Fvq;
	Tue, 08 Sep 2026 07:01:17 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ppS-00000008E1K-0SUj;
	Tue, 08 Sep 2026 07:01:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788850871;
	bh=HWjbQo5zlhO13u55bbJAZDvviqnOCqacnSO0CJjRVfk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=O8c9EkGgt2iwa6KoH+ylDYXlyStOBc6o5crFO8lp7bwdTe9h/O4zrO9GmvyogrLgi
	 UVbG+XwQrXs7Mzrxq+QzP2s0IFVqObF1EKB4nWlN05yjfE2sEB0KhmqmnitSDSaQ6D
	 2rD2G5mpmY1pmo+a9mr9HxNTvSI9zvpbjsiFJsHJxM4H689oeQ/+GMjRLBduOILXUd
	 RJ6wZdiZEGEwKzZFmKg4uA/2dEwJhCtvIoaV+bodSCkxdymTWYfyBSDw5GA3wluzpL
	 KT4teytQYunCA+t4Ze/c5kuoRhwftyPhDYWTpjH5XFxnWrgKPagO1DMnBjyBR9fosU
	 PYDsoc3SqXvqw==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 71F6917E03B6;
	Tue, 08 Sep 2026 09:01:11 +0200 (CEST)
Message-ID: <04cf83db-7914-47fa-8d37-baf5e925d86d@collabora.com>
Date: Tue, 8 Sep 2026 09:01:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] MediaTek mt6572 GCE support
To: rva333@protonmail.com, Jassi Brar <jassisinghbrar@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Houlong Wei <houlong.wei@mediatek.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20260907-6572-gce-v2-0-412a5b037290@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260907-6572-gce-v2-0-412a5b037290@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_000114_317662_9F5F6709 
X-CRM114-Status: GOOD (  22.32  )
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
> This patch series adds support for the Global Command Engine found in
> the mt6572 SoC.
> 
> Notably, the patch 2 introduces legacy ISA format, which is used on
> mt6572, 6582 and 6592 SoCs. mt6577 doesn't have the GCE at all and
> mt6595 is much more close to 6795/8173.
> Patch 3 adds mt6572 platform data and legacy_isa forwarding to the
> instruction JIT.
> 
> This format was reverse engineered from the Android HAL and uses 22-bit
> offset with 2-bit subsystem ID, unlike the newer 16-bit offset and 8-bit
> subsystem ID.
> The mt6572 HAL includes workarounds for WFE and EOC instructions, emitting
> another WFE as barrier at WFE, and JUMP +8 at EOC.
> mt6582 and 6592 HAL dropped WFE barrier, but still have JUMP +8.
> 
> This sounds very much like some kind of software mitigations for hardware
> bugs, but during testing on 6572 nothing bad happened so far. These
> additional instructions are not included in the patches.
> 
> Note that while GCE can be used for e.g. mt6592 UFOE (which is at
> 0x14013000, so outside of the u16 range), currently the driver still uses
> u16 for the offset, because I don't have any 6592 device.
> 
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>

Series is

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
> Changes in v2:
> - Move dt-bindings to mailbox directory from gce (Krzysztof)
> - Clarify that only v2 and v3 GCEs support PA writes
> - Link to v1: https://patch.msgid.link/20260728-6572-gce-v1-0-750bba32689e@protonmail.com
> 
> ---
> Roman Vivchar (3):
>        dt-bindings: mailbox: mediatek,gce-mailbox: add mt6572
>        soc: mediatek: cmdq-helper: add legacy GCE ISA support
>        mailbox: mtk-cmdq: add mt6572 support
> 
>   .../bindings/mailbox/mediatek,gce-mailbox.yaml     |  1 +
>   drivers/mailbox/mtk-cmdq-mailbox.c                 | 11 +++++
>   drivers/soc/mediatek/mtk-cmdq-helper.c             | 57 +++++++++++++++-------
>   include/dt-bindings/mailbox/mediatek,mt6572-gce.h  | 52 ++++++++++++++++++++
>   include/linux/mailbox/mtk-cmdq-mailbox.h           |  1 +
>   5 files changed, 104 insertions(+), 18 deletions(-)
> ---
> base-commit: 8cd9520d35a6c38db6567e97dd93b1f11f185dc6
> change-id: 20260727-6572-gce-6a571ef4af09
> 
> Best regards,
> --
> Roman Vivchar <rva333@protonmail.com>


