Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91990C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 15:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tNLkO+C/O4wUtQK41dTVRispYwNREreB/GWIXCH/Jws=; b=IwDjt7r5uOymYWAJC4VDtf6QTm
	iexPhF7PKTj+Aw6NMbhKRwRJPtExgL9n+3xUpOMUqiX4lpmiLjyJSpjqUqcuK+hkLpstGqUyzzaD2
	jwuSfWQrkUlm0qQux8/I4zYRL9mbbvfcQYicyGRDoi7V5ywQuptLfpvrBr+WtZH4/XzkXEzIvVRob
	zhDCZp/HIX1QvVO8VRut0jpy2K6GS3sJWe4uBeRSzu7+moTRddYbQXxLO65gSQmzAY1GsotOOf7xJ
	/0YNtaxuxaheDrvomGpsW7RJn2mrrp0Hgj1YkDfvw3o29jcW5KkNmVStmnJN2giHXCLjmjq6LVdFE
	UTMurl+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpU4a-00000005BXO-2dvk;
	Tue, 04 Mar 2025 15:20:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpToj-000000057H0-3Ab0;
	Tue, 04 Mar 2025 15:04:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3E80B5C5C94;
	Tue,  4 Mar 2025 15:02:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2276C4CEE5;
	Tue,  4 Mar 2025 15:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741100660;
	bh=+o6T0HzgdvGFUJUX7UuMNF1GylzuupLD2kKACC8bxn8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=sOKcZPIEhcrkofgzaIVvzJHIRBcXFmCvpTQnHlmEAXJgUuy+KP0OKvkIFjwFB3ont
	 T2c5/8G9ogWmCYYbgcBF6/oFbLRXW2ZSclmf5viUsP4cABtvbh2CllxuUrqKUW5whE
	 O/vdRVnol73I4fAxzswWq1F9SCApNRiFVE+lHBKjgsMt6t5IhQyYonBYPiNKCjIPGB
	 iznXH2YiNwDxhystF12REQU4yKwq4mBvodK5ks2obqz+LjFF8Pu6Yf+nw7Numd5G6A
	 Si54WASMn9PdPPDy5jiayoNOYb1QgYgBjmecoYwM7T9PzyebI/OoxI5VjZIOvDyYoq
	 ySQo+O1oM/qNw==
Date: Tue, 4 Mar 2025 15:04:08 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Kever Yang <kever.yang@rock-chips.com>
Cc: heiko@sntech.de, linux-rockchip@lists.infradead.org, Simon Xue
 <xxm@rock-chips.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/2] iio: adc: rockchip_saradc: add rk3562
Message-ID: <20250304150408.60864bbd@jic23-huawei>
In-Reply-To: <20250227110343.2342017-2-kever.yang@rock-chips.com>
References: <20250227110343.2342017-1-kever.yang@rock-chips.com>
	<20250227110343.2342017-2-kever.yang@rock-chips.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_070421_842313_5D1F4389 
X-CRM114-Status: GOOD (  14.66  )
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

On Thu, 27 Feb 2025 19:03:43 +0800
Kever Yang <kever.yang@rock-chips.com> wrote:

> From: Simon Xue <xxm@rock-chips.com>
> 
> rk3562 is using v2 saradc with 8 channels.
> 
> Signed-off-by: Simon Xue <xxm@rock-chips.com>
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
> ---
> 
> Changes in v2: None
> 
>  drivers/iio/adc/rockchip_saradc.c | 24 +++++++++++++++++++++++-
>  1 file changed, 23 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/adc/rockchip_saradc.c b/drivers/iio/adc/rockchip_saradc.c
> index a29e54754c8f..9995f95bafe0 100644
> --- a/drivers/iio/adc/rockchip_saradc.c
> +++ b/drivers/iio/adc/rockchip_saradc.c
> @@ -1,7 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0-or-later
>  /*
>   * Rockchip Successive Approximation Register (SAR) A/D Converter
> - * Copyright (C) 2014 ROCKCHIP, Inc.
> + * Copyright (C) 2014 Rockchip Electronics Co., Ltd.
This 'fixup' should have been mentioned in the patch description.
Not that important though so I'll leave it this time.

