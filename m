Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB1CAC982DA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 11:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=isREWlkrvnlxZCPIqgPqJKLa/Uh0ECKdmBKtggNVbac=; b=emqXkNcMZpbJK2WYFyL0SQZq/g
	NRY1RuFf2ySTetPMq0ijfbj8t8x4J2Uerl2OH6qq7oinTDHeq+g6AiKd+FViMlTWpPC104eS69RCS
	5lFZVyvsOVsUDUaEjBfIUU65ZwFWfHoPcZCRA/IK8XniTe+3feIOt01Dz+cE/CWThVrMluwR/cg9K
	jmgy220yxP/nag77NywYr0ZPXkbvGejknHaegypZ/5CLbGAlJYana8BLCbsaIkeX7cHAOLXSAW973
	/q6fZ9d0AON2YmaN9QRVO14lnJOtiswjqH72bjcJlsNFNvytBpuazLP6vtyr09ESu1dgT/TH4D3Yh
	rgQbpJKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7WrM-0000000EEek-0AAZ;
	Fri, 18 Sep 2026 11:34:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7WrL-0000000EEe2-094F
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 18 Sep 2026 11:34:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=isREWlkrvnlxZCPIqgPqJKLa/Uh0ECKdmBKtggNVbac=; b=BFm0fgIVgG4iQElxtNQgCmIcCZ
	F3ZyW6RVfnDPmENucQrZGQLTMfcnd4I/7894r7cC3ZyFTW3JrFsheHr0qV6+DJHFxYZA0pZhWmvRZ
	O+y1rLtzjld2WyFlXi37F3MLdTMePBSDIMmHFUBB9/NbG+nTxOGqjcD9ad6gCuQwoyzU/QSwJsqOk
	VGURa4FANpUbldsizSaZuZscFm3TljxJjv0Xh/qz6JDkrcf1MqO8VggZsDBYfjqt3wCTb3tUQsxeS
	EsbuVFLaIZ9TrTKlB6pIh/YY+PKSf47o+gfySQPmOu4+1NHVec4nXo1WigJD8awOnPTHcr3FOEKh0
	Drz05WWg==;
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x7WrG-0000000A0Cd-3CkB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 11:34:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1789731262; x=1821267262;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=LhixG2fCAUNCT+8en6PrRgF6aAtHhOutp8kzJk8cL28=;
  b=M4+rNG8NfPlmGDgMr6b55p0IKVNv0lFX9sBAUfk3WsjxXywe/v695ubJ
   tei8IT6E/LN8h8JFy+oX1fQMJuqXccDcmehXj01GXY0gmTPpfMK4g7pno
   cUrnIYY2jFWStd06mLs1xrQee63RFUEU3EDijbc4imf7wimIgFrQ/lhH6
   0RO3rkEcI8DG7W2wAamHhdR9bh2bpOH1MtvmsGEXWR+8yoY1CBhU0KlBr
   ajo6qXa8PeccsexzElaZlKHjSLa6SDP41mMXvZZTu+8H9ox9wXefEsQ4I
   bPWGPNTB+G5QjTVTj0VgcxYFMumHAvwdxmazoij1ym30Hud1mgHOqVhm8
   w==;
X-CSE-ConnectionGUID: dg8cqeJqSmOc+EtBdo31DA==
X-CSE-MsgGUID: KN83PZ+MQK2vb0B5phUZeg==
X-IronPort-AV: E=Sophos;i="6.27,108,1787036400"; 
   d="scan'208";a="62877995"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 04:34:16 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.45; Fri, 18 Sep 2026 04:34:15 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Fri, 18 Sep 2026 04:34:12 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Fri, 18 Sep 2026 13:33:53 +0200
Subject: [PATCH net-next v7 01/14] MAINTAINERS: add FDMA library to Sparx5
 SoC entry
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260918-lan966x-pci-fdma-v7-1-0ecc179c8a2c@microchip.com>
References: <20260918-lan966x-pci-fdma-v7-0-0ecc179c8a2c@microchip.com>
In-Reply-To: <20260918-lan966x-pci-fdma-v7-0-0ecc179c8a2c@microchip.com>
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
	<mohsin.bashr@gmail.com>
CC: Richard Cochran <richardcochran@gmail.com>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <bpf@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_123423_618643_E1B290B6 
X-CRM114-Status: GOOD (  11.67  )
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
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b23fb6f2f4ef..e41d4337136d 100644
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


