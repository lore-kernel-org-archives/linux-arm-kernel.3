Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C084C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 12:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fOkjz0VFKTW//o0rl/Ahee9CbHyMt3wp+wGrHgrtVsg=; b=fssQ+pvv11k+uVVCJEPDc5F+Wa
	QY7YFR3EfHnUxo4F7/8R+nDDMAyK5Q4RmExUwAYf22iduX6kMRn2RTwNyRSMZhQLUkOao+1wjSzNg
	kOxhvpREoL2yG0dgi0ZzV6vLFOCJXpQk66PtzcAdSsBRt9JguQJHhaYT17hgXdTY8MpRx0uxhuFuc
	8/8XkoGujzur6nNzNosTGu1pDFsOH5fNt9FvBtnlFeGyCIKQXn47r3DxRWwjOp3Iy0bHk6O/S35PO
	oUmoykT2qihdgceYWUnVtR41hY/BChtqdVswmoQhweN1vwgvqBdej2/ZfLwEvzdVasfDwHkjUGFPH
	5UBQw6BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnExY-0000000GMpS-3Zo3;
	Fri, 24 Jul 2026 12:25:00 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnExW-0000000GMoE-3lkp;
	Fri, 24 Jul 2026 12:25:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784895895;
	bh=bS1CDh+2Qn5hpHQnRIoCnLbebTACj8iP+9ZHQacVIxY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EEYeAO7g6EJLonaF6x+qTb/XkpP3ggmZpsC3zmaR9d2oGLsa238Sv1iF7CSF1WzLV
	 chjxd/j+bbM1awMByBaLk9/Xpk4sVljL4+s/iiXZxxGvV/s0dkA26BhM0j2lrxE5OJ
	 fGrXoF851gyF2Os0C6sUF7nqZyCwQfRaBR1jlp9JTeBXnbaGKDCzoBzvMYImAD23ks
	 BpghihiPfSQgKlXjTRg0XOdVD6zQ/WsS3Wm4A28h9Zz+h3rQbwv7Duh1Lg7+5iSEDu
	 v/g0VFPIDZSyEb2Lc56QcMtoK32Tt2J3yJHShc6qWrFjOweYZTGYOm6dGcbAy7Vp4O
	 GUXvxYXgwcziQ==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6855417E00E9;
	Fri, 24 Jul 2026 14:24:55 +0200 (CEST)
Message-ID: <8088ac34-4f1e-4c87-8718-77d4e6e6e9b6@collabora.com>
Date: Fri, 24 Jul 2026 14:24:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/5] pinctrl: mediatek: mt7986: register both platform
 drivers from a single initcall
To: Justin Yeh <justin.yeh@mediatek.com>, Sean Wang <sean.wang@kernel.org>,
 Linus Walleij <linusw@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>
References: <20260723035823.2041832-1-justin.yeh@mediatek.com>
 <20260723035823.2041832-5-justin.yeh@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260723035823.2041832-5-justin.yeh@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_052459_096308_AAA7DDB7 
X-CRM114-Status: GOOD (  11.46  )
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

On 7/23/26 05:58, Justin Yeh wrote:
> The MT7986 driver registers two separate platform drivers (mt7986a and
> mt7986b) and used to call arch_initcall() twice, once for each.
> 
> This is fine while the driver is built-in, but a single translation unit
> can only provide one module_init(). Since arch_initcall() expands to
> module_init() when built as a module, having two of them would break the
> module build with a redefinition of init_module()/__inittest().
> 
> Fold both platform drivers into a single driver array and register them
> from one initcall using platform_register_drivers(), matching the shape of
> the other MediaTek pinctrl SoC drivers. platform_register_drivers() also
> rolls back the first registration if the second one fails.
> 
> No functional change for built-in builds; this is a preparatory cleanup
> for enabling module builds.
> 
> Signed-off-by: Justin Yeh <justin.yeh@mediatek.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


