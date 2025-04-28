Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE69CC369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 14:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rnvsrs/RnUfAdIFURUw+pSZpIvXzBwDBppysxb89Nz8=; b=e4IyYhBSR37aFV/V+s8VYALtxL
	Ipm9w4cToUhD8E4plhPNRYhqWa5/Pqe6yNCT7oHkilAJxdimGV8VglhjK2HvoRNJzRdi2q//NjWd3
	2/+tdR/7J0BGarIqT9ImC0QuUVy2KX90Ppin6Wptq+Ip34fjBEZE8Dx1m4xijkxlbVGAhiBRTOj+h
	gQVWmhkGIe2c9jG88bj9rbdVKhjz5Q6RbrVws7hUiGme0BOPp3RR+OAvbhz7MhfNQHw4yp30ntg9o
	8EPGj15SJxAD4VY9XJVqBIXCP9QKTKV9O19mA8resMGm5QvtihNrr2fOFMMv8lQrGfc/JCz94vKuw
	GD0WBpNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9P9c-00000006aHu-1JSO;
	Mon, 28 Apr 2025 14:08:16 +0000
Received: from mout.web.de ([212.227.17.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9P7c-00000006a3b-2WFp;
	Mon, 28 Apr 2025 14:06:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1745849124; x=1746453924; i=markus.elfring@web.de;
	bh=Rnvsrs/RnUfAdIFURUw+pSZpIvXzBwDBppysxb89Nz8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=t5QLb/BKuzh6YSLCKkNGOz0i5eSxRDo1zMIsSD5cUqqAoqe0CrLI4t7vkNZE/crW
	 ahvDtJE1sYWyxf6KYIgFZjEaLOlxlUXQvsDonQRMSilL+nvQ8dSscYc9MAZO1aODg
	 gC4S21hrByDCCrpPMeJA98dZyRoGy+5HDqXA+tbdgyvfBrKlofQOimhjCoiLNeaMB
	 iNoUjdJ6QNuokkTaoM4P2l6+FfcgNvuHtQ+R0Oc2zSTpXTC3b7f3brp+jxyNHJmyC
	 WrZpFYNCeBH7GaS7VctKYHCTUX9wZdLZvAYxH1eTMwlmMOeVNw/XdBRkx/gbtZKzp
	 jA5BswtUlU9xsohUTw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.68]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MmQcl-1ur1S11M9Z-00pd9Q; Mon, 28
 Apr 2025 16:05:24 +0200
Message-ID: <07f95756-8ba3-4cad-b97a-cf69866e0c2e@web.de>
Date: Mon, 28 Apr 2025 16:05:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Gerald Loacker <gerald.loacker@wolfvision.net>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Mehdi Djait <mehdi.djait@bootlin.com>,
 Michael Riesch <michael.riesch@wolfvision.net>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Alexander Shiyan <eagle.alexander923@gmail.com>,
 Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Kever Yang <kever.yang@rock-chips.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Paul Kocialkowski <paulk@sys-base.io>, Philipp Zabel
 <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Val Packett <val@packett.cool>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Mehdi Djait <mehdi.djait@linux.intel.com>
References: <20250306-v6-8-topic-rk3568-vicap-v5-5-f02152534f3c@wolfvision.net>
Subject: Re: [PATCH v5 05/11] media: rockchip: add a driver for the rockchip
 camera interface
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250306-v6-8-topic-rk3568-vicap-v5-5-f02152534f3c@wolfvision.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:0JXlIylFyGR2e+S5ZPdkWqY5NoftdtiKqkjdk+sF/38iaLsBaia
 mybUMF+Jo2kRjb9rNvSl/JbQD73LNLjA1wTLr29EfAXExtrgkOArJL87AqHFeCQjv0dpm4L
 lfex3Tmn0u7uT452l9FOCnGgm7P5bjYHUb+AZS2d/0MQtrHTpwuBoziQXhziR//zW099QBv
 4dAX/qJsHm7/t9sXnkMrA==
UI-OutboundReport: notjunk:1;M01:P0:ptwO+GMJirc=;jIKzgwI1RijYUHZ29yER4P3Rvg+
 XJe7YkSpk9IPW7pUEQAt9mDGgQmEHlAnf7NYDxheK+LDbReCzeLYfJ++/ZRx66Ryb14vGLbqM
 JyUIkge3fc6UVBBgI1QAvGQBRVt0SwFTF9/t6faEEiqgYnCfvDu9v3ZBDnJnzpXVeEUeKmPj1
 maJtSMhK1uNKdFlYz/HVm9s17918lntm8AabMi7k8uSnXQmkBxZpDfxb86Rm3czyJyQPC/8qx
 IgcLDj3+/LV0ETSmEcX2qS04teepZGIrUuCsUPsH4z+G8TQrKmH7YvOzkAPKDIwlwmtj7Qvxb
 ncHSEFAaiSt63Wk7UI0fQPYYFLHGGCYknvkYaXtbkTpQygQaQKnHb5BicEDvO+P/4Z13VH81/
 kB3aFnlwZqzeP9xzO4CTrGT9TJPNxjHZ5kcm+WOBO2ydDZkboF5/6N8zSFroRW09e23fqOpQP
 SHKKtDOfG65d+VX3ncEqheloJfHLuHBL3T94loCib4YBRmbyRoo749RwJoKwpI/o3WMM54grM
 0acRMLeo59kf1C5H9Hx7IsufhXgSXocKydqtH77iG4Dqtn5gHIoKBkYMsawyIO6aK1fF87OXx
 j8B52rWiN5QUFYNBubabjv3Pdu/fcWSgiUMIvIv89ylR1TFbvzFx0JEjag5x2EYTKOdyG1zo7
 QUzVfvQLtCoQ97Ei38f3xT3R+eAgeQkGkEAX8plo0BGIV0Ne94Jzq5IPPYsqlgdGUjTNU0R73
 Vx3MRd2001xhjcE+2SobG6P5GHy5UUIdH6SAhywfsLGs+7cyIlfAYsPQ+xgWcQ8+u35iJsl2Y
 SK1+7TXzIEEmJdJ74cB5zyeFGzkbr7VyoYAKzXy56Fm1/C717lSIB3oCu9E67xadjaLAKbV3E
 d+XDiV1Mx/n+pZLTxMP793Wy9i2rcIy7BNI7d00+ubkQRW4CyCW/jGF+VSHRK2ViXpK+wDohl
 P8q8MNJixF1+sR4tF8dcyqoL8e0w8VD4liIL4gke5JtE4myM1aozFk9izJ88fhx5IXNqORk6e
 aODGzGcU2krfrq9aS+PRcMXAnGYgt9nLgTFl04vbZFsFIKCMx1wVsf/FUzYH+34FgknJWgtUD
 unakhO3WFE2czQE1O1qB5k8xiKUUxwvF43CbShKJxFO4+M22IF4YzBphALrnjH52gQZ3nezKH
 je0BrMA63lOnUPYjJfKey4gxZNCegmqE+Y6NYlEX9K43WbT+i8awboS7c0UVThsU9/sAzGb1G
 JGYwP1CwM5P+trB1Vz4EpSsUsNkrGbayvtxBBDa6E0yZzwIoMHu1wq9qRE3/+zQlWQrFrf2F/
 jIZ2rj8zfdn/nqxpjKCk27hkRUui2LoUkj01nTgQfi/XnbdVK+JzYb6UBjcj4CtFehfjzZZaK
 70fqqOLKc/SDRpqAIHXVeskWf46FXX8KDFqkuChYPwioTdqnAzGEBrv19m62FB5kaLt/qubyP
 VRMc2YoKF0qsX0yTqbkq8LakWwjYT2BAPKf8EZegZL+Jhkw0QPqg1WnM70UU4ECJu6kDdahCj
 Kh5InYmKABNGX/cHIFjAglNr7PeDTYXMgJL3whfwU6BivKHG9zPB746kAuUp2iaNwJrFmsp8S
 prAEy9p7ttQHNUugI+waml0FDX9niEa5AOIuS0GNgdUGEVeWCf/FfJJT7WchwiXPBI/bqpgal
 cDdsl/SsvwMCTcM5WLeKcoG7BJ7Bi2MxaGjzooBy7LVqPQHefedVOMcYm44qvPUKnXt+8bI/9
 xzxk5m0Q23a3QyvAFTCfZjnV4Fk807T/7UNoT0FBjr4LlvsoM/w1yh3nRs3FKJORFzcGXMR2n
 9yZNEc/jB9OY9KrHz+JxffPM1PPhO+K6+0mBjKrW3m9XMBDgWGqPIxX1dysjExtQPW8V72Id4
 mLKLANGep7VBBXYCnQ9sk5BZiOfNyJkCK5s1V2aMcg3cdiFmHTnQm65ivK2PaUpFz3ji1RjqH
 LkzddI2xmF19ZcnDNjx1hjmMtLjgdxEaTGTZrSiezZ/Xlq3Ulz9bqYn5Tca9Sk3q7zMkUo+Fd
 sfF1nOTqowOqTIE9JECLVoxzNNEYa/6ngh4oEDwRvGM09wt5bktGmCK4TzGXiSYPASM59zimv
 YcSqzbd9e422FQP5YqupH0BaTyl9hY/qZIwYLPc8BAOnkmY4BdY8QuUbfxqpLgaSWClVedEHG
 uKS34uZ+vrvVIBNC9XOBOUQthEH76ACHUKijFvRtaH1sS90UMFj/4O41AiJsSzgHHFwoa0a/U
 kpIa9iFDzj/lwpzOfgEsbkox2OhU+11BU4dyfa5BIcM1B5hxq1tC91di3eOf9P5HhPtqZ5B0f
 WFthPE8RL2DpPrg9AwuqG7u035EDvpraxsCaVQDhHTGC6qIs6rMURyDwQWA2mQF22el6qAlIy
 0DOsuyqZ10wA8W2uI/Jj7WBEhEEhn4s4SYl1VjFoqTivCBNUx+5nIbL3Huyzbljjwle1SJo7e
 Kn/PPVbwY8uTnEsI7TFY290PwU5UEahYM+xNJpsGkp6ZmPgjJ3l72WTU2xWi1EcLFm8jQ9S+c
 DpJEpf7VNxaAGyiwQBfup4CjRuNI5oe1JtcjhpU8e9AD6P3Rc5Q/FTsyMoLTq8ilgtw0PY/iF
 9oBbMqDKm/PzjpDAqOsWs108lhmv3t6llOF772WMik+PuuSbI/PduyzHggKh8cbeZqdCnvbUn
 acP9P7d2yjEO4kPDig8I9CACzhcEtIkD8dlHSZgUz5v7ch5jRRyn87j8rWxdE1UXGKfBekK1m
 Co9Api9PN7lnaAwKu3O0ilLZnJ5kuqIWRqmL4ueTyopWgCQl8h9fZyMeiuL6q2E/bsiNoA64g
 Pf6WPk4DXzUozzffNj3jDbZhw3EcTWP0Dez9GhHbpUj3OieAyB6ye+BDjSvFHhJUm5mrd23Jq
 Lbxs2dJ49N9QRVn07wn52kYe7KD4vj3Wo1UeLagW/PSekXb9J/dlICZd2/kHWANDzXvYSQtwT
 0ZMxvfkx7cB3r6pjVZVpJAW0oO0N2BtV8e5jWHtgS35tp81UWbY8txa2GKWPEiSv/EJZRoovO
 PGsHCCJCmVjAdoJOHm+ZqkZ8lwH+k6TAV5fb6IElqFutomX9nKPVShiGC+dkJfx+Q==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_070612_928432_58544867 
X-CRM114-Status: UNSURE (   6.02  )
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

=E2=80=A6
> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
> @@ -0,0 +1,622 @@
=E2=80=A6
> +static void rkcif_stream_push_buffer(struct rkcif_stream *stream,
> +				     struct rkcif_buffer *buffer)
> +{
> +	unsigned long lock_flags;
> +
> +	spin_lock_irqsave(&stream->driver_queue_lock, lock_flags);
> +	list_add_tail(&buffer->queue, &stream->driver_queue);
> +	spin_unlock_irqrestore(&stream->driver_queue_lock, lock_flags);
> +}
=E2=80=A6

Will development interests grow to apply a statement
like =E2=80=9Cguard(spinlock_irqsave)(&stream->driver_queue_lock);=E2=80=
=9D?
https://elixir.bootlin.com/linux/v6.15-rc3/source/include/linux/spinlock.h=
#L571-L573

Regards,
Markus

