Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCACAC5DF74
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 14:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UAkcgdEMwmE9sdUoY4qewo8s31VVAONo66F8/bIGiz8=; b=l/hl0UqOe+u48U8pspBLKOEnzj
	xC1lA0koCJ1GQce+LDv8ty9YjjGMwiHMXaN59zUiYkjT3wCa4C0N3Tq9jPN6l0nthu8rVG6zhpsNB
	59AlYakVRT3PAbEjk58smFFkZ0W5AQt2ZDCrK86XqQXJhgUXorJDL2Cfq7BF1Ti0dD+AA7nyR3Boj
	kqRlfkYlDbV4S5blDqKYZqqMi8YjKrGdDIG9xRbvGsC9bJ1WNo2GxSs6YZlHhv7pfmwM7YLPZziVj
	CAK6ryL/4jqYCd5t/hcqlF0Ip4SMEesIHysWsz3tLRBSLPcyP9iLz/15IhLKiS7SmOXHr9i8X/5IV
	vO+XxBfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwLGb-00000008DDC-44LP;
	Tue, 18 Aug 2026 14:58:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwLGa-00000008DCT-2Lmu;
	Tue, 18 Aug 2026 14:58:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 53A9C4120F;
	Tue, 18 Aug 2026 14:58:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95E6D1F000E9;
	Tue, 18 Aug 2026 14:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787065096;
	bh=UAkcgdEMwmE9sdUoY4qewo8s31VVAONo66F8/bIGiz8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gxm/qsLK/jepvvBrLNu7hBTqsLfuIpD3GgIpFs5cidsKSl9iPBEXZog8OZYQsXY4/
	 HwnDymvczFtUEK1rgDO8omopD4PnogHS32yDGzgtzSOT5E4Eq9OXELNvGCthAKexy2
	 vdaYJLYqFO6jDEKAXxejuNgqFeLGZFhPMzagzItcGeteDH38JflsP3t7t/y4WzfmXg
	 1zDgjpbseESHdmjKdhpXbLO3FyWh5H5mPgPTwdXK5XH+pXg5cE+bhUrNT/W0VgawSs
	 3P7Tfekl7c0Ca6LSTRFrDC54h6AjAwd23jzOKfipgpb0tbc243/16jyJXwLImmtflH
	 DMYWhOXQDK8Iw==
Date: Tue, 18 Aug 2026 16:58:13 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: zhaohaiyang1 <yewentian395@gmail.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, 
	bcm-kernel-feedback-list@broadcom.com, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, linux-i2c@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	zhaohaiyang1 <zhaohaiyang1@xiaomi.com>
Subject: Re: [PATCH] i2c: bcm2835: add missing braces to for loop in
 bcm2835_i2c_xfer
Message-ID: <aoRysYp25Ni4jMaL@zenone.zhora.eu>
References: <20260817130234.372628-1-yewentian395@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260817130234.372628-1-yewentian395@gmail.com>
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

On Mon, Aug 17, 2026 at 09:02:34PM +0800, zhaohaiyang1 wrote:
> From: zhaohaiyang1 <zhaohaiyang1@xiaomi.com>
> 
> Add curly braces around the multi-statement body of the for loop
> that checks for unsupported read messages. This fixes a coding
> style issue where the compound statement lacked explicit braces.

it's not a multi statement body, if you look very carefully from
closer, there is only one single solitary 'if' statement.

> Signed-off-by: zhaohaiyang1 <zhaohaiyang1@xiaomi.com>

Please next time use your real name here.

Thanks,
Andi

> ---
>  drivers/i2c/busses/i2c-bcm2835.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-bcm2835.c b/drivers/i2c/busses/i2c-bcm2835.c
> index 8554e790f8e3..76d017cf1582 100644
> --- a/drivers/i2c/busses/i2c-bcm2835.c
> +++ b/drivers/i2c/busses/i2c-bcm2835.c
> @@ -349,12 +349,13 @@ static int bcm2835_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
>  	unsigned long time_left;
>  	int i;
>  
> -	for (i = 0; i < (num - 1); i++)
> +	for (i = 0; i < (num - 1); i++) {
>  		if (msgs[i].flags & I2C_M_RD) {
>  			dev_warn_once(i2c_dev->dev,
>  				      "only one read message supported, has to be last\n");
>  			return -EOPNOTSUPP;
>  		}
> +	}
>  
>  	i2c_dev->curr_msg = msgs;
>  	i2c_dev->num_msgs = num;
> -- 
> 2.43.0
> 

