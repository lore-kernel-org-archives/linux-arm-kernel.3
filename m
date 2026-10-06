Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC1ACCA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 18:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RZ7Zbdj+yKYKNXrBaPGB9zhpgSXQIaPLXdeU1VEC/2g=; b=r2zTT+8uy8eG4xMrLamxpRCHmP
	ncHAKI7IU9IvYB257fTiKKaQXB2ovIHNGpV4XqM6iy/hicxsFp23R15laBSbfvyt+9/tkR58eoURQ
	+1bJvDM0X/mItaTaRLnSRIqMUW/+0x6M/C93K+EXoxXoKv7EjIVB3lQRE5WjEtO2ZW5RYf6WeraQT
	ygikXpMAbTGvTeIKU/fdq7UrbjlpAepyiF0+jkrq5xVqrdl2RVQXvCe4udxfMKuSMu7Ax/qDoaaGe
	sXsP1g1qeiWyBb84MmgsdQmsKD4wj6FcAEXYo8NyHMPthRzbWT4M/kK1dLcehpXZBQGE1GPQ8k3Hy
	DW/fuBrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE9c4-00000001F9g-3Ala;
	Tue, 06 Oct 2026 18:10:04 +0000
Received: from mail.cyberchaos.dev ([195.39.247.168])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE9c1-00000001F8w-1K3B
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 18:10:02 +0000
Message-ID: <2687bc3e-b73a-415c-8c68-8249e1fe4e6b@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1791310194;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RZ7Zbdj+yKYKNXrBaPGB9zhpgSXQIaPLXdeU1VEC/2g=;
	b=sOtzM009DrBMvU9D6riKuu1ASNyS2/4w4Xm0K/Nx+RPjC8cIbI0xqFpo2urN42HF0elFcX
	kQXqcZ42s6Tso4JvM6tsYw8uZ07FnJyagBKCKbiD05AJaHZGX7Q+L/y4LH6G6CRxjPHLkf
	Hj0a26GpymZcg0YKSUBZ1aFuQeBitN8=
Date: Tue, 6 Oct 2026 20:09:47 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v4 04/10] dt-bindings: input: apple: Add DockChannel HID
 transport
To: Rob Herring <robh@kernel.org>,
 Michael Reeves <michael.reeves077@gmail.com>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, Jassi Brar <jassisinghbrar@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Hector Martin <marcan@marcan.st>,
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, iommu@lists.linux.dev,
 linux-input@vger.kernel.org, Yureka Lilian <yureka@cyberchaos.dev>,
 Julian Braha <julianbraha@gmail.com>, Sasha Finkelstein <k@chaosmail.tech>
References: <20260925-apple-mtp-keyboard-final-v4-0-304c267518f4@gmail.com>
 <20260925-apple-mtp-keyboard-final-v4-4-304c267518f4@gmail.com>
 <20261006160049.GA2406717-robh@kernel.org>
Content-Language: en-US
From: Yureka Lilian <yureka@cyberchaos.dev>
In-Reply-To: <20261006160049.GA2406717-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_111001_623510_A6118599 
X-CRM114-Status: GOOD (  14.78  )
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


On 10/6/26 18:00, Rob Herring wrote:
> On Fri, Sep 25, 2026 at 10:09:31PM +1000, Michael Reeves wrote:
> [...]
>> +
>> +  mboxes:
>> +    items:
>> +      - description: ASC mailbox used for RTKit control
>> +      - description: DockChannel FIFO mailbox used for HID packets
>> +
>> +  mbox-names:
>> +    items:
>> +      - const: asc
>> +      - const: dockchannel
>> +
>> +  iommus:
>> +    maxItems: 1
>> +
>> +  stm:
>> +    type: object
>> +    description:
>> +      STM interface providing the vendor, product and version identifiers
>> +      and serial number shared by the HID devices. When present, the host
>> +      must query this interface before registering the keyboard.
>> +    additionalProperties: false
> An empty node is unusual. Why can't you just query the STM interface and
> treat it not existing or having those properties the same as no 'stm'
> node.

The issue is there is no indicator for the stm *not* being present: We 
boot the MTP coprocessor, and then receive a message when the stm is 
available. In that case we know it's ready and we can proceed with 
obtaining the serial numbers and registering the hid devices. But if 
there is no stm, we simply do not get the stm ready message, and the hid 
devices are never registered (this is the case in the original 
downstream Asahi dockchannel-hid). To make the stm optional *without* 
taking the information from the device tree, this would require some 
sort of timeout for waiting for the stm ready message. I outlined the 
available options in this thread[1] and argued the empty stm subnode 
makes sense, since this is describing a peripheral which may or may not 
be present (and this information is useful to initialize the device 
properly).

Link[1]: 
https://lore.kernel.org/asahi/bbaca769-312c-4a24-9524-16cb2b4f277f@cyberchaos.dev/


Thanks,

- Yureka



