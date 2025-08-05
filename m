Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5329C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 21:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cDvcXYGl2SM9lHx0jfhT79En8esQte6fbgJAw4tuiQU=; b=faHbT3zu8MoeXh0t2cFnotjYk/
	jxq8z2opfFZmrGwFaFBaSCfqaug95qM7aXQO25RkxCvo6wk6N2MpVthzdtB5G8/n24zISq+65UtG/
	dJFAOBcdVJX3QFfJ8ilZQxuhjVR37WHFDbkFM0kQN1+w8knZ5l2jvRmW0/38kg9PcQyoq7/BbP6hC
	VN7lqGJh5YFb8va42F1YC+PQ5RlIuv+2nwaWxTMiAqyvMHXvtQpPpWihLCg9n3PdvtPEDlBCr/jAu
	tz9jryF3Ai0WCr2RSaP5UVX4bfcGXjvSJrLYM2zuQkMJu+YXQQ9naLdqK2gLxfKJfsBgsmMP5fdFm
	YGoI9Vlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujP5S-0000000DoxU-1CMj;
	Tue, 05 Aug 2025 21:20:46 +0000
Received: from out-176.mta1.migadu.com ([2001:41d0:203:375::b0])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujP11-0000000DoNv-1hmx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 21:16:13 +0000
Message-ID: <6349fbbb-de1f-4ec9-abb0-96b4e2d37c97@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1754428564;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cDvcXYGl2SM9lHx0jfhT79En8esQte6fbgJAw4tuiQU=;
	b=TsyzzyM63LSewoRZ9QH/0uF5rJN/ZQvLNt6sIZ0oNVMt0VV7yXoh8+xXI77+nE1OgqEDkz
	GblkHkxXM0x1Qc/a1TurMcTEg9CrYt1QYiYBItv4jmOoaitNAVOnw7/TkwjZuEdL7eIiNP
	PTWOCUCvr2iFWc2IpLCZF9/+t6cmiaY=
Date: Tue, 5 Aug 2025 17:15:59 -0400
MIME-Version: 1.0
Subject: Re: [PATCH net-next v4 3/7] net: axienet: Use MDIO bus device in
 prints
To: Andrew Lunn <andrew@lunn.ch>
Cc: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Michal Simek <michal.simek@amd.com>,
 Leon Romanovsky <leon@kernel.org>
References: <20250805153456.1313661-1-sean.anderson@linux.dev>
 <20250805153456.1313661-4-sean.anderson@linux.dev>
 <8a28ce41-f28d-4089-8a8e-a82ae2ccfc82@lunn.ch>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <8a28ce41-f28d-4089-8a8e-a82ae2ccfc82@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_141611_600369_6FACD4C0 
X-CRM114-Status: GOOD (  10.41  )
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

On 8/5/25 17:07, Andrew Lunn wrote:
> On Tue, Aug 05, 2025 at 11:34:52AM -0400, Sean Anderson wrote:
>> For clarity and to remove the dependency on the parent netdev, use the
>> MDIO bus device in print statements.
> 
>> @@ -186,28 +187,31 @@ static int axienet_mdio_enable(struct axienet_local *lp, struct device_node *np)
>>  		/* Legacy fallback: detect CPU clock frequency and use as AXI
>>  		 * bus clock frequency. This only works on certain platforms.
>>  		 */
>> -		np1 = of_find_node_by_name(NULL, "cpu");
>> +		np1 = of_find_node_by_name(NULL, "lpu");
> 
> There is nothing about dev in this change?

Whoops, this was left over from doing s/lp/cp/ and then reverting
it when I decided that there would be too much diffstat. Will fix for v5.

--Sean




