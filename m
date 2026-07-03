Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B60C4C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 14:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Lh2AAUoB1JC5DGuav624QON15nyQOs3xfpPwsgzzqs=; b=JoHg5Pp5CNLrssUvM/DpcaTCR8
	f3qt18s4cjV3qkNXl8CTTbju9R2ewFp5BCb+QN9Q3gPOk2Kc+Q3AfhNqtC9rCbpq78ObV1nqm3nFh
	v5HpmjL/xphgHc52XjNw13FZ4oCWEJ1pC3FgpP/xETA7nQfWYgrU8B+f8y5guOWPBQkhHlrnVbKkW
	3w4aHBMJF7XeiKnZrZoJP4v95ALgixB11xKecx4ysF7bwSLn5yRz89+5E+oQ5OFS0EO3mG/5bjOZS
	pd4rauS9tHHcRcNFBHbGEdnGUwrROIqxngXR0HZmGa6rxidpjm2uRsmj4LOxcPbJqQ7AycmyXaYbb
	vUoiqOxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfekz-00000007FCb-0euP;
	Fri, 03 Jul 2026 14:20:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfekx-00000007FCT-4BLf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 14:20:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 586A960051;
	Fri,  3 Jul 2026 14:20:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 026E31F000E9;
	Fri,  3 Jul 2026 14:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783088438;
	bh=0Lh2AAUoB1JC5DGuav624QON15nyQOs3xfpPwsgzzqs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=CV3eauhPjuGIcDWAuH7jmQQ0azXqPxyCAQx+VyWA76LBoY6RV6Ml8HdSg0GBxbMRe
	 MMzRFWVsjx3hHjyz2RYpJ/tba2gIgRzZioGO4aW1pNYWs8A2kVnZq+aikpl2QaiGNI
	 ENNkHklIR9iq7+exGB3mg2GttfiP0KyXXvEv4T34zFPrYLCXbkGza0Z6jQLCtCo+gT
	 0QhZH+2EGLx1sdF3J8l+/s/vWJFgi/t1MOe7UG439DRWCb3Bh0jmII46SIkiNA1chI
	 YGsizy5zkRaRy1hIhwIt7woYrNdfo3kFDtlHLOpmR2IpHMuvqBBwJR94QWWVNTr0uS
	 iOjlAAjfDkpgQ==
Message-ID: <d12320a3-65fb-4e0d-9f79-69368a708ded@kernel.org>
Date: Fri, 3 Jul 2026 16:20:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: apple: Add pmgr-misc nodes to t60xx
To: Sasha Finkelstein <k@chaosmail.tech>
Cc: asahi@lists.linux.dev, Rob Herring <robh@kernel.org>,
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
 linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260703-pmgr-misc-v2-0-4b26ba10c5a4@chaosmail.tech>
 <20260703-pmgr-misc-v2-3-4b26ba10c5a4@chaosmail.tech>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20260703-pmgr-misc-v2-3-4b26ba10c5a4@chaosmail.tech>
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

Hi,


On 7/3/26 14:44, Sasha Finkelstein wrote:
> Adds the PMGR misc control nodes for M1/2 Pro/Max/Ultra series devices.
>
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
> ---

Reviewed-by: Sven Peter <sven@kernel.org>

Thanks,


Sven

