Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBD1AC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 18:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jt87a8LfxJPviekB7k5u6RJsXtO1RirRfUFOkTaWN5I=; b=e5a4P/l+O9kf63PKI1/NYPGbUb
	X2xyAiCt0JTwXq/olYFhWrfP9bV3U+sU3TkJSdRfRUGy5U8dRMfbSBjR1nCfswSWoWjXrIALP+8qK
	5dY8akTywYJqKPBBf9IEedrwuSxLYhmtFNWznYsbjtCySst0AuYX38HRYjNXrXjekGqvsssTsbYr7
	FuPnyrGeR0eM6zjWSGqmyO7fjUR25tsCJpny+/ds+adY+XVgeMPJSJlrSvFlRrw/d295kXwqvX2Cr
	Cwmir99Afx/WpWWX/73EqZAoAYONieNnJMoMboFE07DmDdbuhKiTZYx57GZbcLKaxjUbKukPoJnsh
	8t/F98Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7eR4-0000000BTKn-0h3o;
	Wed, 23 Apr 2025 18:03:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7cO3-0000000B1gE-04Ex;
	Wed, 23 Apr 2025 15:51:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 520F1615ED;
	Wed, 23 Apr 2025 15:51:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBFD3C4CEE2;
	Wed, 23 Apr 2025 15:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745423506;
	bh=Q6PcQ8O3FSmUk2TwPF7gCzpyOKQyy07Lo0eWC7IuJ7U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KmgPy7oNLM0uB7pP3DNkeEMd8gByPbo3asds+AarzLLyrC3Gzj86gGQNq1pVjbJ5N
	 g7JU98A9UbuJuyqi5Y6icJSXeVltbtdDoNSSSD3NIs/gc8XhO6WMPuR2VlZauZq4du
	 eB/3iqRuz7qJJLIP0ICaiq6y7u4sXqy807rLeUWT2bxgBphAHgJ3xMF8jzwjdMlgz8
	 7tPFVgLqnQAVM5l90H6TJirFaT+OExzULT45LJJP4s1qRoriaeZyiUEgK8BQ0QkFH6
	 Vv0q3Te2Xe4j3ElXN0hJgRQ4eRVm7sNcyMLIRoGCL5dFl22cXQDstZE8m8KRY9WhhL
	 xIg4IxhWm7z2w==
Date: Wed, 23 Apr 2025 10:51:44 -0500
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	Olivia Wen <olivia.wen@mediatek.com>, kernel@collabora.com,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 3/5] dt-bindings: remoteproc: mediatek: Drop redundant
 maxItems for mt8192/95
Message-ID: <20250423155144.GA581441-robh@kernel.org>
References: <20250421-scp-dual-core-mt8390-v2-0-c84117a959a9@collabora.com>
 <20250421-scp-dual-core-mt8390-v2-3-c84117a959a9@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250421-scp-dual-core-mt8390-v2-3-c84117a959a9@collabora.com>
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

On Mon, Apr 21, 2025 at 04:49:06PM -0400, Nícolas F. R. A. Prado wrote:
> reg's maxItems is already defined as 3 in the base schema. Remove the
> redundant assignment in the if branch for mt8192/mt8195.
> 
> Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>  Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> index 04348cfcb0424dc78ff1ddd77665285a052925e9..82c7edd5a2fbb8610315881a4033a3a43198162e 100644
> --- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> @@ -187,7 +187,6 @@ allOf:
>        properties:
>          reg:
>            minItems: 3
> -          maxItems: 3

Sigh. I would squash this as using maxItems was the error in the first 
place. But either way:

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

