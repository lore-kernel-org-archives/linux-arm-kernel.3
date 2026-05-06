Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62CC9CD343B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 15:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JjwHJvwcsVsAqSid+CqU9EMkSKEwcLlpgnWUJfnSaTM=; b=Kfimbk6n4AlitdvYRrL93BChz7
	dP/2+mJqtZrNsybiH7Is2KmQzNK0ybLKBQP6ZY4B+mnMk4ySLBhpSYCsswgsDJ9BR0xZVjzq56Zd8
	F9pQ2x0QxZ3DpRkPUjTje2RjRG1X0CvaQxrMkC/f5yq87sybKIr4IZctMY+dFSGY5E5SQIb9mmWAz
	uqYecjm/ntBrDHmycg8zHIZax0XQQGD4qm+reh19E11/fL8poa4DURFoTdYs5X61JJYJTHBEBd78b
	8z7pB10HkhFAdMYbzVXw0JNi02JZDduFaqRairsx8eMvezfS45C3BfjVWKhzyvooelQM0quCYpK+K
	Gch/An1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKduz-00000001GLh-1F2y;
	Wed, 06 May 2026 15:12:09 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKdux-00000001GKL-2zA3;
	Wed, 06 May 2026 15:12:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1778080325;
	bh=Qt1sbioAFaLEHbqY0g46pWf0ClCX9emJeK9nPbdl+Uc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=W+J2KqASCur0MUa6UXpbys4AI68ngSl5mg8QmP4PK+0oXoeQbSgsOfzJW9+q7zVT+
	 PUPoAZfAWdC13N7IWjEGZIgCISskwMOet20DrYz65Zcf8s3pGSJSTygR2qT1clgQNR
	 QhRX6+H0cNcWNwFoijGee1osyn8sZq1JwD65fuBC65hl7G/iGn3vPsc2qW4xLDasN/
	 hC5WzM2bRxnBPPv7qPjhDKxz8J3fTnAWU5/1yKUe6BYDwCm3zZdrloM+ebOxuUR2ot
	 XmHipMoHcQx4oIZiHbBCt3L+phPkpwKeM5MVPY/TEw9gt9hWHhK6RMvQldGTPXpCf6
	 5ZoPZL+ikf+BQ==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D607117E0D23;
	Wed,  6 May 2026 17:12:04 +0200 (CEST)
Message-ID: <a3fc8dc2-9379-4189-99d2-e478e446b893@collabora.com>
Date: Wed, 6 May 2026 17:12:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: add myself and Lorenzo Bianconi as Airoha
 SoC co-maintainers
To: Christian Marangi <ansuelsmth@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: Lorenzo Bianconi <lorenzo@kernel.org>
References: <20260505122416.2609-1-ansuelsmth@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260505122416.2609-1-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_081207_894960_203E73D5 
X-CRM114-Status: GOOD (  11.69  )
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

On 5/5/26 14:24, Christian Marangi wrote:
> The development and integration of patches for the Airoha SoC stalled a
> bit lately with the result of some patches getting lost, not applied or
> even flagged as accepted, archived but never merged. The Airoha SoC, given
> the similarities with the Mediatek SoC, all goes through the mediatek tree
> and it's understandable, given the amount of traffic, that some patch for
> a different SoC are missed.
> 
> To help and improve the situation, add myself and Lorenzo Bianconi as
> co-maintainers of the Airoha SoC.
> 
> While at it also change the status from "Odd fixes" to "Maintained" as
> there is an active effort of maintaining this SoC.
> 
> Cc: Lorenzo Bianconi <lorenzo@kernel.org>
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



