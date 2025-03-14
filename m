Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCAA0C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 07:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=5H1Bzh9sCn2QvlMMHbiNUxTkUh8co5OPOP7KYkJgNlk=; b=47nZpjnKPZvojSIXVCUzNH0CO2
	XDkceWp1/3Yc6lcj54aGH2zCu8aVs7oerL9/MUMjKr5HIBehiJtw53rz2IdXw6pDEjHBwjvcdJCvt
	5xrEeRL/tTWXdIFxcYnht6AAjHLJ8kTbx7dRameLmk4gag2SUriKh1YXOottD5qrMUCA+eOnlm6Uz
	GYY6MVFFuRcuKC3fojMpsSDA/29AqOSkFceCu5fFACuRxPoJhFVTI3qNwV49L+Z8+dULcJYiWhzJx
	JuE+q7oOEHSXXzetacICaROhjpSwRFBSnHUbzWDH/goC4aDKzHKj5cg+sj8Hn73K4bXyx9pp/t80/
	ldlDI0nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tszYb-0000000DKDh-2Dgp;
	Fri, 14 Mar 2025 07:34:13 +0000
Received: from [42.101.60.213] (helo=mail.nfschina.com)
	by bombadil.infradead.org with smtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tszWv-0000000DK0c-0Imt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 07:32:30 +0000
Received: from [172.30.20.100] (unknown [180.167.10.98])
	by mail.nfschina.com (MailData Gateway V2.8.8) with ESMTPSA id 1D694606A5D33;
	Fri, 14 Mar 2025 15:32:26 +0800 (CST)
Message-ID: <57885b0a-eb21-4eea-9b85-71a1fd8cd6a0@nfschina.com>
Date: Fri, 14 Mar 2025 15:32:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: remove the invalid comments
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Peter Chen <peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>,
 Roger Quadros <rogerq@kernel.org>, Michal Simek <michal.simek@amd.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
X-MD-Sfrom: liqiong@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: liqiong <liqiong@nfschina.com>
In-Reply-To: <2025031430-poncho-aviator-8131@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_003229_284534_84A9B2D3 
X-CRM114-Status: UNSURE (   5.90  )
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



在 2025/3/14 15:12, Greg Kroah-Hartman 写道:
> On Fri, Mar 14, 2025 at 03:09:21PM +0800, Li Qiong wrote:
>> These function don't return value, remove the invalid comments.
>>
>> Signed-off-by: Li Qiong <liqiong@nfschina.com>
>> ---
>>  drivers/usb/cdns3/cdns3-plat.c      | 2 --
>>  drivers/usb/gadget/udc/udc-xilinx.c | 2 --
> This should be 2 different patches, right?
Yeah, I will split this patch and send again.
thanks.



>
> thanks,
>
> greg k-h


