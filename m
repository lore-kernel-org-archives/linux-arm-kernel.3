Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5763FC98324
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 19:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ey6b9J6JTCAdDyPCmyu7ZPWWXKKJBMlV1jmUHeXwjx8=; b=NSmzZLjFDayeuHZXqlD3A6v6Xg
	3SeTs1SyIcZYw6DOY9VpGd834tLm2qaMzU4bjwMYCm3E24tCPEA3zBffCbK5IiCUlhMsJfLXylQxf
	CjI2fjxnR9YhGD02aLWnJRkmmDvFyxbvuVaqopEtfnb6mesw2J7iOBPZ9x/DDlfP72BGIw+ZuK2VU
	f/uvxcWLibq/uF+M90I+IhNenCzE41URv0vYy8wfLMer8/yRRDfIYViXSTrmhStQHfXHE6pAUFPkV
	lZV6t9XjYC5in8sugccv4zw/29eisOiIuvC/4T4JL9XvgPDwI2vhIjF8Uzij+FAU5tPZdUfJfMVRx
	sDB/tnXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9pan-0000000C5im-399x;
	Thu, 24 Sep 2026 19:58:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9paA-0000000C5Lv-21mz
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Sep 2026 19:58:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ey6b9J6JTCAdDyPCmyu7ZPWWXKKJBMlV1jmUHeXwjx8=; b=AdZdDRwZ6VwATHcivnc/vl1olf
	w9Mmsr+0zy5hea+wC9RyQ5F0Gl2lnVAgQU1PThlKJlNPaPudbqakeNsooKEZlGtj9JvoBFaiy4sjh
	u4xrXn5CE4+TONfjuybOCOvrKisrwUmiTLBhLDjgSHCTcdFT+E+adQs6cyFUjazhnJIkCp5oDw61Q
	6R8e0uz3TD0bA3+HvcleRQtbQxbweoUrW2tSUgrwIL7IYr+qO9XEkJiooZIFkaZ3QxPwsvxtjCl+C
	/z9VeSvfN7+5nk9gN3E/KDUN2BlkGVftTmSMmnW1Fb0v6oHm4qSDkyGB+dQ0RrurzDRlxoVUqPd95
	8Hno7LVA==;
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9pa6-0000000GNqR-48A4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 19:58:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1790279895; x=1821815895;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=c5Izg07tkdc5eWh/EbdJlKt5hNZ4OwsKWgWyQGIZoTY=;
  b=ukzzYa1+xFBGNJ3tQOHfurHWXb9S54F7ay98Gg/TavXmCCGDsmX7e3eZ
   uR4BHw+S2CwDMsA1YIQE+Sqhh8wPl8qzsclKv/R9XO+2kL1wJERt1CdbA
   yP1XMlqirxT2KXBlnAqRLwrBQy6EyEzZEx6RcWYc8kpWyG5E9KpBR5Wzv
   1hCMcPxdNs+R69OBexQs/WC+FqOI8WPMf0MgEVa2yanI1FloyskNqbAnL
   5ZRncvmn4fTQ3Whq69HuBkxcb5+eCm22OX7O9WMPqmUB7Jq9KUk0xeIbO
   UMc5TnSLGWToEDsDww6dsu8x9axLRhGlDYHxi8SEjzuPJoZQFWf0Q3Azj
   w==;
X-CSE-ConnectionGUID: gukwD5jJQt2CF3VfsLI/aw==
X-CSE-MsgGUID: mclnWOHIQvG9DxmhCqkINA==
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="74257273"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Sep 2026 12:58:09 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 24 Sep 2026 12:58:04 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 24 Sep 2026 12:58:00 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Thu, 24 Sep 2026 21:57:02 +0200
Subject: [PATCH net-next v8 14/15] misc: lan966x-pci: dts: extend cpu reg
 to cover PCIE DBI space
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260924-lan966x-pci-fdma-v8-14-201c7b707d8b@microchip.com>
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
X-CRM114-CacheID: sfid-20260924_205811_649792_3424058E 
X-CRM114-Status: GOOD (  11.88  )
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

The ATU outbound windows used by the FDMA engine are programmed through
registers at offset 0x400000+, which falls outside the current cpu reg
mapping. Extend the cpu reg size from 0x100000 (1MB) to 0x800000 (8MB)
to cover the full PCIE DBI and iATU register space.

Tested-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
Reviewed-by: Simon Horman <horms@kernel.org>
---
 drivers/misc/lan966x_pci.dtso | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/lan966x_pci.dtso b/drivers/misc/lan966x_pci.dtso
index 7b196b0a0eb6..7bb726550caf 100644
--- a/drivers/misc/lan966x_pci.dtso
+++ b/drivers/misc/lan966x_pci.dtso
@@ -135,7 +135,7 @@ lan966x_phy1: ethernet-lan966x_phy@2 {
 
 				switch: switch@e0000000 {
 					compatible = "microchip,lan966x-switch";
-					reg = <0xe0000000 0x0100000>,
+					reg = <0xe0000000 0x0800000>,
 					      <0xe2000000 0x0800000>;
 					reg-names = "cpu", "gcb";
 

-- 
2.34.1


