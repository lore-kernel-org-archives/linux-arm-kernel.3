Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DE6EC44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 23:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	Subject:Cc:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vAQQkuJzNDp7AZFSNkUqObH7vlGdvenYmYpHtVyBH8s=; b=DLe6aByGf3IWa3ax5SgXBugnbF
	3KLv0//O2vnw7kyMgz/fGsoDRhbZOw2Xto91Zs3M+8zCRX7UsiP0iyEsJyYALgWqycPPoGttrY+xC
	hspt+6FU/dYFLPXSTd4kG4zRvgfJs48PWjSRYVyIoUn8kbuZkvn76fSefGB06VYe2icAfZPYgHwjN
	SdM35QBReT9j0A+2ZRpzCK5VJ4hCIJ9G9ccdZT8OkwhwVAfmZsIQ2IK6CqvdRZay8FqsxPt20DutG
	6VlRt1J/aTRe4a6ji+DV8dHk8oq7p+JmTbBLb4s65eaKWlTzOywIHrqxcQavLcjHsg9ok6G6py2pL
	5gMR51uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1why0B-00000003qFo-2Rqt;
	Thu, 09 Jul 2026 23:17:55 +0000
Received: from mail.maslowski.xyz ([2001:19f0:5:5b98:5400:3ff:fe59:951d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1why08-00000003qFL-1tNs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 23:17:54 +0000
Received: from localhost (public-gprs387849.centertel.pl [37.47.146.74])
	by mail.maslowski.xyz (Postfix) with ESMTPSA id EB0CE7D5AC;
	Thu,  9 Jul 2026 23:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=maslowski.xyz;
	s=mail; t=1783639063;
	bh=6p4mTHct6xG4EjksULhZhC0FBM6s3IkWFA5OdscgQ9g=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
	b=FzT9y8Xb8ZNgiWivEhcuM9ax/2mZEvdYBOIH9b3rFWRnv+oUTd3enuolQPLD7SKOq
	 hRTkLGZtoXjWkqAB8SwxF51ELLrVeAJWbycZ2TxTnHyGBf3I4J26pqjITfSQwXXblc
	 7OyjEgrjZ0dTD2rOMo1ncmD1z3KiP/Q8yDuUv2o8/bVhRFjtcZYb0/Yu4EadKso4Tj
	 BlBZH9/wr1tt6PGKIkNac2nB7j9vzkaiEYtSJttq1Vlpf4S4+SMPZ+9Ps/mqHJfEO+
	 MAsSfXywvllxKToDmvCYNk4kr3PzsrUnGhoK0Rqo1rJssb78m7yhYLw/irtxpvdesY
	 IHgcA1OmICZrQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 10 Jul 2026 01:17:39 +0200
Message-Id: <DJUFA03SIN5C.1A8B6N89448P0@maslowski.xyz>
To: "Janne Grunau" <j@jannau.net>
Cc: "Sven Peter" <sven@kernel.org>, "Neal Gompa" <neal@gompa.dev>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Thomas Gleixner" <tglx@kernel.org>,
 "Wim Van Sebroeck" <wim@linux-watchdog.org>, "Guenter Roeck"
 <linux@roeck-us.net>, "Linus Walleij" <linusw@kernel.org>, "Mark Kettenis"
 <kettenis@openbsd.org>, "Andi Shyti" <andi.shyti@kernel.org>,
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, "Sasha
 Finkelstein" <k@chaosmail.tech>, <asahi@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
 <linux-pwm@vger.kernel.org>
Subject: Re: [PATCH 08/11] dt-bindings: i2c: apple,i2c: Add t6030 and t6031
 compatibles
From: =?utf-8?q?Piotr_Mas=C5=82owski?= <piotr@maslowski.xyz>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260709-apple-t603x-initial-devices-v1-0-55b305833123@jannau.net> <20260709-apple-t603x-initial-devices-v1-8-55b305833123@jannau.net>
In-Reply-To: <20260709-apple-t603x-initial-devices-v1-8-55b305833123@jannau.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_161752_664013_655EC5D0 
X-CRM114-Status: GOOD (  11.40  )
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

Hello. This is the tiniest possible nitpick, but it could
throw somebody off when grepping through commit messages so:

On Thu Jul 9, 2026 at 9:30 AM CEST, Janne Grunau wrote:
> The i2c block on Apple silicon M3 Pro, Max and Ultra SoCs are compatible
> with the t8103 (M1) one. Add "apple,t6030-i2c" for M3 Pro and
> "apple,t6031-i2c" for M3 Max and Ultra as per-S0C compatibles.

You've got a '0' (zero) instead of an 'O' here.  ^

>
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
>  Documentation/devicetree/bindings/i2c/apple,i2c.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/i2c/apple,i2c.yaml b/Docum=
entation/devicetree/bindings/i2c/apple,i2c.yaml
> index 9e59200ad37b..d39f5e3f1df4 100644
> --- a/Documentation/devicetree/bindings/i2c/apple,i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/apple,i2c.yaml
> @@ -24,6 +24,8 @@ properties:
>        - items:
>            - enum:
>                - apple,t6020-i2c
> +              - apple,t6030-i2c
> +              - apple,t6031-i2c
>                - apple,t8122-i2c
>            - const: apple,t8103-i2c
>        - items:

Cheers,
Piotr Mas=C5=82owski

