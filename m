Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56CA6CA5FA6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 21:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T+pvidewNqLADRTE0xgBKOGCgi+IEjyzenZx7cPnAdk=; b=xQ+BBV6E7/Mg6GAOB/FQVn7fVF
	sSHwJEQGuvVhJaMY0+J05XqJtF86667DuhgoyP1AGQB9Zouc4+0OCuv07jm8glWKq0Ca2FRh6n4x2
	2BVL2r+iVabSNMvw+WIxqqiMwsHmGxdIphM5pQUMFEf9rxyOl3AeIEOS3V+o5EzvcZY4rHuYhIJD/
	htPn/jl7SOlQgq7EVMHpAGaWWJtvfhbR7jFqS9vBNnVsxRkToc6kFRCoT4/Raql3DprpiTTz7aC9S
	iHTnq5HM1Uuu8XE1xdAhkHj4B/+cMxfenklOQ3jELzJYCjkzGQRR6K557nhPDk+nZ0Kr2da6mWHTP
	K7JOpzLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBH68-00000001RYv-40nM;
	Mon, 28 Sep 2026 19:33:12 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBH5z-00000001RUn-1eOd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 19:33:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1790623983; x=1822159983;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=u994Z1jwmZ/TKNi7Rq4rSCq8AqEEFkfuzzqzMPgbbII=;
  b=kvNt16G7lu6wS5FF//bzMgyV0nxwgdZXDAwB9lk6rpmAW1vtB/u6mqsR
   IxzWkrspUSbU/8UWV6MvPovLlt1ZRPI4cSe6hFi6uAJ5BtReQ1/swYUpY
   gkZtVncie1WVYfHQ4Y5iQOJZbDSAq6A8JKERh9Qy5IUf9v02Nr4ESjBv7
   /bQZydu9uKQlBrZpYN7GwYgA7XzxwiHc5i0+6LhwZ6KkR4KVA/fnj/aM7
   Dj+Oa8sXSI/Bd3JKEMSIj1juOANQnZ6+qFcI0Lnye3SR3Zmm0cvAFrVgM
   LZ/o6D+isCbm2+7kPfUthJhWnbyN+RGJs0NNn3MiBOZ1wNe9SKJqXAD+H
   Q==;
X-CSE-ConnectionGUID: zZQhqAAsToeQadjYsZnkRQ==
X-CSE-MsgGUID: b7zjOgIaRuK4F5aIUrMb2Q==
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="231389907"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 12:33:02 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.49; Mon, 28 Sep 2026 12:33:02 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 28 Sep 2026 12:32:58 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Mon, 28 Sep 2026 21:32:49 +0200
Subject: [PATCH net-next v9 01/15] MAINTAINERS: add FDMA library to Sparx5
 SoC entry
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260928-lan966x-pci-fdma-v9-1-a17caf60f89a@microchip.com>
References: <20260928-lan966x-pci-fdma-v9-0-a17caf60f89a@microchip.com>
In-Reply-To: <20260928-lan966x-pci-fdma-v9-0-a17caf60f89a@microchip.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Horatiu Vultur
	<horatiu.vultur@microchip.com>, Steen Hegelund
	<steen.hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>, "Alexei
 Starovoitov" <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
	"Jesper Dangaard Brouer" <hawk@kernel.org>, John Fastabend
	<john.fastabend@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>, Herve
 Codina <herve.codina@bootlin.com>, Arnd Bergmann <arnd@arndb.de>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Mohsin Bashir
	<mohsin.bashr@gmail.com>, "Simon Horman" <horms@kernel.org>
CC: Richard Cochran <richardcochran@gmail.com>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <bpf@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_123303_472506_9997622B 
X-CRM114-Status: GOOD (  11.45  )
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

The FDMA library under drivers/net/ethernet/microchip/fdma/ is shared by
the lan966x, sparx5 and lan969x drivers, but is not covered by an entry
in the MAINTAINERS file. A subsequent patch will add new files to the
FDMA library, so let's make sure it's covered.

Add drivers/net/ethernet/microchip/fdma/ to the Sparx5 SoC entry, since
I am already listed there.

Tested-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
Reviewed-by: Simon Horman <horms@kernel.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6de1ff058db6..740f362e03f8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3214,6 +3214,7 @@ M:	UNGLinuxDriver@microchip.com
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Supported
 F:	arch/arm64/boot/dts/microchip/sparx*
+F:	drivers/net/ethernet/microchip/fdma/
 F:	drivers/net/ethernet/microchip/vcap/
 F:	drivers/pinctrl/pinctrl-microchip-sgpio.c
 N:	sparx5

-- 
2.34.1


