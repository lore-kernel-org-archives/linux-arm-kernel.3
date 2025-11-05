Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7074ACCFA0D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 13:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w1qv8HlVsu3CnEcBUPhNsDCp/x71dPiqlB14h03+nMo=; b=WlPwAY1/p43DF+y+4M5vj3lxux
	zfr+SyZDSVkQdkS8MAju3IPVO1OL/47Qvup3CXdB94seWUujQhs1xBFnTXk4tzHSafuoxywlUWUGE
	CJ0WWFYt22nT1wSjuOqNZ4xhg/Owcw99qbef+9Hovn6bKEkyDHMGexZBFn5C9JfD5Vh9lXODSt7rh
	jvUIm5CJfgfFEXXG73Zun94i4sJVg9/l1cr7x6i6PyHR2eyB0ccjyfKG7SA0I+CHHtgyTHa3eTQfP
	OwN2MkOPUKO1BJJ0dIbbtM9E+Jw6IL3I/vkoktOYqbbNo9/26mzemLNwjzwjI1Ys3Nnl8IyPj7QGU
	kZ/QpDaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGdCB-0000000DjF7-2IDd;
	Wed, 05 Nov 2025 13:05:03 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGdC8-0000000DjES-2iyA;
	Wed, 05 Nov 2025 13:05:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1762347897;
	bh=/lcv0CRLqvhN1u0t7OFVDn+bvcyVjciZS0ifR6L0Ymo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CzFOvzAmTBrDXgxrOwrrqIx7gs/r5A98UFhUYqc3e1yH1jxo+Y/O9bdF6Pqij5DdB
	 sVH3pO1h7Bp0sl9UjCg+IyxSZdL5RarAZ+Gdh6F/GAqkSo6tHx4pykUci3gtZQFct0
	 0h3sBhu7RIncDqqNnF+MkL7xhBSjk0WdordJsMCcCbkTD8prf2H5ww+7ERPsttCEbD
	 9Ias+BPY+6HeyUUq4YaVyzhT3NFP4vxcstuuAYWIYMgh7Sl2/CrWx5UsiXZHCFymRB
	 sGv4Vnl35s3mrNcDW71Hy2UaoS6Csp1xRZvNfC6h79qkfxMP3bIJMi3UCjH1xcLhro
	 +WnIVH7unOwug==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 055C217E0062;
	Wed,  5 Nov 2025 14:04:56 +0100 (CET)
Message-ID: <46e8ec8e-977d-4e7c-9f65-0c5d9c517825@collabora.com>
Date: Wed, 5 Nov 2025 14:04:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] SPMI: MediaTek: Add support for multi-bus
To: sboyd@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, hsin-hsiung.wang@mediatek.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20251024083247.25814-1-angelogioacchino.delregno@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251024083247.25814-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_050500_883331_3CAE1F6F 
X-CRM114-Status: GOOD (  12.99  )
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

Il 24/10/25 10:32, AngeloGioacchino Del Regno ha scritto:
> Changes in v4:

Gentle ping for this series.

Cheers,
Angelo

>   - Refactored IRQ domain handling due to deprecation of function
>     irq_domain_add_tree() to use the new irq_domain_create_tree()
>   - Added .irq_eoi() callback for rcs_irq as that better reflects
>     the actual functionality of this interrupt controller (as its
>     SLV_x_y_EINT registers are really signaling "EOI", not "ACK")
>   - Fixed to use generic_handle_domain_irq_safe() to avoid races
>   - Tested again on MT8196 Chromebook
> 
> Changes in v3:
>   - Added Fixes tag to commit 3, collected R-b tag from wenst
> 
> Changes in v2:
>   - Fixed indentation error in dt-bindings
> 
> This series adds basic support for multi-bus (multi-master) SPMI
> controllers, as found in the MediaTek MT8196 Chromebook SoC and
> the MediaTek MT6991 Dimensity 9400 Smartphone SoC, including RCS
> interrupt handling and per-bus registration.
> 
> AngeloGioacchino Del Regno (5):
>    dt-bindings: spmi: Add MediaTek MT8196 SPMI 2 Arbiter/Controllers
>    spmi: mtk-pmif: Add multi-bus support for SPMI 2.0
>    spmi: mtk-pmif: Keep spinlock until read is fully done
>    spmi: mtk-pmif: Implement Request Capable Slave (RCS) interrupt
>    spmi: mtk-pmif: Add support for MT8196 SPMI Controller
> 
>   .../bindings/spmi/mediatek,mt8196-spmi.yaml   | 138 +++++
>   drivers/spmi/spmi-mtk-pmif.c                  | 472 +++++++++++++++---
>   2 files changed, 530 insertions(+), 80 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/spmi/mediatek,mt8196-spmi.yaml
> 



