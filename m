Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FF79F94CD9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 07:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2IzwryI7mT02sn2ht5LvrVlkiAXegOhJCMt6xHoEnWA=; b=sJ/0T6gaVyGQoa4IzjqincVh47
	r3hviy6xvjnn3z2pL5PGOwd1oJYa8afP1Uj+9UFkd0gKRTuNxdr4lpEmdhvyiCaZcSH/jncXHpfeQ
	hqGW1iO4pR2vZ8sSpQNSzwdaLuJCows/ZsSZfXN1KBZkDOvcjFLNveBfTDqBp0NS3OlSokOC1eoDB
	yOcaceZTedksz+2JqYWJgglodyG3PvkLzGIc3bZKRYDQ4D913Pi23k7p87WDtDIimNKpjWVj+Gspm
	wUoPMQW8e42stLBqA6ALHszVEeP6FUQe7KSZr5awd5O0HXmQYVZS9fGjb9+5HCAwKD067FDx34Zyz
	X9zZrq9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFRs1-00000009iVo-0OQt;
	Wed, 22 Apr 2026 07:19:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFRs0-00000009iVf-1MoJ;
	Wed, 22 Apr 2026 07:19:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6D64A60018;
	Wed, 22 Apr 2026 07:19:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B496AC19425;
	Wed, 22 Apr 2026 07:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776842375;
	bh=/rjpCv9AgVY957+ryIyB1yaYB3gcSX8IyGz/PAx64+c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ENlxW5s+Rrvgh6mt0d5lvBLzYM8Vsg50sVcQIi+KGwoNvmmEkoG8NYs7rU/vomaEY
	 /eaqUkEDRNTVVv6a6s05GDmOEAneIdUa8c7szDyXfW1tmLbMjn9RveSRysrAP+LC8l
	 miVvw76jcgobzS8OIc+6oV9wpmR7JhQ2Kj716Xysfdw9YJFsyUkXQkNLPXyAUGXKqQ
	 MbS05SxsV914xCOAXVPq5NxaV2VEVu4WjlFyEsbv98erkMxrGuOc8fEresi4iDmLHm
	 KjHjUPMMVluPVnMADnC1tNDtT/dX0PbJXSEI9kkajXA0Qr6CyE2DecTsZS0gsQRGoE
	 r9ZG63mLh/Zpw==
Date: Wed, 22 Apr 2026 09:19:32 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Arnd Bergmann <arnd@arndb.de>, Cyril Chao <Cyril.Chao@mediatek.com>, 
	=?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Eugen Hristev <eugen.hristev@linaro.org>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 1/9] ASoC: dt-bindings: mt2701-afe-pcm: add HDMI audio
 path clocks
Message-ID: <20260422-capable-ambrosial-otter-ddd6e0@quoll>
References: <cover.1776646435.git.daniel@makrotopia.org>
 <69f0b69e49068695db4ba6164c0757ccdf9786fd.1776646435.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <69f0b69e49068695db4ba6164c0757ccdf9786fd.1776646435.git.daniel@makrotopia.org>
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

On Mon, Apr 20, 2026 at 02:13:05AM +0100, Daniel Golle wrote:
>    clock-names:
> +    minItems: 34
>      items:
>        - const: infra_sys_audio_clk
>        - const: top_audio_mux1_sel
> @@ -104,6 +110,10 @@ properties:
>        - const: audio_a1sys_pd
>        - const: audio_a2sys_pd
>        - const: audio_mrgif_pd
> +      - const: hadds2pll_294m
> +      - const: audio_hdmi_pd
> +      - const: audio_spdf_pd
> +      - const: audio_apll_pd
>  
>  required:
>    - compatible
> @@ -114,3 +124,16 @@ required:
>    - clock-names
>  
>  additionalProperties: false
> +
> +allOf:

allOf goes before additionalProperties

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


