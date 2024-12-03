Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBBBBE64ABB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 15:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BXfavICdX0pf2jCBeS7KQ/6j01OzZdPaFIC1TGwGLIQ=; b=oufEMrLrdSoyF2AMR/1/eB9F/7
	tVS2CvqP4OnRTh/718eDOTdLUtS9s31Ev8G66j0+ZUtmLmQilmLxbtb3U/+8/mL5rWpaxUIMpChER
	sY8Rl+7CnKP3BHKgLaNF9bWYDiFGkvRRKkwNIzZRsmjTF/mi9nSYawf8aPNcjTXVb7cU+P1LUcEuu
	tehBHNzkJsRPLPBPp9GGSydIM0xjA8T1+Se8zgKH836tzrpS01fSTTzZ2TxDSb7fdI689DPOANeMS
	aS8hT6Zw4RvZHgFe0YirCb2Wk0hqcKiKEYJ+GoFxQUDI9EPEkU8n4YlojH4uGrF83rBd32m4Wxb+J
	HdudBRQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIUqA-00000009vgo-2ySv;
	Tue, 03 Dec 2024 15:29:30 +0000
Received: from mxout4.routing.net ([2a03:2900:1:a::9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIUp9-00000009vRM-3zKx;
	Tue, 03 Dec 2024 15:28:29 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout4.routing.net (Postfix) with ESMTP id 2E8A4100686;
	Tue,  3 Dec 2024 15:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1733239706;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BXfavICdX0pf2jCBeS7KQ/6j01OzZdPaFIC1TGwGLIQ=;
	b=Py3QnBBBNisP8uGRDmzVosE2MOwtzfELAF4PyXfLM9+Ou6W57lxU3hdwiVxZRwCQ3mWx3U
	bv2DHT7/FLF9xty9APbNlVl8/l8vGEHqHNVxu0zAq8AUZydK6HKcMANhuLa5dbDfLR2/QR
	HsRfNEAp6cx/wbmeETgNfjLpSpCz0wA=
Received: from webmail.hosting.de (unknown [134.0.26.148])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id 8A20E1005E7;
	Tue,  3 Dec 2024 15:28:25 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 03 Dec 2024 16:28:25 +0100
From: "Frank Wunderlich (linux)" <linux@fw-web.de>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: frank-w@public-files.de, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 13/18] arm64: dts: mediatek: mt7988: add i2c to bpi-r4
 board
In-Reply-To: <f47f08c0-0fb4-4826-9b25-1277cabe4bb6@collabora.com>
References: <20241202122602.30734-1-linux@fw-web.de>
 <20241202122602.30734-14-linux@fw-web.de>
 <1ad355df-3f2a-4257-9374-1d125e138791@collabora.com>
 <CA7E06EB-D26A-45D0-BF13-9C6B640F27A0@public-files.de>
 <f47f08c0-0fb4-4826-9b25-1277cabe4bb6@collabora.com>
Message-ID: <b12e215af5aa5b6bb2fadbeda1117c94@fw-web.de>
X-Sender: linux@fw-web.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Mail-ID: 811d2679-12ba-4194-b5ef-2c8c75dd7bf2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_072828_131656_61133DED 
X-CRM114-Status: GOOD (  13.22  )
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

Am 2024-12-03 15:22, schrieb AngeloGioacchino Del Regno:
> Il 03/12/24 11:58, Frank Wunderlich ha scritto:
>> Am 3. Dezember 2024 10:40:38 MEZ schrieb AngeloGioacchino Del Regno 
>> <angelogioacchino.delregno@collabora.com>:
>>> Il 02/12/24 13:25, Frank Wunderlich ha scritto:
>>>> From: Frank Wunderlich <frank-w@public-files.de>
>>>> 
>>>> Add basic i2c nodes to bananapi R4 board.
>>>> 
>>>> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
>>> 
>>> arm64: dts: mediatek: mt7988a-bpi-r4: Enable I2C controllers
>>> 
>>> Enable the I2C0, I2C2 controllers found on the BananaPi R4 board; 
>>> these
>>> controllers are accessible at ... I don't know, a header on the 
>>> board?
>> 
>> These 2 i2c have directly connected spare devices (pmic on i2c0 and 
>> i2c-mux on i2c2 added in later commits to have it a bit cleaner). I2c1 
>> is on gpio header which i have not added to let user choose if he 
>> wants i2c option or gpio. I can also add i2c1 to r4 board with the 
>> right pinctrl but imho it should be disabled to have gpio function 
>> default.
> 
> And again, you should really add all that information to the commit 
> description,
> as that not only helps me to review your submission, but also helps 
> other people
> checking the commit history....!

this ine i would rephrase like this

     arm64: dts: mediatek: mt7988a-bpi-r4: Enable I2C controllers

     Enable the I2C0, I2C2 controllers found on the BananaPi R4 board.
     Both controllers are not accessible from user and having fixed spare
     devices. I2C0 have a pmic connected, I2C2 is used with 
I2C-multiplexer
     for e.g. SFP cages.
     The missing I2C1 is connected to GPIO header which can have either 
GPIO
     mode or I2C mode.


> Cheers
> 
>> 
>>> After which,
>>> 
>>> Reviewed-by: AngeloGioacchino Del Regno 
>>> <angelogioacchino.delregno@collabora.com>
>>> 
>>> 
>> 
>> 
>> regards Frank

