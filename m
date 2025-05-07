Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4877C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 03:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WxnIZWGjyW8z4p9AhSnJJsn8ZjAdBNM5VL2W6LDw1c0=; b=UZ1K3+8FUiApspNle45iZupAGg
	YL6wH2NsohU1Qb7XFQ06zrgiPmLuIcahpI5xWwIZSOJbHAus1yygVPQfHf/aWDRlOJCCTFU3ZBZqz
	aGNmFgJK+/iDKpF1+Rj5GSUmlrXRNZ23queNQBYh1Lcq04kOk/S2W2rLyQVn2jaYVpmtnwjEHZm4Z
	8rE0jPT9c4Hdfin4eLAl69Nc+4mK6gFPGuSu+BWcdUO0WJC6/qRik3Mv9twkywSrVrnPOnxKO9007
	UuzA7+MQAIkdNpTTvVY0rb+5miN4Ok1vLAZlEaRZQ36Qin4Km/IEEZ7kKnBlbwPM24LQNoWdTXCTb
	Zp/KdS0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCVOW-0000000E4Hj-1toG;
	Wed, 07 May 2025 03:24:28 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCVMT-0000000E46B-2pnE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 03:22:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1746588132;
	bh=WxnIZWGjyW8z4p9AhSnJJsn8ZjAdBNM5VL2W6LDw1c0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=bCR+8fc3LtDcSawxO4X6KapprEaFUHlDopKZmFaplYY0hg9qY2ZHxxAV725dw6TZI
	 vMDQ4I5qCYW6aZB4ClA6mBPGWTAzsDb1q1Thuz7JM2NEN/d3IuDPcTQLqgOX/JwN49
	 KHoX9w693tqIC2Wx8pBJhr+8PskzFyOU7AHb//tDxrGce2vfyWslb8hUjjTgbuA7VR
	 Q5OEngX/ctCaryV+qVyYxXLfGBO3HzAYro10sfoquGFdPUUuZPvdQI5ai05jbgyxJM
	 fT8bxI8lm3R4gU+9Se9xj6dc4oLjeMt/vfVhuQ2ToHwniIaYo/sUJ108EIsmeyRJEA
	 xje1L/94ngvGg==
Received: from [192.168.68.112] (unknown [180.150.112.225])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 324D864473;
	Wed,  7 May 2025 11:22:10 +0800 (AWST)
Message-ID: <5acf9c0afc764931f3e9e70c4085beeb95b9652d.camel@codeconstruct.com.au>
Subject: Re: [PATCH] dt-bindings: interrupt-controller: Convert
 aspeed,ast2400-i2c-ic to DT schema
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: "Rob Herring (Arm)" <robh@kernel.org>, Thomas Gleixner
 <tglx@linutronix.de>,  Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Ryan Chen
 <ryan_chen@aspeedtech.com>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org
Date: Wed, 07 May 2025 12:52:09 +0930
In-Reply-To: <20250505144605.1287121-1-robh@kernel.org>
References: <20250505144605.1287121-1-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_202221_915918_B60AA67F 
X-CRM114-Status: UNSURE (   5.93  )
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

On Mon, 2025-05-05 at 09:46 -0500, Rob Herring (Arm) wrote:
> Convert the Aspeed I2C interrupt controller binding to schema format.
>=20
> Drop the "#address-cells" and "#size-cells" as they are unused and
> incorrect anyways.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>

