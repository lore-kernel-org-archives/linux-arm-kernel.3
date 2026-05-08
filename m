Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B90DCD342F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 08:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hrfOFVYtqSA4RPeMk5t0kgZgaYsp66JgGoi+frkDnGY=; b=jJl4nJWOcA/q2qnvX4U4HcZOss
	HYYKunWjgw543VElQQQVteZo8vnglE7Ue4RwVIPWdFeWqGqsGRyfUCRocrLf72GQoz54wJrJYDlM+
	vJLVqu0KfXrCzS+pamlro+8kp9QJL/B63vyXLGTXrcAeFyu4FNGuwAztUVkOwT5Eig9wWjjm/NTvf
	LsallGPjW6GUUa/e+8OPbndPDkZe//eYp6lO9jlCqVyDXE4Ph47AdAi789xBqa5+hIvwwE6xu1Fnz
	ZhqQQQXdEkXXPen2OWV1t5IexJcqyltiSsp4KhDITwOq/fb3CD12mHfnmjL8WD/X4v2dZ+nQyVFJ4
	xlhYV+pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLFlP-00000005rPG-2Ytn;
	Fri, 08 May 2026 07:36:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLFlG-00000005rJA-0wlI
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 08 May 2026 07:36:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=hrfOFVYtqSA4RPeMk5t0kgZgaYsp66JgGoi+frkDnGY=; b=RwsYFJZpmWOJO08bhRsoCUTCwY
	agd5yDAUzX29hAFiNZx0OLRCO67ZKPBDBUjyPcr19N7rj/n9zuDh5Sbp+y3uCG5OdrJGjM/HIOgnS
	7DFoD1g62p7l4FOL730Uh3OJO+lD5m+6Sc9bMTu3R2NbHxmn29dzTvZQ/iJyEsXQZkaWzYkHsAby/
	sZQkaynK3v3vIuwS13EU5ehoHzJ+5IC+Jyor+xubj5ugaJoUMTiuD5vKhtvgJAR9vuSxrJ2OW32X/
	nMrOSD6HkaZT3wLeFC/m98L8NujOzBXfeXZ77so1Uu4ioF2mT5HxeyVRzFZUQrbJOUrNH29taxZWV
	2UPQ9cFQ==;
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLFl7-00000005bE9-20qL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 07:36:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1778225789; x=1809761789;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=pLLUnpsQHk0XLLoB+wBplrU8A7WIjOzUca/wCfOw6mw=;
  b=MxHSzq/Cy/7MVBrFAlfkLxq8uHmgR32gBJCzIBuFq2s/R9FBBPte3zHH
   y9a9COyWCGNyJnsBRW4vGZnT0kywD3V0zuSugTDg3fYunkv3e2FeQZO1K
   TFwBLDGHv5SJvkXuDvniLcxa61GyNMrTAY3a8ftqHOijrRJ2USp4hDw/w
   uO2Gz9RQRqA8rcWqX8yYem/yTmuCEsiAAhFqPtqcq/m0E3ahpTjmOtsAu
   rgTzhxGn0Rwi1N5092Bx6YHCE6nSXe0zZxpVGdikNzL97Bh+jtCJvdDG8
   diqbXXKk5EiAJ9cXT85ay5p6jSUw5JNq/N6cBLT2DwnwPLeawtomOCDAg
   A==;
X-CSE-ConnectionGUID: tREAqjtrRMmv2W0hgA17uQ==
X-CSE-MsgGUID: hdL4aii1Sl6Jp/iE7AGrxA==
X-IronPort-AV: E=Sophos;i="6.23,223,1770620400"; 
   d="scan'208";a="224455790"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 08 May 2026 00:36:28 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 8 May 2026 00:36:27 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Fri, 8 May 2026 00:36:24 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Fri, 8 May 2026 09:35:36 +0200
Subject: [PATCH net-next v4 12/13] misc: lan966x-pci: dts: extend cpu reg
 to cover PCIE DBI space
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260508-lan966x-pci-fdma-v4-12-14e0c89d8d63@microchip.com>
References: <20260508-lan966x-pci-fdma-v4-0-14e0c89d8d63@microchip.com>
In-Reply-To: <20260508-lan966x-pci-fdma-v4-0-14e0c89d8d63@microchip.com>
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
CC: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<bpf@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_083632_685583_F6E89472 
X-CRM114-Status: GOOD (  11.24  )
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


