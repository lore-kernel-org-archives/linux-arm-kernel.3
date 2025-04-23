Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C812AC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 18:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eTNKdJFc8hmYXhBJNFqCfUQ6mW4SbkRAnLiE2mina4s=; b=OIhXaJBDVUSEvhB71VBNOdb+xO
	HOLpWEnMAWgIi0wlG1ZI4joMV14E/4uD1NVGlGsWDbwOG+NI2rQYJme1Qkl7cLQ5U/Lej+DyJQ2bg
	G2n9CIVbTgGElJwOqBK66Ivger9KvNu4VjYKwmsQBQ42EBa8ETcGpqCy/P0MFigIHVGKKWhwmmrqu
	TzjjaWr3tj0mKh06aq/MA6RqoGGLPFtXarofxEEjZssRyD2ZKKBdWuRxN2bC5DDnlGXEWic5l8TQQ
	T1XtX5mdWVZTK/XonWXJirvZYBn6ve9sfwPTseMk50HURzfOtSXyttXDlr4xPlfrJZiztbJD5m+We
	kv3Ctvag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7eP7-0000000BStz-1vF8;
	Wed, 23 Apr 2025 18:01:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7cLt-0000000B1O8-0B7E;
	Wed, 23 Apr 2025 15:49:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 36B4449F2F;
	Wed, 23 Apr 2025 15:49:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6031FC4CEE2;
	Wed, 23 Apr 2025 15:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745423372;
	bh=Rd6C0AT8kRiDT9Gitf5UOmK5rHvXSI/4LUIbOAcAcWE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y0PG0OWAI+2W/ge4r1n+ZVwPbQIzUTMG9Qfvf8bmuuEHZ0COTIPA7+Oyv91NxxUgM
	 lVM2/9F/ssXzOPY4Xu/DuoJEKfQwxn3vHV0aEgY4VRgx/uqjvuqeSsOZnrjM+11tHm
	 9+1YkjLtIcWSuqqM1LT3WQaz+KmkuavW/gAySngz7Uqz5SLAPyH7AghzKlclsuZsa6
	 xlg5r5SzgF2gqi0oer+43A009BlYknBI/xG1/azywsD3pCc+7t8lVSELM/S5v6vKD4
	 e/hdUXBhfo1mHahkpeyAHd0BjMMZ+VIVwVVAMrQAhG5ZPqT72kGWcQdTRomOFaKt2l
	 6iOCE4JorUREQ==
Date: Wed, 23 Apr 2025 10:49:30 -0500
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
Subject: Re: [PATCH v2 1/5] dt-bindings: remoteproc: mediatek: Add missing
 minItems for 8192/8195
Message-ID: <20250423154930.GA579807-robh@kernel.org>
References: <20250421-scp-dual-core-mt8390-v2-0-c84117a959a9@collabora.com>
 <20250421-scp-dual-core-mt8390-v2-1-c84117a959a9@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250421-scp-dual-core-mt8390-v2-1-c84117a959a9@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_084933_104412_386CE420 
X-CRM114-Status: GOOD (  15.77  )
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

On Mon, Apr 21, 2025 at 04:49:04PM -0400, Nícolas F. R. A. Prado wrote:
> Both MT8192 and MT8195 have an L1TCM memory, so it should be described
> in reg, and therefore reg's minItems should be 3, as is already implicit
> by reg-names being three entries long. However minItems is currently
> unset for mt8192/mt8195, resulting in it being equal to 2, from the base
> schema. Fix reg minItems for MT8192 and MT8195 by setting it to 3.
> 
> Fixes: 6b55b1e2fd7f ("dt-bindings: remoteproc: mediatek: Support MT8195 dual-core SCP")
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>  Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> index adc6b3f36fde49eb3fa7ed3f08b0fa9e7f331162..ee33c233e44f3d51f0851b35697a24208c87f68a 100644
> --- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> @@ -185,6 +185,7 @@ allOf:
>      then:
>        properties:
>          reg:
> +          minItems: 3
>            maxItems: 3

As the max is already 3 at the top-level, you should drop maxItems here.

>          reg-names:
>            items:
> 
> -- 
> 2.49.0
> 

