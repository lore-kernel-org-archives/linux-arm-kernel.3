Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4A17C98321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 19:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PFjkuRPCCLL1Zxy6qgJeYNREkJNQnK1h6vqCCoLqzN8=; b=mFKIEwM511OU2iGBgjqhv9pngB
	26L+orKK3W7LTgkmaM7TRTZkpVfxnM3aNSCewjDmGReN/gjiSdJmnmi/MYoN88sQgnY2OR7CrCXCN
	XIa1P1Wxt/Ryhkz4M3a773G8CoD23og6HtMxQFC8uUJd+t5ZzmnVTBNRzxqxH3cWUPukMfIFuOC5X
	jWQZ4qKk5yrSnMYfM36Oalphhu2PzA8og5r9OhkEvFYE6X8RpHemnYwMXnoQV7Xeao1FQtJHN+eK/
	uGZMgpaxMBHk6+HXLdUnXZgv1dBEBIryfiXYk39pNG8L6oT3oKLa4DC9b8gCoACtLIlk37JVNLUjH
	Nm/pcbnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9pZC-0000000C4jY-27hz;
	Thu, 24 Sep 2026 19:57:14 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9pZ5-0000000C4i7-0U3O
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 19:57:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1790279827; x=1821815827;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=Gn2TaEmSIG+/lBYc0ldYI+V/SltKbL/jrsFeLOUFEck=;
  b=DAHz75cQa9WYbiaRjvTvqC1cmbcFdsEzy2KPnqe+6/yg1s9zkFXOXijJ
   t+s8lFbYetzqpem0TLY92cM/Nmkfc9IbJs61Aj8YHVXo792sznIKrm+90
   Y76lv25/0QG5HPH5219yKP+J9gLCj0HxlgFES5VSxgoRn5Acbt0kH9sqc
   phTXNt5r0UJrBy3prGd+cQASrqZ4uRY6Imp6ElfdZUYO0EWBMtNxnWcq+
   nTsrZqvaf0ITD9HbH7/BljcaK61KR6fxjA/i1v+y6uoEH6ewlhbTyqalG
   zJp17UnCRN7workKCBn26SA1akhvtTFNpubYUAEGHtAqcWmOzw38d6D2f
   g==;
X-CSE-ConnectionGUID: dt19c12VQ8e4I6MEbc3qBA==
X-CSE-MsgGUID: GAV2M1Q1SI6YQ7IauS2mwg==
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="64420627"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Sep 2026 12:57:06 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 24 Sep 2026 12:57:05 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 24 Sep 2026 12:57:01 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Thu, 24 Sep 2026 21:56:49 +0200
Subject: [PATCH net-next v8 01/15] MAINTAINERS: add FDMA library to Sparx5
 SoC entry
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260924-lan966x-pci-fdma-v8-1-201c7b707d8b@microchip.com>
References: <20260924-lan966x-pci-fdma-v8-0-201c7b707d8b@microchip.com>
In-Reply-To: <20260924-lan966x-pci-fdma-v8-0-201c7b707d8b@microchip.com>
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
X-CRM114-CacheID: sfid-20260924_125707_216821_0C39E11B 
X-CRM114-Status: GOOD (  11.85  )
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
index e3ce77c839b0..e5da9d0378b6 100644
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


