Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9B63C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 06:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YKFIq1SeVmM/nBqAQ3BjuEtsh4GpEB7ByrAjwhyB/2E=; b=uoe11NFzeZsKyJffKfkHg0lhIu
	caEPPyc/tLxya0yJDbUl+1YTFulq2M/9b6nXJUf+jKIzGftVDYgNHVu/nUc+yW7y7B/EKvvCxFgZ+
	kJwq54hqbjAUsxJnHbf1SM6Z7Z1OSrZ0bhwLU5lQrvvq5YCtiJBQ0nMIehTQl/5BlglQuaMSWYMeo
	LXgX8tdzvbrFAAlSJakKaRuA6KPfoU/GyL93ZcH58fr0vc8QP3gxP4Rrnn4AN6OiV6jDgIUvF2i+j
	o/us4D6vfWOVKGTsyT5u+38vKbQ6vgGPURn22y4fF0CXvs/1iOi+EV5eTob4XxKRCMqIJCfLwAWuT
	AtdeFPkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTb5u-00000001opG-0bNE;
	Mon, 23 Jun 2025 06:55:54 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTb0M-00000001nxs-0k2y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 06:50:12 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 73421A0119;
	Mon, 23 Jun 2025 08:49:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=YKFIq1SeVmM/nBqAQ3Bj
	uEtsh4GpEB7ByrAjwhyB/2E=; b=imtNwEFHZ1G6j/wXqaZupldLTlUOBRXeZcu9
	dKO87/+hT9P0E8cDlJbdqiJA1S084NfwPEAmp51c+m5EcHRDQNccQ070em3DAqz4
	mDci5IxTlmfQmdP2V/FxdJTh4+2WFYCAEgpeYnNpJsky327SbuI3JfWq1g908ctD
	C4kchLcNUWPuY/BhxRUWdCM5t2TkkGAbjv8rOYmJJT6zfj6pCKxG4j5jdFfzqJkF
	+u/kq6+jUwG+AjrGb/RGB/cSgKXtk4vp5q4YbMz1Q1TFrAYOKqiZdSCCfOVV1WH2
	rvWTiH/+mx/RlFIyvHBUohT6qyMbeMffVunIedKI+GOU7U2gAGdh60hFLVJQaSDm
	8x+5WiN3uEkLWtJd+Fg56iycMzwEChLRLriTqwLrn8rWsHA9Rj6hn5j3UnyjzRJo
	v2rg9mqJfFZ1jEV+dpCHhqgWzg+fsaAHFz/+qOuOIh/duflf7Wo6mJ04wQLimZGg
	R4vnafT1UZMAyC5NtEogpEiZbOfa5G7LHWvz3S8PPRM2IgmdU5ZYyzVxe7eFKT3B
	dSeGLkyxFh8Nf9dXQz7prL2WKI2n9RJuICACV6MHv4U+ImbhWz2JNi4svKvhBh6Q
	PE6qUlCn+nLtFQ+uW/Fhv/B4aXQbYVvIAksX6mKhyZIBMorFlmAPTwXzuRgpCh9f
	HuYzF3k=
Message-ID: <c6500082-565a-4b00-ae27-4d943586e58b@prolan.hu>
Date: Mon, 23 Jun 2025 08:49:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
Subject: Re: [PATCH v10] dma-engine: sun4i: Simplify error handling in probe()
To: Vinod Koul <vkoul@kernel.org>
CC: <dmaengine@vger.kernel.org>, Chen-Yu Tsai <wens@kernel.org>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>, "Julian
 Calaby" <julian.calaby@gmail.com>, Samuel Holland <samuel@sholland.org>,
	<linux-kernel@vger.kernel.org>, <linux-sunxi@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>
References: <20250610075315.397810-1-csokas.bence@prolan.hu>
Content-Language: en-US
In-Reply-To: <20250610075315.397810-1-csokas.bence@prolan.hu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.254.7.14]
X-ClientProxiedBy: sinope.intranet.prolan.hu (10.254.0.237) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A296767155D6D7366
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250622_235010_715428_59A59C21 
X-CRM114-Status: UNSURE (   7.26  )
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


On 2025. 06. 10. 9:53, Bence Csókás wrote:
> Clean up error handling by using devm functions and dev_err_probe(). This
> should make it easier to add new code, as we can eliminate the "goto
> ladder" in sun4i_dma_probe().
> 
> Suggested-by: Chen-Yu Tsai <wens@kernel.org>
> Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Acked-by: Chen-Yu Tsai <wens@csie.org>
> Reviewed-by: Julian Calaby <julian.calaby@gmail.com>
> Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>
> ---

Vinod, is there a problem with this patch? I'd love to hear your 
thoughts, because it has been practically unchanged since March, and 
only minor changes since the first submission last December. I can keep 
rebasing it ad nauseum every time you push to dma/next, but I think we 
both have a better use of our time. So, if you see anything that should 
prevent this from being merged, please tell me.

Thanks,
Bence


