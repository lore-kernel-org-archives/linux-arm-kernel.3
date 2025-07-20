Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD28AC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Jul 2025 23:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jU3QwGBtSc1xFSh823q1fhhRZXeisAiLs5k9bzNQhxE=; b=mcuwDUk0qTJIQXjzVp+TV1gZ2T
	STg8u4ApR5QRtAJCRy3jT5ow8yMe8kuKlipRI9s/Gx5lus73VfQRFSKB9sJ0Mxvk+BdhKqzQfVIRp
	ggyrBeaozeY8nG8FGdP0HTuJpoGSB3oT8EcrejQwwRowSg+Gm7bBQSOcAicoxKGIfq/ixumXJLPac
	bIx67A0QAKPSpV60BFU3LW4FuAJR3+nYTUMN2wNipwgWUeChQIT7bOVY7UBN1cAMAgKuqmiF2WjOg
	wscHEtFAgihNyHzRWjfBgwgwc97DH1BnmsGD/bTUCELpHKKx9Nd2vSD1gO5rHayodgp3fnlbFo4q/
	lC3OrJzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uddhX-0000000FqUj-2F20;
	Sun, 20 Jul 2025 23:44:15 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uddf7-0000000Fq73-2fLb;
	Sun, 20 Jul 2025 23:41:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 95182A52776;
	Sun, 20 Jul 2025 23:41:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91B38C4CEE7;
	Sun, 20 Jul 2025 23:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753054903;
	bh=NhV7g08fNchnFfGQ92cKt4QKjfGGOaHm0GdCOyMWic4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nky8uBrB/EvnKM+oitV/yd5SqlKBu3bud1ogpJumYos/CaS01zyftcs9h5Wd8Am8M
	 TlMV7ZyuwxqtmAFOHr/36PyMPDSK7c4LaTEItH+ifoNQqQPpI2yHHFzFItv9Six6Kb
	 fdFxcnN1UwsnsqlGzi4dNHddsF68OqHNS3Mu3F8NI255UGznsYRLUJK7LMkX3RjzHX
	 TsT3KnZVLf8cbCsQawOJGEL2eiMRHX5qpe7eluxFMj8JO+0fB7Xe/4sDW2uj0jqoMg
	 xm6XDyeeT8S3FLDkXie3zkBvkw5mFyJMXZX0ohP8CuuQxDNrne/6Vhj/O2DFxDhNgy
	 /GD4jswr3eTng==
Date: Sun, 20 Jul 2025 18:41:42 -0500
From: Rob Herring <robh@kernel.org>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Guillaume La Roque <glaroque@baylibre.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Liming Xue <liming.xue@amlogic.com>
Subject: Re: [PATCH 1/3] dt-bindings: thermal: amlogic: Add compatible string
 for C3
Message-ID: <20250720234142.GA3079305-robh@kernel.org>
References: <20250718-c3-thermal-v1-0-674f9a991690@amlogic.com>
 <20250718-c3-thermal-v1-1-674f9a991690@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250718-c3-thermal-v1-1-674f9a991690@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_164145_743031_C420DE21 
X-CRM114-Status: GOOD (  12.53  )
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

On Fri, Jul 18, 2025 at 02:37:41PM +0800, Xianwei Zhao wrote:
> Add the compatible properties for Amlogic C3 SoC family.
> C3 family supports only one thermal node - CPU thermal
> sensor.
> 
> Signed-off-by: Liming Xue <liming.xue@amlogic.com>
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>  Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
> index 70b273271754..095b92aa5ace 100644
> --- a/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
> +++ b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
> @@ -22,6 +22,7 @@ properties:
>                - amlogic,g12a-ddr-thermal
>            - const: amlogic,g12a-thermal
>        - const: amlogic,a1-cpu-thermal
> +      - const: amlogic,c3-cpu-thermal

Combine with the a1 entry using 'enum'.

>  
>    reg:
>      maxItems: 1
> 
> -- 
> 2.37.1
> 

