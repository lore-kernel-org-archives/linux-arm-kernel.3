Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91470D73E80
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 20:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U/ShU2t5bze21124krsd/kbfEZY86If/E4+xvG3EuYY=; b=r45B1GB6q0L+JTWviDIRWhx2t6
	Ekw2V8EbopncwnhNG9bzOyuBtH/c95g2aSM+Iuod/sCLQArx0zMqlSBvefCuQQ/ssDRPyduFH6DLw
	+CsUeuMrwyE0u8Q0DT/kI8QRqlIYFqXYd3MPaFEKkjEYg5o/vxoGOn4dRcXcAGG5AJhdKkcg0eDnA
	gK1A/wM9TTP3vtwtX3UveFNTN8+sn0/7KOUNOy+cM2xGgX1qRAqqJvKB6KuPITTZAQbN3YlJ7qMjA
	EUf2d1tc+PPB/7dQHY5zyhJzTDHqKHfSFCRnJ9RQY41WntjbK9boxwyAAxTt7HEaAXDPfNEcS6fPh
	eLezx7kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlYOL-00000000azt-0Msi;
	Thu, 29 Jan 2026 20:13:25 +0000
Received: from out-171.mta0.migadu.com ([2001:41d0:1004:224b::ab])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlYOC-00000000axn-49nG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 20:13:19 +0000
Message-ID: <dd8cef14-3149-4181-a57e-f772341e0246@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1769717592;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U/ShU2t5bze21124krsd/kbfEZY86If/E4+xvG3EuYY=;
	b=N39i9Gg2aDhrbF9fYTMtRN0OltQ3Yi67BwL0chPKuLsD8zZUaMhCxas1a+DHXFZ9qVr/Ly
	DeRgJCi0Yp+mQs81pLOqXoLszo4kq7WBufU8nzZQurHPOZTMsESHuW2yBPKwfsBB7aXcyv
	p9PslhTIMfYsuHixSNjXTSOPASj95yk=
Date: Thu, 29 Jan 2026 15:13:07 -0500
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] ASoC: xilinx: xlnx_i2s: Discover parameters from
 registers
To: Andrew Lunn <andrew@lunn.ch>
Cc: Mark Brown <broonie@kernel.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
 Jaroslav Kysela <perex@perex.cz>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Michal Simek <michal.simek@amd.com>,
 Takashi Iwai <tiwai@suse.com>
References: <20260129172315.3871602-1-sean.anderson@linux.dev>
 <20260129172315.3871602-3-sean.anderson@linux.dev>
 <700e4e67-a2ed-4b37-a00b-303bbc5ee6cd@sirena.org.uk>
 <a95d7feb-4d94-4b25-be96-c7c367342c19@linux.dev>
 <866360d1-19d1-4a72-91a6-b2e716195820@lunn.ch>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <866360d1-19d1-4a72-91a6-b2e716195820@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_121317_455371_F886F471 
X-CRM114-Status: GOOD (  19.50  )
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

On 1/29/26 14:58, Andrew Lunn wrote:
> On Thu, Jan 29, 2026 at 12:46:27PM -0500, Sean Anderson wrote:
>> On 1/29/26 12:27, Mark Brown wrote:
>> > On Thu, Jan 29, 2026 at 12:23:15PM -0500, Sean Anderson wrote:
>> > 
>> >> -	ret = of_property_read_u32(node, "xlnx,num-channels", &drv_data->channels);
>> > 
>> >> -	ret = of_property_read_u32(node, "xlnx,dwidth", &drv_data->data_width);
>> > 
>> > Given that the properties already exist it seems wise to continue to
>> > parse them if available and prefer them over what we read from the
>> > hardware, it would not shock me to discover that hardware exists where
>> > the registers are inaccurate or need overriding due to bugs.
>> 
>> I would be surprised if such hardware exists. These properties are
>> automatically generated by Xilinx's tools based on the HDL core's
>> properties. This has a few consequences:
>> 
>> - They always exactly match the hardware unless someone has gone in and
>>   modified them. I think this is unlikely in this case because they
>>   directly reflect parameters that should not need to be adjusted.
>> - Driver authors tend to use them even when there are hardware registers
>>   available with the same information, as Xilinx has not always been
>>   consistent in adding such registers.
>> 
>> I am not aware of any errata regarding incorrect generation of
>> properties for this device or cases where the number of channels or bit
>> depth was incorrect.
> 
> Does version 0.0 of this IP core have this register? Its not a new
> addition?

As far as I know, this register was present in 1.0 revision 0. I
reviewed the changelog for the core as well as the product guide
changelog and found no mention of any register additions.

> Is there a synthesis option to disable this register?

No.

--Sean

