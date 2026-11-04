Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A147606A328
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 10:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nZFs8RFA;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=b6/VbMmw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Awio7RId/8LME8MSZg4JrTdUAU4hYKWNdYybYK4ASqU=; b=nZFs8RFABaKuaU
	nX6obZ3/V2C1caeTr/WZiam/Vx0Va+o1eqtS7xAi73L4kyZOf6aH7lJliigWqesjdhwsUvbGIzA2X
	KG6GbmoLxTDWV+Hnv4wMvMPwcT03K4kdRSLJABLIU0D+ay1VonXHvJsVdzp8+590qJv2N6QLWjSnm
	5DWLvmya+HCeS8NCEWLVZIAoo3CT5smBJQk+4Lh+4uRyzwoRjgSsy8LQPyoPGb15UBwYbQlBomhvh
	AT00htlr1/iDEj4hvPJ5BpEdNR70Y7vbnQZIfhWT0rPgiUJzgpcSdjzhUBQojOzHQWMvjrPzYp3pP
	Dqc5+vUE2ur1luDabXew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOYiV-000000054uW-3tBE;
	Wed, 04 Nov 2026 10:59:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOYiT-000000054sb-1ZnO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 10:59:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 78A4222EA;
	Wed,  4 Nov 2026 02:59:35 -0800 (PST)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 07FDE3F628;
	Wed,  4 Nov 2026 02:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793789978; bh=O82otjfYbzrbsMdYHm1dg0YttcpeVMXQMdvlI0lqyik=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=b6/VbMmwviI0PTu9dcW3SXxOUx6kJ9Rv3QIVBQORpkIxWz3lxrsQ69NBzPi1nnHWN
	 LRgA/d6cItBHCkFCYPGsU6RCpFmPu1J6VNpcyANfbxbCbWHVLwH688T5a5Ms7sKhn+
	 VMk8LTzzxBPKHpVV88xeJ2Psg+XDTk3ry6uDueLQ=
Message-ID: <32461e0e-2512-451a-8eca-f2df63553379@arm.com>
Date: Wed, 4 Nov 2026 11:59:34 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 06/12] dt-bindings: serial: snps-dw-apb-uart: add
 Allwinner H616
To: James Hilliard <james.hilliard1@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20261103-submit-h616-uart-fifo-v1-v7-0-c9e248d685c1@gmail.com>
 <20261103-submit-h616-uart-fifo-v1-v7-6-c9e248d685c1@gmail.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20261103-submit-h616-uart-fifo-v1-v7-6-c9e248d685c1@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_025941_509060_CD41299D 
X-CRM114-Status: GOOD (  21.04  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On 11/3/26 22:39, James Hilliard wrote:
> The H616 UART has 256-byte transmit and receive FIFOs, but its DesignWare
> component parameter register does not report the FIFO depth. Its optional
> register layout also differs from the generic DesignWare integration.
> 
> Add a specific compatible to identify this fixed configuration, retaining
> snps,dw-apb-uart as a fallback.

I think we should not focus too much on single SoCs here, all the 
Allwinner UARTs need some care. We should have had SoC specific 
compatible strings (plus the fallback) from the beginning, but we 
didn't, mostly for historic reasons and because it just worked (TM).

So just from looking at the Allwinner A10 (the first one really 
supported mainline, since 2012): the manual reports a FIFO size of 64 
bytes, and it has none of the DW config registers.

So I'd suggest:
- We add compatible strings for *all* Allwinner SoC's UARTs in here, 
regardless of whether we currently need a quirk for each of them or not. 
This is now regarded best practise for DT anyway, we just catch up on this.

- The FIFO depth is all over the place for the various SoCs, and most of 
them do not implement the CPR register to announce the size. So we 
should use the already existing generic DT fifo-size property to 
describe the size. This is the simplest, yet most flexible solution, and 
avoids hardcoding implementation specific values in the driver. And it's 
friendly to other users of the DT nodes, be it U-Boot, the BSDs or 
whatever else is out there. IIUC, that should already work out of the 
box with the current Linux driver?
Since we need to touch the DTs anyway, I think this is the best way forward.

Cheers,
Andre

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>   Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
> index e2ca126d58ba..fc1289073241 100644
> --- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
> +++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
> @@ -60,6 +60,7 @@ properties:
>             - const: renesas,rzn1-uart
>         - items:
>             - enum:
> +              - allwinner,sun50i-h616-uart
>                 - anlogic,dr1v90-uart
>                 - brcm,bcm11351-dw-apb-uart
>                 - brcm,bcm21664-dw-apb-uart
> 


