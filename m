Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DD92CFA474
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 21:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RFgD/PA6YCmmlcKT63VAf3BqQtGq/9YYTOqYLD13kKs=; b=h9/ML4CUEHRgs47i2Hug9K20se
	UmxPQ/6wS65bQfQCBQkddBh1EBmgvcQzGQQxzaAOxvzdT6DU+L77COLv3rXt4jdo6GuXPz/RC9qE2
	bs9iVffBRNnxl7Q4a0V9jxlXSrYxAIWAGtia8rTcTULQTn4fRYLO56VWzBVnGLtjhYOuvvTpQCeNd
	8HOzCQ23bWixRukA3QBXEkYzX6oT8RSvuwJ13qJNy8sQxlaVCIWz4c7zaoVn5KV4qaSMeQJvh7X6F
	47+WKZ2oLbKEC+F3R8+r2+7lHqiIjNp1H6C0tb/KLFHdV8DxzojZOpTHpviWaXaaWCi1lpe1Ut6qE
	8zxi+Ojw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ihy-0000000Fx4g-2Re7;
	Wed, 23 Oct 2024 21:15:58 +0000
Received: from mail.typeblog.net ([88.151.33.170])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3h2H-0000000FgrN-1qtm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 19:28:50 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 51D29CFB625;
	Wed, 23 Oct 2024 21:28:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=typeblog.net;
	s=mailcow; t=1729711726;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=RFgD/PA6YCmmlcKT63VAf3BqQtGq/9YYTOqYLD13kKs=;
	b=WTSpmHeHFoorJSU5dDnO4UKeYbz9QIFRiTGe32I7QJxlaTMH3dqAWSWCcGS7yMNUS/aesy
	V7fXYhJ2unN0UILIgstBlJaPvXFbF/2SsQX3zpb27NV1d545LXdAEvfWYG5N2ZV6CQ15zh
	t6C6DP8MAhA31hcH/BzXj4JNc2Q3JkYm/J/dzCSo3BQcbMAypfzp5C+P1OkUx6r5cjPeT2
	gtyIWW3G2nW6411D0X7f7wT9ehdOKHaUcVCqcSoJvU1Pwd6n9ZFj1G7iPdg3kfg0KcIVO+
	w6ihoFf+W+phMSBpbpVmlNrz0OJAiwermEEJEWdN3tCHYvoymOAyVTVkJ4it/A==
Message-ID: <80c25e27-0d90-428d-b206-6252d411daaa@typeblog.net>
Date: Wed, 23 Oct 2024 15:28:35 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "MAINTAINERS: Remove some entries due to various
 compliance requirements."
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Tor Vic <torvic9@mailbox.org>, Kexy Biscuit <kexybiscuit@aosc.io>,
 jeffbai@aosc.io, gregkh@linuxfoundation.org, wangyuli@uniontech.com,
 aospan@netup.ru, conor.dooley@microchip.com, ddrokosov@sberdevices.ru,
 dmaengine@vger.kernel.org, dushistov@mail.ru, fancer.lancer@gmail.com,
 geert@linux-m68k.org, hoan@os.amperecomputing.com, ink@jurassic.park.msu.ru,
 linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-fpga@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-spi@vger.kernel.org, manivannan.sadhasivam@linaro.org,
 mattst88@gmail.com, netdev@vger.kernel.org, nikita@trvn.ru,
 ntb@lists.linux.dev, patches@lists.linux.dev, richard.henderson@linaro.org,
 s.shtylyov@omp.ru, serjk@netup.ru, shc_work@mail.ru,
 tsbogend@alpha.franken.de, v.georgiev@metrotek.ru,
 wsa+renesas@sang-engineering.com, xeb@mail.ru
References: <a08dc31ab773604d8f206ba005dc4c7a@aosc.io>
 <20241023080935.2945-2-kexybiscuit@aosc.io>
 <124c1b03-24c9-4f19-99a9-6eb2241406c2@mailbox.org>
 <CAHk-=whNGNVnYHHSXUAsWds_MoZ-iEgRMQMxZZ0z-jY4uHT+Gg@mail.gmail.com>
 <e25fb178-39fa-4b75-bdc8-a2ec5a7a1bf6@typeblog.net>
 <CAHk-=wjw0i-95S_3Wgk+rGu0TUs8r1jVyBv0L8qfsz+TJR8XTQ@mail.gmail.com>
Content-Language: en-US
From: Peter Cai <peter@typeblog.net>
In-Reply-To: <CAHk-=wjw0i-95S_3Wgk+rGu0TUs8r1jVyBv0L8qfsz+TJR8XTQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_122849_664030_E386D424 
X-CRM114-Status: UNSURE (   8.00  )
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

> I'm also not going to start discussing legal issues with random
> internet people who I seriously suspect are paid actors and/or have
> been riled up by them.
> 
>                Linus

This has never been a legal discussion, but a procedural transparency 
discussion. You could simply say "our lawyer didn't ok this", and that's 
perfectly fine. No one is going to argue against that.

Your action up until now is also exactly what a hypothetical paid actor 
would have wanted to see happening -- it's not helping **understanding** 
but rather only extending argument on what would have been a quick response.

Calling everyone "paid actors" don't help. If you have more than 1 
minute to waste, I am under my most regularly-used internet handle to 
respond to you. So has the person who sent the original "revert" patch.

Running a quick grep on the other mailing lists and their commits may 
also have helped answer that.

Thanks,
Peter.


