Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43720D13570
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 07:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jzwxp88ilPxMqqVour7KBL4/+4MkX3IVm03TfWmTjFQ=; b=U+/3G3DkNVRZZ9vStsdiZkj075
	X3zbgz1JBUpkAwVs4Ei4YmM/lK6fW7BbWLEVq5Kupq5azIpFGbLIQ3Py5ttxFzXYKrsi+IpNfPMYm
	y93z/2xFQxUyPr7yaHyqOCugmfVJ5rUcqrfGwj/1iS97CxHtR8MQmwzwN7OK+JUgc66FM4BYmQFQs
	swoG8vblll7VnePVpGJLzWOBUOZWoCb0W+th0UOWHVGra+G7RFD2Sbn8H9h6klpOHkVlTsswt9en3
	/fSeGdg3tvDWbmrR/d8QIQH1QlgwcLjrcOWMBH59+0wnSTLTiLNqlRQ14Y8/GlVLFNmJ7X9AuRdTY
	3QYcYv+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5KId-00000009tUM-3Gpj;
	Mon, 28 Oct 2024 07:36:27 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5KDe-00000009rqq-3BnL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 07:31:22 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 05A64A0767;
	Mon, 28 Oct 2024 08:31:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=Jzwxp88ilPxMqqVour7K
	BL4/+4MkX3IVm03TfWmTjFQ=; b=e5AtdkqFLnQ+WxX26HGP43hZIJUhu/t/Zcil
	JKaYUFaXL+MgHxNclZXtIzFUKHVmO+Fm9WBDHPHsh6CKBuuVucuMZn/xv5IRfxdo
	8YcQfQvuPqSKGVyzrHX9QaCzXTZtlDWfixiwS/+5ZWnM6rN7XXnOnCc4RX3DaejG
	bNN9LxzdByk2JwdVYv9qQb0B1xdln/Tm3pfTq+bKzk4caPn4HJ9dygubggkkr1iq
	BzJYZqsOZxYthfbdrUr3vwLbVp6H+3mndmgOOArJrKjY+agNSkGR0CQJwXiWi1uM
	y8ByvuexjiGYFHaggVe2EZZUr1iIjH6LdWyaN5j4LQJ8ej3zUHbLWBsK2pFS5+9y
	i6fiwAZSrGX6qLv/9dpbraVA7Sbrrb7RDUtvj0qIXIeIc/TTa2RqHJXzDDeXoWEG
	G1Edf/9SQr8HanjRy1WQifQ9CAHSCQrv1pyKtqAoYM6XvORaxe8ZKj4E8jcbTs0M
	/rQApTpqnuUv0PeBNulT2WRCpk0Xs2d1QOAsZx8YqkOw0wgKzbh44kdlWeg3T+VE
	0eeqlcoiWEuc9c/v06t4bZ0VB/Zg5iRQDtZtVOVAz6f5dOVMUl1P8fV7CkCtyF45
	k/RnyI+iZJGfym8UgEgPNaHkMJS6Z9cYTTwFNtvEoDvlxHiq8j2rcLq904vQmJYD
	NfQtGDo=
Message-ID: <5eedfe71-7a8d-4b91-ab49-e09352e7d6f3@prolan.hu>
Date: Mon, 28 Oct 2024 08:31:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/10] dma-engine: sun4i: Add has_reset option to quirk
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <dmaengine@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-sunxi@lists.linux.dev>, <linux-kernel@vger.kernel.org>, Mesih Kilinc
	<mesihkilinc@gmail.com>, Vinod Koul <vkoul@kernel.org>, Chen-Yu Tsai
	<wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
	<samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>
References: <4b614d6c-6b46-438a-b5c3-de1e69f0feb8@prolan.hu>
 <20241027180903.2035820-2-csokas.bence@prolan.hu>
 <dsuadjqzybikpnuyr7q2fbq5jdzev33rqqhnehh3ns2lgfvdlb@bdmib46vlxt3>
Content-Language: en-US
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
In-Reply-To: <dsuadjqzybikpnuyr7q2fbq5jdzev33rqqhnehh3ns2lgfvdlb@bdmib46vlxt3>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.254.7.14]
X-ClientProxiedBy: ATLAS.intranet.prolan.hu (10.254.0.229) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94855677C65
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_003119_330253_190E1B01 
X-CRM114-Status: UNSURE (   7.29  )
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

Hi,

On 2024. 10. 27. 21:43, Krzysztof Kozlowski wrote:
> You did not build v2. Then you send v3... which you also did not build.
> 
> Please start at least compiling your own code. Then start testing it,
> but without building it cannot obviously be even tested.

I forgot to rebase an amend! before sending v2, which I corrected in v3. 
I *did* in fact build v3 (after the aforementioned correction) rebased 
on top of Linux 6.5, which is what I have available for my board. And I 
also *did* test with aplay and confirmed to have working audio. If you 
believe there are differences between 6.5 and master that break v3 of 
the patch, then please point those out as opposed to making accusations.

Bence


