Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C38E7CD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 17:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bPlb+6rZmikGcOppKsC4AOYHoDgI1XwOxhNVxtmjtdM=; b=iGsWwFR2zXAM5h5oDIvwgyWJZB
	uWD1R/lzWCqGVjKLp7Nb3nvRdA4dBARsblwDUz+5IMQ/ZJH2rmPISNXMUH6n1/eElB6efbul15RGB
	kG8qaK14UfUbs3T0pR524iOs5YCiio2xcT7fCTHK0bXZkQTkBl0VRDDp8IBrAL/dvnj5MMPuIU9ll
	A0Ujp8o62dyXEQGBjgJuYoKVAr721l9/3cn99kTDyfwe3eJq8M5yKrxZzG8bnD8nrKt2oiWfxIZpP
	mtnZGAYWCukvgPMmP+kpuEbxzj6V/nlNh/Dx83eaX+0Ouc4QBaBH4JElYPHTn2fnbZM8ZQxl2PS2x
	uB7au+Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXjYH-00000009r2P-1ESs;
	Thu, 11 Jun 2026 17:50:49 +0000
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXjYE-00000009r1Y-0Nlk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 17:50:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1781200242; bh=6VonIUSnB2VX1hIS+0y7GFggDcso+/e+QgzgxZQdekI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NyCJUJMMMMgu+bCOZWx+k5Q6w2XLDVed45aLKpwCON2G86TG8r3qqdrIxEcFS4COY
	 9zdA6o1Q5FhbA73U2wgHmnogP7XuVNI84DUkMqtNyauW0AuOOjt5+kUVjbTT4Zn1xb
	 2IJN6Ie8msCwDlwcI8cRZhrD/sGrugqjTsbvGo4sG6ZqDYLBMipnZrYO/ZTedOMOH+
	 vjq9NXwUBUrPHH+pPLGzK8aS42/+ApvTJPgEOqyEfzTWMttOIJakI91rCtYlonbJQm
	 J/BAxoobEzNyWc4IBbvp40+9JyyrhKFFcbREvzkVsc2ToMllAzFMGEf4wWKMuOO5Xl
	 nDe1hLY3zTEsg==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 52C2D390154;
	Thu, 11 Jun 2026 17:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1781200242; bh=6VonIUSnB2VX1hIS+0y7GFggDcso+/e+QgzgxZQdekI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NyCJUJMMMMgu+bCOZWx+k5Q6w2XLDVed45aLKpwCON2G86TG8r3qqdrIxEcFS4COY
	 9zdA6o1Q5FhbA73U2wgHmnogP7XuVNI84DUkMqtNyauW0AuOOjt5+kUVjbTT4Zn1xb
	 2IJN6Ie8msCwDlwcI8cRZhrD/sGrugqjTsbvGo4sG6ZqDYLBMipnZrYO/ZTedOMOH+
	 vjq9NXwUBUrPHH+pPLGzK8aS42/+ApvTJPgEOqyEfzTWMttOIJakI91rCtYlonbJQm
	 J/BAxoobEzNyWc4IBbvp40+9JyyrhKFFcbREvzkVsc2ToMllAzFMGEf4wWKMuOO5Xl
	 nDe1hLY3zTEsg==
Message-ID: <809d2a3c-4189-4cc6-b340-097608b48c83@mleia.com>
Date: Thu, 11 Jun 2026 20:50:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: iio: adc: KASAN wild-memory-access in complete() on early IRQ
To: Maxwell Doose <m32285159@gmail.com>, Jaeyoung Chung <jjy600901@snu.ac.kr>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Sangyun Kim <sangyun.kim@snu.ac.kr>,
 Kyungwook Boo <bookyungwook@gmail.com>
References: <20260610115700.774689-1-jjy600901@snu.ac.kr>
 <CAKqfh0GVDpfP=TJZPQ2UYkUj=pe1KGn4j1zqbaz_19xawekdnw@mail.gmail.com>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <CAKqfh0GVDpfP=TJZPQ2UYkUj=pe1KGn4j1zqbaz_19xawekdnw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20260611_175042_357202_3E31A7DA 
X-CRM114-Status: GOOD (  11.53  )
ln: failed to access 'reaver_cache/texts/20260611_175042_357202_3E31A7DA': No such file or directory
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_175042_357202_3E31A7DA 
X-CRM114-Status: GOOD (  12.57  )
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

On 6/11/26 19:07, Maxwell Doose wrote:
> On Wed, Jun 10, 2026 at 7:04 AM Jaeyoung Chung <jjy600901@snu.ac.kr> wrote:
>>
>> Hi,
>>
>> lpc32xx_adc_probe() in drivers/iio/adc/lpc32xx_adc.c and
>> spear_adc_probe() in drivers/iio/adc/spear_adc.c register their
>> interrupt handler with devm_request_irq() before they initialize
>> st->completion with init_completion(). If an interrupt arrives after
>> devm_request_irq() and before init_completion(), the handler calls
>> complete() on an uninitialized completion, causing a kernel panic.
>>
>> The probe path, in lpc32xx_adc_probe():
>>
>>      iodev = devm_iio_device_alloc(&pdev->dev, sizeof(*st)); /* st kzalloc-zeroed */
>>      ...
>>      retval = devm_request_irq(&pdev->dev, irq, lpc32xx_adc_isr, 0,
>>                                LPC32XXAD_NAME, st);           /* register handler */
>>      ...
>>      init_completion(&st->completion);                       /* initialize completion */
>>
>> spear_adc_probe() has the same ordering: devm_request_irq() for
>> spear_adc_isr() before init_completion(&st->completion).
>>
>> Both interrupt handlers, lpc32xx_adc_isr() and spear_adc_isr(), call
>> complete():
>>
>>      complete(&st->completion);
>>
>> If the device raises an interrupt before init_completion() runs,
>> complete() acquires the uninitialized wait.lock and walks the zeroed
>> task_list in swake_up_locked(). The zeroed task_list makes list_empty()
>> return false, so swake_up_locked() dereferences a NULL list entry,
>> triggering a KASAN wild-memory-access.
>>
>> Suggested fix: move init_completion(&st->completion) above
>> devm_request_irq(), so the completion is valid before the handler can run.
>>
>> Reported-by: Sangyun Kim <sangyun.kim@snu.ac.kr>
>> Reported-by: Kyungwook Boo <bookyungwook@gmail.com>
>>
> 
> Thanks for reporting this; I can start working on a fix shortly
> (assuming nobody else is already working on it).
> 

The analysis and the proposed fix are correct, please go ahead, thank you
in advance.

-- 
Best wishes,
Vladimir


