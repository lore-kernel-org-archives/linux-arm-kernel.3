Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD443D10F5C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 06:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K7vRR3PICpmX4+NW+QKL36XvwQqMOpMiqtREAJo3mCo=; b=t3jUfRLtXru2SsuThgs6VXC+mv
	mvdld67LYaW+AHJyU7PGbU188iRK5+3IyxgSvxqGmti7fJVNCRJBp6y/89satgyZrzaWsrxL8LdKE
	EA+1Ng9KpPEKeLUz2aY9Hu7eHPTO/F10fP0IDyPmcWUrigLkmf5wOgMBlEagUxZfmJtq6QFzbElKF
	o0XmFwWfznCV8kf95UjTzFMe+1XW7ZzVlA6PjawGdi4yiNNP9Oa64p4UAXSxCYts5VSPZTmy4N3yN
	ZvarbMnf3UdQ2SiEYo2K1NWRGUxMMUmREsIMJmwAQLNPS3jsbWqt6Sb7Xjfmnx1l1MSDELj8WvmYM
	sAp/CsRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCuqk-00000008T2M-0DZj;
	Mon, 18 Nov 2024 06:03:02 +0000
Received: from mout.gmx.net ([212.227.17.20])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCupn-00000008Srz-2KK5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 06:02:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1731909715; x=1732514515; i=wahrenst@gmx.net;
	bh=K7vRR3PICpmX4+NW+QKL36XvwQqMOpMiqtREAJo3mCo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=HxyE6IXTtlFxApFrih9mES0rN4BW2vHr8HivWUeUjGAy04ZgjqWs21cUuVJpi/7j
	 77ltcXX2cfG/G5WRDKNz255Mf+6dWOrmQjaUfEgLfqsZ5jbBB3rAgUklwoU/5Ycp4
	 7g2DtXh7SBceCv9IbEOGWmjW/vklCUj7VRPU4XhxYVxyWSKYTH2ETQHRSvUUOD0eu
	 GSKQ6gGRGGyYjJ43rT6b9gTGZPFF9FPlorLhHxAvFs7oFRN2PI4qHKWcn6LexQxtf
	 wdfHag75YgpncPSTVsnvE9TX1ta8gnT0vZVuCiIGSxFEXKk/wX7s1y1TKe5mr27lp
	 tNvJNualfxEoTrNOzQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.105] ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MTRMi-1tKZnb1g7Q-00RsRv; Mon, 18
 Nov 2024 07:01:55 +0100
Message-ID: <70188a17-cf5d-4b0d-a575-900dad8f9c66@gmx.net>
Date: Mon, 18 Nov 2024 07:01:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] soc: imx: Add SoC device register for i.MX9
To: alice.guo@oss.nxp.com, alexander.stein@ew.tq-group.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, "alice.guo" <alice.guo@nxp.com>
References: <20241118021716.396001-1-alice.guo@oss.nxp.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20241118021716.396001-1-alice.guo@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:rLk4OWx6ljgfKFCL1ZiTAiqssGrPxUkR15IXSqDOTfOg3xbBvOE
 4Nbtq4AFQ8TyIv6dmAe4gaLgHr+lLvmergPk2s9UUQejZvMKTVlqJW1inMySCcne3Zmb4if
 d4got78nvMCDM9bT1lT6/lFbukxjB9Js/1XFinUfp9yOWyzgFJLIUFO1lfohW3GDdjCerMp
 Y7NaPK/tY2mM7Va/nEU8A==
UI-OutboundReport: notjunk:1;M01:P0:zzK4fJzHw4Q=;4YihpUZvk/BUGl5vFAVpjYBSqC1
 fZIs3Ih4QtGM1QFE/Uo4pNikVLNxr9P54uXNd9VJHjPrLnJgT0jzZqEmM77srypLhyXfv/+BJ
 sb9sr8TawDG4Ua19VIzyLI4zm8awXJGiTBLq35JwKFHQD//mkrPz6MAwWFtEAjbcD1/261PCg
 qXidRnGIhslRUOW0r7uXCsyAu+OZPooi1G466phMGC1qWtY83sUnlBpQAQFDm83PrwndXyt73
 516pF8iLJBy8WDu4s1b/LPzklCCzE/sa6IVjOHsYdonjFNlUZtKLsnAFKNFWM4sF1crNF6x/+
 UzeqprIdIbv4UsD6fAHnv9AbanaBBuWjYCgeAA7QCu0224AunRXZ+1319pz1ZWLWYZ/q7sh3b
 u94mqX2u7nYAj4U/IkMByY4tKJppl8j5tyzewWhpVZyJI+bINzZMTd589VZp9Ie3lZBSgWT8l
 S7jXqGVBYQu6eo4IVoAkAvCABGjPOuYnSZ3UUBsbMWeOw6baclklwXRmAI7kKwONFLYLCnbs8
 bMs5GKimEOkjn8PbkGappkb3vmAIieKBgty1uK9RtJeY7LgwXKKsxY8A3RUU3dOQfeHg7Tpi1
 OpcA3UqdbSc0NWBrGukBhv7fTYHcLOEOGQ9q/oWDnmL5Oofy48PyRyNrdU5KthZGDldysHLzF
 3Z2NQ+yWpPVq0kIhRWmeLunBW02YhAcl6DYO+k/jcx0ekutRpDmPY1uWm5gh+FxCNzXI2rzRr
 YOlsw0hdLpVEx1IkmfUCTDaR97100Go5tWwqfx901qSLdNHbxrZUu9/YU2S0uHUouIdnTtF7+
 QQ8mz3YGyKkA0mI6STFNQm2+QEFQBXeh3CFo4KgHn5BjOdd19mOj3o3FMkUIMtgg/T/MG2uWQ
 GZx63ezRqPERoagwNGBNX41bfZPg9iFpFOw3YJx9+xbMBWXUvIowOpMFU
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241117_220203_886767_EE8540A1 
X-CRM114-Status: UNSURE (   8.01  )
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

Am 18.11.24 um 03:17 schrieb alice.guo@oss.nxp.com:
> From: "alice.guo" <alice.guo@nxp.com>
>
> i.MX9 SoCs have SoC ID, SoC revision number and chip unique identifier
> which are provided by the corresponding ARM trusted firmware API. This
> patch intends to use SMC call to obtain these information and then
> register i.MX9 SoC as a device.
>
> Signed-off-by: Alice Guo <alice.guo@nxp.com>
> Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Reviewed-by: Stefan Wahren <wahrenst@gmx.net>
Looks good to me

Thanks

