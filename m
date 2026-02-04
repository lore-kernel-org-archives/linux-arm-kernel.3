Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F33CBE9536F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 10:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z0wE8/eCBrJtGyA3uJxAm11kq+LtLSA96Fcx9eSMR58=; b=ZBsU/HVzLYiyWn9gMy67CTlyiN
	gVmCW27gj1fVjw4AlwpcAuPNj6T/2XAUAKllZDLM5b5nyvhh8jUBmc4mnv3LX/a8Oj+UQjTyzIaEU
	LlT+Kn7N1IaaOUR8e6caq83br//wC9qRfFlmaXErXgrOGWpuwkrRWn9pJQGIxuP18gw3jCbyyrQ+5
	wuEnYVmnUmL/mPE6uUPwqAXW3rsKz3x+1ZUNGUr5IYt5NyTVYPlyJ1868foimd0kVbcpEuZdQIAQq
	25n/DSVPTicncd74ZKrD5ZIvC/zNyF7Q50miUuFIiSFSDpPhsbmbp15VO2BaJEWBfgZOtrSA+2MWe
	KVJJ88Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnZh9-00000008GDv-0W4M;
	Wed, 04 Feb 2026 10:01:11 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnZh6-00000008GDN-3bdI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 10:01:10 +0000
Received: from mail.maildlp.com (unknown [172.18.224.83])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4f5bSd2lRLzJ46hC;
	Wed,  4 Feb 2026 18:00:17 +0800 (CST)
Received: from dubpeml500005.china.huawei.com (unknown [7.214.145.207])
	by mail.maildlp.com (Postfix) with ESMTPS id 39DB940573;
	Wed,  4 Feb 2026 18:01:06 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml500005.china.huawei.com
 (7.214.145.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 4 Feb
 2026 10:01:05 +0000
Date: Wed, 4 Feb 2026 10:01:04 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Abdurrahman Hussain via B4 Relay
	<devnull+abdurrahman.nexthop.ai@kernel.org>
CC: <abdurrahman@nexthop.ai>, Michal Simek <michal.simek@amd.com>, Andi Shyti
	<andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andy Shevchenko
	<andriy.shevchenko@intel.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v10 2/7] i2c: xiic: remove duplicate error message
Message-ID: <20260204100104.00001a85@huawei.com>
In-Reply-To: <20260204-i2c-xiic-v10-2-c2b996425235@nexthop.ai>
References: <20260204-i2c-xiic-v10-0-c2b996425235@nexthop.ai>
	<20260204-i2c-xiic-v10-2-c2b996425235@nexthop.ai>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml100010.china.huawei.com (7.191.174.197) To
 dubpeml500005.china.huawei.com (7.214.145.207)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_020109_053952_1030FA6D 
X-CRM114-Status: GOOD (  12.54  )
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

On Wed, 04 Feb 2026 07:01:59 +0000
Abdurrahman Hussain via B4 Relay <devnull+abdurrahman.nexthop.ai@kernel.org> wrote:

> From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
> 
> The devm_request_threaded_irq() already prints an error message. Remove
> the duplicate.
> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

> ---
>  drivers/i2c/busses/i2c-xiic.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
> index 16ff83fe280b..4cb7c40fb565 100644
> --- a/drivers/i2c/busses/i2c-xiic.c
> +++ b/drivers/i2c/busses/i2c-xiic.c
> @@ -1491,11 +1491,8 @@ static int xiic_i2c_probe(struct platform_device *pdev)
>  	ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
>  					xiic_process, IRQF_ONESHOT,
>  					pdev->name, i2c);
> -
> -	if (ret < 0) {
> -		dev_err_probe(&pdev->dev, ret, "Cannot claim IRQ\n");
> +	if (ret)
>  		return ret;
> -	}
>  
>  	i2c->singlemaster =
>  		of_property_read_bool(pdev->dev.of_node, "single-master");
> 


