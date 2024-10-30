Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 627F8D5CCB5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 14:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jshZkYfvja2YSTTFhWzMe847j/Nt/PWYVOy1voJLicQ=; b=Gv0C8/hRriLvnKPV2u0jbPDJrK
	WK0yEXP1tm4cVRiP0jc8bFBRl98YbUlPnf6slOlMaYTV/OIJpaq0341J5oO7hHRQyEbeyEdnTywUz
	iRnDHaeQJyPak8a3da8RIxMB34zdN8cVftavdi+7TYPkzZ7MqEgm6978HXqInmlT7HP0OXR/GbpKg
	ahwRhhJM97+xKTi3zmxUx/iBJARLohyRMK0ZD6v0omlNbhcpTvUWXC+uFzYRJ444gp6Mc5zFE+lXZ
	Hkxe8mkaDUDK5hLO2GRIEwTizUU7+rBa97C1TfR+hy1KWtibjXe1w0YRBk/NZXAL2wsjiBOis0KHW
	5ZnCefFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6A9o-00000000kQt-2uRv;
	Wed, 30 Oct 2024 14:58:48 +0000
Received: from mout.gmx.net ([212.227.17.20])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6A7a-00000000jwF-24ES
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 14:56:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1730300179; x=1730904979; i=wahrenst@gmx.net;
	bh=jshZkYfvja2YSTTFhWzMe847j/Nt/PWYVOy1voJLicQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=k884u+i9keC0g2paphHbvsVqlTZxxRpT6XIs7pCFHvCBZi72zY6njsEqRP9I34Es
	 2HuFbuu6jY1Jr4OddMJnhC9VcVqXVrd1qe3W7ksIGbEciWWJNU5bDmeFnvyn01ga+
	 3R+hujGe91REFTTU6s9FEiDUbWYRQ8us7PsvLYWM6kTgjuxfNExgcdKBxYyt29mSe
	 P5XLbtJxKDLPICy5L2zinBsPssnpsVlYPvmzgw2xRCDH0+xVVzGCr6iopT6rf36sc
	 18ZxWbuwyWdhiOaOUF0LsjYwf3ps5VjXKuzMmw4SpWLs9GrK5w5D5WAtztDAmwREX
	 61phmsGSwxjwYCoFVA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.105] ([37.4.248.43]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MnakX-1tY6xL3csH-00exFl; Wed, 30
 Oct 2024 15:56:18 +0100
Message-ID: <28689191-db0a-4999-a13d-ab72f0bdc351@gmx.net>
Date: Wed, 30 Oct 2024 15:56:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] soc: imx: Add SoC device register for i.MX9
To: alice.guo@oss.nxp.com, alexander.stein@ew.tq-group.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, "alice.guo" <alice.guo@nxp.com>
References: <20241030091336.3901440-1-alice.guo@oss.nxp.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20241030091336.3901440-1-alice.guo@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:KtNuXtD3fPz5cu76LoF89EA6xDMNunokgaZ6dxY+UMLrbQLZ/L/
 7N9suW9ppmK9Zm8uZ6NijM1whQQaDaRdB7PC7nburWSBlBHBNFnV9+oNGX+4ZFgnMiZFYYu
 qPLXTVz49b2/QWHISmoLQTaMjF00p30Kwy/dXexWdJeIInSDXsb8OvS0KhwGamLYdJFlNs7
 kCAAWw1kWlhtBp1yiqZOg==
UI-OutboundReport: notjunk:1;M01:P0:6TszQDnBRpY=;knUkfFbO2LY6ibsEehq168459ty
 1lvxyAzWl/Lzcwkh34iAwkYmCo+tfPG8w5W4EWKxJocWIwVg+htgqXxtIEqeAhA6Gh1BVfnLU
 Wj3KgafF1fgzTqWbaAEPHaIVsdUIO62R4x59swDjElZAtCdQfA0h9oV1pk/tkkluEPBF4tFNV
 L1jPH+QSXLyaA9IUMs9V1Le4ThSmgLxnqPC56CcDMLvsyxIhuPhK+sW8RJqZSJckSd3r84nvg
 D87UIaPulahAaytmo8IpLFSIg+PlxJqNlDHGFs/Rah3z2Heh1DnJOrDTfQJqj7faHMiMF3EcL
 hYef1AL6L4PL+N3/x4J6Pe9JWOWV0LmUEqV+WNuwN5p2Ph+rNBQGCAx6MWRAaAn0ZX/vqEAVP
 Wh3qgvbH++OvgcObH0Relp27RtzdT/sK1pKnZHKznT2UEybzl3fai3+TOKCbRPqoklBtnnS5i
 cnxOJIdggqAO94wBWHuFT7zJjzP3lT3QLGbt//Ccmnbbc9iZOV+BJeT55BkHSXrdlWqXQjRa8
 tWsggbV65ajBef1QROqnYURvfvd1Lkn1xW8dTswbX5Q3bwjpvEs6wL1zJKARrMnTP8Mb5I/bf
 OqBjnSLcAcdSjOydQy2XzU2qW+90h15ZnLf77akmUyC2zI2buOLWwi9zh6wFDT2yAa3aT0xzv
 5HVHpchTh7ydUHqP51+L9d8hXBVKtKPu+LjzJtgFoCAWFGd5uV3x9Pu6PWqE6IZ4Yb6+N+ko8
 U84WrsxjCXmR0bgwPi5+307zXJeaM/IDHZspQxCtQ6fisAvfifYR9RRdMlCX6cIngdQDdCUkm
 /0hErBHyM8lXimoRkRi/QI9A==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_075630_974196_DA4059E5 
X-CRM114-Status: UNSURE (   6.81  )
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

Am 30.10.24 um 10:13 schrieb alice.guo@oss.nxp.com:
> From: "alice.guo" <alice.guo@nxp.com>
>
> i.MX9 SoCs have SoC ID, SoC revision number and chip unique identifier
> which are provided by the corresponding ARM trusted firmware API. This
> patch intends to use SMC call to obtain these information and then
> register i.MX9 SoC as a device.
>
> Signed-off-by: alice.guo <alice.guo@nxp.com>
Reviewed-by: Stefan Wahren <wahrenst@gmx.net>

