Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDDABC02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 14:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=88iRX8irqERVHqBMl74vPIF+rogOEUfOrJex91RNWYg=; b=12HNP3H6nTX8HHf/d4PrbXg5dp
	BejGMi5qi3y03kpPBU8GhPAYoTwTvOpafYwstqrEY5n7DgUBW+/p1dBKWaih8xauiLQsDpkRJuFlX
	rCSNaqMUM7NmWsuIzLushGaKCNfjYo0QnSe2PdGFFxdgWXAm/FL1wfU5yNWfeN2yhZfDmVZnlo6EV
	c+wT/SwO/ZzZcCOKf/k6qfrJapIVihNuZBvwZoSr6+DZnj1q6MUO/PVUQ93qs4uzEjYAvIa/74pWt
	OHEoSfhNFSeYnG29UdXImqRJt2XLSa2J6prdwxnt8J0AsgoWXGbThQBCu9wp+UeyKUhzfP70vq/8G
	+dN5IEiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg2bN-00000006Wy5-1lUU;
	Thu, 06 Feb 2025 14:11:33 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg2SC-00000006Vp1-3Rzo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 14:02:06 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 516E1Vbh2812418
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 6 Feb 2025 08:01:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738850492;
	bh=88iRX8irqERVHqBMl74vPIF+rogOEUfOrJex91RNWYg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=eCCp3949bwfLnkf8zD3DSkOK9WljWAwbZ1L/ni8wAQRp7eoOYixFjxg/Y61w9mHhu
	 k8S7s75de3G+P08aQBdYm31veRoBRac5Czz1ZbEb1+v91Y+oU9lcc9lO+oZQ3UMY+1
	 a+54Sf6OWM09GHBE+MJjPpkYPisjjRXZknApCiFY=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 516E1VJD057574
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 6 Feb 2025 08:01:31 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 6
 Feb 2025 08:01:31 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 6 Feb 2025 08:01:31 -0600
Received: from [172.24.23.168] (lt9560gk3.dhcp.ti.com [172.24.23.168])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 516E1N6m039077;
	Thu, 6 Feb 2025 08:01:24 -0600
Message-ID: <04ff4911-de4b-4d68-b72f-f03915baa9c9@ti.com>
Date: Thu, 6 Feb 2025 19:31:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] Re: [PATCH net 3/3] net: ti: icssg-prueth: Add AF_XDP
 support
To: Ido Schimmel <idosch@idosch.org>
CC: <rogerq@kernel.org>, <danishanwar@ti.com>, <pabeni@redhat.com>,
        <kuba@kernel.org>, <edumazet@google.com>, <davem@davemloft.net>,
        <andrew+netdev@lunn.ch>, <bpf@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <netdev@vger.kernel.org>, <robh@kernel.org>,
        <matthias.schiffer@ew.tq-group.com>, <dan.carpenter@linaro.org>,
        <rdunlap@infradead.org>, <diogo.ivo@siemens.com>,
        <schnelle@linux.ibm.com>, <glaroque@baylibre.com>,
        <john.fastabend@gmail.com>, <hawk@kernel.org>, <daniel@iogearbox.net>,
        <ast@kernel.org>, <srk@ti.com>, Vignesh Raghavendra
	<vigneshr@ti.com>
References: <20250122124951.3072410-1-m-malladi@ti.com>
 <20250122124951.3072410-4-m-malladi@ti.com> <Z5J7kGFU_ZgneFAF@shredder>
 <f1cf5bfc-e767-4ced-9aad-76a578c53706@ti.com> <Z6Oj7eMRV9z9lF2I@shredder>
Content-Language: en-US
From: "Malladi, Meghana" <m-malladi@ti.com>
In-Reply-To: <Z6Oj7eMRV9z9lF2I@shredder>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_060204_949076_4FEF546B 
X-CRM114-Status: GOOD (  19.58  )
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



On 2/5/2025 11:16 PM, Ido Schimmel wrote:
> On Tue, Feb 04, 2025 at 11: 25: 39PM +0530, Malladi, Meghana wrote: > On 
> 1/23/2025 10: 55 PM, Ido Schimmel wrote: > > XDP program could have 
> changed the packet length, but driver seems to be > > This will be true 
> given, emac->xdp_prog
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source 
> of this email and know the content is safe.
> Report Suspicious
> <https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK! 
> v9dnXdhkNoe0hkqlFZKoUhMAqXZwolk5zXhypw1qeZY8pxUHTuuleZBOKulyBnK9eA$>
> ZjQcmQRYFpfptBannerEnd
> 
> On Tue, Feb 04, 2025 at 11:25:39PM +0530, Malladi, Meghana wrote:
>> On 1/23/2025 10:55 PM, Ido Schimmel wrote:
>> > XDP program could have changed the packet length, but driver seems to be
>> 
>> This will be true given, emac->xdp_prog is not NULL. What about when XDP is
>> not enabled ?
> 
> I don't understand the question. My point is that the packet doesn't
> necessarily look the same after XDP ran.
> 

emac_rx_packet() is a common function for both XDP and non-XDP use 
cases. XDP will only run when emac->xdp_prog is not NULL. I understand 
that when XDP ran, it can change the contents of the packet hence it is 
advisable to use "xdp_build_skb_from_buff(const struct xdp_buff *xdp)", 
but for cases when xdp doesn't run - the xdp struct has junk/zero value 
which cannot be converted into some valid skb. But I think I will do 
something like this:

if (emac->xdp_prog)
	xdp_build_skb_from_buff(xdp);
else
	skb = napi_build_skb(pa, PAGE_SIZE);

Hope this will address your comment.

>> 
>> > building the skb using original length read from the descriptor.
>> > Consider using xdp_build_skb_from_buff()
>> > 
>> 
> 


