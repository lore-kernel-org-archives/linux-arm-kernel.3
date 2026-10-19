Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13CE5CCF2E6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 14:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LWoutUeMhowA/cipLRcwpKdrrczuzzstTuE/CSmA4hI=; b=Pf2SneTnE8fWu8NdYRigISGrea
	L6pHOJBfw25E3Lo7tbaauTU6YKAqoHdYV4fnLI+hIz4rygRSVouA3bxqe84jAnb4K6YKpaAmH8w6K
	IAChHxJfXqrmZlit58P4yLqaZZ7WAgsoeXv+99r+PZshjEr7w7AGYVhtCaajM3cUyg7Z5EIVk+aKr
	bhf/zQo/Vm284xrt9UdUFq2+6mHadQiGvETjx9e+C6HEOnWzwH7ZpbC3oxz+0ls3AnvdtjqkjjVAg
	BY0gQfkqTceFPosBOYHtfRqsrGLTjNP5khRCgKM4ps/tzIAGXhDQg67VA1voRgCN+eCd/Bwx8ImRW
	f/qaZD/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIo8O-00000007i7M-0L8d;
	Mon, 19 Oct 2026 14:14:40 +0000
Received: from mout-p-202.mailbox.org ([2001:67c:2050:0:465::202])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIo8K-00000007i6L-3USy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 14:14:38 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4j7cxM4fPMzMlN2;
	Mon, 19 Oct 2026 16:14:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=timmermann.space;
	s=MBO0001; t=1792419271;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LWoutUeMhowA/cipLRcwpKdrrczuzzstTuE/CSmA4hI=;
	b=FM9SJLpgUbXCjuJYfDwkpUT5we9FdMfdivEU9sQjw05tdwBkvuPPlbWJrneWYnrw34bViS
	000VywhTR5vtp0UoBmbj+nV6EiN/hLoDXuxodJhGjM6x3Uh+I/BMyJn74s0YNZf8CwUubM
	YRm8I/QEb8vAIWfrFRc75Rj/x06vkPWCAedeThvGLjNJ5DN6A17AQy79g2zheDnrmkxuNz
	XYlAnwLFmMotGYbDjgSdcj02V1h/tZQpF3Iqj6OndXOiXrTXM2hnRYKpFVKRWizrn5vyHP
	Ekver87u0iLZLdV0oSA7llOv+6VuTpuImOAlgpPfAv9p9XnAaJJaNf53a9UGKg==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of linux@timmermann.space designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=linux@timmermann.space
Date: Mon, 19 Oct 2026 16:14:27 +0200
From: Lukas Timmermann <linux@timmermann.space>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Lukas Timmermann <foss@timmermann.space>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, =?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 2/7] Input: s6sy761 - split into core and I2C modules
Message-ID: <atYkR_nJnsKtTTE-@archstation>
References: <20261011-lat3st-google-raven-touch-upstream-v1-0-2a9f55159b9e@timmermann.space>
 <20261011-lat3st-google-raven-touch-upstream-v1-2-2a9f55159b9e@timmermann.space>
 <asy92cwqv8Xjc2PX@monoceros>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <asy92cwqv8Xjc2PX@monoceros>
X-Rspamd-Queue-Id: 4j7cxM4fPMzMlN2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_071437_317202_41550354 
X-CRM114-Status: GOOD (  15.74  )
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

On Mon, Oct 12, 2026 at 01:04:36PM +0200, Uwe Kleine-König wrote:
> On Sun, Oct 11, 2026 at 02:44:57PM +0200, Lukas Timmermann wrote:
> 
> Please don't add new usages of <linux/mod_devicetable.h>. <linux/i2c.h>
> is enough to get the definition of of_device_id and i2c_device_id.
> 
> I didn't look into the other patches of this series in detail, but I
> suspect that the same holds true in your spi patch. <linux/spi/spi.h>
> provides of_device_id and spi_device_id, so don't add
> <linux/mod_devicetable.h> there either.
> 
> (If you want to go full iwyu, use the subsystem specific headers below
> linux/device-id/.
> 

I see. I found some mails from you in regards to that topic. Thanks for
explaining.

> > +static const struct of_device_id s6sy761_of_match[] = {
> > +	{ .compatible = "samsung,s6sy761", },
> > +	{ },
> 
> No trailing comma after the list terminator please.
> 

Noted.

> > +};
> > +MODULE_DEVICE_TABLE(of, s6sy761_of_match);
> > +
> > +static const struct i2c_device_id s6sy761_id[] = {
> > +	{ "s6sy761" },
> 
> please make this: { .name = "s6sy761" }
> 
> Best regards
> Uwe

Thank you. I will include your findings in v2.

Best regards
Lukas

