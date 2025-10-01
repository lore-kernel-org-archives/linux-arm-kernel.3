Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74061CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 11:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5JkgLorsszpNpNXqUBHl0PyQ7JsrT6J5rRyhYH20HoM=; b=eKRtPIF8kt26/mFJMnJm7O3nHX
	v5b9gYx/I5U8MVZP1jVkyK38JKQqVbwg2FLcweUnuGYp6UNX+og7zNqF6ftu25bft5U/m/Ma/9BXB
	do4El33D5BE80AFuN55hJ8hqivmfsMYK55Q7gB7KvcXs4h7n01KmOv7a+482SOo4QCXzb6pk4r1t4
	2Gt4rQ/p3en4ixBAWKWQiglXr8iIFvhnojtkAEIUNEgDfVdPtE745Onwn8Xphwngd4G9Gj4q9Nguh
	vjWTEV3Ukt/wJz2fiugsffnHdCAbOHrZoEi6vHN7aWCLNK2UuxaJti84ljufLukWwr/QoCiI7Ive2
	ieYpPJxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3v6F-00000007PHC-40LC;
	Wed, 01 Oct 2025 11:34:23 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3v6B-00000007P9l-1BN7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 11:34:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1759318456;
	bh=ox6s2XGlAFQMOJC4R5KYFkxyed/81WZwsUzVnJ5IZxI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EHVCnkW8v9MNkh2g3aBpf/S+H1g04R4eQK8eHnKV5Ki/8KiBQ6ZPqmTvpyIYFKIFl
	 JwVVwBFZATiGv5ckgYGRTPjaCrwePR49uBBRS1T6wGG/VRsBM9BnUIo9DOjkXtX0Qd
	 7r/2yVXgi1ek30yZX0U+2TyEtPxZV+Zh9BSN+nOY7tLBwvshghSn3fRSmJOGeJoof6
	 lXlnplK5U3yiHwNYQsOHWPC/sb8YRijm57A3IR05fXraRUzBJVfkKtR5QnGY4Kwq+A
	 kdnDm5Ih/MnNQ0IYPDfkXS0pPXr3lPbfVHq5gnh7X/AiMLrgFlhsffTA5Pknt1xJnS
	 8fsSio8obweuA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7E82117E13D3;
	Wed,  1 Oct 2025 13:34:16 +0200 (CEST)
Message-ID: <6cbaa1a8-9cb2-4611-a28c-c7e160018cc9@collabora.com>
Date: Wed, 1 Oct 2025 13:34:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v5 04/13] spi: airoha: remove unnecessary switch to
 non-dma mode
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Ray Liu <ray.liu@airoha.com>,
 Mark Brown <broonie@kernel.org>, Andy Shevchenko <andy@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Andreas Gnau <andreas.gnau@iopsys.eu>
References: <20250930022658.1485767-1-mikhail.kshevetskiy@iopsys.eu>
 <20250930022658.1485767-5-mikhail.kshevetskiy@iopsys.eu>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250930022658.1485767-5-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_043419_480747_381843C3 
X-CRM114-Status: UNSURE (   7.67  )
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

Il 30/09/25 04:26, Mikhail Kshevetskiy ha scritto:
> The code switches to dma at the start of dirmap operation and returns
> to non-dma at the end of dirmap operation, so an additional switch to
> non-dma at the start of dirmap write is not required.
> 
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
> Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



