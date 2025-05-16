Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1236C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 07:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FmRZQYKpsA98XcslpEE/kRwKmHDbWxw0f+hVuWfJG/g=; b=RFYWzmOXi9CrTiAErW8DLYZWHe
	vbuQrZ5kyTBJ8cT/6YxuYKQITwjzcyzSLpFYwHrQ+mYxRmVvXF4aC3GWlKK4o8IXYipng+MYln/fH
	WsYzySLbjs+ADcsyQ0lbhMt9CtBMuluIoMlyOWgVAZ/dimWw7bukhOQzqXNrywCPeBVoYzenw1FDs
	/dt70z0+SNk/I5T/lAiiOEI9DuVPy8K6jVtwhXwGBxkoNa3tUBv8YWVnBcZpGhui82naIbEnGFnd4
	yT8mmqgMQ95GvozvYopkQYXyFf0Zs9pwqxEypPz4mzYztisQhmN4XOtfUKzS1n2NY8UmmuuNm9U2L
	d92+UIhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFpmb-00000002hX3-3miR;
	Fri, 16 May 2025 07:47:05 +0000
Received: from mail-m49241.qiye.163.com ([45.254.49.241])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFpkS-00000002gzq-1oic;
	Fri, 16 May 2025 07:44:54 +0000
Received: from [127.0.0.1] (gy-adaptive-ssl-proxy-1-entmail-virt204.gy.ntes [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 15447ed97;
	Fri, 16 May 2025 15:44:39 +0800 (GMT+08:00)
Message-ID: <e86fec57-de90-4663-9a32-7c50a97cde67@rock-chips.com>
Date: Fri, 16 May 2025 15:44:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] dt-bindings: display: rockchip: Convert
 cdn-dp-rockchip.txt to yaml
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chaoyi Chen <kernel@airkyi.com>
Cc: Dragan Simic <dsimic@manjaro.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250513011904.102-1-kernel@airkyi.com>
 <20250513011904.102-3-kernel@airkyi.com> <2745929.KRxA6XjA2N@diego>
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <2745929.KRxA6XjA2N@diego>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGk1CSVYfSkIdGBlLTh1JTx5WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a96d80d673803abkunm2d3213c01ca95b
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Nz46DAw6PzExCDYqMTgUPBhC
	ExAKFDJVSlVKTE9MSENKT0NNSExLVTMWGhIXVRgTGhQCElUYEx4VOwkUGBBWGBMSCwhVGBQWRVlX
	WRILWUFZTkNVSUlVTFVKSk9ZV1kIAVlBSU9CTzcG
DKIM-Signature: a=rsa-sha256;
	b=gkwgkjXlmwVOg3emov54bWNmQ1ubniLLIoSOjKfg5mEc2hU3kFdn4I0DELqTTHGZzUfzNtVeSguuROWSIs1v6ZOmVpJ6jgtcIbG7x7OJVOObwxO0Tig8aeQYt4seLgQYX2Mqt0TfWExTJl7lmSJgHfz6iavTQYvq2y6wMuO+jiU=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=FmRZQYKpsA98XcslpEE/kRwKmHDbWxw0f+hVuWfJG/g=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_004452_962966_339BD1FF 
X-CRM114-Status: UNSURE (   9.59  )
X-CRM114-Notice: Please train this message.
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

Hi Heiko,

On 2025/5/15 21:00, Heiko Stübner wrote:
> Hi,
>
> Am Dienstag, 13. Mai 2025, 03:19:04 Mitteleuropäische Sommerzeit schrieb Chaoyi Chen:
>> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +
>> +    properties:
>> +      port@0:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +        description: Input of the CDN DP
>> +        properties:
>> +          endpoint@0:
>> +            description: Connection to the VOPB
>> +          endpoint@1:
>> +            description: Connection to the VOPL
>> +      port@1:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +        description: Output of the CDN DP
>> +
>> +    required:
>> +      - port@0
>> +      - port@1
> you're adding the 2nd port (port@1) as output port, which has not been
> part of the old binding. I think this warrants an explanation in the
> commit message on what it is meant to contain.

This is mainly to keep consistent with the binding style of other 
display interfaces, which all have an Input (port@0) and Output (port@1).

This change has no effect on the driver.  I will explain this in v4.



