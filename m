Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20F50C4452D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 08:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OsRNcvyKSFyRA3+QpXbVIZ0cNK00OoBCmXk34zkvGOE=; b=VRkFhzhhlj+MhYrJXJ5/uqX+HC
	d+x6p3RvCeC5ebrc+NU9oKR/pEaulFZZhYY9gCGfCEgbQTbik65MqL6kDA07qbnmsyfdXZjNvPDH8
	R5po8l7KIyT9fYNliIhfUiNLZYqjj8U1bH5ASC0lM8X7gLtmzGUzp/rOXXNYTagbUds6lp/gnL0Q4
	asmyTWXwA3DvPbzMvvYvGhFVm+aKDIO/0X/9ktIFwEd1M/lvy28rHyUHybXMYiK5tRbjs6ETgipYi
	iqCyIKRu+lkt/pN0GrtOq7W83aKEgAzMyhfVtIv6Xu+WfBVwftSjRIXY7PwYFFOmeUMaAHXBxuWfX
	3d0t6vNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmSQp-0000000BH0d-43vO;
	Wed, 22 Jul 2026 08:35:59 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmSQn-0000000BH0B-1Jdb;
	Wed, 22 Jul 2026 08:35:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784709355;
	bh=WD6MXlBWYlF2tyZhCnQGVXS5jehdKt/r6vLrLtoVMrU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EtOzt6lnh2uAXYLGiDylE9t8kz52gJ/syahT09WiSvMnliHyFv8xYcuembWrrlKiY
	 mnJWwxyzjfgmppCcGdT1JJ1hAt1iWH/zW71UoYhqdbmFhvPwM4OIIQHlmF8X0OXX/U
	 2I3EAXJrwuW4vdndh5q5974a6qm7U1rMzq7d2Iv0dK3HSGOMcZv/h5iX7KKTbLtmx9
	 v+djWb5Wh6g+kQydacjSE7QMZMuzsNAGId+Q9lUc6KoQJ1/d8FR3QnGFiv795oRpiV
	 n9N0AC2r12gAEkEmlls8TWoRMSKYRpHQN+N5i96x93O/jCJgliyu/270SELHeqWMPj
	 bOv2C34Bd/Q8Q==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A1A8017E0FA2;
	Wed, 22 Jul 2026 10:35:54 +0200 (CEST)
Message-ID: <10f4ec41-5f90-4b19-a59a-26a76f533a77@collabora.com>
Date: Wed, 22 Jul 2026 10:35:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/5] pinctrl: mediatek: allow common drivers to be
 built as modules
To: Justin Yeh <justin.yeh@mediatek.com>, Sean Wang <sean.wang@kernel.org>,
 Linus Walleij <linusw@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260713083808.168957-1-justin.yeh@mediatek.com>
 <20260713083808.168957-4-justin.yeh@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260713083808.168957-4-justin.yeh@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_013557_501594_ED8BA4BA 
X-CRM114-Status: GOOD (  14.86  )
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

On 7/13/26 10:37, Justin Yeh wrote:
> The MediaTek SoC pinctrl drivers link against the shared implementations
> in pinctrl-mtk-common.c (v1), pinctrl-moore.c and pinctrl-mtmips.c. These
> were built-in only: their Kconfig symbols were bool, they did not export
> their entry points and they carried no MODULE_LICENSE().
> 
> To let the individual SoC drivers be built as loadable modules (required
> for Android GKI + vendor_dlkm, where vendor drivers must live outside the
> GKI vmlinux), the shared code they depend on has to be modular too.
> Otherwise selecting a SoC driver as =m forces the common symbol to =y and
> the resulting module fails to link against the unexported common entry
> points.
> 
> Convert PINCTRL_MTK, PINCTRL_MTK_MOORE and PINCTRL_MTK_MTMIPS to
> tristate, export the entry points used by the SoC drivers, and add
> MODULE_DESCRIPTION()/MODULE_LICENSE() to the three common files.
> 
> The v2 common code (PINCTRL_MTK_V2) is already modular, but mtk_rmw() was
> never exported. It is called directly by SoC drivers such as mt7623, so
> export it as well to keep those drivers linking once they are modular.
> 
> Rather than exporting these shared symbols into the global namespace,
> export them in the "MTK_PINCTRL" symbol namespace with
> EXPORT_SYMBOL_NS_GPL() so they are only visible to drivers that opt in.
> Each SoC driver that uses them therefore declares
> MODULE_IMPORT_NS("MTK_PINCTRL").
> 
> Signed-off-by: Justin Yeh <justin.yeh@mediatek.com>

Some of the pinctrl drivers are missing
       MODULE_DEVICE_TABLE(of, [match_array])

...therefore module build will fail.

Have you tested compiling the kernel with *all of the MediaTek pinctrl drivers*
set as module??? :-)

Cheers,
Angelo

> ---

