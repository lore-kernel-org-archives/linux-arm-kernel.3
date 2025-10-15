Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2E15CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 19:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5fIA9FaPPETqVsjDQH1CiMXcVhmf9EAWPOPsF59hM08=; b=EZbmn4g5c+7+MRbsK9wcMpGL8v
	YzzNmX3w+eDA6ku475BBo9dufJmchkWjGGtODjn0x7g1qghBD18Eab9Q7sn6KCovOdMNJeRkRbkJF
	QgLRZoutRdVvhKHPbEDxnJYg9ZO8sMdfAkXUr/RdjMmH7jYjVeVJvCjKipsXqUiU6j7syPb/4nk8u
	3URdynKXTSH8a0p1nn6VaDjvt6BM9XPCQ6aP1wYFx1Oyv5OGoEQu064Icbrxl3mPoCQQPOw0lMuf3
	HaIUeuR5L1PhUjNC9g5jzA/Cm3KLO+SgrxvqcyZQyZbZJOIhkZlThrS6s1z7WD6eIEHeIBF2kwAHf
	ErIWbehg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v97V5-00000002mmX-1USi;
	Wed, 15 Oct 2025 19:49:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v97V3-00000002mm0-0hwk
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 15 Oct 2025 19:49:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=5fIA9FaPPETqVsjDQH1CiMXcVhmf9EAWPOPsF59hM08=; b=VCs9RKCajquay2xdyVajfXwnQ9
	FoVbhjYrveMqsEXGQSAKxb6YMM2UTWgS0LQuva+rUMEjvfCZeWItRwyDQSELr2G9wBVBvL4cAE7Lx
	8+Zg4GODeoNF00dPgbOvVapY7sDlBnZuSeNrTOkLCvp7NsI5HQqQ2IJ8rJPTMyifSHPSRkyCZbP+O
	zJ4Vr76hQPCgs07bfYsCy0UVethGTPI+vvQx8phPB+JBY6qnFa+B3S/60kZny+6kdgaUu11m7jirg
	tPs0IRxcQeYaLZedlH2PmmQi7oGpELWaay5k92NCMOl3B1/MNE+k2n21BPdo9GDfQh0pzc6epBph9
	Y8lK8hxQ==;
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v97Ub-00000006Ckk-2kcm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 19:49:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1760557729; bh=tJUGuCu7ggRIyopQyMCtc58g1/733SmlpECwCzvrvNw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dDIadWK1+hrZWjIOZwX6YBWXbF3dy2MJkZbjcv0SEfiyzid4Z4drBshnL3owHmAb4
	 OYNrwKEYm6QFDI7sfEHeHVu8gUlvnnw+vLJwgme1ImlrmQhyaO5Yk7XvtjfK/rky4+
	 2rUKQYGThZdddTPAG9vpv8xip4tiXsnzh6u0NtyyDBTD+DtjNrfpLzifcjyB3G1Fil
	 BK+/S8Y8c0nem7m6bs2VJyJ5AgvXk2uD+LGKWRknkaymjy/P0ER7N+jIbH6MBPfGL2
	 S+qAPxq7AREcNEobzh7O/fAbnBJH9KV+3jGSCyv8XNJJzMwAZQyy1M9/7gGPSv/4n/
	 PwbLkc2mGuAOw==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 3C6383DA3EC;
	Wed, 15 Oct 2025 19:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1760557729; bh=tJUGuCu7ggRIyopQyMCtc58g1/733SmlpECwCzvrvNw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dDIadWK1+hrZWjIOZwX6YBWXbF3dy2MJkZbjcv0SEfiyzid4Z4drBshnL3owHmAb4
	 OYNrwKEYm6QFDI7sfEHeHVu8gUlvnnw+vLJwgme1ImlrmQhyaO5Yk7XvtjfK/rky4+
	 2rUKQYGThZdddTPAG9vpv8xip4tiXsnzh6u0NtyyDBTD+DtjNrfpLzifcjyB3G1Fil
	 BK+/S8Y8c0nem7m6bs2VJyJ5AgvXk2uD+LGKWRknkaymjy/P0ER7N+jIbH6MBPfGL2
	 S+qAPxq7AREcNEobzh7O/fAbnBJH9KV+3jGSCyv8XNJJzMwAZQyy1M9/7gGPSv/4n/
	 PwbLkc2mGuAOw==
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi [91.159.24.186])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mleia.com (Postfix) with ESMTPSA id A97703DA36F;
	Wed, 15 Oct 2025 19:48:48 +0000 (UTC)
Message-ID: <b75b30d4-e33e-4620-bc37-56b36612364c@mleia.com>
Date: Wed, 15 Oct 2025 22:48:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND v2 1/1] dt-bindings: arm: lpc: add missed lpc43xx board
To: Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/LPC32XX SOC SUPPORT"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
Cc: imx@lists.linux.dev
References: <20251015184846.2509016-1-Frank.Li@nxp.com>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <20251015184846.2509016-1-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20251015_194849_266330_AB8984CD 
X-CRM114-Status: GOOD (  11.34  )
/bin/ln: failed to access 'reaver_cache/texts/20251015_194849_266330_AB8984CD': No such file or directory
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_194849_266330_AB8984CD 
X-CRM114-Status: GOOD (  14.18  )
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

Hi Frank,

On 10/15/25 21:48, Frank Li wrote:
> Add missed legancy lpc43xx board compatible string to fix below CHECK_DTB
> warnings:
> arch/arm/boot/dts/nxp/lpc/lpc4337-ciaa.dtb: /: failed to match any schema with compatible: ['ciaa,lpc4337', 'nxp,lpc4337', 'nxp,lpc4350']
> 
> Reviewed-by: Vladimir Zapolskiy <vz@mleia.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

I'll take it for v6.19, thank you.

If you have any other changes in the queue, please feel free to send them also.

> ---
> Resend
> - colloect R-b tags.
> 
> change in v2
> - move to nxp lpc32xx.yaml
> - fix ea,lpc4357-developers-kit include lpc4337
> ---
>   .../devicetree/bindings/arm/nxp/lpc32xx.yaml  | 22 +++++++++++++++++++
>   1 file changed, 22 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/nxp/lpc32xx.yaml b/Documentation/devicetree/bindings/arm/nxp/lpc32xx.yaml
> index 6b7f5e6f99cfb..1e290f16a7a50 100644
> --- a/Documentation/devicetree/bindings/arm/nxp/lpc32xx.yaml
> +++ b/Documentation/devicetree/bindings/arm/nxp/lpc32xx.yaml
> @@ -22,5 +22,27 @@ properties:
>                 - phytec,phy3250
>             - const: nxp,lpc3250
>   
> +      - items:
> +          - enum:
> +              - ea,lpc4357-developers-kit
> +          - const: nxp,lpc4357
> +          - const: nxp,lpc4350
> +
> +      - items:
> +          - enum:
> +              - ciaa,lpc4337
> +          - const: nxp,lpc4337
> +          - const: nxp,lpc4350
> +
> +      - items:
> +          - enum:
> +              - hitex,lpc4350-eval-board
> +          - const: nxp,lpc4350
> +
> +      - items:
> +          - enum:
> +              - myir,myd-lpc4357
> +          - const: nxp,lpc4357
> +
>   additionalProperties: true
>   ...

-- 
Best wishes,
Vladimir

