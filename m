Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1274C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 11:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ZKQbs2YDewSV22RQ1NKfVSByBlkkAnFYZaA2MKjZKo=; b=X+VPi+qdgjk1Gs1yKxBaQgZQ+1
	Zp/oXPBunSc4l5qDV/T5CzxrdF+PO++Ar46GRpSU54VHU1cQMDabvB4cZbBoFz1MTskYP0w3uVLE6
	Y9OUrtwBNxEBwB70xIk/Xx75KTq/InixQYqijR+MNYll6P+fcT+XPQlYTSbqiARmOwpe7mPb5EYA7
	vYvUrixm9LkVlhxRyf9dI1w1R+goIot/eXt8/iccMh5xApcdeplFm3bIazAA5xypS4S74H4gwR+DC
	sAMdNlnhyVIzVoQ78Q5dItv28feay3gaK7ZtnryfhPyKMRUW5/ing9Xz4j9vnldS8YLcWs3ApKIPL
	JX1//vqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZpQ1-0000000BdSl-2sMR;
	Thu, 10 Jul 2025 11:26:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZo1n-0000000BOuI-36T4;
	Thu, 10 Jul 2025 09:57:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 151BD5C6C90;
	Thu, 10 Jul 2025 09:57:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D235C4CEE3;
	Thu, 10 Jul 2025 09:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752141438;
	bh=9rh3mqspQCTsXhgwbiE5vJ7eGHXCNC61azHoKSXtp14=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rtfYXZKl0VxbWk6w2YruIrmkPSGk7JkSk9/yJKZxBvo2TKSiLl7v6RMqj8YSqJHTq
	 6KcMglmXZKYtXeiETovgoMQWBW4ahLWBHO3GBFC14rnAl2171vRm5mRG5gGRqMuivL
	 xibpg3g5fvZaNFwy7VvyxAb/taNBdMDdMgSlv1Ojx1TBm4L0dCvrnfKSrvjNJI2KOu
	 buy6+04t4Hu9G7F86+fWLbRx6t/Ox4z7wE0jDyV2QWMM5Xuo+7ohrEf5CyMHN+MsPD
	 rtOk3ZCIOk6fCoqIn/yv1v2W+j8z5UOK5oD3f+XrZ6vjVWPSgTEB2Fsty6zLw2It80
	 rOUGnEUryBP0g==
Date: Thu, 10 Jul 2025 11:57:16 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: jiebing chen <jiebing.chen@amlogic.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, jian.xu@amlogic.com, 
	shuai.li@amlogic.com, zhe.wang@amlogic.com
Subject: Re: [PATCH v5 3/6] dt-bindings: Asoc: axg-audio: Add s4 audio tocodec
Message-ID: <20250710-fancy-righteous-elephant-aee5a6@krzk-bin>
References: <20250710-audio_drvier-v5-0-d4155f1e7464@amlogic.com>
 <20250710-audio_drvier-v5-3-d4155f1e7464@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250710-audio_drvier-v5-3-d4155f1e7464@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_025719_814491_A98A65F6 
X-CRM114-Status: GOOD (  12.16  )
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

On Thu, Jul 10, 2025 at 11:35:39AM +0800, jiebing chen wrote:
> Add S4 SoC tocodec compatibility support.
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Jiebing Chen <jiebing.chen@amlogic.com>
> ---
>  Documentation/devicetree/bindings/sound/amlogic,g12a-toacodec.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/amlogic,g12a-toacodec.yaml b/Documentation/devicetree/bindings/sound/amlogic,g12a-toacodec.yaml
> index 23f82bb89750898d20c866015bc2e1a4b0554846..ea669f4359bc81b0f45bc2105c832fc2b11d8441 100644
> --- a/Documentation/devicetree/bindings/sound/amlogic,g12a-toacodec.yaml
> +++ b/Documentation/devicetree/bindings/sound/amlogic,g12a-toacodec.yaml
> @@ -26,6 +26,7 @@ properties:
>        - items:
>            - enum:
>                - amlogic,sm1-toacodec
> +              - amlogic,s4-toacodec

Keep the list sorted.

>            - const: amlogic,g12a-toacodec
>  
>    reg:
> 
> -- 
> 2.43.0
> 

