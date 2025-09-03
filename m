Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F2BCCA1010
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 09:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4DVwU6ORCD0KTIPF/CZFH+zHLjmgcavJPp8+SH0KKQo=; b=kLVJOh92f/0ADvzdiN5rzW/JA/
	+K/jGl817JO9/fufOuyhWxRjN2Dx17cVIheVoNgLpFk7ptMUOpNgfKuSH1+hYXs3pptzVh6WnmT1Y
	vAGWaOsRKoHjJ5+8a+djklezrVjbrZc5oMfwJmGAFXVpRqgtymHtySLH/LatRtI7q2mbs3vnaoG9y
	zoup2mF64OFAyRJHAOVgeepufYJMkyCT2ab8OE3/k1vF5gvDzpl/tPLwi2r6sG9EXxQByOWrave42
	INyYYXc4WKuAYmozK5TAcMTRadmN4FSGMjCfPlKVUw3EeMms9xT4mn8Omf0fDv5tngLvvKhu5k6jJ
	yNbN4bAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utkEw-000000060uG-33H1;
	Wed, 03 Sep 2025 09:57:18 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utj8W-00000005i5b-2cA7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 08:46:37 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1utj8M-0004jB-AR; Wed, 03 Sep 2025 10:46:26 +0200
Message-ID: <5e993e2a-a0bf-45cc-8d95-75cfc1575a41@pengutronix.de>
Date: Wed, 3 Sep 2025 10:46:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: imx6ul-tx6ul: Switch away from deprecated
 `phy-reset-gpios`
To: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 Csaba Buday <buday.csaba@prolan.hu>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250815-b4-tx6ul-dt-phy-rst-v1-1-9b65e315d9d3@prolan.hu>
 <fa7e2cef-5242-4f3b-84ea-d77b959f6bdb@pengutronix.de>
 <c85a94ee-59e1-47d6-8200-813bb434caf2@prolan.hu>
 <1bf75411-4a51-4103-b314-a8a7253bafca@pengutronix.de>
 <57518c46-2e92-4689-80a3-ae4c99b9fc32@prolan.hu>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Content-Language: en-US, de-DE, de-BE
In-Reply-To: <57518c46-2e92-4689-80a3-ae4c99b9fc32@prolan.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_014636_660996_A2BD6B09 
X-CRM114-Status: GOOD (  11.99  )
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

Hi,

On 9/3/25 9:57 AM, Csókás Bence wrote:
> On 2025. 09. 03. 9:50, Ahmad Fatoum wrote:
>> On 03.09.25 09:43, Csókás Bence wrote:
>>> [1] https://lore.kernel.org/lkml/20250709133222.48802-4-
>>> buday.csaba@prolan.hu/
>>
>> Is this mainline yet?
> 
> Unfortunately, no. It apparently still needs some polish.

So you are trading one breakage for another here. This needs to be spelt
out along with rationale.

Alternatively, see my suggestion in the reply to Csaba.

Cheers,
Ahmad



> 
> Bence
> 
> 

-- 
Pengutronix e.K.                  |                             |
Steuerwalder Str. 21              | http://www.pengutronix.de/  |
31137 Hildesheim, Germany         | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686  | Fax:   +49-5121-206917-5555 |


