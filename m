Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D90C0C5AD4E
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Aug 2026 10:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/8f/Alges9Ms2yc2fIsm5bhogqPCHPQpn6lmC4ygk28=; b=fvxase4VJbH5sxx60gmMa2Nj4o
	72bthXdsP2/x1f7pshIMa7Vjz/Ta7fwqe5FCbleLRwGVzNRHzC84R4Ar3d4T3033mXH3PmqDcWilZ
	mKna7FWKUXNWyu/Hr1Vf0l4IQfxJSERHerWsktXYLY21ce3hRjvFGOId1etb03V4yfIKA2uk6LLW4
	ODuXlIECncySzuKYBeOTrslUltvGH2I8triP8Ogi9SmRrWja61XSUwRhnbm3KICjIpsmon3QQNE3C
	bxlXKdSpWIt1oeUeYihMPlolioV9bJOavXmoMGKujA028FdComyO0UYDGhyLtvIj3Qlx0Y2tytwKP
	uZpz6Tbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt0ud-0000000ADVu-1gWV;
	Sun, 09 Aug 2026 10:37:51 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt0uZ-0000000ADVW-0QBI
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Aug 2026 10:37:49 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8E4B11A14FC;
	Sun,  9 Aug 2026 10:37:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 598306033B;
	Sun,  9 Aug 2026 10:37:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 40F7611C489DF;
	Sun,  9 Aug 2026 12:37:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786271856; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/8f/Alges9Ms2yc2fIsm5bhogqPCHPQpn6lmC4ygk28=;
	b=LHXOE+S5RDeFN4aC1XC7GsR20GQXpdRq3qVD5AvSC+Zwq0XzQS6SvKbNH7loK/DbkJbMTK
	2C13xz0GgyUsCLsHQkzx7sCwN9SlCg5zZONIblEN4FLtqW+F0uBzJlQKA+2j4jjaw7n8VA
	BpRlx3X/qQDJsBZrwS074tpSZy25xc62A5d0ucxa/966uxWxwD3qxqkLs3Tp4P+K9IEeD8
	Hmx9CnsrrF1tO1ZwdEv27b1BHWXOJ1XadOiihnQcpvDsI9xJVGXco2u2t+uiOa6RxAZ3MK
	TROYjxa6dSivN5n+JkJc+gcMWkdvUuYCBavYjathUsCZ9eVJDnsEiNA1/DiUUQ==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@oss.qualcomm.com>, Andrew Lunn <andrew@lunn.ch>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] ARM: dts: marvell: kirkwood: Correct indentation
In-Reply-To: <d539bef3-ee1d-43b8-8b43-6704979703ec@kernel.org>
References: <20260706180333.648401-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20260706180333.648401-5-krzysztof.kozlowski@oss.qualcomm.com>
 <874ii27uqb.fsf@BLaptop.bootlin.com>
 <d539bef3-ee1d-43b8-8b43-6704979703ec@kernel.org>
Date: Sun, 09 Aug 2026 12:37:25 +0200
Message-ID: <878q6fmvfe.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_033747_301248_EBB2B197 
X-CRM114-Status: UNSURE (   8.49  )
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

Krzysztof Kozlowski <krzk@kernel.org> writes:

> On 13/07/2026 17:52, Gregory CLEMENT wrote:
>> Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com> writes:
>>=20
>>> Correct spaces or mix of tabs+spaces into proper tab-indented lines.
>>> No functional impact (same DTB).
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.co=
m>
>>>
>>=20
>> Applied on mvebu/dt
>>=20
>> Thanks,
>>=20
>> Gregory
>
> All this was applied two weeks ago but it is still not in linux-next.
> Maybe you missed to push the patches to the for-next branch?

Argh indeed I forgot to push the for-next branch!


Gregory

>
> Best regards,
> Krzysztof

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

