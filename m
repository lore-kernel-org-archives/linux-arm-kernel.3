Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D84BFC4452B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 04:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tmgyHk6loOLo2xFly+bTdBXTfayYJvruU03nKY/rO4k=; b=wgy3h9wv7AF4F/o1FUeWSikNtu
	HDthmPpaO2psoisZpUT/tLd8qUwoeM3K5kI8gspS7mM8/u24saqkkLkSDtXMC5CWiH/ObVwknMbNF
	T6yEhpgZdHWT26Vue7+IqKftAUaTve8xq0pf281DDQ4DmsNv9vyWqHfLk6wIPpBo1vuGeMf/4114s
	s/25/QakqXH7Z6nyIMDvaSW6HC3iZk30FHKOX00Z5aXxvG60YT28pCIPsgyXg9JN8mRoDSTOQoW9r
	ne3iAcrRVGOmM7nhIMHIQSmbHgHWTLx4ThnBX8GXz0Eark3KQkwi1GmJ4OQ2HIDBQ2s9s0V3rsaR+
	vUbStcgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmlLi-0000000DQhZ-38ZC;
	Thu, 23 Jul 2026 04:47:58 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmlLg-0000000DQgl-0qsc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 04:47:57 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5782E11AF26;
	Thu, 23 Jul 2026 06:47:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1784782073;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=tmgyHk6loOLo2xFly+bTdBXTfayYJvruU03nKY/rO4k=;
	b=aJO93URXK63r7gBQTWR5JyNICiyYIxrp7Wqf20fWRrLXz8FM5JjUM3yFLnU02+o5BxHhAB
	zTqNqLfc/x01qimvxrcx6R5NdniXq70o82xWH+MipwrvCLZhrWgnkmbErdXIbAXJN9xzQo
	PFP6PyfusspfW5cKxwdtJCu31bNWoxt3Geaa1R2CCp3NpFUYY06pRwRPA0ZoABRTFaiL9R
	urrlpG1QK4rOJTlEuN2S72+p0X0UwD+gVEH40iSOYhYyz1pSwreSPJjj2+gG50iXVqEXCq
	naZLHOkflGhzFrZ0KTPsczSBuE3KlojWvs0wP3xMmYgGz/XKJpnZpTpqIZefeA==
Message-ID: <d7844d5d-1ce5-2b31-64ca-4ff2798ce221@nabladev.com>
Date: Thu, 23 Jul 2026 06:47:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2] driver: fpga: xilinx-selectmap: add csi and rdwr
 support
Content-Language: en-US
To: Xu Yilun <yilun.xu@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-fpga@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Michal Simek <michal.simek@amd.com>,
 Moritz Fischer <mdf@kernel.org>, Tom Rix <trix@redhat.com>,
 Xu Yilun <yilun.xu@intel.com>
References: <20260721114258.3324794-1-hs@nabladev.com>
 <amGbvtMWHXjpE35D@yilunxu-OptiPlex-7050>
From: Heiko Schocher <hs@nabladev.com>
In-Reply-To: <amGbvtMWHXjpE35D@yilunxu-OptiPlex-7050>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_214756_462705_811644CA 
X-CRM114-Status: GOOD (  13.47  )
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

Hello Yilun,

On 23.07.26 06:42, Xu Yilun wrote:
> On Tue, Jul 21, 2026 at 01:42:52PM +0200, Heiko Schocher wrote:
>> Add csi_b and rdwr pin support for the xilinx,selectmap driver.
>>
>> In current driver the pins are configured from DTS and set to
>> GPIOD_OUT_HIGH. This works in case you have one FPGA.
>>
>> Extend this to really implement csi_b and rdwr pin function in
>> driver, so it works with more than one FPGA.
> 
> Please help specify in changelog: what do csi_b, rdwr pins do? Why they
> now work with one FPGA but not with 2 FPGAs? How do you select which FPGA
> to reprogram? thanks.

I will try to add this. You find some hint here:

Documentation/devicetree/bindings/fpga/xlnx,fpga-selectmap.yaml

Thanks!

bye,
Heiko
> 
> Thanks,
> Yilun
> 

-- 
Nabla Software Engineering
HRB 40522 Augsburg
Phone: +49 821 45592596
E-Mail: office@nabladev.com
Geschäftsführer : Stefano Babic

