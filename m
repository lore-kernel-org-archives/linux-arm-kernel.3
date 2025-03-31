Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBAB6C36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 15:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ONG0BJhYcdFcbdbbG9uUilO0npdYdFa1cy8TdF6a93M=; b=B1FKLXxLIho5t5plKjJEdGJHex
	LHJDVVwaJUxfp7xm8RSRHeYHfuMyvu50n4bTDbnmS0XlCacEVBFlgy0XrBhyY1LOWpNETDR5CyOQM
	K8Qb4q8k9k8ltMHGQwB2RC4RbFrIMM476StlVextCdiunvuuseBI1OmTbESMv3Yl7/jDraaMbmMWv
	5OTCd6HlQyY4WzXBOAWxTtOKxW+UJ0ocU8EzE/Jm5/82ghKBAta4ROQlx0lqa9tbsGFSMaYPkoeLc
	ZjrTawgkunqsWNxaF3Ynd9t66b72RKXyksuTWmHyBCcot+718aLV3bRbp91omX1d1a0s1neV0j4zP
	rBY3HsFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzHIp-00000000rnc-0B6G;
	Mon, 31 Mar 2025 15:43:55 +0000
Received: from mout.web.de ([212.227.17.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzGcp-00000000g4F-3XDY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 15:00:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1743433222; x=1744038022; i=markus.elfring@web.de;
	bh=ONG0BJhYcdFcbdbbG9uUilO0npdYdFa1cy8TdF6a93M=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=wB+Cd8iE+DqToF1NS/R3/YV9BZsYuknrDQn3p5akJ0SVzAMCEHX0umWWZlMUhUps
	 W7uQGq/7H+hutF2zICuzeE/r5iN92kLrdaUILMhfECNYHrTOh1+6YYtjax8IbG/59
	 ElMx24D/63//ezeRHpxiXB8HyTMCtcj7ThqIwsyoL0EChx+y3aGx/lm6pHkqwukGX
	 xHXWdy6r1Io8y2X2eAC6DKNok/6Mxl3kRfdqQm1oDXNax/fiWpTCQ250ytfjNHdCx
	 HLwUm65mDLBPH5PvhuzP4OeoCF9Z6JAodzpeZn0xU86jHxVKbCvKx/IKPI9wfAsKV
	 dj89YU14+pnVH+oFTQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.37]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MJFhJ-1tfFjZ2Zz9-00Vc5g; Mon, 31
 Mar 2025 17:00:22 +0200
Message-ID: <b1749989-ae58-4b1d-b228-62c996dfe87d@web.de>
Date: Mon, 31 Mar 2025 17:00:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Henry Martin <bsdhenrymartin@gmail.com>,
 linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Will Deacon <will@kernel.org>
References: <20250331144324.12940-1-bsdhenrymartin@gmail.com>
Subject: Re: [PATCH v3] driver: tx2: Add NULL check in tx2_uncore_pmu_register
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250331144324.12940-1-bsdhenrymartin@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Kk9i/dDmIdF1mDcszJt+OqM6Us9gi274qI3kCBdJbalGiQIIJUi
 cnj5SZU15ThuDoXnTCc4+50LqBRM1qeAqJlnkrZKvk8hSECSzOAxp+dYPwe+ehMJVijdxQH
 aaa5aNCNyGNHhyRMfn9rJG957R67+ydkg0hvIYr8G7h5yRIdUA0T8rzOE2ZAZml7X0lRQG0
 1oWNjZUXcweWzSgerSJqg==
UI-OutboundReport: notjunk:1;M01:P0:5wmAebdhJ6A=;DEPTNbWInGLhXRlQgnpQ1+Q1V0s
 NLDq0/gV/aPjY/DxmczBTdB85kA5Dd0cmkzI7pJ5EcP1hyi6cWWQpoBOx9CyZCSR52+FCb3Oe
 jxidFSrMeUQOR8spo0ETqUck1iPGfOGo7wVhkA9WcbOjwmkfi2tewgnI5VDuD6iFMGYXFwGql
 Y1QoaforH7Eg6b4yITKRHSiHzi7ZXiABHcHOEvfD0j1t6whbK7AAk0K2KIcbCQlCnVLxagXaW
 yzcL0v7fTr8ua1ENQvZFkWOoRE3Y8ewWnVni+cUhGvlbheoxJ5FtDGxSL+HwEud0nW1OpKVnE
 Y4CvbT9wzq8/Vu1RhAVk0HzuR7vJ9qPJb0mt21gxwL42+IL0rqQ5MWawEAckFmjBwHTxNjeBW
 HL0iwBJFMTB8w7VeQwqBZ0A15u4hbn2XVZPOk+U3pfWVMja0tfzB5L10A5sWCJAvThT7J2mtr
 jlFCEwe/Nn4OWDBzGN0uHXZIJROM6VqcE7nVyDC1f1ZDodgwgdn5E6rWbAlGFSjHkKAIFAvfa
 aoIbQQxGVztVge3CE1b68P6lXhUj1RyY/fhJFcXoCAj1tgxAxSFOxfL3DtwBNv/LbVRcWm0C6
 UtZbxuu/3KkdC+RSmCfQyq4eHQtrpgG7qSNn6Pcbe98xXaaJdxTUyZ28kys7/3UsEUQiWFwMQ
 ghPpW3GgprY0bg0QeE1somZRTiPl02OFblGfnkP/7ZQfoLAPc45sJuz4EMrMDeXs+fCJrDg42
 8PWb0IXz7fiUELX7PscK3kDdxFHI30bpXlaud12IsIGBjtonRCwbyMT5HLxzdJskL9Ambl1zy
 wkQdKrjPXgWObYB2+nbky5pcJI0rZqCSJzHpMHER9LkZRY0rEosdSEtqlUAmVzaRTCuPk4axc
 kOB4l5h+zhciijlhc1k9PDwZD0lpmJ3kg3NkY+vCLlm2cuQPg0JNTJo5OrThwYHrQLQMhvthD
 mAomd63icEwafFTGnSPhrydakAWv2MaCfX6Q5s56Prvgnwi1vSKw3AvkeeNL2iUud5r9E0H2C
 RXg5bVEiHMOtT5GUv8tJEqPjKUIEgkgm8uONKNAd9gREyQ5uW1VYQPHOxnAZs56oF25o+vUPJ
 DlB2NubSuNWyxYAeKyPZSu9+yNhBvUbPsREdj6Wpgo+fIRqlqUcubaKqiS4FUxl7anj9JZBWX
 HRMxQ6kGfuK/948/QuFcJbSJJuK+gn0GTTg/W7mlaLpTx6sDoovj98vzfd/D/uCKpsgNgbo7A
 fT+cK5iRJ5lyk0BfsEumOFA4myjuzxM6AtVNpSLp/gIKa7nMO20PCL/g+yFPus1YTh8kcEW4S
 kJzmef2vKRd9AGnuxIvK7P45/0C1cylTTG2kROoRZQ9X/rM4AbHR3MQEpi+7B+5YLa9/1I49Z
 DS8gf/Hgys2eMFTkL8IXuyrDEBZ5fgFI5rnZJ7pVtZ3S2rPWkpGZu0xKAYCNeNCrcID4WfOiw
 TN8QN/TO9pGPHWyAuxnEtHJ4QGqQfLyhMUdm28CMgxyWSM1JV/AcwY+H3oopk6gfMCPJkhg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_080032_180966_AC507C60 
X-CRM114-Status: UNSURE (   8.99  )
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

> devm_kasprintf() returns NULL if memory allocation fails.

                call                                 failed?


>                                                           Currently,
> tx2_uncore_pmu_register() does not check for this case, leading to a
> NULL pointer dereference.

This (temporary) view should be reconsidered in more detail.


> No automated tools were used;

Further development tools can help for such analysis attempts.


>                               this was found during manual code review.

This approach might be misleading so far.


=E2=80=A6
> +++ b/drivers/perf/thunderx2_pmu.c
> @@ -738,7 +738,8 @@ static int tx2_uncore_pmu_register(
>
>  	tx2_pmu->pmu.name =3D devm_kasprintf(dev, GFP_KERNEL,
>  			"%s", name);
> -
> +	if (!tx2_pmu->pmu.name)
> +		return -ENOMEM;
>  	return perf_pmu_register(&tx2_pmu->pmu, tx2_pmu->pmu.name, -1);
>  }
=E2=80=A6

Should your source code analysis approaches take further implementation de=
tails
better into account?

Example:
perf_pmu_register()
https://elixir.bootlin.com/linux/v6.14-rc6/source/kernel/events/core.c#L11=
859-L11862
=E2=80=A6
	if (WARN_ONCE(!name, "Can not register anonymous pmu.\n")) {
		ret =3D -EINVAL;
=E2=80=A6


Regards,
Markus

