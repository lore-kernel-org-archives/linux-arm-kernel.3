Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA6D9C282D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 10:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yCqVZdRR3wuwl1YUaUIIxJGus32Wsp9w18Z1riLWvQk=; b=2p4ZMY+Ajt9J7N5b91XAYoV9d6
	3QbUUsaXYj3+7h3Q6/oWg77mBBtj+18f0/fxOMvuD42CbYHBblD/0l/ShkiAFDF4+2PBQcXUcDS/e
	MxWoBYWCCya50uzrX7Pf9QjZFDAeFlzKSY3X7QTWudHAZZNGt5ZisDfDK1um7465Aq+BQPJ6JAyfs
	hhQBCOlowbWj/oTLxfGDfgn6aCz2NOfLoM1/KgVNUva00BGyfYmsfZQlBlM4gi8bwoTTxjsx1Venq
	qP/3qxC6GMVePKd59sY/6bgcUBk8YCW83LXGCyQvwHoQ8P1+wjq4ybYUhcE8zVW7+dO235g60dsFD
	T53BfP2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpPcZ-00000004AuF-1pxI;
	Tue, 04 Mar 2025 10:35:31 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpP7Q-000000043ar-2CPA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 10:03:21 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id DEE8BA0B13;
	Tue,  4 Mar 2025 11:03:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=yCqVZdRR3wuwl1YUaUII
	xJGus32Wsp9w18Z1riLWvQk=; b=iWPcUVrsZN3bKc1ntgJPwKf2w5CUj56/hbM7
	QbTM7wTdc2PqTyGXYDxpyFRuL7HKhsuf2CspjsWK3k4q8qp4JNAJr75bDJV1AruA
	vdoxpnNJIcvDofbKCfIb0PNwk6576KEab40UnMwjxMz2U7u91Tv1apoDRSEICMmZ
	SmtvwO8VTA9JI59X/rhTxpBuXD6bUh0vhvmaMwn8CpNre6BMQdVvKXADMNRzUR8u
	1OOanzAIDxxVzRtK2iJZi48PcbGCGprEO25Gv/jOK4Vwk+lADW85V6J4z83WDisi
	NgSvkeX9+imdXHFs8V9N/Rz9SOjN2EHwZY8Clwp/YiBEv7lWEOASFlh2j7iV24FV
	PvgFtOiiEKW10TZ7ijwr+ME1L7isUDI2KX6NfZ9iaIKoS0fgcL2IGQPzgcS6bdS/
	plgTAaobgQHr2BO6yj+PP7yxTKkZ0We+M5DmR1V48/i1470CXQTO52RDYLtICj4x
	MxUK9JhR9tkuO+nALISyoEZasjaTYdNpxYAMc2xZWzR1z1qlzARnJ1Qd/iDuxbfW
	YbWlN3IOTY3mCP1PEJvNkigPemD+aI2YBdEf5Ur6HfHop/QZ739Aa5CN7iTT+oWa
	/6EMuk2MaAHIo+29qwGYPxahqlDGbcjQLbc5ab+NjxUA3C3GhwPHsVNRq4EepwX1
	GUFKdbM=
Message-ID: <1604dce5-7be6-4a95-a51c-0c760a6c9a76@prolan.hu>
Date: Tue, 4 Mar 2025 11:03:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] counter: microchip-tcb-capture: Add capture
 extensions for registers RA/RB
To: William Breathitt Gray <wbg@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-iio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Kamel Bouhara <kamel.bouhara@bootlin.com>
References: <20250227144023.64530-1-csokas.bence@prolan.hu>
 <20250227144023.64530-4-csokas.bence@prolan.hu> <Z8awGBW8obpG1QPN@ishi>
Content-Language: en-US, hu-HU
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
In-Reply-To: <Z8awGBW8obpG1QPN@ishi>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.254.7.14]
X-ClientProxiedBy: ATLAS.intranet.prolan.hu (10.254.0.229) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94852637260
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_020320_721908_96CB25ED 
X-CRM114-Status: GOOD (  16.36  )
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

On 2025. 03. 04. 8:47, William Breathitt Gray wrote:
> It's cleaner to exit early on an error than to carry it to the end.
> Instead of if (!ret), perform an if (ret) return ret to exit early on an
> error, then simply return 0 at the end of the funtion.

Ok.

> The capture2 extension doesn't exist in this patch so remove this
> comment line.
> 
>> @@ -30,6 +33,12 @@ enum counter_mchp_signals {
>>   	COUNTER_MCHP_SIG_TIOB,
>>   };
>>   
>> +enum counter_mchp_capture_extensions {
>> +	COUNTER_MCHP_EXCAP_RA,
>> +	COUNTER_MCHP_EXCAP_RB,
>> +	COUNTER_MCHP_EXCAP_RC,
>> +};
> 
> Remove COUNTER_MCHP_EXCAP_RC for the same reason as above.
> 
> Also, I would argue for these to be preprocessor defines rather than
> enum for the same reasons as in my other review[^1].

Ok.

> One final comment: is RA/RB the best way to differentiate these? One of
> the benefits of abstraction layers is that users won't need to be
> concerned about the hardware details, and naming the capture values
> after their respective general register hardware names feels somewhat
> antithetic to that end.
> 
> I imagine there are better ways to refer to these that would communicate
> their relationship better, such as "primary capture" and "secondary
> capture". However at that point capture0 and capture1 would seem
> obvious enough, in which case you might not even need to expose these to
> userspace at all.

Hmm. Well, RA and RB is what it says in the datasheet, and since we 
don't do much processing on their value, I'd say we're still closely 
coupled to the hardware. So, if one wants to understand what they do, 
they will have to read the datasheet anyways in which case I think it's 
best to be consistent with it naming-wise.

> William Breathitt Gray
> 
> [^1] https://lore.kernel.org/all/Z8alaOTjZeRuXnUI@ishi/

Bence


