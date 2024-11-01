Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A9ADE6B277
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 13:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2YJmInUh1yE273D7fVlYwg9roES59gJ3eGGrzo7i6RE=; b=hoyAVHdmxJ/QMaw/X6k2BZaoX5
	ru26CPGwZJUF6wDx223FnNUDfCur3RQ1pgBg7kTeS7hLiNcB1m69shbBTpNla4udRd051QIZY0oQw
	XHRa5qgvqduyTu3IElEH51Pjqg1EcEiHpzjaA4RdkNg1sVgx+f7b/eLx5s3kLjB/MYdhAdsKLl/kG
	d28rSnfDkhoaDduRwfUqdxa7T4UIMvbBv2j13jBi1VioQpcf1hxhBpKLBfzXUoCRtyWB8MqbPMSTW
	DI00Ht2XZanFh6POyc3xiA4DytqMYsXv+Y42wfBYMGC2dyNQKEqw3tmFPp0DU9MjjpISP21HlCJnw
	m0zv0Sqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6rKB-000000077FF-0inz;
	Fri, 01 Nov 2024 13:04:23 +0000
Received: from marcansoft.com ([212.63.210.85] helo=mail.marcansoft.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6rIU-00000007759-17yG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 13:02:41 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 4C2554346B;
	Fri,  1 Nov 2024 13:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1730466156; bh=nhbHZKbxhPcBXuHUqFG2yiYnaslxZtegal/zrhaoRY4=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=EkXtSx78tsnEiLjKYpIO8q8ZP5aZBk3HctrUH0NJltK2p8lzJIfy6zAjKtIR8P7eH
	 RfcMbu0PdhuCadcd3pe3T4v8fHM+bQegql5sDqNhEkgv8ze6orUF1BPaPasiTvBYpP
	 finfnvZ5tr0DMuw8H23A5xS7xroVhGKJ/Cs1G/uDM5EyWaXCmX9YzfY2v/LlPz5YDE
	 q7JAQ4Q3oXcnkVlxwaffNgTBgFwsMTKaM0kbz35Sw3NWzmkOJJ2CPiDiP+87mmz285
	 5sdchaQEkiVbJzoJZEj20mvIVx9pgkLejflylzD9RyO1RUUZlsuc20zweQkmNT8zjs
	 Fx/TZXD2w9cYg==
Message-ID: <2f03a7aa-cd74-45d1-b56c-ab19c19d9632@marcan.st>
Date: Fri, 1 Nov 2024 22:02:34 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 RESEND 0/2] watchdog: apple: Increase reset delay to
 150ms
To: Nick Chan <towinchenmi@gmail.com>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241029013055.45538-1-towinchenmi@gmail.com>
From: Hector Martin <marcan@marcan.st>
Content-Language: en-US
In-Reply-To: <20241029013055.45538-1-towinchenmi@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_060238_820820_F59EB5C7 
X-CRM114-Status: UNSURE (   9.98  )
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



On 2024/10/29 10:29, Nick Chan wrote:
> Increase the reset delay to 150ms as the Apple A8X SoC can take up to
> 125ms to actually reset.
> 
> Since the code is being modified anyways, also fix a bug where watchdog
> writes were not actually getting flushed after requesting reset, depsite
> what the code comments said.
> 
> Changes since v1:
> - Fix an existing bug where watchdog writes are not flushed
> 
> v1: https://lore.kernel.org/asahi/20240930060653.4024-1-towinchenmi@gmail.com
> 
> Nick Chan
> ---
> 
> Nick Chan (2):
>   watchdog: apple: Actually flush writes after requesting watchdog
>     restart
>   watchdog: apple: Increase reset delay to 150ms
> 
>  drivers/watchdog/apple_wdt.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> 
> base-commit: dec9255a128e19c5fcc3bdb18175d78094cc624d

Acked-by: Hector Martin <marcan@marcan.st>

- Hector


