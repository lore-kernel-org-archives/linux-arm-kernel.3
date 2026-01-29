Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C71C1D6B084
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 16:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+UL5IJSMRNi9sRy9WZ4RDlnbr3IBfPmfcWS8SQQsaQ0=; b=qhwZSwhhkkVaqixl/JDA0BzGd/
	cyubJCiyAI66b4eQBHdbE+axTp0Z3++IA9YnjT6w5dkft5tp9wgUbiXIf+1h7AIGhBOvN8Q00+JHE
	M7eYm14rsghr8kHo3UAMlPSrNHGRtt+dXcB6ckcIeM7k03W4UQoUITANOjDOjplUl7PtAZCgYTCbb
	6assbR9eILvQBjnIsoJ5Of0UGgvKrYxyi2jMKH4xX9r6zN1afMqHjx2e2kbnX370Iwf0oQnIy1dWu
	8Arc0r9+9PK3HU44ZdNfYHeDwDrBxj6QJwPNHy2z3a4TFUwyD0Asr/ScpVIPz4tDw4oYBhDdFx1Bk
	mS9soQXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlUXy-00000000Jmy-0vcH;
	Thu, 29 Jan 2026 16:07:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlUXw-00000000Jmi-1uQ3;
	Thu, 29 Jan 2026 16:07:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B06A26001A;
	Thu, 29 Jan 2026 16:07:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3ECA5C4CEF7;
	Thu, 29 Jan 2026 16:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769702823;
	bh=tXLZf586UMlopidhDPd+PLHMkBbfoB3yGad7HOETBIQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ze3bCGG/Hi5NgiKNzxsqJo1h+thuZE83AJGM3VOwqqyq9zuyxXz1YYh0gYxoXT3b6
	 5rY3/sq21LyoYekh9tWhU4sCw6G7n2xC7gZNRDPxvXWQDCMyvm4UA0YCBICNtKOyCf
	 2zIHGuAMaurWjAoyxsWEqvNiePG3VPrRrqrXIpg/IokMcjzzxPcchNHetQ0D3AIOn4
	 Py3Qk6YDAgnMyHZjYBqqv69Jhnjv6DRP7pNDHnM1PCmccf2Hel4JL8iqHSk3cFBkyb
	 l5quNXdS50Oemjhyk8xvtBIFjfpzr7KLzowBh7dJm8pXRot48elOiivmf6Z/asjzic
	 722agsrP7ELAg==
Date: Thu, 29 Jan 2026 10:07:02 -0600
From: Rob Herring <robh@kernel.org>
To: Jiebing Chen <jiebing.chen@amlogic.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
	jian.xu@amlogic.com, shuai.li@amlogic.com, zhe.wang@amlogic.com
Subject: Re: [PATCH v6 1/5] dt-bindings: clock: meson: Add audio power domain
 for S4 soc
Message-ID: <20260129160702.GA1111873-robh@kernel.org>
References: <20260126-audio_drvier-v6-0-99e350855bc2@amlogic.com>
 <20260126-audio_drvier-v6-1-99e350855bc2@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126-audio_drvier-v6-1-99e350855bc2@amlogic.com>
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

On Mon, Jan 26, 2026 at 06:01:42AM +0000, Jiebing Chen wrote:
> The audio power domain has been found on S4 device.
> It must be enabled prior to audio operations.
> 
> Signed-off-by: Jiebing Chen <jiebing.chen@amlogic.com>
> ---
>  .../bindings/clock/amlogic,axg-audio-clkc.yaml         | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
> index fd7982dd4cea..1cd9a99e5ff3 100644
> --- a/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
> +++ b/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
> @@ -20,6 +20,7 @@ properties:
>      enum:
>        - amlogic,axg-audio-clkc
>        - amlogic,g12a-audio-clkc
> +      - amlogic,s4-audio-clkc
>        - amlogic,sm1-audio-clkc
>  
>    '#clock-cells':
> @@ -99,7 +100,8 @@ properties:
>  
>    resets:
>      description: internal reset line
> -
> +  power-domains:
> +    maxItems: 1

blank line

Looks fine otherwise except for the DTB warning, so something here 
doesn't match.

