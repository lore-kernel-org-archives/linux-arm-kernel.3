Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AC3CD6A220
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 17:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XgMMy+4oHqhQAIKt3y7EZ0tmTJ2euqZWHA2y3veCa1g=; b=zxCwOK3DFXY/NpgwWBnhFw1NJw
	ztqr26fxQXnZfiHqrKj8mTf580CRsVWT+teq40i69yruV6vSCNlMz0kZytfDaSyTg263MwNsLMjo8
	Esik+GoSWd/waODrumWZq2OjhQhFXDJ0sTu995s96N8k0+QW6GXUpTIIPs2B6Xf3xifKjGD3Y4XCj
	NajaTXy1iVePkX8L7mLlZFQLKqHV3ZdR1zMQkJNEaxVdqgnXgDPfoOhdfEVl9vuokcgKkm0jEN6jM
	EEHDkjFVsseKTo+OlTdqlV+XTZiRy7QSkLBrtG4Na2yTA3L1aRt/hcNBovjnv424DmoUlG7KwQ0ef
	w8Jj/mnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBdYN-00000000JCY-1fQe;
	Thu, 14 Nov 2024 17:22:47 +0000
Received: from mout.gmx.net ([212.227.15.19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBdWz-00000000IjO-2niJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 17:21:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1731604873; x=1732209673; i=wahrenst@gmx.net;
	bh=XgMMy+4oHqhQAIKt3y7EZ0tmTJ2euqZWHA2y3veCa1g=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=I2iJl4kv/k11IlACiHS3oKguS2fcLQ/k9CFWc7L1gwIQ4o/iT2Q46cW9aiqms1YJ
	 qLM4uOfYefXR06wpO/iIAgF8cwUFKDcT2uoJ9+ue/4zgELPGMQeVFKfNM8AqvYuTW
	 gw1IGqXywMpe9cT3GdqB3QXNpq9ymtLt7aPYheCUHenWTAVQnkMihZo25atj7AJdb
	 ihlt8GyUUzNXrBO17pmOenbnwYRPmbu8K8NlGALajiyoug8cCiQZAtU97Y+y/JtCx
	 g41dE5ijqGRFWBgM6CnEIMo9ad7TYPqRZIEBqbWuryJIvp7QcvD6OIHPxCvtlOOQH
	 gb8VpvNy2g2eGamo3g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.105] ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MAfUo-1t50lM41Lk-0063ZB; Thu, 14
 Nov 2024 18:21:13 +0100
Message-ID: <f9b27f78-2829-43b5-853e-55f87223b256@gmx.net>
Date: Thu, 14 Nov 2024 18:21:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOWbnuWkjTogW0VYVF0gUmU6IFtQQVRDSCB2NV0gc29jOiBpbXg6?=
 =?UTF-8?Q?_Add_SoC_device_register_for_i=2EMX9?=
To: "Alice Guo (OSS)" <alice.guo@oss.nxp.com>
Cc: "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Alice Guo <alice.guo@nxp.com>,
 "alexander.stein@ew.tq-group.com" <alexander.stein@ew.tq-group.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>, Peng Fan <peng.fan@nxp.com>
References: <20241111032307.144733-1-alice.guo@oss.nxp.com>
 <eed25785-7972-43ce-9903-d8350e51ff7e@gmx.net>
 <PAXPR04MB9644C81E428A2AD90F7E5E6EE25B2@PAXPR04MB9644.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <PAXPR04MB9644C81E428A2AD90F7E5E6EE25B2@PAXPR04MB9644.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:KUmWu2rfel4DoRQNr3ppUnphw8MqIgFflIQCRmYcqL3vFXuNjPB
 2GZ4gLya/pILw+6fpSMDRK3vQiJSQqOmEW6KJOVpl1HZSuyEUNV15HxLHSs8v4vrjGuH0eb
 z5d6yEBF8bt0D+8q//de/Si1xtEcXvJJ+NhhFrOVgKe87gsghS9Ow3MLQviMZZCzBl89pPv
 IMYPn+dxDiif65UErLazw==
UI-OutboundReport: notjunk:1;M01:P0:M/YUmZxmemo=;8llD2nlaWqHmow9ukLbXBKykNYf
 kI2+l2mERSidDltwBgwT8zqcKUhX3bcnVaUOdd24sYvDi5MjJ08fKgnDdGQ3f3K59h0Yqr2Jz
 Mao9WspPeTDTPTNe3fRahH+YA+5vhQrgrjuu9z+kLaSOUZKuJVQtHTEyXdp2cMfPVxu917bNb
 D4mVXZMa/tR6m9TkmxYXvwnefyJ4PF52qUB/6UTJL2F0/BrWST797Y80KNFc4MZykZrOQkzsh
 4IJ+DRkX74TkdSgbe5/yILw1rHZphpmNjqDXtBNI5mHdkZZoIU2S0QUbHDLpwb1aqd6YFymcn
 DCDAaASqGuI50nn3j8oRnHxiS5Oe6FY8YCVQYRNkJyKNG8H9/PPyBI8fw7kAa4jBRDtZ/4l77
 VkXteFKUrn3yZEZ+CNOUOJckBlVjuYTvGgJp1bnhgM/dzmVGLqqFGOTt8lpoWwACyG5tfA/FA
 HOgENg/grMEO3ivqvvMO09nsPRgHYBdFZqwlQTjOgUi120SYdwjednYlQBwhbDLplPIdbcwit
 sVeoKK+itpaPZ18ccx4xhrGl29apq8ds0sdqGPQBTCMT6TZcF3DpBF2zUUmGSNwaT5PrV2rwu
 fehIZ0x+7lHJ/XnGokjWCDH8dakldcb749KD7qw7pIPIZDLbUoJHp8bpuZY+fVMWj3+ihYVGv
 JACw/SY6ih9JptbTv8uEUc+e8E3z0DjyPY1aOkaIOVJRHBjENO8r6qe+X9I0WpBRA8U25bHJB
 f2EVD1bxkXDxKRIwCqpc8I12bCtzVHpbJIAkfA+yGiltbviCNJ3t+42P0vKk1+yN4KbNp3GHk
 z39gu1ZFXXdBLvA46HCgTGawTY2ypgyJDw+SCPFbod9AMFug3QCQPloOvVmgHmkxYKfwpy/Yw
 PprV1xgovrCK8nNIvpNCf1lD9jCdvK2EPXwGNFYSpt1ytKl+5QHw6Sw+D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_092122_067908_5A4F7D6B 
X-CRM114-Status: UNSURE (   6.35  )
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

Hello Alice,

Am 14.11.24 um 08:58 schrieb Alice Guo (OSS):
> Hi Stefan,
>
> There is no device node which is bound to this driver in DTS file so tha=
t I did not use module_platform_driver. This method is the same with drive=
rs/soc/imx/soc-imx8m.c.
sorry, I wasn't aware that this must handled in this special way. Please
ignore the last comments. I will send new ones.

Best regards
>
> Best Regards,
> Alice Guo

