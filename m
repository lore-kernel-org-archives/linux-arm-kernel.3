Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF33C677C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 09:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kAzwGtV8l69hmqgAcWu9s48Egh2Bi+URTgRQvr201ec=; b=bulFK6wBtOBFSSsVk31zHVVOKD
	GH6apyVM/p9bWIBrUNpM8iVPaz/H7OL4cL3mmvn4fYwPxmvF1XKDS7ssQp1HSqxn7O1kX0sreEKmh
	Z1R8js6VPEln2gb3xCNrnwkfojUve1cSaT0zMAJwhHJ3ih24f/9T/yuS1A5WMF3y+M+CxdP/qwWsj
	XGT6QVz0kEwNlX/Rfu1xU1uTZpqvhPatcgFL3V/OWfrUqiYROXQZblYowDWDoOP3NmWxKcxTO7CUM
	EGNqxJwR3vFkvraT9cjKhL+Y0SQuvq+QAZv2ovAYaAJAtMmFgvsZSk/hgR4PHmqhBmupPIz6bFNUp
	68iLw9wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPI2M-00000009WXc-2y7k;
	Wed, 11 Jun 2025 09:46:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPHq7-00000009U9X-2Cat;
	Wed, 11 Jun 2025 09:33:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=kAzwGtV8l69hmqgAcWu9s48Egh2Bi+URTgRQvr201ec=; b=MoD6voO8BFbyCXrtAmHPjoo86n
	rUfbWftUQ68rPZG+iDAG96DMxGLxK8C3qfcNPPckgezJVoPS1yVu6MoQM8CnNk5hSg3bnH/0DImQr
	2dQhLD04CJR6TtLc1TJbu6f6a4C8ZxIcvxIphXsyw6TG0pGdwZE+9maqOT47qj0+S4ByoYZrVwg5j
	EzQ+cvCy2WrRB0RkBTrLH0A3TMiWP2Tld66Pet9tlLDZ2Vv5bUyGN8ZzoT7jbJ7OsILsVCXFZTHCj
	1M/6IrzP0MsXQGiU+EEEJxXFkYWKatob2AmOx5td+2R68A9ILikZiLj92rid6rn4eptP9uyDtzQN5
	vJFm+C5A==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPHq5-00000002EYg-37nK;
	Wed, 11 Jun 2025 09:33:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1749634423;
	bh=lAO7ICT8rPi2jW/yKmCQoIc5yJNSzG6H883GDZTA6Eg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OaYEbMNudDi8ORJRv5JVQtJGvVka/LQLBHfvrTI/7GMZbfUSONdbHLFx5Sud+94ZY
	 K44xXTp7i6goU83CFlmdDpcFtQk6gvCc7vDWoSaLKCdoRZdBA4ulZppatpjbtcdtLG
	 vrlX65aGJo8JUrl337gzmeXj5k0tN3kfes5aefLkRFgKchXgflY+Z0tB6qwh4yRcZx
	 /jq8u0eqAH59fg0Gl8SwVR/NbKscxrT7QXwA9BDI8I4AVdaPNJ5jlk7Cjl5QjR+Y5O
	 OXUlGjDVYSaYIsCwwbWJ6ybsOruAea2A3NXWy/5+9C4I9CxFXkuXRLtY3MFEwQHzV0
	 7WUCcv0/qmdpQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 253A617E3626;
	Wed, 11 Jun 2025 11:33:42 +0200 (CEST)
Message-ID: <12816e74-9708-4e83-939a-347e1f6f6f5c@collabora.com>
Date: Wed, 11 Jun 2025 11:33:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/13] arm64: dts: mediatek: mt7988a-bpi-r4: add gpio
 leds
To: Frank Wunderlich <linux@fw-web.de>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Georgi Djakov <djakov@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
 Jia-Wei Chang <jia-wei.chang@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>, =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?=
 <arinc.unal@arinc9.com>, Landen Chao <Landen.Chao@mediatek.com>,
 DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
 Daniel Golle <daniel@makrotopia.org>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Felix Fietkau <nbd@nbd.name>, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250608211452.72920-1-linux@fw-web.de>
 <20250608211452.72920-11-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250608211452.72920-11-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_103345_882997_959FF091 
X-CRM114-Status: UNSURE (   8.64  )
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

Il 08/06/25 23:14, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Bananapi R4 has a green and a blue led which can be switched by gpio.
> Green led is for running state so default on.
> 
> Green led also shares pin with eeprom writeprotect where led off allows
> writing to eeprom.

This is extremely ugly from a hardware perspective and I'm sad to see such
a thing here.

Though, I don't see any other solution, so I can only give you an advice:
don't ever write to the eeprom from the kernel. Things will eventually go
south otherwise.

I would also advise to add a read-only property to the eeprom node.

Regardless (and sadly),

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


