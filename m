Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7732C53219
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 17:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=462j4k19cm15BvLlYDBHArjhCmLoGRr+ciBtur8u6ys=; b=VlI1MpiGyzKAVdPs5uYVYGS27O
	WnuaBIOSgFWZTH+/INbhIjw58dIqSh4ZyZKXg+DC2VS8jlXXGSh6LA3e4fe51l501UNPFXbmgjQOM
	cBleV3x6u6Zf32avW77Lk46op9w6ucfxf7MDCQ9PaUF3dg9BgMLuwoieTCiDkoUVZYHwO1cxMv9KY
	ANK7HZub4Tvsh54YKqgn77ND6WkVilZFktZvhVXn1EYHihdmC0WnJVLX9LuNlAARkWPxkEeGzYVGp
	OG4/3Z6HDl7GZimN8GutvhP7PGCtL4u9IkaXnef8lamTx8TOA2K1tCEP/HjaAew882vGlobIJd8s3
	m6H+Xxiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp8Tk-00000008kxn-380Z;
	Wed, 29 Jul 2026 17:54:04 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp8Th-00000008kx8-3pog
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 17:54:03 +0000
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id CCCA984B54;
	Wed, 29 Jul 2026 19:53:59 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9LAyUqDgZ9C9; Wed, 29 Jul 2026 19:53:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1785347639; bh=Q0pdWhMBat3jwyJ8KqHtLbg7jtiLNwyC7rPs1rQwt2s=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To;
	b=T6ta3zzDE1JmiFBn/Gya87FZ/bfiCNfgO0tA7xlQRX2vxDE8jm+eWaQP86NxPb0aw
	 jjV0bxYerzE5EvxZkZd6mJJ530oG3D7NLV2iN4S8uKjzYyvTNBRLfSJYGEZ3QHHqxv
	 Vay/S1/Zpru1dLhLtTK7u37aiI/KULukdV0oGgR+eHtmQkH6DJi8ww4R9Aocc9nrHM
	 Jevdh0mwt698tkrOpk9mcQKT8/zSlyiwlkcpAbal8N4Sg/HJE6kFYJ+xsciYbd9CRa
	 ktT5KUmO1BBfCKDoRNSOieONsxmlitOIyWg+QDIMi61AI7EUOrWfgEnmUNVnugyGCh
	 w8HEP+zvadkhA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 29 Jul 2026 23:23:45 +0530
Message-Id: <DKB8WW9AK4KQ.2A9KVJWD5ORFT@disroot.org>
Cc: "Jonathan Cameron" <jic23@kernel.org>, "David Lechner"
 <dlechner@baylibre.com>, =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 "Andy Shevchenko" <andy@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Peter Griffin" <peter.griffin@linaro.org>, "Alim
 Akhtar" <alim.akhtar@samsung.com>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>
Subject: Re: [PATCH 2/3] iio: proximity: add driver for Sharp GP2AP070S
 proximity sensor
From: "Kaustabh Chakraborty" <kauschluss@disroot.org>
To: "Joshua Crofts" <joshua.crofts1@gmail.com>, "Kaustabh Chakraborty"
 <kauschluss@disroot.org>
References: <20260723-gp2ap070s-v1-0-b8ca3a4c10dd@disroot.org>
 <20260723-gp2ap070s-v1-2-b8ca3a4c10dd@disroot.org>
 <20260723234439.06411731@systembl0wer>
In-Reply-To: <20260723234439.06411731@systembl0wer>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_105402_121635_68EF7385 
X-CRM114-Status: GOOD (  16.31  )
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

On 2026-07-23 23:44 +02:00, Joshua Crofts wrote:
> On Thu, 23 Jul 2026 22:58:34 +0530
> Kaustabh Chakraborty <kauschluss@disroot.org> wrote:
>
>> The GP2AP070S is a proximity sensor designed and manufactured by Sharp
>> Corporation. This sensor is used in mobile devices, including, but not
>> limited to - the Samsung Galaxy J6.
>>=20
>> The driver has been adopted from Samsung's downstream kernel
>> implementation [1]. Due to the lack of public documentation about the
>> schematics of this device. The downstream driver acts as the secondary
>> source of information. Driver clarity has also been improved with the
>> help of the GP2AP* drivers in iio/light.
>>=20
>> Link: https://github.com/Exynos7870/android_kernel_samsung_universal7870=
/blob/lineage-16.0/drivers/sensors/gp2ap070s.c [1]
>> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
>> ---

[...]

>> =20
>> +config GP2AP070S
>> +	tristate "Sharp GP2AP070S proximity sensor"
>> +	select REGMAP_I2C
>> +	depends on I2C
>
> A very small nit (and probably a personal opinion), but "depends on" shou=
ld
> go before "select"

I happen to agree with this one. However most (but not all) entries
follow select -> depends on though. In any case I'll change it.

>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * IIO driver for Sharp GP2AP070S proximity sensor.
>> + *
>> + * Copyright (C) 2026 Kaustabh Chakraborty <kauschluss@disroot.org>
>> + */
>> +
>> +#include <linux/i2c.h>
>> +#include <linux/iio/events.h>
>> +#include <linux/iio/iio.h>
>> +#include <linux/iio/types.h>
>
> Please add iio/* includes after the generic linux/* headers. Ensure
> that there is a blank line between the two groups.
>
> Additionally, you're also missing <asm/byteorder.h>, array_size.h, err.h,
> types.h and delay.h.

By the way, is there any tooling to satisfactorily point out the
shortfalls with includes? Or is it just intuition and experience?

>> +	ret =3D devm_request_threaded_irq(dev, client->irq, NULL,
>> +					gp2ap070s_irq_handler, IRQF_ONESHOT,
>> +					"gp2ap070s-irq", indio_dev);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Failed to request IRQ");
>
> Just return ret instead, dev_err_probe() is called automatically on failu=
re.

Are you sure about that? I happen to call dev_err_probe() on all other
places and other drivers (as of late) as well (other than -ENOMEM).

