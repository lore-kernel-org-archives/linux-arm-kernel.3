Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29A58C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 06:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/KV1IdRK0jNc6P5Dk5JgB2v3ALeStYM5PPll6QvTUdE=; b=s/CHpX2XyTSRSaqel6Asdzrszt
	M45B6yDAN+jZRTz79hduvNJVfF9DYfCFXfFpkrVHEWvpgDbNMW4O5jwqtz2o2SyYwHxO2OlFWy67V
	EVWtb6ib9RPpuouLiye8X7w6r3CJpTA9k3hUgL3r8pxH5xwQL8nLo6QzskC0i2pJoN2kpeZafZIfi
	4tuL9hcz82GZIMKEpg3Y2ZG7F43p+x4W+piPWfHN0WJT8Zqz1XykQ7c6/4ltaoou2rB3jZdC9phxt
	9TtgXU2VJVjgtOGCT1uaX+74mLc7TaCltnu60eLkjT8+ImTLqads/BUS/WpmfhV5X5kvnrGeL3yIn
	lQTAFMgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woFHw-000000024iJ-43xQ;
	Mon, 27 Jul 2026 06:58:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woFHv-000000024hv-1WSi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 06:58:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1532B4177B;
	Mon, 27 Jul 2026 06:58:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B601A1F00A3D;
	Mon, 27 Jul 2026 06:58:06 +0000 (UTC)
Message-ID: <b3bbf0b1-051c-4652-96d8-c141b585a1c9@tuxon.dev>
Date: Mon, 27 Jul 2026 09:58:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] arm64: dts: microchip: lan969x: add QSPI nodes
To: Robert Marko <robert.marko@sartura.hr>, broonie@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 tudor.ambarus@linaro.org, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, daniel.machon@microchip.com
Cc: luka.perkov@sartura.hr
References: <20260709112006.390742-1-robert.marko@sartura.hr>
 <20260709112006.390742-6-robert.marko@sartura.hr>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260709112006.390742-6-robert.marko@sartura.hr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 7/9/26 14:19, Robert Marko wrote:
> Add the required DT nodes for both QSPI controllers.
> 
> Signed-off-by: Robert Marko<robert.marko@sartura.hr>

Applied to microchip-dt64, thanks!

