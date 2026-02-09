Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66545E94615
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 21:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oDoWGOvnSSAXOftdZaUiXU7zO2JN++fSCDG5BqTE7LQ=; b=Fl4Qb7Wyu1zA/xNp9FFejgctrX
	bbkIbP7guRcWm+/zXKAbjlqy6SBC2XTKcNtyHdNbpThjYt2Fh2U4cC0kr995exc0v9LaH4xe0ww3r
	SFnC0G/BFCAiJdzlWNthB2QatLtBusVLGWPTQqeJUprkqLaLVSSbMjs1JNlx1gR215f4WH2MS320c
	YrO+JjUmcTkICxlgKyfw2v0iEWPD2qcVGXfHLHHZ9Cr3S3uZTgy9zvYrB/YaKKqH0RJtkzcvH+sv8
	dv6CQZ6MOxBTI9zlX2gxX1jYpPQbSVA50VtwbdlND6OWdkZUtEU2HAoRretmfw2X06k3KMdInAte3
	QWo2zrKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpZ8T-0000000G457-3As4;
	Mon, 09 Feb 2026 21:49:37 +0000
Received: from galaxy.gendns.com ([66.235.175.158])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpZ8R-0000000G41p-3SKd;
	Mon, 09 Feb 2026 21:49:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lechnology.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=oDoWGOvnSSAXOftdZaUiXU7zO2JN++fSCDG5BqTE7LQ=; b=sNxY3zZt0CSHmXGl+BwW8I9o/L
	fDkqryCPQ7Tu5xiyV8p7zo45MjItLfp/TiYZQ6zZuGMnQipbSbSe6FKOb3KAJGfi+u9WEtzv7fYmJ
	NmvttdM3m8nD7HpgFXJ6sNzGgL+e+gnmUQPHLxkB8kseZB47G+wPQRdMR22FVOh5a1DUhN+fmhnBS
	z7lU/h35W3Nl4P7sBUgaUcPL2DcWw2916zPttjYbDZwhzk7iuneETixon/AtzYsjPlICRv0RjoqDy
	N4H1yPTtjVzXAEtcCqt07VRMOttqSSYxQbRVWARzPIY5wTGB9V5cpor3Xh+IXUnjMbu1eVvqKgAof
	QjviySPg==;
Received: from ip98-183-112-25.ok.ok.cox.net ([98.183.112.25]:41990 helo=[192.168.1.142])
	by galaxy.gendns.com with essmtpa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.99.1)
	(envelope-from <david@lechnology.com>)
	id 1vpZ7j-00000002kl3-0bkj;
	Mon, 09 Feb 2026 16:48:49 -0500
Message-ID: <1b092f9c-d0b1-47df-a83e-a99d7491a32b@lechnology.com>
Date: Mon, 9 Feb 2026 15:48:45 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt8189: Add pinmux macro header
 file
To: Cathy Xu <ot_cathy.xu@mediatek.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Yong Mao <yong.mao@mediatek.com>, Wenbin Mei <Wenbin.Mei@mediatek.com>,
 Axe Yang <Axe.Yang@mediatek.com>, Lei Xue <Lei.Xue@mediatek.com>
References: <20250919020525.7904-1-ot_cathy.xu@mediatek.com>
Content-Language: en-US
From: David Lechner <david@lechnology.com>
Autocrypt: addr=david@lechnology.com; keydata=
 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
In-Reply-To: <20250919020525.7904-1-ot_cathy.xu@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - galaxy.gendns.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lechnology.com
X-Get-Message-Sender-Via: galaxy.gendns.com: authenticated_id: davidmain+lechnology.com/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: galaxy.gendns.com: davidmain@lechnology.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_134935_913225_95FBC40E 
X-CRM114-Status: GOOD (  11.29  )
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

On 9/18/25 9:03 PM, Cathy Xu wrote:
> Add the pinctrl header file on MediaTek mt8189.
> 
> Signed-off-by: Cathy Xu <ot_cathy.xu@mediatek.com>
> ---
> This patch is base on the patch series:
> https://patchwork.kernel.org/project/linux-mediatek/list/?series=981475
> [1] dt-bindings: pinctrl: mediatek: Add support for mt8189
> [2] arm64: dts: mediatek: mt8189: Add pinmux macro header file
> [3] pinctrl: mediatek: Add pinctrl driver on mt8189
> Since patch [1] and [3] of the series have already been merged, this
> patch(patch [2]) is being resent individually after modifications.
> ---
>  arch/arm64/boot/dts/mediatek/mt8189-pinfunc.h | 1125 +++++++++++++++++
>  1 file changed, 1125 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8189-pinfunc.h
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8189-pinfunc.h b/arch/arm64/boot/dts/mediatek/mt8189-pinfunc.h
> new file mode 100644
> index 000000000000..df69f50c267a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt8189-pinfunc.h

General question:

Why do we have similar files in two different places different places?

$ ls arch/arm64/boot/dts/mediatek/*-pin*
arch/arm64/boot/dts/mediatek/mt2712-pinfunc.h
arch/arm64/boot/dts/mediatek/mt6878-pinfunc.h
arch/arm64/boot/dts/mediatek/mt6893-pinfunc.h
arch/arm64/boot/dts/mediatek/mt8167-pinfunc.h
arch/arm64/boot/dts/mediatek/mt8173-pinfunc.h
arch/arm64/boot/dts/mediatek/mt8196-pinfunc.h
arch/arm64/boot/dts/mediatek/mt8516-pinfunc.h

$ ls include/dt-bindings/pinctrl/mt*
include/dt-bindings/pinctrl/mt65xx.h
include/dt-bindings/pinctrl/mt6779-pinfunc.h
include/dt-bindings/pinctrl/mt6795-pinfunc.h
include/dt-bindings/pinctrl/mt6797-pinfunc.h
include/dt-bindings/pinctrl/mt7623-pinfunc.h
include/dt-bindings/pinctrl/mt8135-pinfunc.h
include/dt-bindings/pinctrl/mt8183-pinfunc.h
include/dt-bindings/pinctrl/mt8186-pinfunc.h
include/dt-bindings/pinctrl/mt8192-pinfunc.h
include/dt-bindings/pinctrl/mt8195-pinfunc.h
include/dt-bindings/pinctrl/mt8365-pinfunc.h


Plus one different naming pattern.

$ ls include/dt-bindings/pinctrl/mediatek,*
include/dt-bindings/pinctrl/mediatek,mt8188-pinfunc.h



Which one is preferred?



