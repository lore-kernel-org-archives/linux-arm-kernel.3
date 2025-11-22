Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 173E7CF64B1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Nov 2025 11:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4gWI5ub2Hl47V6iD8OCO6ZzPMuZTcUTzU/VqNVx2Mog=; b=oY2ZZxpEJ+oPAW6y8ZKiTIsGws
	Rsnv7t1WDakCv/TePPZA4HHQimd7/iMLmF8wr6lHP1fY4axRsQ42An3xW9lJhYxABfVYXS2Q4xMJH
	d5kNrHcxpYBkzJoLB9UAzhAD/rnEifLeveEfYgVHJay4cRGGNavataOYEGnrJt6an6UbOtuZNoRFy
	MYz6JxCXPjUiuMO3liz9/9MyAjFzt5CI2GDmd0nbEg9JUkSijGA9Fe2EkjCOuyFyKFpHG4ohT2cD0
	FC4/IRuK/NaYr1rDmHiFaigHmbfP93E/yvRGxE4ZyeXdw8Ht/BTslm2idBV2apcgJ4q49FSYgUCTR
	m52aAxgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMlth-00000009VZ7-42zI;
	Sat, 22 Nov 2025 11:35:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMltg-00000009VYl-0BfF
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Nov 2025 11:35:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 790EE40E38;
	Sat, 22 Nov 2025 11:35:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD82FC4CEF5;
	Sat, 22 Nov 2025 11:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763811319;
	bh=IxDDJj+ygRvaEnL6Mv9NBj7KbnZR8hk1nQd27frJE4c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LVWk8ULvqh2xe440+nRdtGXjxKjU3mwEtE8JpOGjuvw9xErXSWy6vhAc+JoKF19Lu
	 K9sOBsXMExNo4MNoVOlbYm3cjE530lDTTw+1ePxmwKS5b7AMm8vt4a2jC5FeoZeQ10
	 Wn+2fpjpzbOKWhpOA5cVrbvgWIwrgCty25xWdmSDH4hniMXOIER0Z2u8lqntilAuBJ
	 UA+9V19LjRhwX2GbkQAssqQCM87gLF8q01hTuqIw+Py3Z+J3IYzM6qb0oiZFet5fev
	 rWia9kvLG3i+KW2pca2px+ssMax4/5XvPLL1stNrZwglf/XRrG+WcEHIe5ocgYoAIf
	 eXC792xrgoSqg==
Date: Sat, 22 Nov 2025 12:35:16 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: =?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com, Will McVicker <willmcvicker@google.com>, 
	Juan Yescas <jyescas@google.com>, Doug Anderson <dianders@google.com>
Subject: Re: [PATCH 1/4] dt-bindings: clock: google,gs101-clock: Add DPU
 clock management unit
Message-ID: <20251122-silent-fluffy-agama-9a9ad1@kuoka>
References: <20251120-dpu-clocks-v1-0-11508054eab8@linaro.org>
 <20251120-dpu-clocks-v1-1-11508054eab8@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251120-dpu-clocks-v1-1-11508054eab8@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251122_033520_130686_EEC6DC63 
X-CRM114-Status: GOOD (  12.59  )
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

On Thu, Nov 20, 2025 at 09:06:11PM +0000, Peter Griffin wrote:
> Add dt schema documentation and clock IDs for the Display Process Unit
> (DPU) clock management unit (CMU). This CMU feeds IPs such as image scaler,
> enhancer and compressor.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  .../bindings/clock/google,gs101-clock.yaml         | 19 ++++++++++++
>  include/dt-bindings/clock/google,gs101.h           | 36 ++++++++++++++++++++++
>  2 files changed, 55 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
> index 09e679c1a9def03d53b8b493929911ea902a1763..1257be9c54a42ea2387e1112e53b5ee1f03e09f5 100644
> --- a/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
> +++ b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
> @@ -34,6 +34,7 @@ properties:
>        - google,gs101-cmu-hsi2
>        - google,gs101-cmu-peric0
>        - google,gs101-cmu-peric1
> +      - google,gs101-cmu-dpu

Standard comment - oddly placed. d < p. Or you just always keep adding
at the end?

>  
>    clocks:
>      minItems: 1
> @@ -171,6 +172,24 @@ allOf:
>              - const: bus
>              - const: ip
>  
> +  - if:

This as well follows alphanumeric placement.

Best regards,
Krzysztof


