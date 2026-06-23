Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22763CDB470
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 08:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NkUCuOZEAxriNK+bsTZOkniDVJJwCJGQarQcQoUFjYs=; b=tIebTMdCh8WBCsYpbS8+XaWvNg
	KIljrrLCQdkN0AqswebB/WBhRXcWhEU1b45ulLdv9sFUEUNGF3k6FVyfqygBBE0xGg/Yd1qoE9WfS
	E1Xx0YCNB90S7y7sFAEQ5CaboyGNP4i7XVqZ3O44sFJNqhzfBryAMpJh1sGGLLglCAOQMweMVO82C
	VwiH1O8/LUS6U/ACewc+udFvQxDGnM6TfzaxaflGw2WohpJBObgyQujrWdIzlK/P+3++IICCjBWFR
	/P/P3JkJnsJLsEaDWltVqNhi/ihHAZevSasFVPIe9K2C5iS45AY2arO8VX8+JAAaBqXMB2yn8tyYe
	kgaMJyfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbw9o-00000005sgl-44ud;
	Tue, 23 Jun 2026 08:06:56 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbw9a-00000005sZG-3Ck3;
	Tue, 23 Jun 2026 08:06:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782202000;
	bh=q2relrEzTIVCRZtAr/bd91kPwtipMyKMmyPaD3/aess=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dEzAGm846cDEOxZceS9ZX5Z+brcAg8I4pPI7P/ZT8nF6Te6xx1AXVFa2hR4ZqrEEH
	 5iKbTeifvIgC4YgmO7AIgK193fPilrE9LcpinTVJDcMn+ohNVHExfNZ2ik+RTlqw6d
	 8f0oMwVKCF7GKFnF+nNRw6lKhHVrop4Tiuru+OSqofejwRpuDmZDH7HqoV10qG8sBV
	 7GPQzl+tppV/e9zepAF7DldXHr9zzHRSRvleN7ouyLelTnOsDgVY0yPJZTxqJTM+4D
	 ujtCnirqiR3Pwu4BGGB6DHLme9QxlbSR9iGpQEWbdXDu6WrmEgQxtxNUeEA6MLm89s
	 IUDV2bh2buMYA==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9608017E1025;
	Tue, 23 Jun 2026 10:06:39 +0200 (CEST)
Message-ID: <36d9b5b3-4db3-4684-960b-651fb453ce1f@collabora.com>
Date: Tue, 23 Jun 2026 10:06:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] pinctrl: mediatek: mt8189: Add MODULE_LICENSE
 declaration
To: Justin Yeh <justin.yeh@mediatek.com>, Sean Wang <sean.wang@kernel.org>,
 Linus Walleij <linusw@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260529100308.51271-1-justin.yeh@mediatek.com>
 <20260529100308.51271-3-justin.yeh@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260529100308.51271-3-justin.yeh@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_010642_971795_C2F21FF6 
X-CRM114-Status: UNSURE (   6.84  )
X-CRM114-Notice: Please train this message.
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

On 5/29/26 12:02, Justin Yeh wrote:
> Add missing MODULE_LICENSE("GPL v2") macro to fix modpost error during
> kernel module build. The license identifier matches the SPDX header
> (GPL-2.0) at the top of the file.
> 
> This fixes the following build error:
>    ERROR: modpost: missing MODULE_LICENSE() in pinctrl-mt8189.o
> 
> Signed-off-by: Justin Yeh <justin.yeh@mediatek.com>

Please, do this for all MediaTek pinctrl drivers.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


