Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4717D606A324
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 16:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=q/g8MWPj;
	dkim=pass (2048-bit key, unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=rdpqnWPZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=TbKaMzBpYRYTjd4ya2VmiEvOHH15Pa5kX8JfwHMy+5M=; b=q/g8MWPj3HwcRx
	dL3OSWxvrx6Du+WD+gsrO1oQbWcYwVYnW5iTkv22f1Z3CT9G6G+4g6lkLqAPc3r199Pl/7+rL91w9
	JMxooQuKfxgpht3yvUD8VCccC74DeA7oVYrBYE+xh2sbtlnpDcPb/ogtEqQfSEvMqPXGb/6UWFE8r
	CuZQ6ugxq4xjlafs6dlgKBko1rUeSSNScT67DS9GGw/96F9FaauGdySJnbont2geatzyOKQ7CsoP7
	xlj6LopskWpUz/7bWWynOdXPEQmFvguwPnRkf92WaXyIUZkVhl/clPLjruYh354nq4ZpmsDRa3Mgg
	ajr0RIPxy7NxtwJ626sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNW7a-0000000EYnH-1gPe;
	Sun, 01 Nov 2026 14:01:18 +0000
Received: from mail-southcentralusazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c10d::3] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNW7X-0000000EYmp-1z1s
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Nov 2026 14:01:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cm1gAQN17S5hys6cYNpQoJbSInDe49pk/C4/Qi7QoIhZkfzU9I07OLMGIGARKd4zhmOSGyCLw6Bt7znU404vB1QCOmWRaMtOglWW3qs2UpTE2nH09dw3athXhAdosF2on8kDpMPrICLUPoWk/He7Nv6AonXA+pMqgrOIz0YBjjIkFmv+Bb27L7dEID7dzj2hCOtoQzhtlTqmbT0NAlGT2HG47mTrKeMMa6PK+AH2GNB0O+22a6b11iGG4fzIhzp+minRdEyyS13VJPjtHfOExeidLk762q6/AbAob7plH9M9Tj2hoO5eCKlCd1EofaTwvHMT+nr4p238beEQcBis9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TbKaMzBpYRYTjd4ya2VmiEvOHH15Pa5kX8JfwHMy+5M=;
 b=cflI9u5bvrCYqHF9PpIiWrs6MiO/nK/XkchZ/pKUKdy5yxgC3HEnJEuBViu8VwTeQxjoln4YM8tpVHXN7Eh2fHu6mdQNej8nIZiKRdzaP+DmPrx9EktGWBNcZPoU3gSO816x6qWQtfnLIvGVJUzw3BIeTBwZzbelx8W5dPZ5ZKNr2a+KCs56fIzLirIhVzbB+Wu7O++Kr0DSCDuPkjga2tlptxv+Ql8TcD2ZTR6h/tLzH0nwRmOToAjbBpWcliAWMj2hWZN9ok191beQu/Owg14mpiPjWltKF5/LkzLLbYXrH33zyQ+8zchFfUBMju+gtoo84Yf+3t+yR0EVF9fQxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 64.62.143.114) smtp.rcpttodomain=axiado.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TbKaMzBpYRYTjd4ya2VmiEvOHH15Pa5kX8JfwHMy+5M=;
 b=rdpqnWPZYOPLUwv0YXn4c2i7KsdOoDaNMGOASsOT/u5EOfs1OKs78CPIziCuEskZVBBigXBdiQEo8i+UBBsGuhDSiT9E/W+pUAsU2O0GEyGxhrseuA491Z6lUUrMZDLsSlXmzFH0pvhmeLBoNkey4NXbINJTtMsLWt7NTJO0m0JSeuXdejHdLkRjHeMmiIUQOOjsO8aAOuWPmnVrfVVKTOwY5l0m/N2vWRRUxpz331lZw/78pPa2Zpj0oyNg1CekPRMwxdUx21R6jpnfdqNrXDjEP40A7uT2VncnLYoIXahib0Fp8a149v++THHr2eUKOo4tCIwJaQ3kRegjqxqbGA==
