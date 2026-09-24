Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8211C9831F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 20:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ow2O8of2Y71X7MukV9Nlt7v7jN1qAv8RcOjuQZoIiUY=; b=NB1SFJhMXJnaln+Gk4eJw7ICMP
	9bQgdgb0tQCwL9Ov3w40v5l8CYwf8KkFYRC0CZ0xxTeBK5GCsvGzWcwwl2glRWEJDMjLjg6ThxjPX
	XzIBeLessAK8cUBihA+fRzy+bFHwtUIRqJumYt8TWd7K05SJf1edNQNPwT90OgiUUbGmxv8g+I8s4
	6JghT/OCMqHmxGrSbSX1hyScav/VM3PQtaJJmsfI5XPyVjcPCfB3G3GlZWF+yFZraOK7caBYm2poy
	QlAynfcAgAx98bl58sU3VzM/wywwGYopkcZrMw+OevpxCzbFjXg/OQY4rWbiqTN3TRvgg0aMsTQBi
	fPxrWw/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9pv1-0000000C7s8-3hxu;
	Thu, 24 Sep 2026 20:19:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9puu-0000000C7rM-0pWR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 20:19:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 581B2601DE;
	Thu, 24 Sep 2026 20:19:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 980021F00893;
	Thu, 24 Sep 2026 20:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790281179;
	bh=Ow2O8of2Y71X7MukV9Nlt7v7jN1qAv8RcOjuQZoIiUY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=UoOI7/oAsLn8O+bOUSB1w2r9wR57yEkrOUMZaK8OpZywXxvcqkkQDslm3EUKqoVK2
	 NOAUqFw4j5oWPoNUBPUmiApPO70umTf26mUIRnvKVDl6/RgQAxYMD3xSDXfeF+R+6j
	 dtVhHE+iYS+9XOec9JyWy7IIV8Y9m+cEjsk+Yz7xrVZAduDvLNJH5VaGxUTd43P3JZ
	 1sF1uurG6MCyNOpNOkGbLE+Ja1VrWmDhvFDAUrhD2w2idyQ68B7BP3tu1dkP4tTqQw
	 1cOEAo9Hr/czI88I52jyE/qdPsIsfZqZt0uDdV6pCsIcDGCWzAvJA2AWe6ceR7DWpi
	 vjqDM9HeTk1zQ==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Paul Cercueil <paul@crapouillou.net>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260918212923.148505-1-paul@crapouillou.net>
References: <20260918212923.148505-1-paul@crapouillou.net>
Subject: Re: [PATCH v3] ARM: dts: samsung: exynos4210-*: Fix Bluetooth
 nodes
Message-Id: <179028117510.127367.15417070276593312684.b4-ty@b4>
Date: Thu, 24 Sep 2026 22:19:35 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
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


On Fri, 18 Sep 2026 23:29:23 +0200, Paul Cercueil wrote:
> The BCM4330 Bluetooth chip is capable of doing 4 Mbps over UART. The
> Exynos 4210 however, can only do a maximum of 3 Mbps. Add this
> information to the Bluetooth nodes using the 'max-speed' property.
> 
> This fixes extremely choppy audio when connected to external Bluetooth
> speakers.
> 
> [...]

Applied, thanks!

[1/1] ARM: dts: samsung: exynos4210-*: Fix Bluetooth nodes
      https://git.kernel.org/krzk/linux/c/b47faa6004d86ade16b90d24fa1e1f179e6f7230

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


