Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25390F3ED51
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Apr 2026 14:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tx8XR3bTwX1HeLZj5m9ccZh3FCp00PC8QPSgzaFQ7K4=; b=hZcYDY3rtP46nsQuxhNOKEr3t4
	yH2D0rKP4QVWOUCtdwvuc1DEvwCTQt4UTKTgcpVRhpQSIX0SJGfomTKFX2HfRWKxAkoyP1eBnVkYC
	xkaFfj8xBWJ6oUtepjpfU2SEy9qGPFaILfyeYFds7frviiD1y7SzP5Oblyi2SNohRsHdHeJF2C8wD
	MCya/T9zIub99hrV3iFiJd9N/ft+5Y5z88Wx7rREEM7plkc/ba7FaAbwepjqPXqndTDMXatyu3LXN
	OPxLeFBwHbovetyP/XpStKc8FZ1/an/L/l9ebIHV4VVRWpfXz3d/2TT5oyhdviGfegxtAooj9pJ6T
	RlETZsgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBYvK-0000000DV6z-2xdf;
	Sat, 11 Apr 2026 14:02:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBYvI-0000000DV6f-3LVC
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Apr 2026 14:02:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6C2EA415FE;
	Sat, 11 Apr 2026 14:02:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0FF3C4CEF7;
	Sat, 11 Apr 2026 14:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775916176;
	bh=qTGXf6WynDlhqCeEMRmn0/Jqz0E8aUSyGBpnv9H90GQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q1kpwNnn6yIqce5aPejAr27ABKp8tmHqlIhPh2SZG6WlK+MT+50xikE68MEcRwPXg
	 oC7pR6bUg3H6tHB3Np88jjDfoKs78Cy1yz6LSP7I8ZzCmXP1aK4n50yKcZIxB481GL
	 ASVcppBVzj6w5TGjhKjU6ElNbOMq8hkBHrqKK4tGaabWBNX0pFt0d6CfveL2Nr/tqY
	 EczxhqnBDs9UCmPK/rg6ay8TUyECwTq0lLCWWY9NyD0lMk9QQdPzwCddyoI3G5KYa5
	 oBUX8l70kJqKZuhcNwQ6uDqnhDRIE+oq8Q2FCLH1UreGsYIqgvc27FrgTKEBBfJto7
	 XB9iQ+OC+yaIw==
Date: Sat, 11 Apr 2026 16:02:54 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: David Heidelberg <david@ixit.cz>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Petr Hodina <petr.hodina@protonmail.com>, linux-input@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	phone-devel@vger.kernel.org
Subject: Re: [PATCH v4 09/11] dt-bindings: input: touchscreen: st,stmfts:
 Introduce STM FTS5
Message-ID: <20260411-banana-coot-from-vega-2f4a96@quoll>
References: <20260409-stmfts5-v4-0-64fe62027db5@ixit.cz>
 <20260409-stmfts5-v4-9-64fe62027db5@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260409-stmfts5-v4-9-64fe62027db5@ixit.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260411_070256_851954_B4FF631C 
X-CRM114-Status: GOOD (  14.20  )
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

On Thu, Apr 09, 2026 at 12:15:52AM +0200, David Heidelberg wrote:
> Introduce more recent STM FTS5 touchscreen support.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  .../devicetree/bindings/input/touchscreen/st,stmfts.yaml  | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml b/Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml
> index 64c4f24ea3dd0..441fc92b9a4ed 100644
> --- a/Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml
> +++ b/Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml
> @@ -16,10 +16,19 @@ description:
>  
>  allOf:
>    - $ref: touchscreen.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          const: st,stmfts5
> +    then:
> +      required:
> +        - mode-switch-gpios

Does existing variant have these pins? If not, then missing else with
"mode-switch-gpios: false".

Please move entire allOf to the bottom, like in example-schema, so after
"required" block.

>  
>  properties:
>    compatible:
> -    const: st,stmfts
> +    enum:
> +      - st,stmfts
> +      - st,stmfts5

Best regards,
Krzysztof


