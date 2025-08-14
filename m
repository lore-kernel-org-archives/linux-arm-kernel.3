Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 091D1CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 21:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/KWT4TAq5U72A4q56Qgy9kGseEvaQixIPL2uXHQI/oM=; b=06fIGLOx/dY1RqTGpQWSnM/uYC
	zy4TT5HkV+1LJ22C9XnihjuBmY8wg/qV5iaAF7QzwjYP1iM2xA34GHYoqUyQqTsYR5ePQ/bRMvQ/w
	z31rs7ShPnh8aSP71AYGkdprpZKONSFAP+j1SiUyjTWlSQXJuyN+6qdkten1xWkCskCiTW11oSYWq
	nOuJ0lvKj6UsydTy74Xv/nEE1qiOd2QQdCwnXDVJHDtlq8VUfoj1Iy4356IslOcQqY4gtI43IZX1C
	Zkcn5X/Zpe0tiLYYxDwwVbBaNIdi/fsxqJI72H2A9Jb14ZJXaPY3zEPg6IYEouAhSTKoQ3BOQsdZ1
	AxQOHvCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umfdC-00000000bf4-0Tao;
	Thu, 14 Aug 2025 21:37:06 +0000
Received: from out-182.mta0.migadu.com ([91.218.175.182])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umfac-00000000bSY-3FfZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 21:34:28 +0000
Message-ID: <7f5982e9-6f62-4bc8-87d3-a2d18a6d6aba@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1755207264;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/KWT4TAq5U72A4q56Qgy9kGseEvaQixIPL2uXHQI/oM=;
	b=Fr6mFjpj0KV+uh3aiH9HAqKAlSPZOlwXishJpVVd1cTQXNyOQa67Twq0S2ulAar7E2O44V
	gQtzamKyEOoO8bqY0BedT+nEUvA9F5gRiSbvwZG7Dj09q2yXcBHa7I4SUG1qU6yJoCSd8Y
	AGOahdt81af1c/MSHglx468niDM+Uuc=
Date: Thu, 14 Aug 2025 17:34:15 -0400
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/9] dt-bindings: spi: Add spi-buses property
To: David Lechner <dlechner@baylibre.com>, Mark Brown <broonie@kernel.org>,
 Michal Simek <michal.simek@amd.com>, linux-spi@vger.kernel.org
Cc: Jinjie Ruan <ruanjinjie@huawei.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
References: <20250616220054.3968946-1-sean.anderson@linux.dev>
 <20250616220054.3968946-2-sean.anderson@linux.dev>
 <1a87f436-317b-40e0-a655-cd82f969f22e@baylibre.com>
 <5b02293b-9c86-441b-9344-2d0263eb1659@linux.dev>
 <5bbdddaf-4ff1-4cff-a933-143160896717@baylibre.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <5bbdddaf-4ff1-4cff-a933-143160896717@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_143427_238691_D6A6A16C 
X-CRM114-Status: UNSURE (   9.63  )
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

On 8/14/25 17:17, David Lechner wrote:
> On 8/14/25 4:15 PM, Sean Anderson wrote:
>> On 8/14/25 16:55, David Lechner wrote:
>>> On 6/16/25 5:00 PM, Sean Anderson wrote:
>>>> From: David Lechner <dlechner@baylibre.com>
>>>>
>>>> Add a spi-buses property to the spi-peripheral-props binding to allow
>>>> specifying the SPI bus or buses that a peripheral is connected to in
>>>> cases where the SPI controller has more than one physical SPI bus.
>>>>
>>>> Signed-off-by: David Lechner <dlechner@baylibre.com>
>>>> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
>>>> ---
>>>>
>>> FYI, Mark's filters won't pick up `dt-bindings: spi:`, we need to change
>>> the subject line to `spi: dt-bindings:` on the next revision.
>>>
>> 
>> Sounds like he should fix his filter then.
>> 
>> --Sean
> 
> No, this is a documented expectation for contributors. [1] says that SPI and
> a few other subsystems want the subsystem first in the subject.
> 
> [1]: https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html

Hm, this is new to me...

--Sean


