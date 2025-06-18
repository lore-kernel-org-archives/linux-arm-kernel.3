Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6BE4C71155
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 03:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qN9NPv1XQrsC3dwPyHVqoYgRHQm03qU19l77O6/+NkY=; b=DTVs7OAM7fdBrqEj2viDVt7G/K
	UrabH+YITDO6G037cU41Uz2lp4qaNOJR7f0l35H78075NVu/9jT1hTnBR4yePpfQozV5MAZEEj9zy
	s67eSbyG9DlncA1fR6B8rH/y/wuSPp7vG/uEPFjH45knw1pAdDu+bkRCTbuB4CMpkHWnWUp3uU57I
	wDL7BDxxkttyXqxPXXhjF++2U6JlGPPD+YQRcH7M+bHVmUhnPGETgTvNYu+fyjW7stXU5n6J8xNRG
	0PfBpPgTSWh1zdFR/W7JPtbUo5AXy6brg7WdWwtCBdZUFHTGyGjJUnppR+i/3EEG/VDmjy8tbrY/s
	UUIJjG8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRjC6-00000008shV-0RFk;
	Wed, 18 Jun 2025 03:10:34 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRj82-00000008sJr-2hdV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 03:06:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1750215980;
	bh=qN9NPv1XQrsC3dwPyHVqoYgRHQm03qU19l77O6/+NkY=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=LTxBQNyBuJBxJiNhQgy5vLgg2Q1cilu5sqxx4AN8cNHwXn3HgrmJ49pIjCSxchnhf
	 k+FNxzchFLCwwXtnx1qCPCG1f7j2s3vs3CZN21KTO+p/EaEXiSUeIjL8bM/PbWThMX
	 fq2fBARicrss4AGOgQ/ZU368YBmgxKZkpjza4B2yywBn+g4IwGNksuuUUfVXxbqQ7e
	 5LpdYkclvvubJ3u0UFwr+Rv+4D2o+67rXcweW/LXnMiQ/f4eF4kRCHw8xTgZ7ZcJqJ
	 M8vbxOhLi9T5AgbG4Jr+Gp33Ow0BZ+P+BitiamvWb4iimO95tuBYdl4DJYo5oBqU01
	 loocYLcuF8ttQ==
Received: from [192.168.68.112] (unknown [180.150.112.166])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id E875E640A0;
	Wed, 18 Jun 2025 11:06:19 +0800 (AWST)
Message-ID: <064a5583e43ee0b67da1112fb5fc9fa421e4f96e.camel@codeconstruct.com.au>
Subject: Re: [PATCH 8/8] mmc: sdhci-of-aspeed: Add sdr50 support
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Cool Lee <cool_lee@aspeedtech.com>, adrian.hunter@intel.com, 
	ulf.hansson@linaro.org, joel@jms.id.au, p.zabel@pengutronix.de, 
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Wed, 18 Jun 2025 12:36:19 +0930
In-Reply-To: <20250615035803.3752235-9-cool_lee@aspeedtech.com>
References: <20250615035803.3752235-1-cool_lee@aspeedtech.com>
	 <20250615035803.3752235-9-cool_lee@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_200622_871011_1DB29722 
X-CRM114-Status: UNSURE (   5.18  )
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

On Sun, 2025-06-15 at 11:58 +0800, Cool Lee wrote:
> Add support for SDR50 mode in the Aspeed SDHCI driver by setting
> capability shadow register.
>=20
> Signed-off-by: Cool Lee <cool_lee@aspeedtech.com>

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>

