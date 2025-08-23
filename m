Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A357CCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 10:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/7KMbMMLpm9nJ8Py9ovsw7CQ4WUxxWOeApHUoT4qzew=; b=d+uTWLk712rwqtz/KkGktvSwwE
	CT403ccnaqbsYOXaI5PSVeYqoKequwezfRXKiKXX6wsOeYTso4VmZfxqpEHStM83DKE8IjgmE/75A
	LXJkqRgi11QRVoPKqrtQbMyYFWoChkfSNt8k3+97BUllBUumYFPv4gpsV0MOIaYyVn4ognKSqLC7C
	L/vxExlri1mITaUJ07GV/Sg7mza5bRD/tpdvHN/XbHi99Y3T+EFGTG39IX+wKOqkZTh2L3IqpP0aD
	YOScoAKrd8s8gNHqeAFVh2H2vHv0IBFLjMJvpUijW3WLnnKH7v9wunhEZeLVmPsWmFwC9DWASNFWw
	ioQdcIDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uplog-00000004fJ4-1AA1;
	Sat, 23 Aug 2025 10:49:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upkbv-00000004S7d-3Yvq;
	Sat, 23 Aug 2025 09:32:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 57B7C5C4AD0;
	Sat, 23 Aug 2025 09:32:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD2E1C4CEE7;
	Sat, 23 Aug 2025 09:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755941549;
	bh=+gmaRG4bCJwAnZiedCk4uT+ovE7FPGaq2RQsy9fyihM=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=FhjPaQhPe0F68Fk8Xg+5uYwyCCuS30Qb3gJ47QfVRuDzDVENxq/NbNpZI/Am7oLbf
	 +aAUIa9Qk/rz5HZeQ2srhbwDNhMs/cz2aeDfaHpfYlAuH7f0T/JsyrArRXpNjEjjZs
	 6pbeqYT1CrU2lWc24aBYLB5HgJbetmavjZFWWVlV2Mcu7ZPGQMPItkt/9ww1vNnILp
	 Jp/xLMUbklEpqp3VlycKxM4hbuQXSGOR4LeFtVIWnzuKJKQZPON9fEn6hcwHiCknk9
	 gAblSTs8LXPsE0SRQBdAECmv/RK3U3/rY8dhFXrA19yQ8eMUzUQiKYaXrJZfSFZVVf
	 7s3OE9FSPbxdg==
Message-ID: <0289f92d-0d18-43d2-b98a-da8bb08e9342@kernel.org>
Date: Sat, 23 Aug 2025 11:32:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Sven Peter <sven@kernel.org>
Subject: Re: [PATCH RFC 07/22] usb: dwc3: apple: Adjust vendor-specific
 registers during init
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Neal Gompa <neal@gompa.dev>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "asahi@lists.linux.dev" <asahi@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
 Hector Martin <marcan@marcan.st>
References: <20250821-atcphy-6-17-v1-0-172beda182b8@kernel.org>
 <20250821-atcphy-6-17-v1-7-172beda182b8@kernel.org>
 <20250821221832.zsn4rk7nomsbgytx@synopsys.com>
Content-Language: en-US
In-Reply-To: <20250821221832.zsn4rk7nomsbgytx@synopsys.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_023231_938061_ED6A9C9E 
X-CRM114-Status: GOOD (  11.80  )
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

Hi Thinh,

On 22.08.25 00:18, Thinh Nguyen wrote:
> For this patch, however, I'd prefer these vendor-specific settings to be
> in their own glue driver. I can only imagine more changes will be
> introduced in the future with this vendor. See if we can use the new
> glue interface in glue.h (some call this the new "flatten" model) when
> creating a glue driver.

Nice, thanks! Hints like that are exactly what I was hoping for when
I sent this RFC.

When I originally started working on this I tried to use the 
parent/child model but didn't really get anywhere. This flattened model 
looks very useful though.

I think I can even move some of logic from the previous commits to 
dwc3-apple.c if I extend the glue a little bit. I'll see how that works 
out and maybe do that for the next version then.

Thanks,

Sven


