Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6608C36008
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Mar 2025 04:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZOtbZWHKJq1fKUTHc3MKAcM5tyMaffSyZyyDs2jaTtY=; b=zXv1fqPFWknMVYAN7ShI4xp91H
	AAXtfXXv74747PIIwn5Wg80r4lCMc/VD7GWs3Nu6l69xVPvyEe/3Gsgvq/LYe4uGaFNDVUPd1Lexd
	hYQTLBsH3AwkoI9tYdlK3Ils4eZGYvnzFrWoNoF1VEFXlXvvM2pIGnl9HZhEX82DUCYXL21r+sHd6
	bvmeE9n9tuAVaqYCgVFmN1wz5FU8CW0H3DYMwB0A5VvAJgV+QonsW1eAaM9vLsE/gaZrO/BY179Nx
	cBIBq4A4VX+zV01ZhBkYEFgrgmbVaIiObyjt8vN4azZlUdApaJPp4wdn1KD5m6o25mk0ncZc6EDyl
	NY89/zwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyNzn-0000000EiLP-1OvC;
	Sat, 29 Mar 2025 04:40:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyNy2-0000000EiFL-2Fo3
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Mar 2025 04:38:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E32BD5C256E;
	Sat, 29 Mar 2025 04:36:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A214CC4CEE2;
	Sat, 29 Mar 2025 04:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743223125;
	bh=7q+Yck0Cj6soZ9tM/uUP3AbbuXduATe0/O5ptwVEFl4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uwfM2noPG2VVUQs9TuPyNnrEGG27RYJpinuBps7bz436mXOYOs6HdJ4V1lmjdNLU/
	 GJ0/oEcBRdZAmEU/u3HU81vNQPnJfM7tnxJJM+ljzMyFlh+VTEWLGsaeDgxvURn6q/
	 p6tniCTH2Etqhak7oe4L/ZTYwOJwDOACKgVN3GxBRCgDzX4raGBQCLHUQtWaMr4RsL
	 2HIACrUIMEWxOpsQZOCIbWiILdKNsL4c5In2i32SEwBOn6qzJWlq0HB7tGRrNeoK8O
	 QuyN7VJuHbadyKsPuTLBEbrjCmc5G/LE0CD/EAmm3nRmdtz0mLWbITJEl411iHlKhA
	 u+vYO50fiOhig==
Message-ID: <26ab079e-9178-4936-9dd9-6aa66916a59a@kernel.org>
Date: Sat, 29 Mar 2025 05:38:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: soc: ti: bist: Add BIST for K3
 devices
To: Neha Malcom Francis <n-francis@ti.com>, nm@ti.com, vigneshr@ti.com,
 kristo@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, u-kumar1@ti.com
References: <20250328111439.374748-1-n-francis@ti.com>
 <20250328111439.374748-2-n-francis@ti.com>
 <fc4d9a33-2d3f-47e2-b1cf-59962cc54bce@kernel.org>
 <71f19095-02c5-4d9a-8c6f-c51fb4ea9b36@ti.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <71f19095-02c5-4d9a-8c6f-c51fb4ea9b36@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_213846_672399_765E8C60 
X-CRM114-Status: GOOD (  14.99  )
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

On 28/03/2025 13:42, Neha Malcom Francis wrote:
> On 28/03/25 17:18, Krzysztof Kozlowski wrote:
>> On 28/03/2025 12:14, Neha Malcom Francis wrote:
>>> +properties:
>>> +  compatible:
>>> +    const: ti,j784s4-bist
>>> +
>>> +  reg:
>>> +    maxItems: 2
>>> +
>>> +  reg-names:
>>> +    items:
>>> +      - const: cfg
>>> +      - const: ctrl_mmr
>>> +
>>> +  clocks:
>>> +    maxItems: 1
>>> +
>>> +  power-domains:
>>> +    maxItems: 1
>>> +
>>> +  ti,bist-under-test:
>>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>>> +    description:
>>> +      the device IDs of the devices under test control of the BIST device, the
>>
>> Still not phandle... What is a "device ID"?
> 
> I took a shot at working with the phandle, however the test devices may
> or may not be present in the devicetree at bootloader stage which is the

If the nodes are not in DT, then you should not reference them here.
Bootloader is supposed to receive all the nodes it is expected to work on.

> only place this BIST driver can execute (I know I shouldn't be bringing
> up the driver here but it's crucial to how I can model this property).
> HW mandates you run it as early as possible before any other software
> executes on the test device.
> 
> So now thinking of other possible ways to define the test devices, we
> have unique HW identifiers [1] for each of the device which is what I've
> used here...
> 
> [1]
> https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/arm/keystone/ti%2Ck3-sci-common.yaml#L31

Then do not redefine properties, but use one common definition.


Best regards,
Krzysztof

