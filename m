Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAF5ED44D56
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 10:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+1qLLA7rZ+s0MA27nCdKQOKEZrSgHLBdQd9OWvEge48=; b=e6N0YjY46cftKeJm3MNvMdKjTX
	6yaN78JMtsVIP+XYEGnwz0q8NPKkSADzuOETzWdtNGmQ1ahROh/E1Gd0S+GTxCew4h+GWnLNc2tUp
	llXMa6dE77O/JUm5lz+kJWr6dRIxPYGQOy4H3k2Wv1yemZWQsBJ1NEdSvexQ9tzRU75NEafec/Y+B
	8prNW9jtiTiUnGzbLW11TUBtDLHp5lmvj8BGuyoNjR1FI2lW8l1DFJdoT7Zj70u/JQ8Fe4GfZYhNU
	qlNu4NZLmlJNSSAom6MMYVSvpgIOjWupra7NH3tfvIReRsBUwRIVPdw4TDTik687R8DOKviWE4hoK
	Wfe4qc7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t900r-00000006XmP-0xWT;
	Thu, 07 Nov 2024 10:45:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8zw7-00000006WBt-2LTq;
	Thu, 07 Nov 2024 10:40:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1954D5C5662;
	Thu,  7 Nov 2024 10:39:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DC7EC4CECC;
	Thu,  7 Nov 2024 10:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730976022;
	bh=VRa2mI7dVpDSpKy9Wwljp/gFO/T3/KSxHI247WS5TrU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VADCOzFPpJ4Ika22a9Ctfw75oRTQdgYokAlAjZd7OPy2rtj96ZMEvXjBocKAby9Sj
	 LNDIf1+TNqRu9rzfDXyfZGArMqnzr5eD29925xfyx2xbKcm1+kFHQQz1ULdYqt5IUi
	 xzXk2O8tgvikkGJnkUJbf00OfoN5fMdTuOf01iVZaCBCRakNRvw1zzcsdB8pdbrSFx
	 /zSVDyHU/BRFTb1/BtXuJi1e3AR6GVVUZfpsNTmpnOpDoosHtpr3fOVmKHIiYfMdBZ
	 K80KZOxtyfYqsQtuLxFCIbVIm5W1Xurj/6Vws6p7gBL/LO8dDcVGrfaTQ8e9Uik1Nn
	 rQGnyoryKt0Eg==
Date: Thu, 7 Nov 2024 11:40:16 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: clock: actions,owl-cmu: convert to YAML
Message-ID: <4kmt23n5v5ppqf3sc5bdag76r7vxsnryazh5xytfevt25c3wrq@ptnk5wpb67ol>
References: <20241106153141.375389-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241106153141.375389-1-ivo.ivanov.ivanov1@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_024023_670385_E782102D 
X-CRM114-Status: GOOD (  13.62  )
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

On Wed, Nov 06, 2024 at 05:31:41PM +0200, Ivaylo Ivanov wrote:
> Convert the Actions Semi Owl CMU bindings to DT schema.
> 
> Changes during conversion:
>  - Since all Actions Semi Owl SoCs utilize the internal low frequency
>    oscillator as a parent for some clocks, require it.
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
> v2: drop address and size cells from example

...

> +description: |
> +  The Actions Semi Owl Clock Management Unit generates and supplies clock
> +  to various controllers within the SoC.
> +
> +  All available clocks are defined as preprocessor macros in
> +  include/dt-bindings/clock/ headers.

You could list the headers. Otherwise it is pretty obvious and could be
skipped.

> +
> +properties:
> +  compatible:
> +    enum:
> +      - actions,s500-cmu
> +      - actions,s700-cmu
> +      - actions,s900-cmu
> +
> +  clocks:
> +    items:
> +      - description: Host oscillator source
> +      - description: Internal low frequency oscillator source
> +
> +  "#clock-cells":
> +    const: 1
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#reset-cells":
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#clock-cells"

In the future: please keep the same order of items here in required: as
in properties:. No need to resend just for that... but:

The clocks property were required in the old binding.


> +  - "#reset-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    cmu: clock-controller@e0160000 {

Drop unused label 'cmu'

Best regards,
Krzysztof


