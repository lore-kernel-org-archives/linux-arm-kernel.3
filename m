Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85818C79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 00:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LB4xOGwX5zRvsIqTiz17TCA8SFZm8FpI7B2jc9dy2MY=; b=BkZkBSDqvQy0oGBVLPXSGxLNNs
	khZH99A7xfmLeFiCqvgo4ie95yO1+sIZS+2Jj3+amA+h6V+mNEKhCpdoVgTygOgbZ2XYOLLHmI+NJ
	EnFoheOfpe46RjksqTtqBCmq8zbUp7pjCJFJWSRrobegeDp71821ete5E6At+RePjn8R8Q72LER6Y
	uMHfIoKP1GNVRAiZf4PV0lkUpYQqDoaU3LzaGw9Wr49KcnLHQDHDPY0Z4V8b0GKs3JJPClIZ9MO/Y
	9NwDsVM6QrqU5K130VfA3b1bsfGtUfftgrNir0m3sBYiu++z5GsqeFlUKtTM3oDIkWxlpIRG3hP5P
	vQ7yciPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Sq7-0000000D8we-40cd;
	Thu, 10 Sep 2026 00:40:31 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Sq5-0000000D8vy-0RvD;
	Thu, 10 Sep 2026 00:40:30 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ADACC40E58E;
	Thu, 10 Sep 2026 02:40:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1789000824; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=LB4xOGwX5zRvsIqTiz17TCA8SFZm8FpI7B2jc9dy2MY=;
	b=W2e0+R+j5MhtDmDdh4jEQPXtRn2UQUSpSayn4MrW/NP39/u/IvlpGWcZWJY4zwClYDQUzv
	CVsbJXXCxEis6yeZPP8PhS628sxtAa6o2kSnhGKVTtHwpdxRpQz28T3jHfdNRl91JpJK17
	j3zVTIrdKBxvtCCAe7rM1lZN6NChxCMcvus84hPhVafJRaSRoRAMD5QyaxC0qJKBFs3QpL
	MIW5cpvlvw6UP9JuRNeY2KhE9XCW0Uo7HIwB/iO3ntqfdJ0G7GLezv3sWjJCW5gApBps7G
	TYuqkcPWYJ0oE1S4QfMMEUd2tW284zNPKoiTo2oCEPB7vIC9GX4Nipve6uqmsg==
Message-ID: <508e083a-2bee-4003-8ee9-e9b269b2821d@cjdns.fr>
Date: Thu, 10 Sep 2026 02:40:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH net-next 1/2] dt-bindings: net: econet: add EN751221
 ethernet
To: Matheus Sampaio Queiroga <srherobrine20@gmail.com>, lorenzo@kernel.org
Cc: 25181214217@stu.xidian.edu.cn, andrew+netdev@lunn.ch,
 angelogioacchino.delregno@collabora.com, b.larsson@gmx.com,
 conor+dt@kernel.org, davem@davemloft.net, devicetree@vger.kernel.org,
 dong100@mucse.com, edumazet@google.com, enelsonmoore@gmail.com,
 han.junyang@zte.com.cn, hkallweit1@gmail.com, jes@trained-monkey.org,
 krzk+dt@kernel.org, kuba@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, maxime.chevallier@bootlin.com, naseefkm@gmail.com,
 netdev@vger.kernel.org, p.zabel@pengutronix.de, pabeni@redhat.com,
 robh@kernel.org, vadim.fedorenko@linux.dev, wangruikang@iscas.ac.cn,
 xuanzhuo@linux.alibaba.com
References: <20260909212146.3184077-2-cjd@cjdns.fr>
 <45cb6035-4d15-426d-bb3f-45d20b4201da@gmail.com>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <45cb6035-4d15-426d-bb3f-45d20b4201da@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_174029_338157_F9876FF2 
X-CRM114-Status: GOOD (  15.02  )
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


On 10/09/2026 01:09, Matheus Sampaio Queiroga wrote:
> Hello everyone, please excuse this email.
>
> In my opinion, the Ethernet driver for the Econet/Airoha MIPS SoCs 
> should be merged with the existing Airoha driver.
> i get PPE and xPON to start and work on the en7523, en751221, and en7528.


For my part, I don't agree with that opinion. When I first began 
developing this driver, I first began trying to work on that driver and 
I couldn't find a way that didn't lead to code which I consider ugly.

The main differences in hardware are the number of RX/TX chains in the 
QDMA, number of IRQ banks (we only have 1), QDMA register layout is very 
different and we have fewer features, and we have two GDMs rather than 
four. Also as I recall we have fewer channels available so QoS logic is 
not drop-in.

If someone proposed to me to add Airoha support to this driver, I 
wouldn't want the same econet_qdma.c file supporting both platforms, and 
in the Airoha driver the QDMA subsystem is more tightly coupled - so if 
I maintained that driver, I would not want them merged at all.

I added Lorenzo Bianconi the Airoha maintainer to this thread in case he 
may have some thoughts on the topic.


Thanks,

Caleb


>
> With a discussion on the Openwrt forum,
> it is said that integrating the en751627, en7528, and en7580 Ethernet 
> drivers into the new EcoNet Ethernet driver.
> These families are closer to what we already have in the Aiorha driver.
>
>

