Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FDFAC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Jun 2026 18:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uHOeYxkKAiQhzavro8PL41M7M0u24klFsT/bDBnVfU8=; b=rwR4RWA5Lo1gTukv0VKChvk07S
	EPxWsdw4ZByfgwTiguIVVuT0fh9lgDKyjIogLkpdjDqxTRxxI3RLiiQ9Q1zumFBbX6dhvdY0sJo+l
	DmJ60qQ137ci65XRHOm+tbXet1/2hX28zlWmZtQlNog6+OvShIsibFLcaOciDCu3o7bejUuQgi/ME
	/VqN9pi5emvwfl35RmHQq2g7NMA96UfNW/GCAUFy8/7+1a0iTXMPzKpY1P+mV4YIBdKEEcNZIZ+pw
	SUY0avXbNHUGW/mc2YLVH/eyspskgTog193F3NLKKnlr3xLCpMV1aSA4n1qUiFS4URSw++Oxru0na
	bFjJ4JDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdXXK-0000000ChLp-04zo;
	Sat, 27 Jun 2026 18:13:50 +0000
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdXXI-0000000ChLV-23bK;
	Sat, 27 Jun 2026 18:13:48 +0000
Message-ID: <1d27f8eb-30eb-4f2a-ad3d-54d39e63ad57@infradead.org>
Date: Sat, 27 Jun 2026 11:13:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: parport-lowlevel: Fix curly bracket
To: Manuel Ebner <manuelebner@mailbox.org>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Andreas Faerber <afaerber@suse.de>, Manivannan Sadhasivam <mani@kernel.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 "moderated list:ARM/ACTIONS SEMI ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/ACTIONS SEMI ARCHITECTURE"
 <linux-actions@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
References: <20260627092359.30044-3-manuelebner@mailbox.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260627092359.30044-3-manuelebner@mailbox.org>
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



On 6/27/26 2:24 AM, Manuel Ebner wrote:
> Remove needless '}'
> 
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

> ---
>  Documentation/driver-api/parport-lowlevel.rst | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/Documentation/driver-api/parport-lowlevel.rst b/Documentation/driver-api/parport-lowlevel.rst
> index a907e279f509..af73741289c9 100644
> --- a/Documentation/driver-api/parport-lowlevel.rst
> +++ b/Documentation/driver-api/parport-lowlevel.rst
> @@ -341,7 +341,6 @@ EXAMPLE
>  			/* Try to detect a device on the port... */
>  			...
>  		}
> -		}
>  
>  		...
>  	}

-- 
~Randy

