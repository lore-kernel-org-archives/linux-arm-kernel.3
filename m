Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71B5FCA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 06:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zc3A3cOKU+Yffs5eCndyKf9yY8nYExG370G9paaMrfQ=; b=PjVOhbL/rkrhrTcf8/xSNNt0AN
	q+KOPuQ2S8rOkzJi7gham3OEtwXs/j8m2Dg9Yx4joMeJiw6mx3JPPLA/qEl7FA29zf18eO8dCkCW5
	TXT4ChYgiOY/HK0L5+YHLfVDMhb6p7G8VZ6B9SBUhxdicTnNszL4rDd96UAm9Gr1Ltb0uKo0mkWlX
	G5bnfaC2JBwoBatuDnt4qg6TcdWhXUESYrLH7QHX72fxXDEYTJPsIy6iNVH9ehAG3hTmA8BGmFNqI
	xMSZKDK6DHeTeVNDgaIzFumcxZZTdq7fO4IBCI/ctHQY2uCjqqMf1CUiZfa0EFqesjhzIIVI717Jj
	6TegQb6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCA5X-00000007sGt-0KbA;
	Thu, 01 Oct 2026 06:16:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCA5W-00000007sGZ-1GLm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 06:16:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 80BCE601F6;
	Thu,  1 Oct 2026 06:16:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0571B1F0089C;
	Thu,  1 Oct 2026 06:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790835373;
	bh=Zc3A3cOKU+Yffs5eCndyKf9yY8nYExG370G9paaMrfQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YthR/Bo+j9kwzCk3ljzbQRm4pdDgJBQrIXInI9Ynqwn6exu2r+KWCd0tb2PkjH0eu
	 KR7hwVtff9yVAP9tvr9F7AegEtzw+QfIzUgkk+5PI1LOCkfpNy35Zmondav0RlR6XV
	 yNd3ouFvV6A9KYrgV5SivAAagID1kgXc6cfRtV8hCCemRKZjoOBdyAvRX9boz/QIyj
	 hloFXvsYmPl29hwYMtkDwJaXRD9aa1pX0uGGXHwRBFJdPPCivmHXHFC/bW/BywTbcR
	 WIYbEpUCa4IuQy8Er5fYcdMobWW73CzAT812uLoARQ5ruYluuvFtCPrirKNC9flcUR
	 7escPX77rd+BQ==
Date: Thu, 1 Oct 2026 08:16:08 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tim Michals <tcmichals@gmail.com>
Cc: linux-sunxi@lists.linux.dev, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org, 
	andersson@kernel.org, mathieu.poirier@linaro.org, jassisinghbrar@gmail.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v2 1/7] dt-bindings: mailbox: add Allwinner sun55i msgbox
 schema
Message-ID: <20261001-sensible-marvellous-porpoise-3a8350@quoll>
References: <20260922034711.190253-1-tcmichals@gmail.com>
 <20260927002021.797069-1-tcmichals@gmail.com>
 <20260927002021.797069-2-tcmichals@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260927002021.797069-2-tcmichals@gmail.com>
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

On Sat, Sep 26, 2026 at 07:20:10PM -0500, Tim Michals wrote:
> Add Device Tree binding schema for the Allwinner 4-port hardware
> Message Box controller found on sun55i (A523, A527, T527) and
> sun60i (A733) SoCs.
> 
> The message box connects the ARM Cortex-A55 host cluster to the
> HiFi4 Audio DSP, Power Management Unit (CPUS), and XuanTie RISC-V
> co-processor across 12 logical channels with 8-entry hardware FIFOs.
> 
> Signed-off-by: Tim Michals <tcmichals@gmail.com>
> ---
>  .../mailbox/allwinner,sun55i-a523-msgbox.yaml | 102 ++++++++++++++++++
>  1 file changed, 102 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/allwinner,sun55i-a523-msgbox.yaml
>

Do not attach (thread) your patchsets to some other threads (unrelated
or older versions). This buries them deep in the mailbox and might
interfere with applying entire sets. See also:
https://elixir.bootlin.com/linux/v6.16-rc2/source/Documentation/process/submitting-patches.rst#L830

...

> +  interrupts:
> +    minItems: 1
> +    maxItems: 4
> +    description:
> +      One interrupt per processor port in port order (arm, dsp, cpus, rv).
> +      The ARM host port interrupt is required; remote port interrupts are
> +      optional. Use interrupt-names to identify which ports are present when
> +      providing a partial list.

No, this has to be constrained/specific. See writing bindings and any
existing examples. Also, just list the interrupts with minItems, instead
of free form text.


Best regards,
Krzysztof


