Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B2CBCD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 14:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OIgTdG49SDgzzqZu1X0DrxQsOeL+D74IHpuZMcKgJbQ=; b=hggfZY7pBGfFBm3pHcKu6J+nzA
	7c/9v7OjfV+uqr/R2dWoHLLhxYZsfcNysIEcvNkAjvLSgc1j1XlRIdMJG+VIWTh86M/R9eCjo0NyG
	X0fqvvZ85djPhIteRD6UxZGzKCGxb7GGapbaiFvdrk254VTiXpwdssExMjT5rUmY8vdEIQwzWUW1y
	ulwYfapYGGRqPY8oP8ETIVu9LvZu2Dz5yrxqAxbdqjz6W1MpqNPbXOXhTutRg/6gjWyfj+cmsublT
	kWd+kH8GxjIA5zvwG1NVL7+dBm0NQEDpKV1W4ncgxdn6qjnau0jaXLkyZX9Dp/d1jqy8tr+DHjyPI
	58cZtYPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbfax-0000000540W-1FjO;
	Mon, 22 Jun 2026 14:25:51 +0000
Received: from mout-p-102.mailbox.org ([80.241.56.152])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbfau-00000005402-4418
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 14:25:50 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4gkVqF3tyGz9vGs;
	Mon, 22 Jun 2026 16:25:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782138345;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OIgTdG49SDgzzqZu1X0DrxQsOeL+D74IHpuZMcKgJbQ=;
	b=h1dZNLrqpWihL5Z8j1HgL/7ltb6LGPc5pnvJ7XfUHI6k6ZxssabXl7UbT4ktm6cUT1muJS
	E5e4FWh5MfNKVPP1Bza4lSvQyfoTM8Qm+u4nblJZSn1yim96Bt3+dog+UwkUeY9p1ZIEzW
	8w6Sh74i/8K3fpU0eiUEiPxwlHuzz4taRDanKOkYTbq49Gg/PzrYB4QcsLi2vWgzYuMSFJ
	qWylKWtFCh8S8YVKg1t0U9E+8stoyXoULsY97EdAaxobxbSw7IvTMmIz3ObGj9uTn22JCQ
	hrT9VW2aESvwsZa0Ywkbzn8ht3y+Ztqi2AHMRwxe7VmD6BIgJ+fBCMnK/X4hDg==
Message-ID: <f980c840-bdf7-4c00-bbdc-ced7b1b9f63f@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782138343;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OIgTdG49SDgzzqZu1X0DrxQsOeL+D74IHpuZMcKgJbQ=;
	b=FdCx3pp8lU9ekFGj1xizyWveLlHlfBotiaxbTE7vDgY4F1qMp1UkTG0ENBC8av8OG2LltY
	88VltbsPZan62gDpBmDWIbQH5hSyTccgvoLwUDoYFlcEN3bfmaHj6p3l9MJ8mUakdpy+Na
	apB2EBBt522Z8ZMAZp+5rMK1uI3jdWYTqdsbcvoJ66N4/CAC+8dPzNjRvO66DbzW876cnq
	2Q2ZBbU5Z7bYt7dIA2cChr3jV/3dXzRPODl54Vz2cLEvbHvpShOCPuSno0U3QGNfbR1kil
	bMHdz4L5GRFX+eG0VUtF64/VlstCduExqUrMhARHXYUeTeImQNyp+7pSSwrmVA==
Date: Mon, 22 Jun 2026 16:22:02 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/4] irqchip/gic-v3: Refactor GIC600 limited to 32bit
 PA erratum handling
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-pci@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20260618220427.14325-1-marek.vasut+renesas@mailbox.org>
 <20260618220427.14325-3-marek.vasut+renesas@mailbox.org>
 <CAMuHMdUxT87M1oQvPP_h4YX4vXFaVbbG+LCG8EdmuLTuHNtybQ@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdUxT87M1oQvPP_h4YX4vXFaVbbG+LCG8EdmuLTuHNtybQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: h9ynyzsu8mzdxzd9637onuq1ybxfbah7
X-MBO-RS-ID: 86ebaccfe5fcbdd292f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_072549_195324_48957F21 
X-CRM114-Status: UNSURE (   5.69  )
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

On 6/22/26 11:52 AM, Geert Uytterhoeven wrote:

Hello Geert,

>> +++ b/drivers/irqchip/irq-gic-v3-its.c
>> @@ -4890,10 +4890,17 @@ static bool __maybe_unused its_enable_quirk_hip09_162100801(void *data)
>>          return true;
>>   }
>>
>> -static bool __maybe_unused its_enable_rk3568002(void *data)
>> +static const char * const dma_32bit_impaired_platforms[] = {
>> +#ifdef CONFIG_ROCKCHIP_ERRATUM_3568002
>> +       "rockchip,rk3566",
>> +       "rockchip,rk3568",
>> +#endif
>> +       NULL,
>> +};
>> +
>> +static bool __maybe_unused its_enable_dma32(void *data)
> 
> __maybe_unused can be dropped...
I will fix that in V3. Thank you !

