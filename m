Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA08DD2ECF7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 11:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZN6Js6bvYUwBHKtacRq+m09Crr6gkPDpjl2gN8opAjY=; b=L6sgMd7yqjyASVcRu933wQhLf3
	76nKAKitfGHZE0uKihz0yAvNWk/L8gF+Gmw1BUOrDFMvf5vT2koiUQG0ybxAFmGf9HiPs+oOkGcz5
	oq6NVoFbG+TmUv3SeESeHwPjizq5PgqqVe+wDLArQpfcPC7xFzgiWIAkcJsv47R6xLzeNKSj0L12U
	+u0xIjCbhs4B6RwtjLmEpooAY/4GKIrRTR/dmFcXtaDV5MsKmQOlKoW0LTamg8CWA3GDD/JEb6GI7
	UIt867u/K7wzgQm5HmHyL3e9H8AgkpsRGR2fH7Xx+b7dGTzzaOWtcRqNFM3Z2H3GTfqFbux8omPce
	l+T6S7sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi9wh-00000003iVs-3keb;
	Tue, 20 Jan 2026 11:30:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi9wg-00000003iVV-1mHF
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 20 Jan 2026 11:30:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ZN6Js6bvYUwBHKtacRq+m09Crr6gkPDpjl2gN8opAjY=; b=TeJmiin21A+sOHSEk5A3kpJlTw
	zgmvrKA27XLXklWP+AumEK64R0wQc7priRO/7aOmtfspufe5JvMyAx7JPt7974QbpfQo0YeEBDbKJ
	foIypg4SoJ6j2cp3UjdLlLk0dlExAnTBA3tB0a8bT5vrio6vpPiwPn3dKm6IGxJWpyc1ZU10JshrO
	wxac1Pv+kZv+SlcxJ5NiCBPMhWIECl7i6GbS4ySc7zWYPBL5ANMwUgQvMaWYlQKk7glyfQwAhqDqU
	1zzdDW4lSMWKzbi3nCwPsZ2jxLjMDinB+56nVNlc8FxdGvyTNtKfc882VJ4NmH4N3IQJ4Vu11p3+x
	FLdzybeQ==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi9wd-0000000Dv24-1hgD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 11:30:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D49B843C7A;
	Tue, 20 Jan 2026 11:30:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9C73C19422;
	Tue, 20 Jan 2026 11:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768908643;
	bh=9NM+oghNkkVqgepU5c12IfRc35B/z3EEEGh8HcAsK7E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RRMSCePle9tlCGNr1cXpZDcYzt8lFk5AAnRVuYS+FTtE+bz8FSLy0yCfKq5J6y5yY
	 RkQHRjP5Rhd2PjQLOsAzAcRfMdEXMNJCY3iyphh+MWusaW69V3+vTCEl20EdkTNjJL
	 j7zC6Mq9zJx+MTbbNs+RfuOG8PuWEdYVbDcY1i02DTGqXKY43rse/XLOPfkp7SfN0P
	 WD7okPXlpjEH9u+RyvOkg6+M3XRakmZAudwHyKVu/apnE43TbduJUejT5JaJ2VXdwx
	 LGqV1zQ3jpMTmqv83Wn/IaoKQFJgluPxVBeWgpd9082AXYqJeSAWGbDMJKaVUL0TN4
	 FA5r4cjTWHXZQ==
Date: Tue, 20 Jan 2026 12:30:38 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Carlos Song <carlos.song@nxp.com>
Cc: frank.li@nxp.com, aisheng.dong@nxp.com, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, vz@mleia.com, 
	wsa@kernel.org, linux-i2c@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c: imx-lpi2c: support smbus block read feature
Message-ID: <aW9jUs2-kiVIxTfn@zenone.zhora.eu>
References: <20251121110100.1909603-1-carlos.song@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251121110100.1909603-1-carlos.song@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_113047_846484_38B05D8F 
X-CRM114-Status: GOOD (  21.98  )
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

Hi Carlos,

On Fri, Nov 21, 2025 at 07:01:00PM +0800, Carlos Song wrote:
> The LPI2C controller automatically sends a NACK after the last byte of a
> receive command unless the next command in MTDR is also a receive command.
> If MTDR is empty when a receive completes, NACK is transmitted by default.
> 
> To comply with SMBus block read, start with a 2-byte read:
> - The first byte is the block length. Once received, update MTDR
>   immediately to keep MTDR non-empty.
> - Issue a new receive command for the remaining data before the second
>   byte arrives ensuring continuous ACK instead of NACK.

What is the real fix you are addressing here? Can you be a bit
more descriptive?

> Fixes: a55fa9d0e42e ("i2c: imx-lpi2c: add low power i2c bus driver")

Is this tag really needed?

> Signed-off-by: Carlos Song <carlos.song@nxp.com>

...

>  #define MRDR_RXEMPTY	BIT(14)
>  #define MDER_TDDE	BIT(0)
>  #define MDER_RDDE	BIT(1)
> +#define MSR_RDF_ASSERT(x) FIELD_GET(MSR_RDF, (x))

This name sounds more as an imperative action, do you mean
something like MSR_RDF_ASSERTED(x)?

>  #define SCR_SEN		BIT(0)
>  #define SCR_RST		BIT(1)

...

> +static unsigned int lpi2c_SMBus_block_read_single_byte(struct lpi2c_imx_struct *lpi2c_imx)
> +{
> +	unsigned int val, data;
> +	int ret;
> +
> +	ret = readl_poll_timeout(lpi2c_imx->base + LPI2C_MSR, val,
> +				 MSR_RDF_ASSERT(val), 1, 1000);

What is the value of val here?

> +	if (ret) {
> +		dev_err(&lpi2c_imx->adapter.dev, "SMBus read count timeout %d\n", ret);
> +		return ret;

This is an unsigned function and you are trying to return a
negative number.

Can we also add a comment saying that readl_poll_timeout() fails
only if it times out?

> +	}
> +

...

> +		/* Read the first byte as block len */
> +		block_len = lpi2c_SMBus_block_read_single_byte(lpi2c_imx);
> +		if (block_len < 0) {

both block_len and lpi2c_SMBus_block_read_single_byte() are
unsigned, but you are comparing for negative value.

> +			dev_err(&lpi2c_imx->adapter.dev, "SMBus read data length timeout\n");
> +			return;
> +		}
> +

...

> +		if (block_len == 1) {
> +			ret = lpi2c_SMBus_block_read_single_byte(lpi2c_imx);
> +			if (ret < 0)
> +				dev_err(&lpi2c_imx->adapter.dev, "SMBus read data timeout\n");
> +			return;

do we need to increment msglen here?

> +		}
> +
> +		/* Block read other length data need to update command again*/

Please fix the commenting style here.

> +		writel((RECV_DATA << 8) | (block_len - 2), lpi2c_imx->base + LPI2C_MTDR);
> +		lpi2c_imx->msglen += block_len;
> +	}

Thanks,
Andi

