Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BF81C83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 09:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SZvhiaAM1zk89IrSjXe8NpOVN3mQnnTqKGxocKpuCeU=; b=iePfmJ10obRTyR9MjkIxlYEN0w
	Cf+ht2hVR3U2bD5hCj//WjwE6Nl/RcRdJH+zYYFWbXbWRHLrUupsgyAn2VHUK28vZb3w3erfCSrPT
	wNyqjCoA0WD2Hs4nP+sD9VDqfb1oR5rRcYfVhZDt8754GzpELd18bj/wLAtTZ1/5xrNFOrCEBwK4L
	9PKm0R5cnwNuUB9pCv6psnb2s3qdCYM69JsdgI+B+qdRHCOR2YOWC9nRKznUgh10MoQJuaCOgBRIK
	EWg8Uf+VLg/8tkT0+DPN1hY+ev22fFFQE5FFuMaRlJBrYBejiAq6e7hRTixX0Je5d3cViBAwRh4L9
	XnSSAbvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubcBC-00000004jF8-0ftx;
	Tue, 15 Jul 2025 09:42:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubbWX-00000004bio-1VMm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 09:00:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0FFCF44D99;
	Tue, 15 Jul 2025 09:00:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02BADC4CEE3;
	Tue, 15 Jul 2025 09:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752570028;
	bh=/fSaFmzNZewgomFZk/gLqQ6dUoME78cATqFdKv1CmqE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pvFGLVYzhNqOC/kSI/4Xn23X6QKO6JAWGUIK9qSDGVILdYWjEkrt7z0orc36YIju5
	 R4gegq/7RuLBDpkd9CtMwGtznMIh40kIDUNeHEuRVBx35s9Zn6Iksc8lXgu8vlcjOU
	 ZffzQOgArxhE48yxQw3JR48c6gjtk+fMa1rMLf/CDyh2xA/OcyqOBnVoXjVmqMYahP
	 5UOyvYJW4g93R5mbSmSei+e7M6LkdWZ2hiBYWwKulQkMEacrtDLuLkoaqaBaELHciN
	 AQq4gdE6rJ+Nh+F+rkVkL1WFKoPbICTP02WLkIuL4tSJNzXKE5mvLMyRNpQzZ8Bv0+
	 Ej/n5x8jATqAA==
Message-ID: <a1076669-f044-4a84-aa1c-478573bf3c64@kernel.org>
Date: Tue, 15 Jul 2025 11:00:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: ethernet: eswin: Document for EIC7700
 SoC
To: =?UTF-8?B?6Z+m5bCa5aif?= <weishangjuan@eswincomputing.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, rmk+kernel@armlinux.org.uk,
 yong.liang.choong@linux.intel.com, vladimir.oltean@nxp.com,
 jszhang@kernel.org, jan.petrous@oss.nxp.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, inochiama@gmail.com,
 boon.khai.ng@altera.com, dfustini@tenstorrent.com, 0x1207@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, ningyu@eswincomputing.com,
 linmin@eswincomputing.com, lizhi2@eswincomputing.com,
 pinkesh.vaghela@einfochips.com
References: <20250703091808.1092-1-weishangjuan@eswincomputing.com>
 <20250703091947.1148-1-weishangjuan@eswincomputing.com>
 <9316adcb-4626-4ff8-a308-725c6ab34eba@kernel.org>
 <724b4f84.323b.1980d4b15c4.Coremail.weishangjuan@eswincomputing.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <724b4f84.323b.1980d4b15c4.Coremail.weishangjuan@eswincomputing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_020029_442716_8E43BF3D 
X-CRM114-Status: GOOD (  12.91  )
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

On 15/07/2025 10:54, 韦尚娟 wrote:
>>> +
>>> +allOf:
>>> +  - $ref: snps,dwmac.yaml#
>>> +
>>> +properties:
>>> +  compatible:
>>> +    items:
>>> +      - const: eswin,eic7700-qos-eth
>>> +      - const: snps,dwmac-5.20
>>> +
>>> +  reg:
>>> +    minItems: 1
>>
>> Nope. Changelog does not explain that, it is not correct and no one ever
>> requested something like that. See also writing bindings about constraints.
> 
> I have reviewed the writing method from other YAML files in the source code, 
> and they all use “reg: maxItems: 1 ” instead of “reg: minItems: 1”. So we also
> need to use “reg: maxItems: 1 ” in our YAML file. Is this understanding correct?

Yes, assuming you have here one entry.

> 
>>> +
>>> +  interrupt-names:
>>> +    const: macirq
>>> +
>>> +  interrupts:
>>> +    maxItems: 1
>>> +
>>> +  phy-mode:
>>> +    $ref: /schemas/types.yaml#/definitions/string
>>> +    enum:
>>> +      - rgmii
>>> +      - rgmii-rxid
>>> +      - rgmii-txid
>>> +      - rgmii-id
>>> +
>>> +  phy-handle:
>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>>> +    description: Reference to the PHY device
>>> +
>>> +  clocks:
>>> +    minItems: 2
>>> +    maxItems: 2
>>> +
>>> +  clock-names:
>>> +    minItems: 2
>>> +    maxItems: 2
>>> +    contains:
>>> +      enum:
>>> +        - stmmaceth
>>> +        - tx
>>
>> Not much changed, nothing explained in the changelog in cover letter.
>>
> 
> For clocks and clock-names, other YAML files have no minItems
> and maxItems. Remove minItems and maxItems from
> clocks and clock-names and as we have fix 2 clocks. Add description in clocks:items. 
> Ref yaml: sophgo,sg2044-dwmac.yaml, starfive,jh7110-dwmac.yaml
> 
> All the changes will be added in cover letter in the next version. Is this understanding correct?

Yes.

Best regards,
Krzysztof

