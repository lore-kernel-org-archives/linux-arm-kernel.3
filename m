Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 203CCCD343F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 15:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qVt3lmzQ7N6PZH719ot9HwSZfxNbFLse3Q7BGP9gLo0=; b=b7PFHPSqy5dMYV
	FZZFcc6Vk04NJLOXOZg4bJdJipW3IUxHS+jfj4zJdpgZjyz5mLMjM2qcBb0kgZs2V91JkIC+xJ4yY
	mAgVYF2lDdQjOHvOoHi8DUKiCpj7/da+4pGLYsspCjK4EHHhWRqrwF2qeuHpY/6nJvogN/XJYb9TN
	a4NQeTGMEobm0+RVtntbhffnKUZhi72a1rpJCmvij4M3WQeoGjZJ2JaTN9f4bqQLti9O7RUPSfMuz
	WxDrtz2nBfikcYxrJm1uVJ38WK3OSNapZOFMhGszK0V08nLyFi2asYIPqGsX5BhR8p+pRMm2jcKzO
	pKJ5aB5wHyRNFUXhgyEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKHqF-0000000GfwB-2RZR;
	Tue, 05 May 2026 15:37:47 +0000
Received: from elephant.ash.relay.mailchannels.net ([23.83.222.57])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKHqC-0000000GfsL-2fS6;
	Tue, 05 May 2026 15:37:46 +0000
X-Sender-Id: hostingeremail|x-authuser|chester.a.unal@arinc9.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 7CDFB802AFE;
	Tue, 05 May 2026 15:37:35 +0000 (UTC)
Received: from de-fra-smtpout10.hostinger.io (100-97-142-130.trex-nlb.outbound.svc.cluster.local [100.97.142.130])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 33CBC802AD9;
	Tue, 05 May 2026 15:37:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1777995455;
	b=xCnlpjAaETZZ8nB6SHCx3uKHKF8gy+I0b8kIjK1SV84Nm7mr8kN3yQ/Bmv3zfScALbXL32
	D5utVoQithYoiwZafCH//fStWO43iF8/Ra80x591Umb+NdUYSmvvRQwyWDrhKeANzNBxKR
	ScKKAlKyDPFBvMA6zg66D2HC3zgzG1+DmhlSr/FRWDI/47Ij8rimVot3QP6jh4UvFs0dqW
	fsc6mGtJ25RuYhpMpacUA5LLAbuL3Ym2iHKpeWOqD+lV6oDVB7QWhBtCCaja3d/vLT65tG
	/RIexo9YoI5clp/Hdx3gbfabxD16WwoSQlhn4hupuTnGVEA8GIMHybE+faZeiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1777995455;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=qVt3lmzQ7N6PZH719ot9HwSZfxNbFLse3Q7BGP9gLo0=;
	b=gkdE1mw+RZR9o4dfnfLlPxauQN3/RDP4M2R0bemfmlpvKtMDXJX9EO4BgFUzp6XYHuCHr5
	fphQ4lzkndpIP9nC8oJ9ja9MEtglZgDclAhs3Ow3AsnARgJR0baSQX52sJLBbQ7oydtggJ
	7WvXdIRvmmO8KOsC2sYqajMmYvwhmlro2sD1s38RWLqRaEX4ifNJn6wAx5xUL/kUzLMFI8
	jXf/ZjZsXGqPqbmzSr9FqyHloDIG5aO0MGyp56rxWb601WtxwiAfC6CIFka5J58dbztCF3
	Do3fRdTtAFhEUohsSrvrGgZJ+Mrp1/JgGYedIyubmt0PXFrYMR04mpqmWem+Rg==
ARC-Authentication-Results: i=1;
	rspamd-859c89884f-8lmrr;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=chester.a.unal@arinc9.com
