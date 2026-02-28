Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EDD8FEE4E9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 11:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H7EfJ78N8YyJsjeBao8EHmdSF79MioVMX/HIXeQhcvg=; b=Z7ysXXjchxF4tEXVfUXzA4Fj2W
	HF975cSdlVmk2TE5eJBBHixHI/12LXZ/+3dXAY+UacKNsDi45WonT+2JWQir41eN+uZGkTl9OfJTn
	/s/BsPFgEzbKkTiAx8Rss2fPId86r2IbfUZOhZZE9U1C5UMuyynnyewFxOu1tNt3WltuX4ZNtKUSc
	h6SLdAtOP7i/oh2+bmHMqFs/aO/k293qFI8OcNmeRG4GrobXCxKvytgJcUfOh4jMR37jenUw66NPL
	i1Ja6DypjZWskuUHU4jKnJsO/Zt0rIiAi7+JAW7774BC5AnAUsTj248DWL3nXYvKXHO0mfOwRmrgL
	6geyWtCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwIDl-00000009lhk-3sH2;
	Sat, 28 Feb 2026 11:10:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwIDl-00000009lhd-09YH
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 11:10:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7AC6B60122;
	Sat, 28 Feb 2026 11:10:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A03EEC116D0;
	Sat, 28 Feb 2026 11:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772277052;
	bh=SixLanAX28L3eVA65Z7AUlIyc6aPTHICfbbVTUGJoM0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b3ERNk22ZMaqsJjHlNTD9KmPTKx1jZGzp0/shHe0iURZGbFnck5YLGpnrFIPn3KTw
	 Zzm8rs3rHkG0t9HHaaZN4dFpWvtKf77zjlEcGGsxaVB4q10+8nZNdJXSekrgt1MpO3
	 IYxKodWXE0IjKWdFVgFG6LFD6Wen84WYhhYaFpOrSxtn4pHEY9QLjc/FjCrlaxTTu9
	 jB6XdqCGo4dqmkDZDEVgI8QmHEpgyRyrJi4X2MTE0rO2CyPLWqmHCNB8F8KVpn/Y/L
	 FxoprP83lQf77ioqSiDCKN3/CsZ7IXCVjPxwt2pGP/yJzPTolvmSqr2rynADqkOkJ+
	 Cmgxc+b8NNAbA==
Date: Sat, 28 Feb 2026 12:10:49 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 5/8] dt-bindings: arm: Add two missing Gemini devices
Message-ID: <20260228-dangerous-victorious-pheasant-88995c@quoll>
References: <20260228-gemini-dts-fixes-v1-0-0c6f6d0fb4bd@kernel.org>
 <20260228-gemini-dts-fixes-v1-5-0c6f6d0fb4bd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260228-gemini-dts-fixes-v1-5-0c6f6d0fb4bd@kernel.org>
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

On Sat, Feb 28, 2026 at 01:05:45AM +0100, Linus Walleij wrote:
> This adds the Raidsonic IB-4210-B and the Verbatim
> S08V1901-D1 that were missing from the bindings.
> 
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  Documentation/devicetree/bindings/arm/gemini.yaml | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/gemini.yaml b/Documentation/devicetree/bindings/arm/gemini.yaml
> index fc092962ab56..dfb11244b57e 100644
> --- a/Documentation/devicetree/bindings/arm/gemini.yaml
> +++ b/Documentation/devicetree/bindings/arm/gemini.yaml
> @@ -55,6 +55,11 @@ properties:
>            - const: itian,sq201
>            - const: cortina,gemini
>  
> +      - description: Raidsonic NAS IB-4210-B
> +        items:
> +          - const: raidsonic,ib-4210-b

git grep for this and other gives me 0, so how could they miss from the
bindings?

Best regards,
Krzysztof


