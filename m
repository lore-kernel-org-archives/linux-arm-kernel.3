Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F09F5C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 10:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nQTC+UbEpPfIerFs6/JqZKz/8nKSu2MSAWuhuo9inQE=; b=ZWTo/vDx3j3hhqHHhYbg5l2gJV
	atSJOqtm8bJC3A9Vf5JPZaO0esOpcOg1zHQrVFwQdxyBPvhaQeGve+u1eyGCTVOjORVPAbMi539KL
	Omf82PKbBFflK4tV9SBqMLEc1xm2btO/3OwPxb3rTCRVXwGeAAUsC8bjV7dkAE97wo7iG1EinFGR2
	XlAhFnFlYrFtDfZE9DlZUWrSb3+EZtPURFe4u6e/dHcg7sqIqOy9Z+3ikqRs3hsnzXhpsMgeuJZvl
	/9ggFflY/q4zikDaDiKcW8ldqo3Coom/+MgTKPvPlnxkrcenXbyTc+eMIn9rZot3o2i56402NYn7U
	eIIA1q9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1titNx-0000000EaCE-3wfn;
	Fri, 14 Feb 2025 10:57:29 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1titMV-0000000EZgi-1Ovc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 10:56:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 37C34A428A6;
	Fri, 14 Feb 2025 10:54:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ECA6C4CEE6;
	Fri, 14 Feb 2025 10:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739530558;
	bh=nDoYZ61Y7FckgQVxnTynsl6BGiFLGniurrtI8ZD3LuI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=J5227bCzjw1jOrbCkwiKJ3V3JlULVrf6vmDsNzl82zKG/WZ1nEoz/UL+a9koqH+H/
	 4AtcYzCgXmxGt/Z4yJ5AY7iNaWWAD9e20xX5BAiVbre0zUQ0lArQUy30vl9030Atrb
	 tubs9hROmmW4+HpZniDcZNsuPX2h1SHk5kr1Xlg/heHVDZFRYqya6korH6wKmr9uHu
	 vOJ+rdYeUDOMOmTG9hfm6qpwUThyTNrEHQ9U/gXfgoCQ7t2DnXfm7+BXqHil2pVEh+
	 pHQ0+RRcbPfYQlTOmF1oMXoIh3eCGCt/yZezu0CQm0kp/2CShGAioSnJlpmu2boVG8
	 7tTtrdHCWqP8w==
Message-ID: <904930a2-61e7-4dba-8752-deff45cfeb2e@kernel.org>
Date: Fri, 14 Feb 2025 11:55:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] dt-bindings: net: Add FSD EQoS device tree
 bindings
To: Swathi K S <swathi.ks@samsung.com>
Cc: krzk+dt@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
 conor+dt@kernel.org, richardcochran@gmail.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, rmk+kernel@armlinux.org.uk,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 'Pankaj Dubey' <pankaj.dubey@samsung.com>
References: <20250213044624.37334-1-swathi.ks@samsung.com>
 <CGME20250213044955epcas5p110d1e582c8ee02579ead73f9686819ff@epcas5p1.samsung.com>
 <20250213044624.37334-2-swathi.ks@samsung.com>
 <20250213-adorable-arboreal-degu-6bdcb8@krzk-bin>
 <009a01db7e07$132feb60$398fc220$@samsung.com>
 <27b0f5c5-ae51-4192-8847-20e471c55be7@kernel.org>
 <00ad01db7e9c$76c288a0$644799e0$@samsung.com>
 <7d50f55d-d0cd-4741-ab55-2f54dc45d6ab@kernel.org>
 <00ce01db7ec3$7f9ab750$7ed025f0$@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <00ce01db7ec3$7f9ab750$7ed025f0$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_025559_515077_797C544A 
X-CRM114-Status: GOOD (  10.88  )
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

On 14/02/2025 10:33, Swathi K S wrote:
>>> Could you please help in detail what specifically needs to be modified
>> regarding the ordering and minItems/maxItems usage?
>> You did not try hard enough.
>>
>> Open other bindings and look how they list clocks. For example any Samsung
>> clock controller bindings. Or any qcom bindings.
> 
> Thanks for your insight. I tried understanding the dt-binding implementations from Samsung/ qcom as you suggested.
> I am thinking of making the following modification in clock-names:
> 
> clock-names:
>      minItems: 5
>      items:
>          - const: ptp_ref
>          - const: master_bus
>          - const: slave_bus
>          - const: tx
>          - const: rx
>          - const: master2_bus
>          - const: slave2_bus
>          - const: eqos_rxclk_mux
>          - const: eqos_phyrxclk
>          - const: dout_peric_rgmii_clk
> 		 
> Does this align with your feedback or do you suggest any further changes?

Yes.

Best regards,
Krzysztof

