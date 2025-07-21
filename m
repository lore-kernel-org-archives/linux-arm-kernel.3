Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4726AC83F22
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 00:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yOjzHgNqDO73bMWBUf1JAQIyUEt/t18VyXO2bvbrhpI=; b=B8T2kWidPoYUYUmOG8tKfNSE8t
	cxtwf2e0zqLn6fKV4+gYG3EoWjpGEO/Jf0vzmQgcGi4wpjq5BV+sViyPnXLSWwgLrCDJjz/C15spB
	UVcomznxi2C3+CD9P2BITbcN/G/8Q8rYKT9AorWh4lQUqKPp2fZEnzMgLH2NuU/BAY1DM5YhDaN/V
	LrlkPoRFouqio0u+u4QU8R2tu/6mJm9pPXkv+aTj/I0aibkkWOGaJeo24zFikilqSBmQufOx5EH9g
	9L0eokYUo3MMq36pwqIpnol9/GHnqI+mnXECHwJZ7U2nvr+oveaH4PgYLaCeXKNgJvUqSlXCHwavZ
	Ce4Lkhog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udeOw-0000000FsNx-26Qg;
	Mon, 21 Jul 2025 00:29:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udeMW-0000000FsFe-0MDf;
	Mon, 21 Jul 2025 00:26:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 384865C4C43;
	Mon, 21 Jul 2025 00:26:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56CF0C4CEE7;
	Mon, 21 Jul 2025 00:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753057594;
	bh=2jXD6fV2pi4XdodBU4IjziGtCooOyqc6QbykipInwFo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XdcfoYAMJGyOpwexECJfGYYaLJpKEJYaYhR7Ve456pp1Mu/xlx0GKy77EaNihR0qP
	 bbNTuZ8BdR8SrB7V52lvnWlaWytC0BjVLaKfuxfcrSlflGZfDVJ6uQjJDyfd26XiJi
	 fMa6nsR62qdGsIU+RMMsX1MTLVFKYZXHrT8eF36Hyv0351dK7+Nd14tTw0KWxznmaW
	 Hy0UXyrAlM0GzSVNTcvup5NX/GBBqXfVt77RpIkmxeK52AdeepglwFzNzr+f3/QPAW
	 XC89vjEWEpVDy8wdkBiDimVW/g9fiPtALjYmQYNvSslUw06gfM2CWvRgQtzjWaELm7
	 OKLrf9nnyB8Qw==
Date: Sun, 20 Jul 2025 19:26:33 -0500
From: Rob Herring <robh@kernel.org>
To: Macpaul Lin <macpaul.lin@mediatek.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Peter Wang <peter.wang@mediatek.com>,
	Stanley Jhu <chu.stanley@gmail.com>,
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	openembedded-core@lists.openembedded.org, patches@lists.linux.dev,
	stable@vger.kernel.org, Bear Wang <bear.wang@mediatek.com>,
	Pablo Sun <pablo.sun@mediatek.com>,
	Ramax Lo <ramax.lo@mediatek.com>, Macpaul Lin <macpaul@gmail.com>,
	MediaTek Chromebook Upstream <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: Re: [PATCH 2/3] dt-bindings: ufs: mediatek,ufs: add MT8195
 compatible and update clock nodes
Message-ID: <20250721002633.GA3083612-robh@kernel.org>
References: <20250718082719.653228-1-macpaul.lin@mediatek.com>
 <20250718082719.653228-2-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250718082719.653228-2-macpaul.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_172636_205792_4569B9E8 
X-CRM114-Status: GOOD (  18.18  )
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

On Fri, Jul 18, 2025 at 04:27:17PM +0800, Macpaul Lin wrote:
> Add 'mediatek,mt8195-ufshci' to compatible list.
> Update clocks and clock-names constraints to allow one to eight entries.
> Introduce 'mediatek,ufs-disable-mcq' property to disable
> MCQ (Multi-Circular Queue). Update conditional schema for mt8195
> requiring eight 'clocks' and eight 'clock-names'.

Don't just describe the diff, we can read it. Describe why you are 
making the changes. How is the new h/w different (or the same).

> 
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> ---
>  .../devicetree/bindings/ufs/mediatek,ufs.yaml | 49 ++++++++++++++++---
>  1 file changed, 43 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml b/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
> index 32fd535a514a..9d6bcf735920 100644
> --- a/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
> +++ b/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
> @@ -9,21 +9,20 @@ title: Mediatek Universal Flash Storage (UFS) Controller
>  maintainers:
>    - Stanley Chu <stanley.chu@mediatek.com>
>  
> -allOf:
> -  - $ref: ufs-common.yaml
> -
>  properties:
>    compatible:
>      enum:
>        - mediatek,mt8183-ufshci
>        - mediatek,mt8192-ufshci
> +      - mediatek,mt8195-ufshci
>  
>    clocks:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 8
>  
>    clock-names:
> -    items:
> -      - const: ufs
> +    minItems: 1
> +    maxItems: 8
>  
>    phys:
>      maxItems: 1
> @@ -33,6 +32,11 @@ properties:
>  
>    vcc-supply: true
>  
> +  mediatek,ufs-disable-mcq:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: The mask to disable MCQ (Multi-Circular Queue) for UFS host.
> +    type: boolean

Seems this was undocumented, but already in use. That should be a 
separate patch.

> +
>  required:
>    - compatible
>    - clocks
> @@ -43,6 +47,39 @@ required:
>  
>  unevaluatedProperties: false
>  
> +allOf:
> +  - $ref: ufs-common.yaml
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - mediatek,mt8195-ufshci
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 8
> +          maxItems: 8
> +        clock-names:
> +          items:
> +            - const: ufs
> +            - const: ufs_aes
> +            - const: ufs_tick
> +            - const: unipro_sysclk
> +            - const: unipro_tick
> +            - const: unipro_mp_bclk
> +            - const: ufs_tx_symbol
> +            - const: ufs_mem_sub
> +    else:
> +      properties:
> +        clocks:
> +          minItems: 1

1 is already the minimum. Drop.

> +          maxItems: 1
> +        clock-names:
> +          items:
> +            - const: ufs
> +
>  examples:
>    - |
>      #include <dt-bindings/clock/mt8183-clk.h>
> -- 
> 2.45.2
> 

