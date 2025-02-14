Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48AC7C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 08:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fVDQzYkE6ZMDTPdcEAsdWvbM3Lw9DOF/Ac6Pw6a0tsE=; b=OBp6RLMwcFMzUoNZ56pimZwzBU
	2WZJjcayQCbwgtGewClUubb82oLAxqXZbxldv/AM/ILklAYnDLjtpyM6yGhrTmKO0ArEWUIsMkLhO
	EOBy0HKf3D6WMLq5wsIblO+VqQJ4zLZIPxd9elp8BqwQpSFAYci6BjsNu5Nfz+QwkqrU/knPzAAZt
	oqQscZxjrdBxuaB1JYLlMJzOGR7/xa5nqe3IGNkVcfMTFBXU5Qg/VFDgG1oF7P2oGHI1TH431eU5U
	Ikv+SYcRNLzkHfK5G7X/tAN4c0X5cZO/HuGE5r6rO6PS9wxCvvNfsg6wt5maUkEA09f9JfErvOtek
	7q7d6SDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tirGg-0000000E9wa-0YLx;
	Fri, 14 Feb 2025 08:41:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tirFF-0000000E9lW-2H2B
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 08:40:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5D31D5C58FC;
	Fri, 14 Feb 2025 08:39:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6005C4CED1;
	Fri, 14 Feb 2025 08:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739522420;
	bh=YE4l8V3UVTEVbSPXutJ4j6Y6NMn523OYmOJG5yYkcjQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sxINyX1nsva9oK8xaDH5WHmRvU01UOW+REYlhjfVDrEpNU6+U56EAL9RwOXo95DNB
	 7XBTBPaSi0G7m/Xs0liBIg4I+e06vkyyR2ealXUjZkTkwLZWYOF318xBUOJyytKNdF
	 cjNehgtBM61B9JadQkJiimYpwpzWNke42cqAUXi+aM8ZVfBH7lS7n6MyywYjwwZX2D
	 75LlyJhFchFWEMQH9boTW6UAptsFmDLqaudauFkPFIZiq1X+ADDIwL+c07xDoq0IH2
	 SGHv/PJHYTS8VqT3p3NNcHrpIqheXwleoSgmispXJxDb32yPv7KY/7ih+J3QkYiCjQ
	 tKz++T9bnGklw==
Date: Fri, 14 Feb 2025 09:40:16 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, 
	tiwai@suse.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] ASoC: dt-bindings: imx-card: Add playback-only
 and capture-only property
Message-ID: <20250214-honest-puzzling-bear-b8060d@krzk-bin>
References: <20250214070533.2808496-1-shengjiu.wang@nxp.com>
 <20250214070533.2808496-2-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250214070533.2808496-2-shengjiu.wang@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_004021_635070_B28BCF9C 
X-CRM114-Status: UNSURE (   9.78  )
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

On Fri, Feb 14, 2025 at 03:05:32PM +0800, Shengjiu Wang wrote:
> diff --git a/Documentation/devicetree/bindings/sound/imx-audio-card.yaml b/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
> index f7ad5ea2491e..86571fa930f6 100644
> --- a/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
> +++ b/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
> @@ -46,6 +46,14 @@ patternProperties:
>          description: see tdm-slot.txt.
>          $ref: /schemas/types.yaml#/definitions/uint32
>  
> +      playback-only:
> +        description: link is used only for playback
> +        $ref: /schemas/types.yaml#/definitions/flag
> +
> +      capture-only:

Aren't these mutually exclusive? If so, you need proper schema for this.

https://lore.kernel.org/all/20230118163208.GA117919-robh@kernel.org/

Best regards,
Krzysztof