Received: from MW4P222CA0023.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:114::28)
 by SA6PR18MB6150.namprd18.prod.outlook.com (2603:10b6:806:414::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.11; Sun, 1 Nov
 2026 14:01:07 +0000
Received: from SJ5PEPF0000020A.namprd05.prod.outlook.com
 (2603:10b6:303:114:cafe::4) by MW4P222CA0023.outlook.office365.com
 (2603:10b6:303:114::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.11 via Frontend Transport; Sun, 1
 Nov 2026 14:01:07 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 64.62.143.114) smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 64.62.143.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.62.143.114; helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (64.62.143.114) by
 SJ5PEPF0000020A.mail.protection.outlook.com (10.167.244.43) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.5
 via Frontend Transport; Sun, 1 Nov 2026 14:01:06 +0000
Received: from [127.0.0.1] (unknown [10.4.1.181])
	by smtp.corp.axiado.com (Postfix) with ESMTPS id A15A24186B58;
	Sun,  1 Nov 2026 06:01:06 -0800 (PST)
From: Akhila Kavi <akavi@axiado.com>
Date: Sun, 01 Nov 2026 06:00:57 -0800
Subject: [PATCH net-next 1/2] dt-bindings: net: Add Axiado AX3005 IRoT MCTP
 transport
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261101-mctp-transport-irot-ax3005-v1-1-36ceb822f01e@axiado.com>
References: <20261101-mctp-transport-irot-ax3005-v1-0-36ceb822f01e@axiado.com>
In-Reply-To: <20261101-mctp-transport-irot-ax3005-v1-0-36ceb822f01e@axiado.com>
To: Sammai Chakravarthy <schakravarthy@axiado.com>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tzu-Hao Wei <twei@axiado.com>, 
 Karthikeyan Mitran <kmitran@axiado.com>, 
 Jeremy Kerr <jk@codeconstruct.com.au>, 
 Matt Johnston <matt@codeconstruct.com.au>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, Akhila Kavi <akavi@axiado.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3629; i=akavi@axiado.com;
 h=from:subject:message-id; bh=P0qovBVjx/IH6h3UP1OG3u9hfQiCFlamMEyG5D7j8ww=;
 b=owEB7QES/pANAwAKAaZBpzlrM+NgAcsmYgBq50YhA6Oq4d7UMMUKwN0qICz2v/kqzxettq+wU
 IWSD71pUf2JAbMEAAEKAB0WIQQZuAZ2jpLwmauYGXqmQac5azPjYAUCaudGIQAKCRCmQac5azPj
 YGTcC/0eRZxP/e1ay5ftqdv4dYbNgPeXyjEiVe+EbA0zCb9+46IazOy2kbl7xIVCXNEKLB6fDQF
 qRnbbsmwm9aRzu8O9iugiBoC2IsufButr3a3eHRMnIa18+FJprjo24uC89cjLtRtStp9JO193PE
 FrU/Q1abzuKZTN9nqTfoTukAUEn/OFsMOHbNhvj7tAw4x3reC+/UK8hDsha0F+XkScp4x561rhs
 EwZEzYeCymvfMtLS9gLukRJHBzk8E15ujmEYG5+5U0IkzwauFxdkrxFZzv+mqqUkH4giIT+qaiK
 TFU1okTLS00oaS3iIQ6e4/9SrGpnHzF+KF0lVPnwrg7MjZrDxCsShwOZgUwNm2PItaqvHlTC4w9
 Avtp4fk96/IBb5BkKmqGQMrJEGrhYu4OKh3Ez2uCHVxexo/7Us16ZwK3ODvafb5g82wu65s7GUd
 UMkdTH8p3/4eJ3eiP1Iv2yHIT3JCWUf2UuM3B6MQDwZLTfNQ1x2p53r77pcjfnxhlOMQ8=
X-Developer-Key: i=akavi@axiado.com; a=openpgp;
 fpr=19B806768E92F099AB98197AA641A7396B33E360
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF0000020A:EE_|SA6PR18MB6150:EE_
X-MS-Office365-Filtering-Correlation-Id: 84846bbb-3b77-4b41-e544-08df3820933a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|34020700016|7416014|376014|1800799024|36860700016|82310400026|921020|260925022911599003|260925021311599003|260925021911599003|56012099006|261009223027099003|261028144727099003|261021121427099003|261026121527099003|261026140227099003|261022105027099003|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 6mj4jz1tPqKKGy3/9LxEGkGDYVCr4xjLRuIkPxdEpmzgKW+tEVT3U6bGMFJvWp+qSNYUJJbshkcnMzHWOvKBaOOd9FKy/Z8MYouOdcCY6KMrvPuHYSEozfxG89DxZdIWhpKuOFYb8sCxvQpo7c9KMBybQrZzRyJzcYnFlrj8e+sVoehxuP2/zl49K9e0S/m7W1MVaNWcqvScAd0LN8nO5ttexRTqwh8FIpYOp7Bbg737BjDgdtC56fKW/SSfpwpqNiekIe8qYExmnr+ZxQofNtg9LNj29YTM+EW8Qtt+PFj2zjbVfUTBH7HBlICmtVX2u+c0maEGG5hKjMbS930yi1MJW/eM9uZl5XLOPhCzhAmCsErSQpPJQ5XNS74fd8gMPnV8z97yFxmWWGpSx+duXdcIJB6jef/JK1KLAXHPr2SrheTh4ihBg+fOSzwLwQWlKnslQ02BNmDCNaTj/mSCuBlvFsAz9OVSzBdmt7LugBjxMN+KW65BlJ+MG9ZUsggNebOFncvoLVPErjf11I0AWgCQNjqE0PHkswA9anTLWKWKzlwPnsGm4kUEdg0QCXA1Sq9wp+VWZmakCUTs5/WPULRhePiQeqb/XRcCA0vu6CKkk42Yacv9ZgUzON2ziHfv336z1HWjXWOCG40exRWWWToQXePb0LVIdfLoOB4k24eSUjIAEBW1ubeAzkVc7nxvH5VfZ4JEILB1B/yticYisw==
X-Forefront-Antispam-Report: CIP:64.62.143.114;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(34020700016)(7416014)(376014)(1800799024)(36860700016)(82310400026)(921020)(260925022911599003)(260925021311599003)(260925021911599003)(56012099006)(261009223027099003)(261028144727099003)(261021121427099003)(261026121527099003)(261026140227099003)(261022105027099003)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 4RTJM15kFGI7QbMPHb2vOTChrUeNNIBt0H0eH0vamaTYF0QrUp2JY6kHL/OqJl2bHUV9UaUQJgFRUDaK5NAMMqETlinDUBYSKp51Iz3V8efn14CLyU6DXFQAZrIbd3fTrocNP0PaXnYGi1GPwYR7Snum4PS0G0+UjmCEn6hr28H52xd3Awyo5iPHvv+lJEvpkC0nv9/uiStRykcEMjNETTgijZ8HhgTUXjaTyIL3JMlg0KuzBlAGgCvMULsHTkzbMRzB49RGG8GW/W25z9IX5zCCNCtM6XG/wnFx1CCV4mvMMvZuzpkvFnOJA2uXNNPsDNS+XCyqssiEzF/a+VJovia7zKvQFhGPWrQage/k0KaPoFuUAhB5+P+L9UUCIluJkgZeB7ME4c/9oaLpJRvoo8Fkz3TR5ihndc5vdt3WuAQUSzn7rJrNv8aPNtv/kkMb
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2026 14:01:06.9471
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84846bbb-3b77-4b41-e544-08df3820933a
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[64.62.143.114];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF0000020A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR18MB6150
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_060115_530041_29E863B7 
X-CRM114-Status: GOOD (  14.61  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The Axiado AX3005 SoC has an integrated root-of-trust (IRoT)
co-processor next to the application processor. The two exchange MCTP
packets through a no-map carve-out in DRAM, and use one channel in each
direction of the AX3005 mailbox controller as doorbells.

Add a binding for this link. The node has no registers of its own. It
describes the fixed pairing of a TX and an RX mailbox channel with the
reserved-memory carve-out that the IRoT places its packet windows in.
The IRoT firmware chooses the window addresses inside the carve-out and
reports them at runtime, so they are not described in the devicetree.

Also add a MAINTAINERS entry covering the binding.

Signed-off-by: Akhila Kavi <akavi@axiado.com>
---
 .../bindings/net/axiado,ax3005-mctp-irot.yaml      | 60 ++++++++++++++++++++++
 MAINTAINERS                                        |  8 +++
 2 files changed, 68 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/axiado,ax3005-mctp-irot.yaml b/Documentation/devicetree/bindings/net/axiado,ax3005-mctp-irot.yaml
new file mode 100644
index 000000000000..795949a4444f
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/axiado,ax3005-mctp-irot.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/axiado,ax3005-mctp-irot.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Axiado AX3005 IRoT MCTP Transport
+
+maintainers:
+  - Akhila Kavi <akavi@axiado.com>
+  - Sammai Chakravarthy <schakravarthy@axiado.com>
+  - Prasad Bolisetty <pbolisetty@axiado.com>
+
+description: |
+  MCTP transport between the AX3005 application processor and its
+  root-of-trust (IRoT) co-processor. MCTP packets are carried in two
+  shared-memory windows, one per direction, and a pair of mailbox channels
+  act as doorbells: "tx" (processor to co-processor) and "rx" (co-processor
+  to processor).
+
+  The co-processor allocates both windows from the carve-out referenced by
+  memory-region and reports their addresses at runtime.
+
+properties:
+  compatible:
+    const: axiado,ax3005-mctp-irot
+
+  mboxes:
+    items:
+      - description: TX doorbell channel (Processor to Co-Processor)
+      - description: RX doorbell channel (Co-Processor to Processor)
+
+  mbox-names:
+    items:
+      - const: tx
+      - const: rx
+
+  memory-region:
+    maxItems: 1
+    description:
+      No-map carve-out that the co-processor allocates both MCTP windows
+      from.
+
+required:
+  - compatible
+  - mboxes
+  - mbox-names
+  - memory-region
+
+additionalProperties: false
+
+examples:
+  - |
+    mctp {
+        compatible = "axiado,ax3005-mctp-irot";
+        /* AX3005 mailbox channels 0-7 are TX, 8-15 are RX */
+        mboxes = <&mailbox0 0>, <&mailbox0 8>;
+        mbox-names = "tx", "rx";
+        memory-region = <&irot_mctp_mem>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 360977678f70..b16248974044 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4477,6 +4477,14 @@ S:	Supported
 F:	Documentation/devicetree/bindings/mailbox/axiado,ax3005-mailbox.yaml
 F:	drivers/mailbox/axiado-mailbox.c
 
+AXIADO MCTP IROT DRIVER
+M:	Akhila Kavi <akavi@axiado.com>
+M:	Sammai Chakravarthy <schakravarthy@axiado.com>
+M:	Prasad Bolisetty <pbolisetty@axiado.com>
+L:	netdev@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/net/axiado,ax3005-mctp-irot.yaml
+
 AXI SPI ENGINE
 M:	Michael Hennerich <michael.hennerich@analog.com>
 M:	Nuno Sá <nuno.sa@analog.com>

-- 
2.34.1


