Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 170A7C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 08:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WDfEEzSWJgWFfXeNIdpxPGAQ9BpwsK2ZXWq6vw2pT4g=; b=zOVaUdzqIwiwL5lWbgoskJnjhb
	5PPjfG5vE1zGRn6rOXyJBBnTJHBZBDf+Skby9ZwJHGBoYheBKU/2u6DztYTiTO/5dYEPNlkrSsoOP
	qzIWxbDOah69Xk8chgPvL2IAt8s0MwIJEcJ/omHrltyW6MPr1Hv2U94G7Z0kP6SDJTEjQD6o2JNbm
	SGkdXctbLaj1fbTivXAm+JIKdnYMb5yYX/Zx2/cnUgvo1E03RYekIwBZHdl0/Ui75zYk2rvTeI8qm
	gmJqnwhQQrBq1sGLfOlpp0evo/4sS5xUHuNnAHvL15puTVuhHlEgZI6d9KXnPl/eTV6TORIhX0Prc
	e9EAyH9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfCsB-00000003t1o-0olV;
	Thu, 02 Jul 2026 08:34:15 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfCs6-00000003t0N-1CwZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 08:34:13 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 4E5911A0DCF;
	Thu,  2 Jul 2026 08:34:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1ACF35FF03;
	Thu,  2 Jul 2026 08:34:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4F7B0104C960E;
	Thu,  2 Jul 2026 10:34:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782981246; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=WDfEEzSWJgWFfXeNIdpxPGAQ9BpwsK2ZXWq6vw2pT4g=;
	b=OxUMApa58Q5UX9hYLVcjPJ6e2e+iHrh8huayYvoEZQKLdPjprWeh/PEbPcaOAt//xCfpYt
	b6eZTaZBWGVoB0hdCFWubkvwhIyj+Vib+w/dsrIENF5bRQe5ARQ7MjDhF8w3A6Or+a/jTH
	0+dii1umHVwRhMcgzoMgoif7GWCZJLh2CXmT4MQki//kMWdI3rFQBSWL3UoTurVIfvrarx
	9UOsFthX+ipW32PyPVzc2W5Grzx7jQ9BDqnCOAX2li3fIBGLTu0c21tu5xlwZalmP7F6wC
	0ykF0l0Z/vIUi17rmyKC2+NkSR1KZR77jK59xxYBdwFpT9V8YrQKKsLYLET+8g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 02 Jul 2026 10:34:02 +0200
Message-Id: <DJNY3N48KALQ.1JASSQTBU3GTN@bootlin.com>
Subject: Re: [PATCH 5/5] gpio: nomadik: drop "chip registered" log on probe
 success
Cc: "Bartosz Golaszewski" <brgl@kernel.org>, "Philipp Zabel"
 <p.zabel@pengutronix.de>, "Vladimir Kondratiev"
 <vladimir.kondratiev@mobileye.com>, "Gregory CLEMENT"
 <gregory.clement@bootlin.com>, =?utf-8?q?Beno=C3=AEt_Monin?=
 <benoit.monin@bootlin.com>, "Tawfik Bayouk" <tawfik.bayouk@mobileye.com>,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
To: "Linus Walleij" <linusw@kernel.org>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260701-gpio-nomadik-silent-v1-0-644d10316cef@bootlin.com>
 <20260701-gpio-nomadik-silent-v1-5-644d10316cef@bootlin.com>
 <CAD++jLmmHXBC9ni0pcVoB2HNK+osBzgirxH7vLHZaANmoe-tpQ@mail.gmail.com>
In-Reply-To: <CAD++jLmmHXBC9ni0pcVoB2HNK+osBzgirxH7vLHZaANmoe-tpQ@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_013410_470962_4E991AE8 
X-CRM114-Status: UNSURE (   8.65  )
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

Hello Linus,

On Thu Jul 2, 2026 at 10:00 AM CEST, Linus Walleij wrote:
> On Wed, Jul 1, 2026 at 6:57=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@boot=
lin.com> wrote:
>
>> Successful driver probing should be silent. Drop unconditional
>> dev_info() call that is done at nmk_gpio_probe() exit.
>>
>> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>
>
> I actually don't generally agree, but you are using this driver more than
> me now so let's go with your minimalist dmesg style for this driver.

I get from where you stand, but the info level is somewhat strong.
Documentation/process/coding-style.rst agrees ("When drivers are
working properly they are quiet").

If you like this log line we can turn it into a lower debug level?

> Reviewed-by: Linus Walleij <linusw@kernel.org>

Thanks for the reviews Linus!

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


