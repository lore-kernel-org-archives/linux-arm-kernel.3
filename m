Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CC06CA5FFE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 17:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Date:Subject:Cc:To:From:Message-ID:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xsQ6WpVz6dLVvH0jIBhmi25p6i3B1TGiyxsQ84fsA2k=; b=2eXWnQt6KoczAARWERXYLoE5mm
	a8iXnaiC0pujzw7qiR/eX7Kx8O1gaOUqHFn8qXEQulqPFPvhQXs9BETTo+Do/SQLnK/kFnFZn4YR2
	Wi0u9fFGHMNAYpyux79vTuN2UrFI+/j+HDx/4Z5GnEsmHNszcFzUz0uSaNt1rfor9NTrgkQ2oQkm4
	ZZVhZwDA5FfowIhxQ5zbbxaIQufKW+AZEwYA+4evPs8QWUEqjXW4sO+JV1QR8PDKv4FqWRowTk7sg
	Q1tWYQqXgCJJpD4Dfim6JtKoao/lfzXhpVcOPCKKO7iHdWndHhAUEcvjRB3Rwufyf58neUoBFVeW0
	vM5G9zIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDmWa-0000000Gv7R-1CPa;
	Mon, 05 Oct 2026 17:30:52 +0000
Received: from out203-205-221-155.mail.qq.com ([203.205.221.155])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDmWV-0000000Gv5f-2ALN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 17:30:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1791221444; bh=xsQ6WpVz6dLVvH0jIBhmi25p6i3B1TGiyxsQ84fsA2k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CnYcGjszzX4vLRX+c/tVUCcO8hGJMp1q3PVyJoN/6xjb7xwekfJD9bwP5tCOTH3vE
	 6Yw+uEBODCQKULOXuUcv8G2UJKRUqeoXlC5fy6EMEFe7XBVN18VjtPkPl79IEbg//B
	 2pKdVO0heDyI5kpKDuqIh7mKZzkA/ylJbOWzKsHs=
Received: from AERO17.taila7786d.ts.net ([2409:8a7c:21c:8010:c675:1308:618e:14ff])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id 7A82281B; Tue, 06 Oct 2026 01:30:40 +0800
X-QQ-mid: xmsmtpt1791221442t6kaszaez
Message-ID: <tencent_C77DAF0026980C137B8C46907F855FC9E506@qq.com>
X-QQ-XMAILINFO: M2SvzgchpLqf+ciKQjAvwfVmEe4sr15OLSKB4SNAmTOQmrBm32CGsyNdYdTAaG
	 I8j/Cid2dyzy1w5em+7qNt5yIbjAxZ2KXvvAfu3Vb36iuzTRscsKxRCED8KQlwpsqRW1xBS6Aal0
	 mqa0OL1koXEqMm2ec8V26dy3crIuSE9w050iTVBZnhsH/zckZTXUp2nj59xqR58os5P+9KlzXZfv
	 SyOHPQ9S2bLxEfKKot1KmrelxxGNd8wgavvGDyLoaCLBcsaAMEipw7zfMRcSjdSoBMXwiNQaV+jZ
	 rtF9KIvaviVkH0qYMkMRcozEpiVVAzcgMt+0o+xeqR+wZiP1O0AdDvWyIY6+7L4/yjdAKlDs8bro
	 uPIBuyx5mEjCUwtyROvC8bJwgCbsJNfgadFINjkd3yx7amXqhYnh3em5ze+jGlurDJ6xec4hIIIb
	 b1Vgu8eTb55FvomtDeeEJr9XMFZleh3zyoyDw4uhV+4wFad+iZ0w56pzgLCzueOUBZWPNd0vFek9
	 pg4wvIIj5SdIUpXCOFhqXDNNm40m076RTEXJQJmg+FfOvL1bZQB+Oly+QrNa1NoBW6FyfvuDp5RP
	 U7MzTKzxyxn+q7ACzB5NwIppxsrB8xPqEGiFa8Suhty0dZE8AswJTFzrb6o+U2IPhXm7g79nkmV4
	 2wdPU0kclAQDpIAY9mfe5d8UBF8iJGpVLN3tQV6EGtVIrmjz37tP4m8HsK+nop2Palky4Rn3qohO
	 TooJgjZX/6xKqcVO+PEhye68xsZ1t+0/N/r/LGdsc4xE9TELcMszYwGFNpcpk6YZdxs8riZy8O+D
	 NcxXdcqCGXEl4IXvZDz8KCcr0QDNxEU+MyOWU0KLv/JpjVNrS8+cRvIdXvM2IOCna4EUYHppowpM
	 /lp7O4BeGj6v+UllWYbHCKgOxUQsXubsI/On5Gv+EoQE3sFJRcR5eKj4YZ3ng2R5h6Ogztfjitm/
	 FI3VL51J+dlUgUCtaO2lyg28bIpnKDqDGwkXBi+pGflec7mWoa0GbifAZIGHrv/pq7zl/eE5AHqz
	 smzbeoNG+yasZyhsaEcg5nEf5v9u2W93mC0C1WBhQ5eNR/UQ0dXXwcpRGkWLWymCikkDlGOlSWyb
	 XK065aFcyMJdB4Sg4=
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
From: Pufan Jin <2254650260@qq.com>
To: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	andrew@lunn.ch
Subject: [PATCH v2 1/3] dt-bindings: vendor-prefixes: Add ALINX vendor prefix
Date: Tue,  6 Oct 2026 01:30:37 +0800
X-OQ-MSGID: <20261005173039.707304-2-2254650260@qq.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261005173039.707304-1-2254650260@qq.com>
References: <20261005173039.707304-1-2254650260@qq.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_103047_913402_4389A242 
X-CRM114-Status: UNSURE (   8.67  )
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

Add vendor prefix for ALINX (Shanghai Xin'yi Electronics Technology
Co., Ltd.).

Signed-off-by: Pufan Jin <2254650260@qq.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba2002969..97e7ef340 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -90,6 +90,8 @@ patternProperties:
     description: AlgolTek, Inc.
   "^alientek,.*":
     description: Guangzhou Xingyi Intelligent Technology Co., Ltd.
+  "^alinx,.*":
+    description: Shanghai Xin'yi Electronics Technology Co., Ltd. (ALINX)
   "^allegro,.*":
     description: Allegro DVT
   "^allegromicro,.*":
-- 
2.55.0


