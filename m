Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8C5AE6896D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 10:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=czggZw1ImOvUCNjV9J0Fcc94CVGtF4QXnBHN0bWctP8=; b=i8Y82aScl/YhUSdbBrimWCfXsg
	zKxeHC05dPfqqPfpMKa5AiYLV0U/Zo+uO77WtmVzqt96CMQTs0cL17UR0xvng5gKLjJ0OIHoMInVy
	fnLgjUiDF/QGwBD4U6jDwulYGtmbLyzf9yCpUdNLzwU89U3CG2H2h6KSyVuK4+PKskGvCUlZrePgj
	0v5UsBo7pZsUn6ydE3NdTipMCjZZMIUxf2NFucUIG0omVIFgH2EHzk7U8i3pHxf/EcAu0cpR+N5cW
	y++pbZd9H+5e5WFU8+xqPjfLbZRtI0Z2inh2j/b5Cs06RWBEdcbUoDR+m51AaJ7+kxNR1rHbvskyq
	tyNzNJqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6S6I-00000003BN2-26tQ;
	Thu, 31 Oct 2024 10:08:22 +0000
Received: from mout.gmx.net ([212.227.17.21])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6S4d-00000003B8V-3PsP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 10:06:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1730369194; x=1730973994; i=wahrenst@gmx.net;
	bh=czggZw1ImOvUCNjV9J0Fcc94CVGtF4QXnBHN0bWctP8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=bdXYH2ok2ThyRDK0WQIxlpnIB7e/Chol5Cm3EywtEwFpI0+CQayBlS/tc8CvUt7D
	 Gz39OuPCzMWKdiVjHuwVRWBr6uu79HAd4MP0uV70Df+MXWTGe8CgPVJcr/tSMAs9I
	 nvqF4mIYQq2SOekDMjU8OVva3VtkoTvbrvaHHAeSbZkP3DhQLDqbCDnYk1yjxWMjY
	 0zvNPanqw7YJZ4ZN3MZMzf2eFJeWE/T4YOio/oCwiyuLSCxa45m6T1j54f41Skdb0
	 rMmYPEld9nG1WjD3J2kKb7YeU0KmJcbREO9dSbd87XaC6fKBzQgeS+zMjDOr7kb3m
	 Jyr/WUEdoNvxa1u+KQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.105] ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MqaxU-1tbP6Q31uq-00eZ21; Thu, 31
 Oct 2024 11:06:34 +0100
Message-ID: <1a851c21-18d2-472f-95ae-b4121ffded4f@gmx.net>
Date: Thu, 31 Oct 2024 11:06:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 4/4] ARM: dts: mxs: Add descriptions for imx287 based
 btt3-[012] devices
To: Lukasz Majewski <lukma@denx.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20241022133040.686562-1-lukma@denx.de>
 <20241022133040.686562-4-lukma@denx.de>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20241022133040.686562-4-lukma@denx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:F7iNUNqYNdiEuQkrR7RINVZPMB1Sy2y7T6+j14hQxtRoye0cYGT
 S0D3noRd9h1Q0UvacqGupZJ+mxwgvM044pV0jhv/Fn+qPyzbJ2Hm+driWi4b+bfVKExWLay
 LrMs6JrgPbKOHCXFHW2FEPN4I7blrn+1VbE+RVUmlEni8RptFd7yKAkOh6ABJLijBomkmRw
 +edM6v6gyUCRcwkL0mdiA==
UI-OutboundReport: notjunk:1;M01:P0:s4eDwSPY0a8=;0KcBJFMpQiU1k9ATTJaFmUH2h5T
 vcJ8BbomjztZJIutSk/kPEkwZcR5oPkxlbfuy5FCSFW8VYlKyeNFmROJyFm1uqB9W7r88nyin
 sqg7EIsry0EYsQHtGVZ5HTweRxhcBANSqV84SiESUJmoxc2GklO5FuTLMsjg0CBfEeWGGitWy
 cvE08ycTnAbDwudWzQo6dZMG727usqShFvg3fHtEe1wFfaBBOFkSuMOOb6XFmw2l/HB5nYspK
 glddAOUMyEQVXStJMf7HQW5txZyzYYKrzIw2Jd4xXcG3GFwRz2M4OL2fskbhOVd1qaF2jCM43
 8/mRs33YUqVz/d5Hq2nAdhHlOkDrxmIvJb3BGfkQJTE0HYOFT4mDGkKmUeKRNBAaLPM/xDb9s
 wS6PsFDtMO71wrSlFTG8MyPpH5jWy3s1PN8MY1qAijurobv2El4MPXqatsgiL6MoW38hvlQGw
 XC9uM28Q1SFgjMMVayQDyqT/zxGXPnvA66ZNh3zZleFugbimW38Kxv/ir9F/z/GM7N3G7Qpl5
 rKsGEir4Iqw1Rx7tt+ee/ZNjTGCq3o07EeNx0mVwIyRA+Jj83v7Fi4TA2cQ8QIeWLymVTvXVi
 lMv7QpgDLWveaUi1yKS4FRhpJsfj5u4kb3p31HoM7njLj7rhgFjDuIe7PheTYuH/asVMBdST/
 GBIHA8G6Rr4DBkRCQttVXcRMVWtZH6Mby691qoezLy+PBpWdn3KgVFDkr4hBGdShfssLg9OX7
 SYIFooYqnasuEyUKvRtL8fne5ayO3gx4evx4EZOnpjSwS/96sZvrqjTxpYmGbHZPitMjcZAc7
 KfjphD/63KZOKhVHudWfmdpg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_030640_186063_445FBA53 
X-CRM114-Status: UNSURE (   9.88  )
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

Am 22.10.24 um 15:30 schrieb Lukasz Majewski:
> The btt3 device' HW revisions from 0 to 2 use imx287 SoC and are to
> some extend similar to already upstreamed XEA devices, hence are
> using common imx28-lwe.dtsi file.
>
> New, imx28-btt3.dtsi has been added to embrace common DTS
> properties for different HW revisions for this device.
>
> As a result - changes introduced in imx28-btt3-[012].dts are
> minimal.
>
> Signed-off-by: Lukasz Majewski <lukma@denx.de>

Assuming that Rob's comment wouldn't result in fundamental changes here:

Reviewed-by: Stefan Wahren <wahrenst@gmx.net>

