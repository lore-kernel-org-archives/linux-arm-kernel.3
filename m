Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE46BD37E59
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 15:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HPhK4KjjnRqSs9b7v5hKWxDnIeNV27SBK22m7p5AFTc=; b=HYSOh11scDfUxc97Mi+kydwWC7
	vrptED7GJwzn5bGQG9D6/Ww1+znicJCTHrW4LnLAw/ri1cFUzLS+Iu1aUfnl0IhLmoeouKY+DSPVl
	JY+ZytF3G6vHMJ/JBBjuQhXjM7XGEsUqIwEY95gwT5BoerBxSAvCl0oKL/RdGaipR1ApzMYzBqv8A
	rCjsPyGy9SmGaJk9VPXhgOQx3Du+1Qns2mpGhzOsJyBjY9l2WxBkwE3bSzhTrjslQGFBImFwe6toA
	IW1cV3zOSpABKlZxUvML6jU4e+S4P8UdqS+l/OeLPgrd/fUGPK/cKDr8G8pECPBmnvUgFoqNCiRn8
	uHivP8ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg3EH-00000009ndQ-2qVL;
	Wed, 14 Jan 2026 15:56:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg3EF-00000009ndH-3x8K;
	Wed, 14 Jan 2026 15:56:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=HPhK4KjjnRqSs9b7v5hKWxDnIeNV27SBK22m7p5AFTc=; b=n16HFBApoKhCPFHNXdnxrAsx25
	C0+yNWOe26qpuROij4Z7Xunuu3ArDYBK8dJX7eZycQ1qtk/ZZ4XK2hKVSlp8hcV98kyW0KBo5VLCX
	7BmkglP5z6gEb3wjejG/03REjD3RiuB7HvvDQwYBQBslAj4V91bdYQtBGFs8ns5dk3J6oxjpZEF5n
	zhMV4UJyIajpRHr9mIZf4hIAWzM10/GzIw/dpZxpD+hIHWR7g6s1eG54pChvmIrH0Wt1sha0MxZ+6
	C1WD5bGqsjzKJxdAeWTyeKWelwhhmMwv+q4kpRyjCqOTKt5WMSBgBZ8Ho4RW6v2g16AqtUuPnPLjb
	lMOi9ovw==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg3EC-00000005B2w-49CG;
	Wed, 14 Jan 2026 15:56:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=HPhK4KjjnRqSs9b7v5hKWxDnIeNV27SBK22m7p5AFTc=; b=tazNDxBvsypyesjPwJzb3+PoQj
	S1+fjE9afh3Fm7eDFKgSWZSnz6l0FiNtvJ2DoNbLQPALi7MloHXcbj2qGjVl7zv8OXNEmYjZjQv/v
	/Bl9JUgwpdIIOerJq7150ZXOF867L7Z3nkoUb3Xbq8iivwWFNt8DRZPQgH7Sei/7gnug=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vg3E2-002ocm-8m; Wed, 14 Jan 2026 16:56:02 +0100
Date: Wed, 14 Jan 2026 16:56:02 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v2 1/2] dt-bindings: net: airoha: npu: Add
 EN7581-7996 support
Message-ID: <76bbffa8-e830-4d02-a676-b494616568a2@lunn.ch>
References: <20260113-airoha-npu-firmware-name-v2-0-28cb3d230206@kernel.org>
 <20260113-airoha-npu-firmware-name-v2-1-28cb3d230206@kernel.org>
 <20260114-heretic-optimal-seahorse-bb094d@quoll>
 <aWdbWN6HS0fRqeDk@lore-desk>
 <75f9d8c9-20a9-4b7e-a41c-8a17c8288550@kernel.org>
 <69676b6c.050a0220.5afb9.88e4@mx.google.com>
 <e2d2c011-e041-4cf7-9ff5-7d042cd9005f@kernel.org>
 <69677256.5d0a0220.2dc5a5.fad0@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <69677256.5d0a0220.2dc5a5.fad0@mx.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_155613_200929_5E2161C2 
X-CRM114-Status: GOOD (  11.43  )
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

> > Yes. What you plug into PCI is not a part of this hardware, so cannot be
> > part of the compatible.
> > 
> 
> Thanks for the quick response. Just to make sure Lorenzo doesn't get
> confused, I guess a v3 would be sending v1 again (firmware-names
> implementation series) with the review tag and we should be done with
> this.

Since this is a PCI device, you can ask it what it is, and then load
the correct firmware based on the PCI vendor:product. You don't need
to describe the hardware in DT because it is enumerable.

   Andrew

