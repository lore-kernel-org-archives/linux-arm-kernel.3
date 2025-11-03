Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0CFBCCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 09:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DR9FjUoJ17jKio0QmfF9eqS/alus4oywkIH5PZnPSyo=; b=qzdBKdEFuQoLxMV71y3U3vdaRY
	WxQ/1GBBqgASTUpK2KNzUqA5FaWZOBsVnOyBH7fJzn2+6fAL6Il/eeOWhX4z31oQ+whWOIMJ3qnTq
	2QV21zKqUlVP/du6iZiwiQD/AiSTUfUpKI0FtP85xHMAkYeXhpNzBZNmI848FdHCVCOPiDti8Q1qo
	a9xiSyDa33n/w27VuQdrGnV9SLoPUbufp1Ko9vhDRtYUcOwEi3p5czybFwnkRymPGRBuezHsTxtIO
	1wFVcp3JEUWlumz7abEnmzlPQxcCE2CT0fFv9yqqlCCAD1cjPFcWgMmAu6qSViXPbY8jN4ArC8Dwd
	7PP82a1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFqSD-00000009Txo-3I0E;
	Mon, 03 Nov 2025 09:02:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFqSC-00000009Txd-1k76;
	Mon, 03 Nov 2025 09:02:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7C62060008;
	Mon,  3 Nov 2025 09:02:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 973A9C4CEE7;
	Mon,  3 Nov 2025 09:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762160539;
	bh=W8dEDPU+y16+j7p2S006IJb//u+cz581x8CUkn3B/4Q=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=fIP5eMU3/TlkV4WaIeORzkfCc09vjr7X9960r3wf5HUHS5Lmw0OveLNoK2SM4/31k
	 sBS8fpvPaUxFHp1W4fUXl0WE+xCKjxpU9OKvGyCXXv4Ey8mJkExNzUC/7gb1UOIboL
	 +dpZW0yBeSO+e+FvPyLnUAiGTlyWC0Kn9Pnxt3pTLm2mNsvoO756KmbZyU1ObsWSPF
	 HzxWv0kNdtB8Y/+Xo4fS/I0I+76V7KY81jwnGORY5/cgpiWCS87Jl8L5JmHYA7GJyf
	 vnAxwe/DMdUZx07cQS7o5Y+3kp/pM2qkQ9D15iKbqOjANIHOF9DLzZkqxivtz0vYuC
	 xn7qdljWFJFGg==
Message-ID: <13df4a17-93aa-41f4-bbff-d1e83993a618@kernel.org>
Date: Mon, 3 Nov 2025 10:02:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH] MAINTAINERS: adjust file entry in MEDIATEK MDP DRIVER
To: Lukas Bulwahn <lbulwahn@redhat.com>,
 Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Houlong Wei <houlong.wei@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@redhat.com>
References: <20251029110623.96661-1-lukas.bulwahn@redhat.com>
Content-Language: en-US, nl
In-Reply-To: <20251029110623.96661-1-lukas.bulwahn@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 29/10/2025 12:06, Lukas Bulwahn wrote:
> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> 
> Commit 169ac4bc5bc4 ("dt-bindings: media: Convert MediaTek mt8173-mdp
> bindings to DT schema") renames mediatek-mdp.txt to
> mediatek,mt8173-mdp.yaml as part of this dt-binding conversion, but misses
> to adjust the file entry in MEDIATEK MDP DRIVER.
> 
> Adjust the file entry after the conversion.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Reviewed-by: Hans Verkuil <hverkuil+cisco@kernel.org>

Rob, since you picked up the patch referred to in the commit log, can you
also take this patch? Since it relies on the yaml conversion patch?

Regards,

	Hans

> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e428ec79dd24..c094b2fef0fc 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15881,7 +15881,7 @@ M:	Minghsiu Tsai <minghsiu.tsai@mediatek.com>
>  M:	Houlong Wei <houlong.wei@mediatek.com>
>  M:	Andrew-CT Chen <andrew-ct.chen@mediatek.com>
>  S:	Supported
> -F:	Documentation/devicetree/bindings/media/mediatek-mdp.txt
> +F:	Documentation/devicetree/bindings/media/mediatek,mt8173-mdp.yaml
>  F:	drivers/media/platform/mediatek/mdp/
>  F:	drivers/media/platform/mediatek/vpu/
>  


