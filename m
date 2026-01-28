Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1A5ED35662
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 07:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=arWR99Pp8oLQP4pwNzpaRZUuoj5zegmS5PZQDvsGeXE=; b=m0oF318byG7rHAFaQoypgwFSQq
	pTmyS+kyH96okbIVL+LNUIbtF4PqZCs3cs2d7bO++5HIMvjw2Xiy5AEVSnWkWOU51+z+2M87qLSog
	ED+DC4pnnIUSOKncw3MdNmGQ68dcubQYjYzTYYUnXo1y+5VSTYu00fgoSph5RhmdJSg3e5BdW3Zii
	2zYz0Q6hNC148UzZ5E6Iwk88CC+n7TlpZUBVxF6eJyE7GY4aMRhf6zrUyanHlavAzzQ2yY25gv1FS
	SLd5tMmg2hqdZfWRwkwFNrldU6htnaYA5zyb3NqFp6pQJXrfV4TiUR6tGNwCGh4kFtwBPfvhJ3ZXo
	pdHIrxWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl08K-0000000FbF2-1Sg1;
	Wed, 28 Jan 2026 07:38:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl08I-0000000FbEw-3YVc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 07:38:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4B0E060007;
	Wed, 28 Jan 2026 07:38:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E8F6C4CEF1;
	Wed, 28 Jan 2026 07:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769585914;
	bh=CxYkdbtO+4+3Z/EXJUvu0H4KA1l87G+n2kMTlUXO36U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RF07kkSSmjiJNPiek0Wu3h5KuLOAHGvQ+kJhV9O774T/vcgXc0ujy3hf0fk3IXOxC
	 U5MBZgygXiN/FWRiG7Y6YIJQCc6j0pm4dC7AtENSIvmVF7AvqugkWBDyOZgi9EXDM9
	 0E5p/JkElIvhRfBme9fgZ5R11ukln1NlRTYBAKxihi1LQNgT0nameti2wLivgk/3yQ
	 hiW4TbQ+EVg24aMjQoNYSfQ3/BOpsDZVsxBeYsF4PUapz5GqsuLbXA3HBKPw5I0k8v
	 ejFT8xi4ghrcgtoT5bnRYs61Qcka28gyWAk/PgN129aGQPyLV3rT+k7QKfXlqiMr9N
	 0hf+/lj6z/peQ==
Message-ID: <5d3a2dac-ef86-4855-9978-79f0815e2c01@kernel.org>
Date: Wed, 28 Jan 2026 08:38:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] Add and enable USB nodes for ExynosAutov920 SoC
To: Pritam Manohar Sutar <pritam.sutar@samsung.com>,
 'Rob Herring' <robh@kernel.org>
Cc: alim.akhtar@samsung.com, conor+dt@kernel.org, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, rosa.pila@samsung.com,
 selvarasu.g@samsung.com, linux-samsung-soc@vger.kernel.org,
 muhammed.ali@samsung.com, faraz.ata@samsung.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 dev.tailor@samsung.com
References: <CGME20260122125130epcas5p4ac37f540c609f3016ff02f5708e897a2@epcas5p4.samsung.com>
 <20260122130721.205664-1-pritam.sutar@samsung.com>
 <176910209177.2703219.7993114273484886473.robh@kernel.org>
 <000001dc8c30$d83ce2e0$88b6a8a0$@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <000001dc8c30$d83ce2e0$88b6a8a0$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 23/01/2026 07:23, Pritam Manohar Sutar wrote:
> 
> Apologize for any inconvenience caused by the issues you’ve identified. 
> Below, Have outlined the changes, will implement to address the warnings 
> and ensure the patch set aligns with the required standards.
> 
> Proposed Changes:
> 1. Will include #phy-cells = <0>; in the USB PHY nodes 
>   (usb_phy0, usb_phy1, usb_phy2, and usb_phy3) 
> This is a crucial addition to avoid compilation warnings and ensure compatibility.
> 
> Example:
> usb_phy0: usb-phy0 {    
>     compatible = "usb-nop-xceiv";    
>     #phy-cells = <0>;    
>     vbus-supply = <&usbdrd31_dwc3_vbus>;    
> };    
> 
> 2. The errors were not caught by the make dt_binding_check and make dtbs_check 
>   commands 
>   make -j ARCH=arm64 dt_binding_check dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
>   make -j ARCH=arm64 dt_binding_check dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
> 
> 3. Once the above changes are verified and tested, I will incorporate them into the
>   next version of the patch set (v3).
> 
> Questions:
> 1. Are the Proposed Changes Correct?
>   Please confirm if the inclusion of #phy-cells = <0>; in the USB PHY nodes is the correct 
>   fix for the issue. If there are additional changes required, kindly let me know.
> 
> 2. Why Warnings Were Not Captured During Initial Checks?
>   The make dt_binding_check and make dtbs_check commands did not flag the warnings,
>   which suggests the schema or bindings might not be comprehensive enough. Could you 
>   provide insights or recommendations on how to improve the schema to catch such issues
>   in the future?

Please explain, why are we talking through microslop ChatGPT?


Best regards,
Krzysztof

