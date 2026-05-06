Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BA46CD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 21:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P03wL+yRq2fhnonG0hKGi8A1NVc+WdVspICjAGZDnnM=; b=GWQxKzrOmtjheJFOcBmvixzjVX
	FKugkpY/4H0oHLJNpoiROB+FojXGqorK8JOTadfPBJW8F4ziN9IdVaq6p2BFPOVHYtz6isOQcleOV
	rfxLN1e74i2QUTazX2Ycym8b9lc4g45sahCvgRvVuBZGsiKkAWx7qRvneB+w4muJOHY+JGIntuUNh
	bsodpmFY2+1M1oF6soN60K+LgS1dTTOuqRnMvuGJCq0NPrQ/uwgVudA/R5op9M4/QanF6q45/W2PD
	zBO1GR+DlR+8Cek3horIPBQZYIbCQQ4EC26DRmDE0psNihukfzzXpj41bdqvG04J/2BpbZukehGkg
	F80sQh2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKjTB-000000024UO-2bRA;
	Wed, 06 May 2026 21:07:49 +0000
Received: from [2a03:4000:b:d08:14a9:1bff:fedc:75ad] (helo=mail.kernel-space.org)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKjT9-000000024Ti-4BlM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 21:07:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel-space.org;
	s=s1; t=1778101662;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P03wL+yRq2fhnonG0hKGi8A1NVc+WdVspICjAGZDnnM=;
	b=xNTXpScVBMmNpq6KjpNcbP5A2luevAYVXAlrWKSUV8m+Y1+kyCpJR4LVof1+DCV7wYm3SD
	L2xqe2tRGpTRdK9f/4q8HcsiPGsjx0F35c2n2kD08AyvGtd0SzvY7epjURQCJWoaz85+A8
	x3Hf0Leg3nNamgr5zgea75Ae9AOZepM=
Received: from [IPV6:2a07:7e81:7daa:0:62cf:84ff:feee:627] (<unknown> [2a07:7e81:7daa:0:62cf:84ff:feee:627])
	by oreshnik (OpenSMTPD) with ESMTPSA id 15c256de (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Wed, 6 May 2026 21:07:42 +0000 (UTC)
Message-ID: <a4b53dc6-e89d-46a5-b4c1-460b0d90ae30@kernel-space.org>
Date: Wed, 6 May 2026 23:07:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/10] m68k: stmark2: add mcf5441x DAC platform devices
To: Jonathan Cameron <jic23@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Greg Ungerer <gerg@linux-m68k.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Steven King <sfking@fdwdc.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 David Lechner <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
 Angelo Dureghello <adureghello@baylibre.com>
References: <20260504-wip-stmark2-dac-v1-0-874c36a4910d@baylibre.com>
 <20260504-wip-stmark2-dac-v1-8-874c36a4910d@baylibre.com>
 <ef773bbd-1cf2-4cc2-96a8-fccd3355d6b1@app.fastmail.com>
 <20260506155737.6cd625a5@jic23-huawei>
Content-Language: en-US, it
From: Angelo Dureghello <angelo@kernel-space.org>
In-Reply-To: <20260506155737.6cd625a5@jic23-huawei>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_140748_355603_BAAF7AAF 
X-CRM114-Status: GOOD (  14.30  )
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

Hi Jonathan,

On 5/6/26 16:57, Jonathan Cameron wrote:
> On Mon, 04 May 2026 19:28:28 +0200
> "Arnd Bergmann" <arnd@arndb.de> wrote:
> 
>> On Mon, May 4, 2026, at 19:16, Angelo Dureghello wrote:
>>> @@ -94,8 +94,42 @@ static struct platform_device dspi_spi0_device = {  
>> ...
>>> +static struct resource dspi_dac1_resource[] = {
>>> +	[0] = {  
>>
>> This looks like the name has a copy-paste error: this is not
>> related to the 'dspi' controller at all but is just the dac, right?
>>
>>       Arnd
>>
> 
> https://sashiko.dev/#/patchset/20260504-wip-stmark2-dac-v1-0-874c36a4910d%40baylibre.com
> Has noted some more alongside this one.
> Seems unlikely a DAC has a bus number.
> 

that sashiko comment is not clear to me, maybe was related to the comment
i copy/pasted from dspi.

I have now fixed this as:

+static struct resource dac0_resource[] = {
+	DEFINE_RES_MEM(MCFDAC_BASE0, 0x100),
+};
+
+static struct platform_device dac0_device = {
+	.name = "mcf54415_dac",
+	.id = 0,
+	.num_resources = ARRAY_SIZE(dac0_resource),
+	.resource = dac0_resource,
+};
+
+static struct resource dac1_resource[] = {
+	DEFINE_RES_MEM(MCFDAC_BASE1, 0x100),
+};
+
+static struct platform_device dac1_device = {
+	.name = "mcf54415_dac",
+	.id = 1,
+	.num_resources = ARRAY_SIZE(dac1_resource),
+	.resource = dac1_resource,
+};
+
 static struct platform_device *stmark2_devices[] __initdata = {
 	&dspi_spi0_device,
+	&dac0_device,
+	&dac1_device,
 };

It should be fine for sashiko too.

Regards,
angelo

> Jonathan





-- Angelo


