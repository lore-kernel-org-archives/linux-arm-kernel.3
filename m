Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE53AFF8867
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 08:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PBSLS81Hg9wDkJCyNVNhBa0+o0mO+VoVZYB9LUUukSc=; b=D23LnPV9Pd4YKkBwVmlT/qDQJ0
	jF89AYN65c0OhfIoG4r96rd+qwJrz/vdwkOj7vVpZy9c0tfkjnQvMxCrlpF/NJ9DAVMxAXzns3dH1
	2a9Qn0SqOrAmazfglb0qPZTfuVGQN6oJgTkOM+72NQk7BZDVvgWJ0TrYh35z/DDmGN/VuTV9j1+Ek
	L5rDSn6JPq2jdizZCCpnm5YGBXqdt8gxvzS+IxgeUvDEPd5GBL8Z/8zIBmd+ZisxKhL5yBne6ilMe
	ro7i9riYBbUHVmENzrMrcGmjz5vmNzNMxOiuua44WhunoihLtWQBfhcb8e1QgBMnboSTFbcw3EZXr
	63mIdmsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHzzO-00000003E3R-1xPP;
	Wed, 29 Apr 2026 08:09:46 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHzzM-00000003E33-3Hyz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 08:09:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=PBSLS81Hg9wDkJCyNVNhBa0+o0mO+VoVZYB9LUUukSc=;
	t=1777450184; x=1778659784; b=hk5nTabiKMZg2WR+pMo1A9c8HbnyL+4oxPLkGQVdzNQHGst
	2800cHfj+UIRFTT5JHzFxKFqCjFKaje4LiAiryKf5+HXzU7EYnzE+D45gxZrzafFmve/XbQf/TNeD
	K+eIlfNPgLoS4S/Z4vvpE/ij8/c57Zmn8UHldi1F33bXMh52w9/qqmdelgHPF0lrH++60LdF8wxXa
	vIPasrbqvZfD/0IUPC23KECM8Vwx9eyiSKHU/+FaW/bieVYn64N4QGrnabuBOiSDDGGa69LkcZgFW
	JzUNiKdNwUu7PbSk30LYvn+cYHSJH9K8YPdg28WQdbEi+P2I2SO+DHQCYpOicasw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1wHzz8-00000002BBN-0V2e;
	Wed, 29 Apr 2026 10:09:30 +0200
Message-ID: <373571e47fd174777531005a99ef43aa37a0b504.camel@sipsolutions.net>
Subject: Re: [PATCH v3 3/3] p54spi: convert to devicetree
From: Johannes Berg <johannes@sipsolutions.net>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Bartosz Golaszewski
 <brgl@kernel.org>, =?ISO-8859-1?Q?Beno=EEt?= Cousson	
 <bcousson@baylibre.com>, "David S. Miller" <davem@davemloft.net>, Dmitry
 Torokhov <dmitry.torokhov@gmail.com>, Eric Dumazet <edumazet@google.com>,
 Felipe Balbi	 <balbi@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Kevin
 Hilman	 <khilman@baylibre.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Linus Walleij	 <linusw@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob
 Herring	 <robh+dt@kernel.org>, Roger Quadros <rogerq@kernel.org>, Tony
 Lindgren	 <tony@atomide.com>, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, 	devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org, 	linux-omap@vger.kernel.org, Christian
 Lamparter <chunkeey@gmail.com>
Date: Wed, 29 Apr 2026 10:09:28 +0200
In-Reply-To: <20260427142355.2532714-4-arnd@kernel.org>
References: <20260427142355.2532714-1-arnd@kernel.org>
	 <20260427142355.2532714-4-arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_010944_823173_10E69745 
X-CRM114-Status: UNSURE (   7.58  )
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

Since you got comments anyway...


>  	}
> =20
> -	irq_set_irq_type(gpio_to_irq(p54spi_gpio_irq), IRQ_TYPE_EDGE_RISING);
> =20
>  	INIT_WORK(&priv->work, p54spi_work);

This leaves two adjacent blank lines.

johannes

