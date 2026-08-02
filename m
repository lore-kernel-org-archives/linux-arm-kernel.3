Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEB9EC55171
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 13:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vkTOnR31yeeOdOJVUVg0K2ZzHo20RD5KRKrlXpN0Gi4=; b=p+NlCMeNtVd7n0b3+PK12OBYX+
	c5VYVdfkwafAo2LILny680ojI3V9PJNr2FB5XnK0ltwHsvYJahREYPOBl0GYvS5Ekv9/+MLq/yrCx
	KyH/wkYXpBX4W2ruIoio1OdA+cbjHo+IOGmFR3B81H1mZwwHHMgqBSpeMXI0oUq9dCWPKVwsIjN3G
	dfnKLZrisU+hqw/kQD1wA/7XHlUSqzNMk/xwXBrmnPEgPpXArYoSNOD/A26rjqS23rZeDLF5XguO1
	o7/YHp+cwXfAPfk3ixLEL20gGpmKS3U+85bInmGASsT7p7DnYIEb4vev5L40aAY1XnfCMZwkFmi+W
	rTTBjTVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqVyi-0000000Fef0-2XGP;
	Sun, 02 Aug 2026 13:11:44 +0000
Received: from chaosmail.tech ([77.81.229.115])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqVyf-0000000FeeH-3G5R
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 13:11:43 +0000
Received: by chaosmail.tech (Postfix) id BFF551C8156;
	Sun, 02 Aug 2026 13:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1785676298;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vkTOnR31yeeOdOJVUVg0K2ZzHo20RD5KRKrlXpN0Gi4=;
	b=b/nw4PncVc3c9HkgKU0eBuDmAJAIGrsssZDqA17JgonoWUAQPIF7JZZDoHqlB6Xjib635S
	ytLA+lr115234uATxcGpo6Bh7Ga80FS+Is8yoEMU4U7CA2BFQg6xDc8J/H6pPR66eAsLxw
	Ju3iiYydf06uNaULPdpLvLY/Gjr+hS8=
Content-Type: text/plain;
	charset=us-ascii
MIME-Version: 1.0
Subject: Re: [PATCH v2 7/7] spmi: apple: interrupt controller functionality
From: Sasha Finkelstein <k@chaosmail.tech>
In-Reply-To: <20260802130738.GI806854@robin.jannau.net>
Date: Sun, 2 Aug 2026 15:11:27 +0200
Cc: Sven Peter <sven@kernel.org>,
 Neal Gompa <neal@gompa.dev>,
 Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org,
 Alba Mendez <me@alba.sh>
Content-Transfer-Encoding: quoted-printable
Message-Id: <31025FFA-DCA6-4F73-8F86-A8FC3CA91262@chaosmail.tech>
References: <20260728-t603x-spmi-v2-0-f43e5f10e583@chaosmail.tech>
 <20260728-t603x-spmi-v2-7-f43e5f10e583@chaosmail.tech>
 <20260802130738.GI806854@robin.jannau.net>
To: Janne Grunau <j@jannau.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_061142_275770_53B1A0C2 
X-CRM114-Status: GOOD (  10.59  )
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

On Aug 2, 2026, at 15:07, Janne Grunau <j@jannau.net> wrote:
[...]
>>=20
>> val =3D readl(spmi->regs + SPMI_IRQ_ACK_BASE + SPMI_IRQ_USER_SIZE);
>> if (val & BIT(SPMI_IRQ_FIFO_RX)) {
>> @@ -239,6 +357,23 @@ static irqreturn_t apple_spmi_irq_handler(int =
irq, void *dev_id)
>> handled =3D true;
>> }
>>=20
>> + for (offset =3D 0; offset < SPMI_IRQ_USER_SIZE; offset +=3D =
sizeof(val)) {
>> + val =3D readq(spmi->regs + SPMI_IRQ_ACK_BASE + offset);
>> + /**
>> +  * because of other masters in the bus, we're going to get a =
multitude of
>> +  * interrupts we're not interested in. irq_resolve_mapping isn't =
very
>> +  * optimized for the nonexistent path, so instead we mask with (a =
locally
>> +  * cached version of) the IRQ mask
>> +  */
>=20
> I don't understand the comment. Interrupt bits in SPMI_IRQ_ACK_BASE..
> are set although the SPMI controller has masked them?

Yes, they just do not cause an interrupt to be raised.



