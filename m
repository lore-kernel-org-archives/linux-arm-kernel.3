Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AD01FF8870
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 06:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VVMW6CwJ9GS8iGsurnKGxoQ/sNx6USinsH3XsvT64Go=; b=V+votaTHw8bOmfUwb6x09FswH/
	ZMi5vkgXMhIBgICr067XUm6OvGXfrL0C0aiUcspg4ZHWO+drHR0IvMcgSK74W7rXNWNr8WxjB0rdv
	vX2G4pfUFzOGQvYIWDiLKbyU+1H3zDu7OhDYvIU/GI68s61YzfB1ezvXXMP1cRwEHDnWcdWac6hON
	CbvqLTbGIr0bRXtIySg2B4lqeUsJdPFsrOwZbDk8t+s7tROYNjO7Nv0lb+IelouchJu1Yuma4x1uP
	Kk1nDFjrUj5c+Mp1mU52hau46I2B5QfoXxilKj750iJ2zgUWCnuR6+ttbZmUK8UVLO5iZ4t5vgjkD
	3/3gBlXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHbtb-00000000d6y-2rHG;
	Tue, 28 Apr 2026 06:26:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHbta-00000000d6g-4Bgs;
	Tue, 28 Apr 2026 06:26:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 59C6460141;
	Tue, 28 Apr 2026 06:26:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A34ADC2BCAF;
	Tue, 28 Apr 2026 06:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777357570;
	bh=Cs0va9ksutkltfw/gfiQLgiE4WIPRepYv8o4zvP4pTk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rk9r+wOGldHCWKoV3gZDP9RF3hwTmvN8ykTAcsATsiZU8b/Mcj814GM4viziTI/22
	 Y6v8iKEpQ2JP7L1L60iOuseFkFGqU7oj8p6G+Gci+MJFXUoEViKH1fCnrgY6tj9xbX
	 h5VGUVLJ+NWqXcE9+UKm5G7j3lY1gO3vSpgl6NcYgX35Qw+O5K9m/2D8eTE0u9/wkP
	 FuALcZtiWY5/dhpXI5XEd0hEygD5xqxqdaFYXW4u5caPbctuHTcFNe2v/eQzChRTqq
	 jxD4R7YtJs6blf7zNBhZ4EHMWqsg+XFcoITlkNjYh9QbUlRQ4cKQ8mLlI0eM5c/vlX
	 laScHgn7+FS6g==
Date: Tue, 28 Apr 2026 08:26:07 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: mtk20898 <zhengnan.chen@mediatek.com>
Cc: Yong Wu <yong.wu@mediatek.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [RESEND,v2 1/2] dt-bindings: memory-controllers: mtk-smi: Add
 support for mt8189
Message-ID: <20260428-topaz-turtle-of-support-f5b9ec@quoll>
References: <20260427070444.20247-1-zhengnan.chen@mediatek.com>
 <20260427070444.20247-2-zhengnan.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260427070444.20247-2-zhengnan.chen@mediatek.com>
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

On Mon, Apr 27, 2026 at 03:04:28PM +0800, mtk20898 wrote:
>  properties:
>    compatible:
>      oneOf:
> @@ -40,6 +55,8 @@ properties:
>            - mediatek,mt8186-smi-common
>            - mediatek,mt8188-smi-common-vdo
>            - mediatek,mt8188-smi-common-vpp
> +          - mediatek,mt8189-smi-common
> +          - mediatek,mt8189-smi-sub-common
>            - mediatek,mt8192-smi-common
>            - mediatek,mt8195-smi-common-vdo
>            - mediatek,mt8195-smi-common-vpp
> @@ -108,19 +125,23 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - mediatek,mt8189-smi-sub-common
>                - mediatek,mt8195-smi-sub-common
>      then:
>        required:
>          - mediatek,smi
>        properties:
>          clocks:
> -          minItems: 3
> +          minItems: 2

Same problem as v2 before resend.

Please explain me how mt8195 requires three clocks. You can prove it by
trying a malformed DTS (past here the snippet/diff) and pasting here the
validation error.


Best regards,
Krzysztof


