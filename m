Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D8E1C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 12:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ayoSzH5fd0Q0ofHM9FCbQbrCBnyBn12MJyDO97wV3bQ=; b=gLVCkoe4Uub7PS+wxazPTfA0pm
	oK3mTxBSu0hVyI1Jf9/wLssWXqQZCKA8xe+Etl50yM2SgUZlzpJHX7kPMcqv9DuY4t5YSgBYnjrLV
	IIA5Wqj9BWBI/qvyDOaYHKx+9/MtDbhzoUwMjEI12sCokBTQcHEoJZsL5Tpr/UIb+CXG+yNuDKy/u
	9IK40YWQWDwyR7GlbhvI3Lbz984V9CvGnznpPMPt7XLxSgDUMOd3rz41Mi8FF87uaawQa7rcI08xp
	d092DxTJBDWIxWM6blYIo4M2wKE+CdfgFhstrTE2VSk4Rx4GvxkfuYYFxH9Tt5DYs8GwD9ARaBvXx
	tLGNyglA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnExG-0000000GMjY-25CL;
	Fri, 24 Jul 2026 12:24:42 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnExD-0000000GMie-0Mv4;
	Fri, 24 Jul 2026 12:24:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784895875;
	bh=dEDWWpyR8FmNBGJdtP04CKQ0RFI848qzfOTxhCXPXPo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AzYEbfQx6krtRQHaNAIOwFk8nhKzsYLxt3JEXX/vkaLkm2QFcLK/o8X3b5CU0TWrQ
	 Uotuap2mpYT5nj0Fgm0nBk19VwUQR8/TLCjh3x5FsROOnOZyQY9LYki18XcVlFEGeW
	 CzCiLxrMU/l8N0OkKKiIwT57qvSfYNfFEgI9/qcnBqiczfP63hcPDmzXyBb19s7HRA
	 eEfhw21kQsrabt/b9VRgiHFOGsi6xFk9AtQQP+EK4BBoWxNoZJIQuZaRoDXftY9uKa
	 tfG7GGbmeZoVovVTjtdVAMsMhKIK0b8/zcJ5j7g1n88am5+OuFv9F+L2vGVyrHh4oo
	 ySdV2xiNvbtIA==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AA37C17E00E9;
	Fri, 24 Jul 2026 14:24:34 +0200 (CEST)
Message-ID: <cc5348d5-3bda-42be-915a-476635708165@collabora.com>
Date: Fri, 24 Jul 2026 14:24:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/5] pinctrl: mediatek: allow common drivers to be
 built as modules
To: Justin Yeh <justin.yeh@mediatek.com>, Sean Wang <sean.wang@kernel.org>,
 Linus Walleij <linusw@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260723035823.2041832-1-justin.yeh@mediatek.com>
 <20260723035823.2041832-4-justin.yeh@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260723035823.2041832-4-justin.yeh@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_052439_290695_286F12A4 
X-CRM114-Status: GOOD (  13.49  )
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

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