X-Sender-Id: hostingeremail|x-authuser|chester.a.unal@arinc9.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|chester.a.unal@arinc9.com
X-MailChannels-Auth-Id: hostingeremail
X-Juvenile-Stretch: 5e85dd1b5d2d99ef_1777995455411_2547369502
X-MC-Loop-Signature: 1777995455411:900885652
X-MC-Ingress-Time: 1777995455411
Received: from de-fra-smtpout10.hostinger.io (de-fra-smtpout10.hostinger.io
 [148.222.55.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.97.142.130 (trex/7.1.5);
	Tue, 05 May 2026 15:37:35 +0000
Received: from [10.10.10.3] (unknown [109.228.203.208])
	(Authenticated sender: chester.a.unal@arinc9.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4g92h93Jbrz405w;
	Tue,  5 May 2026 15:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com;
	s=hostingermail-a; t=1777995450;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qVt3lmzQ7N6PZH719ot9HwSZfxNbFLse3Q7BGP9gLo0=;
	b=OA9pK6JkqwuJkBC+Lq+VgLCL3oEA3PmUnLE0lzbyZ1xTPUXiGdZjaaZU0J/ENZ4Uqowz21
	9XL/4EcTiKKIO2L33pdCYLntrKcExyiqBl++T7gG39FOqJ8lH5QOQatAQyFmdXE40WCDm7
	w7l7Y5QpsdDGEj8Vukspph9Ry+AOzzjPJzNEP3A58CHNWYE2vCxsSGtOQrIc9vZrKvFaYf
	mHW3Yb5h5q/y/vW6cXLmeRN2BLytuFanPMFhsJs/TZbVMSWw4B1A40FmFiQ1p6tkyo4alT
	LhIJuERJceb7zLJMsOh0lAMR5FKCQZALMmH3UQ9eybEzMqT7jc0W2XGHXQWmbA==
Message-ID: <46071c08-d85f-4157-9d61-6a0feef56747@arinc9.com>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 2/5] net: dsa: mt7530: preserve VLAN tags on trapped
 link-local frames
To: Daniel Golle <daniel@makrotopia.org>, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 DENG Qingfang <dqfext@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>,
 =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 Sean Wang <sean.wang@mediatek.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <cover.1777986341.git.daniel@makrotopia.org>
 <3ad4b724d7ae6250b8429d50fe913d2dca07a3f9.1777986341.git.daniel@makrotopia.org>
Content-Language: en-GB
From: "Chester A. Unal" <chester.a.unal@arinc9.com>
In-Reply-To: <3ad4b724d7ae6250b8429d50fe913d2dca07a3f9.1777986341.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue,  5 May 2026 15:37:29 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=Ceda56rl c=1 sm=1 tr=0 ts=69fa0eba a=CS7yVHPVoEopjVSexcYCQA==:117 a=CS7yVHPVoEopjVSexcYCQA==:17 a=IkcTkHD0fZMA:10 a=VwQbUJbxAAAA:8 a=VT4XjZGOAAAA:8 a=b-zwJ4yWfF2n_vrUc9gA:9 a=QEXdDO2ut3YA:10 a=6CpsfURP9XNmmWg3j1mJ:22
X-CM-Envelope: MS4xfKevdoLEsxmpx10pKfk+csh2waOq6MgMEWDN9OPOgqtKBQ6a+CfiVfyz0RAK+HWO2338y9SoLUXXzQmIZHlwm/h4SaeL6E6NGBhsz1bCYQhQipE6Ja3v QKIYit66gJaTE43yJrGJ81W53ozrNCPScbIhy30OVoH0M1tF4AMBCk/9KaMHXFaZXm/7ti0DKX2CBaTAmSqr5+j0dAXVNLP/8NR+J1sZKqYzia636LPlp2om 8xd2nSTWGAm3UBp4QDfXne7l+hDgqnaybhYar5ubdrztmXc2z5neorRu5OqUMsq8CjM3BWoiVIoAN7NdLY+KpKdD9f8tXpVSw/j8QghojOW9zDBR0In4HPPK RdrNEeGfTLOBEra8wZUvKeqHG8aawJ0NToAzksH3WJjLf0FBDgLGUSVq/OgssgwZ266jM9wgJyOJZHmABwzfd9N94MhMgECu2f6AoWI/XcMX6SOvmUXJzF1k fzYzDiVSXBiiIsEhY8a+7NIaZ+k0u5daHZ+zHi22w8RTR/FDy1T9LkNSvpu5mkB114IpbpR+PRXM+Y/7AHUGi+clPfAtz3JP8C9IadOeJ+CqJn6k0TD6v9+K ddBDsnci/bQ27jdT1+h3Lu6laUyjTWNSNwKNa2KEmXZna7YiEzzUrxHD9W5BnpV+efNBh1w4b1ZZNjVWyWmsQhgMaagfD4NKXvWnuWjzMfQIur6kRLBlxFNF 30atd3eNxtKdbCz5RwNU6BwidLZoO03Pi8KYIwgLr44V3mKSjBg//A==
X-AuthUser: chester.a.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_083744_839379_4DFB454F 
X-CRM114-Status: GOOD (  11.98  )
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

Hey Daniel.

On 05/05/2026 15:16, Daniel Golle wrote:
> The BPC, RGAC1 and RGAC2 registers control the handling of link-local
> frames with reserved MAC DAs (01:80:C2:00:00:0x). These frames are
> correctly trapped to the CPU port, but the egress VLAN tag attribute was
> set to MT7530_VLAN_EG_UNTAGGED which causes the switch to strip any
> VLAN tags from trapped frames before they reach the CPU.
> 
> This causes VLAN-tagged link-local frames (STP BPDUs, LLDP, PTP Peer
> Delay Requests) to arrive at the CPU without their VLAN tag, so they
> are delivered to the base network interface instead of the VLAN
> sub-interface. The DSA local_termination selftest confirms this: all
> link-local protocol tests on VLAN upper interfaces fail.
> 
> Set the EG_TAG attribute to MT7530_VLAN_EG_DISABLED (system default)
> so that the switch does not modify VLAN tags in trapped frames. This
> way VLAN-tagged frames retain their original tag and are delivered to
> the correct VLAN sub-interface, matching the behavior of non-trapped
> frames which pass through without VLAN tag modification.
> 
> Fixes: 69ddba9d170b ("net: dsa: mt7530: fix handling of all link-local frames")
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Thank you for this patch. Could you please confirm that it conforms to the
findings documented on this patch log?

https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/commit/?id=e8bf353577f382c7066c661fed41b2adc0fc7c40

Cheers.
Chester A.

