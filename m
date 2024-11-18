Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F002CD49207
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 15:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vzs4vt6w15sXAXLkQP0Zktd5p6ChVpzECd9BbiSAAOM=; b=xuIc2j+zP2yH3Kx0aRArlQ9akz
	Kf+jsCX1TP6zB75RFVxkrbVs5MArZB0efGai50qeefqLCfyrR8CBlGmoY75M4SzXSxQAbHJwzhgFI
	UsAZxhHu02+xlQEz4AB2Z1q3pyqqN6YDlwVZrxNFBqHEbAQIj69eWlJMR3tiO0imYMjcuNKSqoknc
	2AuSsHfpMMeDO8pajUYF7hvrbEV5ZdOF3PDoU60tAWZt0WxGCCjrdrP7sCyq/+pEpRU2Xm3kEOF0E
	8RB00AZwZ+S1KG+QtpJ530GFq/C/IbQN6iLR168pKdtprTwLtpaTD3tXQnPIRe0Jh1DxjIiS2oFoK
	bkq3yrQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tD49Z-00000009zqu-1U0B;
	Mon, 18 Nov 2024 15:59:05 +0000
Received: from out-170.mta0.migadu.com ([2001:41d0:1004:224b::aa])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tD48R-00000009zJQ-1BQv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 15:57:56 +0000
Message-ID: <410bf89c-7218-463d-9edf-f43fc1047c89@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1731945471;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vzs4vt6w15sXAXLkQP0Zktd5p6ChVpzECd9BbiSAAOM=;
	b=r/ar/5vugQgGutY0z0Ss+XPmIwu6J6w2HPZGeDs3ApIgamwCXf3GJbw9FSWUaxcRkUuJ2A
	Kupj79l47OSOExMAeKJM8A76/dKeZFQmeNq6B4yn5/lpk0NeXA4H3EZoCLj2MQjPMoJSd5
	EqtXQPfRJgcFNP0RtB08HgsY4+jv+4Q=
Date: Mon, 18 Nov 2024 10:57:45 -0500
MIME-Version: 1.0
Subject: Re: [PATCH net-next 1/2] dt-bindings: net: xlnx,axi-ethernet: Add
 bindings for AXI 2.5G MAC
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Suraj Gupta <suraj.gupta2@amd.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, michal.simek@amd.com,
 radhey.shyam.pandey@amd.com, horms@kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 git@amd.com, harini.katakam@amd.com
References: <20241118081822.19383-1-suraj.gupta2@amd.com>
 <20241118081822.19383-2-suraj.gupta2@amd.com>
 <20241118165451.6a8b53ed@fedora.home>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <20241118165451.6a8b53ed@fedora.home>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_075755_466947_EA07F9C4 
X-CRM114-Status: GOOD (  16.64  )
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

On 11/18/24 10:54, Maxime Chevallier wrote:
> Hello,
> 
> On Mon, 18 Nov 2024 13:48:21 +0530
> Suraj Gupta <suraj.gupta2@amd.com> wrote:
> 
>> AXI 1G/2.5G Ethernet subsystem supports 1G and 2.5G speeds. "max-speed"
>> property is used to distinguish 1G and 2.5G MACs of AXI 1G/2.5G IP.
>> max-speed is made a required property, and it breaks DT ABI but driver
>> implementation ensures backward compatibility and assumes 1G when this
>> property is absent.
>> Modify existing bindings description for 2.5G MAC.
> 
> That may be a silly question, but as this is another version of the IP
> that behaves differently than the 1G version, could you use instead a
> dedicated compatible string for the 2.5G variant ?
> 
> As the current one is :
> 
> compatible = "xlnx,axi-ethernet-1.00.a";
> 
> it seems to already contain some version information.
> 
> But I might also be missing something :)

As it happens, this is not another version of the same IP but a
different configuration. It's just that no one has bothered to add 2.5G
support yet.

And to my understanding, the device tree should not contain any info
that can be reliably detected from the hardware.

--Sean

