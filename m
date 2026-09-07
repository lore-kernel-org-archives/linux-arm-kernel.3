Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4FCAC79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 17:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VPIix+7AnaBedj/9o6f9YRK+QLjnUUv24fnzZhVoMeY=; b=LhXhw3P6Dxhc51p0giIzpEhFn0
	DupvcfSjSp2Wx+lgk9QwvvD0Nt7hZwhNZVhFXuoo9R0BBTm0XsBYHRraKDWk78eg1VTbqrMwtU8a3
	HzfJN4O9MOAhiNhdd46HHyw+hV2OQOuvMdwglQ3JAmwvQa4g3OGYbXnVRViJEToTS1sedJXYXGnY6
	fhNHGo/Dg09rtVNBc3YW6wuQ1X5+u9i691AwR5f7veQf0cVRDb50ds3nn4y2REXqnEyM1E07qyUkt
	mrw2DjgSpozRBBBlXL4pAXjNwRHW+ItGaFE3zaqzdOlEpUB/UTtSlbzEyJje+ewbEDMFM754wPWdJ
	p7SQyXpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3d4Z-00000007U1m-2HuN;
	Mon, 07 Sep 2026 17:23:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3d4X-00000007U1W-3MtC;
	Mon, 07 Sep 2026 17:23:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 741184184A;
	Mon,  7 Sep 2026 17:23:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 674201F00A3A;
	Mon,  7 Sep 2026 17:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788801837;
	bh=VPIix+7AnaBedj/9o6f9YRK+QLjnUUv24fnzZhVoMeY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=AJvMuifV/ySOJl35bWcRxUaZJ5UPFD8LTnXwHqNkE8397RX+9FesEOyfk1YcJrz4n
	 Fx0Mf1BatExxqtDFrIOyrWYHXW/WwZ717n8XtUOb34tx+X4dmXGgs6SEeWBOrza71H
	 +WZw7XZzG7fNsl4AKsXW/wpO5I8KEq4gYw128qr3oePlvnPPyorqklx7Hdtq08lMTf
	 oRnPazAmw1GUUeueqLoAaRWgE2amzDnP1tvVP+Q/cY0Q8bvjmINIJjyRriqt9ZjFGD
	 cBLUpT8P0xIIH/7xVZbKOhf6MMzN34Sx/xMf1akGFfOHRsiPdug63huToARwjGSyJO
	 yLxHrpLGPm2YA==
Message-ID: <4c10971a-6165-49e6-b97f-978bbe6e1cb3@kernel.org>
Date: Mon, 7 Sep 2026 19:23:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] nvme: apple: add t8132 (M4) ANS2 NVMe support
To: Yureka Lilian <yureka@cyberchaos.dev>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Keith Busch <kbusch@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org
References: <20260906-apple-nvme-t8132-v2-0-ac0328590823@cyberchaos.dev>
 <20260906-apple-nvme-t8132-v2-2-ac0328590823@cyberchaos.dev>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20260906-apple-nvme-t8132-v2-2-ac0328590823@cyberchaos.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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


On 9/6/26 22:15, Yureka Lilian wrote:
> Add support for ANS2 NVMe on the Apple t8132 (M4) SoC.
>
> This variant requires the IO queues to be registered using additional
> MMIO writes. The qsize of the create_{cq,sq} command is now ignored, and
> instead a write to mmio_nvme+0x1210 (which was previously known as
> APPLE_ANS_MAX_PEND_CMDS_CTRL) sets the IO queue sizes.
>
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
> ---
Reviewed-by: Sven Peter <sven@kernel.org>


Best,

Sven

