Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A277CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 05:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F75mzR8twH/mSVbUSPi+Z2WCD89OpV0qBy++5+MrAjw=; b=XiamyY1kndSGh7fAeZu7QLIFk7
	HOGAwm9Xs5cwfQBNMIEg93+xVYvGgXFFiprzVGMUzPyl5SaK9SDUx6g2sLvetNSOmvR3y1ccv1rFO
	BsTnSPeRIZpzhYU4bmrkBh1E8E1733oLWRuGJUdTA0AQhku5413tEor/VYZ5q74nEfyJYAgXKOCmA
	CfmTh0Q0kqglJON+gocyAPbe8yjNtMS+w8dFgGLC3w3MmKcD2kDu67sXxLURj+mWmudMO5SraDOr8
	1WocbE1RYe13CLDylKLjTCPtYoJYqWdlRuFhX1ZVf/jMquIu5fLnokPno84imtVCvM6sPX5Y6Y5vv
	gJeWB7xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGsy7-0000000EuSU-1Pzg;
	Thu, 06 Nov 2025 05:55:35 +0000
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGsy6-0000000EuSA-0b80;
	Thu, 06 Nov 2025 05:55:34 +0000
Message-ID: <8766fc64-f7d5-4443-8646-604f98a6d26f@infradead.org>
Date: Wed, 5 Nov 2025 21:55:33 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: parport-lowlevel: Separate function
 listing code blocks
To: Bagas Sanjaya <bagasdotme@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-actions@lists.infradead.org
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>, =?UTF-8?Q?Andreas_F=C3=A4rber?=
 <afaerber@suse.de>, Manivannan Sadhasivam <mani@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20251105124947.45048-1-bagasdotme@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20251105124947.45048-1-bagasdotme@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 11/5/25 4:49 AM, Bagas Sanjaya wrote:
> Commit be9d0411f1608a ("parport-lowlevel.txt: standardize document
> format") reSTify parport interface documentation but forgets to properly
> mark function listing code blocks up. As such, these are rendered as
> long-running normal paragraph instead.
> 
> Fix them by adding missing separator between the code block marker and
> the listing.
> 
> Fixes: be9d0411f1608a ("parport-lowlevel.txt: standardize document format")
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  Documentation/driver-api/parport-lowlevel.rst | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/driver-api/parport-lowlevel.rst b/Documentation/driver-api/parport-lowlevel.rst
> index 0633d70ffda7fa..a907e279f509b4 100644
> --- a/Documentation/driver-api/parport-lowlevel.rst
> +++ b/Documentation/driver-api/parport-lowlevel.rst
> @@ -7,6 +7,7 @@ PARPORT interface documentation
>  Described here are the following functions:
>  
>  Global functions::
> +
>    parport_register_driver
>    parport_unregister_driver
>    parport_enumerate
> @@ -34,6 +35,7 @@ Global functions::
>  Port functions (can be overridden by low-level drivers):
>  
>    SPP::
> +
>      port->ops->read_data
>      port->ops->write_data
>      port->ops->read_status
> @@ -46,17 +48,20 @@ Port functions (can be overridden by low-level drivers):
>      port->ops->data_reverse
>  
>    EPP::
> +
>      port->ops->epp_write_data
>      port->ops->epp_read_data
>      port->ops->epp_write_addr
>      port->ops->epp_read_addr
>  
>    ECP::
> +
>      port->ops->ecp_write_data
>      port->ops->ecp_read_data
>      port->ops->ecp_write_addr
>  
>    Other::
> +
>      port->ops->nibble_read_data
>      port->ops->byte_read_data
>      port->ops->compat_write_data
> 
> base-commit: 27600b51fbc8b9a4eba18c8d88d7edb146605f3f

-- 
~Randy

