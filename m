Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37548CA0FFD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 07:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rXHXBpVzBMPLP6lwzDZ1YPClgwiOnPvFCwrShjQQ0dE=; b=jDpQfzg6WORVKjjaRXDZNecAQI
	fLuS2JCgYup9mm3DKC32Bs4i3iLCzWmpn5rypn4EIXHKw9Exg1ar1WekwEVcK8ZS2jB3AGPEgqc1i
	Xmjs/FirLn0WBbjTRlT0lcZlZi9nqqiITtlB/+snAnN1KkxFJSld7LcBShlW2SFBm/KVgV6Rwz/Kh
	oy0daVC1OsIr66cxVZrAJdo1vOC7HUs6Mo1Dq2+GNLjo0Tb3AgfQlk7/5xoZyFQBXZyqEmdlzX4nQ
	ZxMFgFNLn9fUBJiU6zuKZbYoxVX3zf9A8Waq1tK/m4grZCZjTeE3EuF9K7nP47TsGwqCrlKka9yWP
	3KgRRLVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uru1E-00000004rrp-1AHC;
	Fri, 29 Aug 2025 07:59:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urtmX-00000004o5j-0Xxl;
	Fri, 29 Aug 2025 07:44:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0A98E40397;
	Fri, 29 Aug 2025 07:44:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BD31C4CEF4;
	Fri, 29 Aug 2025 07:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756453459;
	bh=nMvebug/8aKBzyMnj8cDMWfLOrd+I+pKXhPg7EME4vk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Vjx01uYhuY7ysGvUDRQnccZcPl1S2rnoL2GRt9uHIO8R8kBXUw0FyO89wrumtXRc3
	 HKLiCsdUwk/ySu0HZmC5szGw0LM2IbgEJenbi6sZPYs849o6Uofxz08WaaX7HCFvjd
	 bcVyOUh7V3l+Q9aGKCgx5HmRT9STMjOQWWpuevJ+/4VwyUjhAemwLYexIbCnukSF53
	 6R0pDMb5Xa9r3jrqSNxbSDx0pAPeo1NFhpk8bJ4jLbGwW4hpjyArBL2rsKeI4NEzHd
	 cjDe6e9ZLyOqhbDhZ0I8emtbZM0pIOR5OipJLOzFB/mEYAObMWZB7dCXRiGkTNsUWg
	 qavyfN+q8lO3A==
Message-ID: <aeef4f20-03c6-42a7-aac0-e385419a05f3@kernel.org>
Date: Fri, 29 Aug 2025 09:44:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/9] dt-bindings: iommu: apple,sart: Add Apple A11
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Nick Chan <towinchenmi@gmail.com>
Cc: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Neal Gompa <neal@gompa.dev>, Jassi Brar <jassisinghbrar@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Hector Martin <marcan@marcan.st>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Keith Busch <kbusch@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, iommu@lists.linux.dev,
 linux-nvme@lists.infradead.org
References: <20250818-t8015-nvme-v2-0-65648cd189e0@gmail.com>
 <20250818-t8015-nvme-v2-3-65648cd189e0@gmail.com>
 <20250820222044.GA1513864-robh@kernel.org>
 <3147ebf4-054c-4777-811f-86d0ad14caf6@kernel.org>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <3147ebf4-054c-4777-811f-86d0ad14caf6@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_004421_193126_255EDC7D 
X-CRM114-Status: UNSURE (   8.94  )
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

On 27.08.25 15:20, Krzysztof Kozlowski wrote:
> 
> What commit fails to explain (folks, please fix that) is that device is
> incompatible with existing ones. Right?

I've already applied this [1] but I can still rebase and change the 
commit message to "Add apple,t8015-sart for SARTv0 found on the Apple 
A11 SoC, which uses a different MMIO layout and is thus incompatible 
with the previously described versions".


Sven


[1] 
https://lore.kernel.org/all/175593408419.53541.12520438370584715457.b4-ty@kernel.org/


