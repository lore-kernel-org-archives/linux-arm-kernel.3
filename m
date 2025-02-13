Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4270C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 15:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cSPo3S4QwhCTf4yRppXnD4bxwylZMuurUQ4Zm3rpVHA=; b=AjvkYsFFS5qxE9
	4HgCo/PIuyo3uWpPajspsuNeFV/HochhdchaFrKvDktrh1OAEjPQRy6s4/Uf93TR9FptkgGYMisOW
	7xR/LpACCJM0SH/zpIRt+aEEJtEPTwVfmiP8UqHzRMrL6yT9ojNtLeeQpp2XdMv3xLxX5T5z2tifj
	Y52C26k+w1Fa3V7ZbyC9czZMbnNRjhihnvHJSK92fr6YDiFoiin4ewhx0aoG8kYbpGW8hMZgnlo1E
	jX1ADvYwfezJGks/OJPj1PeDDW+48wPeVMwKqvcb95w53Lp+vOdT6C6A8AIqSZSCtwbelKih2tLCZ
	HI2T6tKMq0QpMPeR7Vcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tibCN-0000000BY3E-2rfK;
	Thu, 13 Feb 2025 15:32:19 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tibAx-0000000BXjP-0DoM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 15:30:52 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4324C4327E;
	Thu, 13 Feb 2025 15:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739460649;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cSPo3S4QwhCTf4yRppXnD4bxwylZMuurUQ4Zm3rpVHA=;
	b=PtmoB1+K9ZJpqH7XU7YV+rkGa5/jQ96ghiUnt6VfxJVRxZYka5Ak+BMTqGWHQoJvheOSqD
	qGwvjShFz7i4ntX0vUQCB+tJEbcCJ8Dm/EEh7SAYuEm/jN9yewdGbbamUQSnarpvuUU5Xv
	jZI/Uy/kgLuzo1W0NMnqk6GTO+Orj9RtxNpsX+ilWiD8RV5pxlDVcEDdQ8QCloTBvbCTKB
	zXL8kh1gNSDnl79NNXC8x9iE+rMVTxGRWfescZRLAULJIKnwAD/60ucr5M9gOWIkK74Bn7
	81l4MFKwhUNtG9CzFZgvc7zyoMnlltSasP+dVZqLmyR89940UDzKcg/fqC0RMw==
Message-ID: <8e954934-b0af-4c80-9ca0-1914b65644f3@bootlin.com>
Date: Thu, 13 Feb 2025 16:30:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/12] bluetooth: hci_wilc: add wilc hci driver
To: Krzysztof Kozlowski <krzk@kernel.org>
References: <20250212-wilc3000_bt-v1-0-9609b784874e@bootlin.com>
 <20250212-wilc3000_bt-v1-10-9609b784874e@bootlin.com>
 <20250213-fine-thankful-lobster-eed3e8@krzk-bin>
From: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Content-Language: en-US
In-Reply-To: <20250213-fine-thankful-lobster-eed3e8@krzk-bin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegjedugecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpeetlhgvgihishcunfhothhhohhrrocuoegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepvdetteektdehudelheehkeeggfejgfelveevgeevtdejudfgveetgefhtdduuedtnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegludelvddrudeikedrtddrvddungdpmhgrihhlfhhrohhmpegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvdegpdhrtghpthhtohepkhhriihksehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmrghrtggvlheshhholhhtmhgrnhhnrdhorhhgpdhrtghpthhtoheplhhuihiirdguvghnthiisehgmhgrihhlrdgtohhmpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvl
 hdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghjrgihrdhkrghthhgrthesmhhitghrohgthhhiphdrtghomhdprhgtphhtthhopegtlhgruhguihhurdgsvgiinhgvrgesthhugihonhdruggvvh
X-GND-Sasl: alexis.lothore@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_073051_220401_0B16110C 
X-CRM114-Status: GOOD (  11.80  )
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Eric Dumazet <edumazet@google.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Marek Vasut <marex@denx.de>, Rob Herring <robh@kernel.org>, Ajay Singh <ajay.kathat@microchip.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Kalle Valo <kvalo@kernel.org>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org, Simon Horman <horms@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "David S. Miller" <davem@davemloft.net>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Krzysztof,

On 2/13/25 10:24, Krzysztof Kozlowski wrote:
> On Wed, Feb 12, 2025 at 04:46:29PM +0100, Alexis Lothoré wrote:
>> +#include "linux/bitops.h"
>> +#include "linux/byteorder/generic.h"
>> +#include "linux/err.h"
>> +#include "linux/gfp_types.h"
>> +#include "net/bluetooth/bluetooth.h"
>> +#include "net/bluetooth/hci.h"
> 
> Keep some order here. Why some are <> some "", why net is mixed with
> linux...

[...]

>> +	wilc_adapter = kzalloc(sizeof(*wilc_adapter), GFP_KERNEL);
> 
> Why not devm?

[...]

>> +	if (IS_ERR(wlan)) {
>> +		pr_warn("Can not initialize bluetooth: %pe\n", wlan);
> 
> dev_warn or even dev_err_probe to handle deferral.

[...]

>> +	dev_info(&serdev->dev, "WILC hci interface registered");
> 
> Drop simple probe statuses. sysfs already provides this.

[...]

>> +static struct serdev_device_driver wilc_bt_serdev_driver = {
>> +	.probe = wilc_bt_serdev_probe,
>> +	.remove = wilc_bt_serdev_remove,
>> +	.driver = {
>> +		.name = "hci_uart_wilc",
>> +		.of_match_table = of_match_ptr(wilc_bt_of_match),
> 
> Drop of_match_tr, you have warnings here.

Thanks for the review, true for all raised points, which will be handled in next
rev.

Alexis
> 
> Best regards,
> Krzysztof
> 


-- 
Alexis Lothoré, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

