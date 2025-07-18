Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41392C83F34
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 07:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6wnS2xtxbpcAFUB1BnrJaz1aAjdAqzNZyXAbUulIYnU=; b=Jhppjpu8OjTLOP0lGvwmhMZ5nS
	wG8if9vAcMEHFxCgV1su0ovGlineZGqlgqBL4+Z5eeKZnCw4ZFqfXOtbEl6ahVOBMQuYK7qtAc8Jq
	uRUcEVpbZqPv43lQgYEICcLNeUiAuzHPni2bywCveikOHFtl1JjouwW9h9/MwtwidC3iW1kfh/3sG
	uthWMGEFrA39TiGrQNfc9F1piTOHo/ppq2tioV0aNYtqg/KOyG2x0L3W3AyJX5WHbm6OIdZdQ2mOj
	a82vXt3nxR4GfFqCWgA9ARkNkO0CqeAFIVr0pC2n7IfAHifDExvss2i/VJtO4bdYKCWhaKzxhMwoy
	Zwif+sHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucfKe-0000000BraF-0APR;
	Fri, 18 Jul 2025 07:16:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucfIB-0000000BrLH-39zg;
	Fri, 18 Jul 2025 07:14:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 293645C5776;
	Fri, 18 Jul 2025 07:14:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48874C4CEED;
	Fri, 18 Jul 2025 07:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752822842;
	bh=6wnS2xtxbpcAFUB1BnrJaz1aAjdAqzNZyXAbUulIYnU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oVP99uSgcEX3099jFyPoXovhI+iXC/4894QOq8GLAMo+8ebJE8XBwBedRXTWsAVxv
	 Am+ULddeOWzprPWACkqZhMt8wTHF7woLG05KwrO3HplkKO+5Ecjvl73cm/8WR5qGyh
	 AjCP5KKDgn6SXcFjY95xtpDaObC5JjKzRGewdpdb+11XE1bV/JSh93YYgPOxa64DY5
	 1I6d88v7lpNz1dUgM3VqJUBMticCE+k5fUtnBslcCm4gf7wY3uhVe/I+jBniKkbbOd
	 9MwThN779mxxK6FZsZMx+EEiZGTMy/Jt6Hvku7db46Sohp1ZQnZN37vkA02kZ4pWr/
	 /MquzMECERMag==
Date: Fri, 18 Jul 2025 09:14:00 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Simon Horman <horms@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH net-next v4 1/7] dt-bindings: net: airoha: npu: Add
 memory regions used for wlan offload
Message-ID: <20250718-sceptical-blue-bird-7e96e3@kuoka>
References: <20250717-airoha-en7581-wlan-offlaod-v4-0-6db178391ed2@kernel.org>
 <20250717-airoha-en7581-wlan-offlaod-v4-1-6db178391ed2@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250717-airoha-en7581-wlan-offlaod-v4-1-6db178391ed2@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_001403_828091_B057AF58 
X-CRM114-Status: UNSURE (   9.45  )
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

On Thu, Jul 17, 2025 at 08:57:42AM +0200, Lorenzo Bianconi wrote:
> Document memory regions used by Airoha EN7581 NPU for wlan traffic
> offloading. The brand new added memory regions do not introduce any
> backward compatibility issues since they will be used just to offload
> traffic to/from the MT76 wireless NIC and the MT76 probing will not fail
> if these memory regions are not provide, it will just disable offloading
> via the NPU module.

That's not what I see entirely. I see the same problem I told you already.
of_reserved_mem_region_to_resource_byname returns error ->
airoha_npu_wlan_init_memory returns error -> your other patchset prints
big fat warning in mt7996_pci_probe().

So all correct DTS now gets a warning. Warning is a state of failure,
even if probe proceeds.

I don't understand why you can't make it fully optional, so also fully
backwards compatible.

Best regards,
Krzysztof


