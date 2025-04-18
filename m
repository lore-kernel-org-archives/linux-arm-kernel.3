Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7618C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 09:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lpFv20DDYxhbAWqqo0/MdXt9VXqLpTTMSrFUKJvS/SU=; b=wusK1HYXxG/9lez2nBn3Ciaf9U
	TK/g5eIjvig7qSdLbSta+T0VQrmiJfPWMs0QuRicMfCD6rAO0AzfJQ01TarVZJwiWdE80DDBEVlRH
	yoJnz5EEC/Ldql8XKEr6++8lkXmtm+X2jRIB1ic8SPk54Cyt1b9varjcP+I8Za2vLIiBAAGk6zXmp
	aWgoVDQP2ezBl53mQqAYknoJ/cA7WBilUg3E7Y8aWCe83Y2P2DIEFRtthPc3HM0KOzd9glS9j17MB
	RbfkP/pV07HvQLWJSDw9R+aEGNEdhMYPaLbUSzIgng8GC5Y5krH19UEyZ6kDBN6JKnv7yKZ1RqUYs
	nmGdZmFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5htV-0000000FjwR-3o2m;
	Fri, 18 Apr 2025 09:20:21 +0000
Received: from cpanel.siel.si ([46.19.9.99])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5hrd-0000000Fjj7-41V8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 09:18:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=lpFv20DDYxhbAWqqo0/MdXt9VXqLpTTMSrFUKJvS/SU=; b=BIGmK1GJEUKd12IfLt293mn2V7
	O4xV5c4T5puHm94czvjBEhCz0ZDMk/Wy4QK+lSx9I+yPmPnQy8iSIZnbnJmzbNPp5Q2c3SlqcOf3X
	wHTpmRR5rr2nO71jU7MAP/u6NnuwrHISVL8/3VT2ZyDGu2sw1Kk3XV/t0LEsvlcF+sFr776lKOj0u
	w3sDUTyc9UfEY+czKOyrYKBfBvW2c3nB7o6NEFcbTLfJx7GrG3nKKxSnWk8OVJh10Mc/vu7hr/UXK
	fy518A15GUXHT/lMj4uKlAHPHjykswYuTL7C6E39tTujuGEIhgxcdLdFEe/fsbTsa7nbmaE/XYzQy
	M+SbqK+w==;
Received: from [89.212.21.243] (port=36688 helo=[192.168.69.116])
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1u5hra-00B3iy-2o;
	Fri, 18 Apr 2025 11:18:22 +0200
Message-ID: <63ba0243-ae07-4e8a-beb3-447e903ba9fc@norik.com>
Date: Fri, 18 Apr 2025 11:18:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/15] arm64: dts: freescale: imx93-phycore-som:
 Disable LED pull-up
To: Dirk Gouders <dirk@gouders.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, upstream@lists.phytec.de
References: <20250418063104.2202085-1-primoz.fiser@norik.com>
 <20250418063104.2202085-4-primoz.fiser@norik.com>
 <gh1ptpkhpi.fsf@gouders.net>
Content-Language: en-US
From: Primoz Fiser <primoz.fiser@norik.com>
Autocrypt: addr=primoz.fiser@norik.com; keydata=
 xjMEZrROOxYJKwYBBAHaRw8BAQdAADVOb5tiLVTUAC9nu/FUl4gj/+4fDLqbc3mk0Vz8riTN
 JVByaW1veiBGaXNlciA8cHJpbW96LmZpc2VyQG5vcmlrLmNvbT7CiQQTFggAMRYhBK2YFSAH
 ExsBZLCwJGoLbQEHbnBPBQJmtE47AhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQagttAQducE+T
 gAD+K4fKlIuvH75fAFwGYG/HT3F9mN64majvqJqvp3gTB9YBAL12gu+cm11m9JMyOyN0l6Os
 jStsQFghPkzBSDWSDN0NzjgEZrROPBIKKwYBBAGXVQEFAQEHQP2xtEOhbgA+rfzvvcFkV1zK
 6ym3/c/OUQObCp50BocdAwEIB8J4BBgWCAAgFiEErZgVIAcTGwFksLAkagttAQducE8FAma0
 TjwCGwwACgkQagttAQducE8ucAD9F1sXtQD4iA7Qu+SwNUAp/9x7Cqr37CSb2p6hbRmPJP8B
 AMYR91JYlFmOJ+ScPhQ8/MgFO+V6pa7K2ebk5xYqsCgA
Organization: Norik systems d.o.o.
In-Reply-To: <gh1ptpkhpi.fsf@gouders.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cpanel.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_021826_469278_A8AD0163 
X-CRM114-Status: UNSURE (   5.66  )
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

Hi Dirk,

On 18. 04. 25 10:16, Dirk Gouders wrote:
> Primoz Fiser <primoz.fiser@norik.com> writes:
> 
>> There is already an external pull-down resistor on the LED output line.
>> It makes no sense to have both pull-down and pull-up resistors enabled
>> at the same time. Thus disable the internal pull-down.
>                          ~~~~~~~              ~~~~~~~~~
> Sorry for disturbing, but I couldn't resist: the above somehow
> contradicts the subject line -- at least when reading this just by
> chance.

Yeah... it should say "disable the internal pull-up".

Great attention to details :)

Thanks,

BR,
Primoz

> 
> Regards,
> 
> Dirk


