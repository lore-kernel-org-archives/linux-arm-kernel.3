Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BB3DE9D3E3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 14:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QMsU8DONWeBqLOpBxRE7w+Qp0qLlJYNALImr2yb3DjE=; b=M9gMNPIan/mSIT7mb3gnq6EPfO
	aNwwdHYiOpPHNzIgFrb4BQZlkozfX4n5FaBR6/25W6eMFALV8QfqfExcDqSFjNHJn3Txt15rhBn6V
	buE9J1N7MKpyYsDXDNi4LIpeZRb34IBM5J74JySGe0Rxd/v+DhQiLWMhiPqEftQI41VteZ1LIN5Bq
	JkH62Qp/BBG5e+whbvcOp/rVUEW/PZft9x3sQ3msdURBWzUsaNapKOhF6g2Cj9Bk2O9i0OLdTchLu
	s3ctJ1c8TDdNmMlep00uwjv54B0pzmI7MOgiuhoc7yK6tZrm6SSpEbr5dr+N6ydgYfgsoXndm4HzU
	iEE3rEtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vndgZ-00000008ZwU-0sTh;
	Wed, 04 Feb 2026 14:16:51 +0000
Received: from mout.web.de ([212.227.15.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vndgV-00000008Zvp-41x6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 14:16:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1770214602; x=1770819402; i=markus.elfring@web.de;
	bh=QMsU8DONWeBqLOpBxRE7w+Qp0qLlJYNALImr2yb3DjE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Rx76PHdypJVuo7mGJaFBaIPOSP1itwGBjdgio0iTXoQs9/AqwWYEXBdeY8pXpXqN
	 C/y/+aK7Jn71E81hbbEXGboMU5KGlyCrOI5pRbfb5BZrtC6sNMc4JMJqIsx7KGTFj
	 QfpFSTAY+mKBgF59qDW31hksEw4MxYhDyoG0UupwmylXlrpQqVUe2qHuu3edgVXtI
	 OwNBwkJvJzjtDZ4YweUCtrZqKMbQpHMUo/NnaDKihxpIsp+VN1kUW083VML3bIdoY
	 XWwKUwEFqg89UseIfbBWa383hguNbLZPoBlqlRj4S/v1K0yBvgX3olfDt7xBRyKIF
	 X+7oAeBmmxeAdV5Lug==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.224]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mdf89-1vEIvo3rmb-00qNbQ; Wed, 04
 Feb 2026 15:16:42 +0100
Message-ID: <dc34ccf3-31d0-405f-a909-b0409624aedc@web.de>
Date: Wed, 4 Feb 2026 15:16:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Alexi Birlinger <alexi.birlinger@nxp.com>,
 Antoine Bouyer <antoine.bouyer@nxp.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@pengutronix.de, Conor Dooley <conor+dt@kernel.org>,
 Daniel Baluta <daniel.baluta@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 Frank Li <Frank.Li@nxp.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Julien Vuillaumier <julien.vuillaumier@nxp.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20260123080938.3367348-10-antoine.bouyer@nxp.com>
Subject: Re: [RFC 9/11] media: platform: Add NXP Neoisp Image Signal Processor
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260123080938.3367348-10-antoine.bouyer@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:8VfDpKU9y7KeyfIA8iN//Fqpm4veFy0TXecloHhEyzNR65xcEFT
 OjXEJAFXBoSpYWor/zHR84q1ebS/4UAAaXmRplZWdsZmg+bekvQSNEiV8k/wbxl9E96fqCX
 AK2zc2gtWFth0yCDvNoSoP7fJwoDG+J2txQWS8euKzC8657/ExPTaYtriE27XW+iI68hRM6
 GJMnGj3Xa24vCxwBEKmxg==
UI-OutboundReport: notjunk:1;M01:P0:qzkxLT3jCPY=;vskJnAQHCzVI0igwffcu4EbT5yM 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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_061648_352571_453C8572 
X-CRM114-Status: UNSURE (   6.43  )
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
> This driver was originaly inpired from =E2=80=A6

                  originally inspired?


=E2=80=A6
> +++ b/drivers/media/platform/nxp/neoisp/neoisp_main.c
> @@ -0,0 +1,1985 @@
=E2=80=A6
> +static void neoisp_node_buf_queue(struct vb2_buffer *vb)
> +{
=E2=80=A6
+
+	dev_dbg(&neoispd->pdev->dev, "%s: for node %s\n", __func__, NODE_NAME(no=
de));
> +	spin_lock_irqsave(&node->ready_lock, flags);
> +	list_add_tail(&buffer->ready_list, &node->ready_queue);
> +	spin_unlock_irqrestore(&node->ready_lock, flags);

Would it become feasible to apply scoped_guard() calls?
https://elixir.bootlin.com/linux/v6.19-rc5/source/include/linux/spinlock.h=
#L585

Regards,
Markus

