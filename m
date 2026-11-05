Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E5E606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 12:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lGLtvfJ2;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=ZYeY8RKH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=POGRuviH5TlEzEUjx6xxRrSvo62+D+y2VRA4aXnjt5Q=; b=lGLtvfJ2Yb8/se
	o7SzcfaSY5gY9UvcAIUV8lTQTTu7cWAxKpDuUzVG8Q+LfBSJYKKjGbKhkPmIdcRf3SOpioLnKsJzO
	KYTEa1GufCLJZaaY3Kw0r60+VClqQAh6BSx6e7Iv9E7v6E8a/AhFe08DA2IZL1jjLhuWFp22MO3YY
	3ELLM0Bxnw+DdzEtOioAOfhUXBu47vIuynGH3YJKyF/mEr/DVV27oE/mk6n33E1Yxi6gsD1dsXsmJ
	hwUIX7rXDhg3zYRGM1jgNQT55ikYt3uPmrXAtc/iHxaGXDHmRizTwuAwMRII3JyhMoDjA/hI6T+L7
	2QrKg/U29yuMe0ihaHJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwBi-00000008oU4-1Yjj;
	Thu, 05 Nov 2026 12:03:26 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwBU-00000008oNV-0KNb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 12:03:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YmeY5vq5WtGXIDUlJ8CnskTsKUbvJJ0eOeoSt7WI+kLXTHc9wnWlGgTN2MVz4CiKG3cXpSS+Rq9vdVoaG7sbPVAcsj/VPoMmlVURLwUS3ZjkFFYLAGJSZnC/50PFgcUUOgtg5QtFy7MmY3F0ttk45JNbQ8iCpvJntb6eJff4bN/cWm5WW+AK472pYwfq1ToHgbfWao9Z+XYKnlT/Fk3qmOqflh8CKy2hCjwCVfL3Hg0ZjSqHyIdaCaE3VRpS4LwlzcMk4kUuiOTrLl26tTi1cDYB/Bzf+YAkFCvf5gcu0yvucHvSu2wqFHZmxCpX+J+6evbz83esGYlLFfzrb1oi1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=POGRuviH5TlEzEUjx6xxRrSvo62+D+y2VRA4aXnjt5Q=;
 b=NhKFwGyPpKn9zi4uttHZv7Tiky7UiHfRvhQLO2uhz92yt9kGJE7t1RjIKC6UJ4yajUZTqm1T921lLc30ztZkLDCq05b2jAalUgtpWglxpoEnXq1Wu+5Jkc6BhbZRnNZ/x8l/Nd1SZTaeik3mQXlQ5Q6zOvdLmDG7NazjiR+qEd8kLHocKbQZ1kpUm2McrHt3WQtDjfUrsxzHgYJGgyq5jbdo7e7ayiFXnnURwuiUq46nVuoaxdXQBM2VvqswUv0sBa1+Iq6IVSMhdzJAp9JnVleCAGz5NG8WZcjTkoQghgnIs+yM8Kw1VFn+Cspw1yPjZDddE5RFlvO0VeodiD7/jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=POGRuviH5TlEzEUjx6xxRrSvo62+D+y2VRA4aXnjt5Q=;
 b=ZYeY8RKH4G1EbslnFDqV/MwmjqWkMIrwxljak1UJX2r1r9EsmMx3P2dHDAyJtaWMk4UwGon54E/IgCkjcaD7x3foRonxwVn3drtazjC8oHkgISKXGnzC/5TDTkFgd1u5lhsmAYCGin8TOhnIJ3O5jK5FzZZGN5FAEpK1Am7hM7laFidKJMjgBNegs2KXhByXfqGHCPZNfzj0KKunIhtC71RMb+DS9BuCvbMSANUxORmkm1Z/uT0s7O71juOWzyePW4xNoCNIVTX8xL71zvm50N+Ut/4V2QC3k/BcKEk44cARWInLOMaClHxOJ0z8fRonMcmiafDpWD/TIU+a4qcTQw==
Received: from PAZP264CA0113.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1ef::7)
 by AS8PR10MB6200.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:54e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.4; Thu, 5 Nov 2026
 12:03:06 +0000
Received: from MAD0EPF000008C5.eurprd05.prod.outlook.com
 (2603:10a6:102:1ef:cafe::2e) by PAZP264CA0113.outlook.office365.com
 (2603:10a6:102:1ef::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 12:03:05 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 MAD0EPF000008C5.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 5 Nov 2026 12:03:05 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 5 Nov
 2026 13:03:31 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 5 Nov
 2026 13:03:01 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Thu, 5 Nov 2026 13:03:00 +0100
Subject: [PATCH v5 2/8] dt-bindings: arm: stm32: allow TAMP nvram child
 node for syscon
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261105-upstream_nvram_reworked-v5-2-ddf7dbf1b298@foss.st.com>
References: <20261105-upstream_nvram_reworked-v5-0-ddf7dbf1b298@foss.st.com>
In-Reply-To: <20261105-upstream_nvram_reworked-v5-0-ddf7dbf1b298@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>, Srinivas Kandagatla
	<srini@kernel.org>
CC: Simeon Marijon <simeon.marijon@foss.st.com>,
	<linux-stm32@st-md-mailman.stormreply.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008C5:EE_|AS8PR10MB6200:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e1f3628-ac1f-4ae3-9e6a-08df3b34c014
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|23010399003|6133799003|18002099003|22082099003|261009223027099003|3023799007|261022105027099003|261026140227099003|261026121527099003|261021123027099003|261021121427099003|261028144727099003|56012099006|10067099003|261102123227099003|11063799006;
X-Microsoft-Antispam-Message-Info: JRYkbAUDszs2OSLp206B9NeQ/t4hFDx34yH6rW3p2efPJB9dkQ4/16TWPeKfO/9Woh42HigDFLSJx3O4ZsxNkDY8DnGPC6Sv2z7kNpiFbopwRGPRztFPK4nftxRiOxPqEo1QDjM1uDLKz6Z9zRup5f39x9SiNJd9fHAF2TPbPJDiAtHiCZG0/8MWXZMgJYwbcHhqBnsGGz46VZU/AWorkg4mC57q5QJt8d02QfF98PVrQah4A1/Ky3MVPZf58Y8wxSvG1FI+qx398t+FlW852rJHfGfslcycMA4Lphw8BiB25CFOrxMFZbYA3pgE+m7ZK+3AlKYrgzuFBq/tYEic/hRh5Smze0szWLiaCR2AeZl0IAIPYR9/Ng+PogbVQ5mhQYF0gQ/f9758A9wzzjcK+FJOwmfbCiQbL/1bZsKE0j977oKxdrMTwdK4wsGmSTfyUw9ROISfA0mQhps9WBpALGDsITCVJW6FY91Nk7HkVKhe9MDjC507v8X7OCIM8A+cKftxOLnm8+H3Ylej5iioFHFYtUYIwWxnY6hXwjG7OwIZZBqET+jfPJwkAX/D1Y7cMdKGtcDevPLOKQvHZ7o69ViHu/eZ/h76sV2DfKveuF+apREzFDUrHSgV90q6X9nb885ITsnT+smHU6O9ER68dTo9zrwmjtaoaXaPVFkq6//0S8Asepo7ncBLb72DLJ1bj9piZK6bwu/eJK8EK+tOlw==
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(23010399003)(6133799003)(18002099003)(22082099003)(261009223027099003)(3023799007)(261022105027099003)(261026140227099003)(261026121527099003)(261021123027099003)(261021121427099003)(261028144727099003)(56012099006)(10067099003)(261102123227099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: uJpRrt+q5RDkmo569ZqsMKckNRAafoqIpae/mlHaOG+PxQWmsf2o0yQ1SpsGFtT4AMGBAyWiVSkMFYVXvoeUvdHSwE0ukETSWBNoi6U6nqYoey7/vyBDqjKz0Z7kY2FlqXKAkYSKLLTiJj7LTqBgr/QJmVnQo0pRbxhXX9F4z4F5s1nZvHU2XCjV8PgEiZZ8zPc0nDygPZkdsvz3N5XFRiY6NZE4Qljp5soiK1ho+ebuKKvy8eFHs/LbLYajWEKAMeMNr+JoxuPBB+q6PDMAIZHKvPFQutIo0jt2WvEvAogSvcqo8koSBG105Q7i4UFwzH1zzNa6fQHMTg0i6HIZJMZFVAX7FKRn0Sz6HHw2sS38/XG1QkrnKy2bgYZkkAFvn3uYKMHDuypZF+RlgISw6d7/g0u2UBXKJUr0ugEP8qYju3JHxTJ+1LK5dIbfwugs
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 12:03:05.5779
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e1f3628-ac1f-4ae3-9e6a-08df3b34c014
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: MAD0EPF000008C5.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6200
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_040315_267587_2A487F00 
X-CRM114-Status: UNSURE (   9.10  )
X-CRM114-Notice: Please train this message.
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

The STM32 TAMP node (compatible "st,stm32-tamp", "syscon", "simple-mfd")
exposes its backup registers through an nvram child node described by
nvmem/st,stm32-tamp-nvram.yaml. That requires the TAMP node to carry
"#address-cells", "#size-cells", "ranges" and an "nvram@..." child.

st,stm32-syscon.yaml uses "additionalProperties: false" and only allowed
into the DTSI made "make dtbs_check" fail on every STM32MP TAMP node:

  tamp@5c00a000 (st,stm32-tamp): 'nvram@5c00a100', 'ranges' do not match
  any of the regexes: '^pinctrl-[0-9]+$'

Allow the addressing properties and the nvram child, gated on the
st,stm32-tamp compatible so the other syscon variants stay strict.
"#size-cells" may be 1 or 2: the STM32MP21 soc bus uses two size cells
(an empty "ranges" requires the node to match its parent) while the
other STM32MP SoCs use one.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 .../bindings/arm/stm32/st,stm32-syscon.yaml        | 38 ++++++++++++++++++++--
 1 file changed, 35 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
index a559f8b03b84..51cb565e05ed 100644
--- a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
@@ -43,13 +43,19 @@ properties:
     const: 1
 
   "#size-cells":
-    const: 1
+    enum: [1, 2]
+
+  ranges: true
 
 patternProperties:
   "^phy@2[48]00$":
     type: object
     $ref: /schemas/phy/st,stm32-usb2phy.yaml
 
+  "^nvram@[0-9a-f]+$":
+    type: object
+    $ref: /schemas/nvmem/st,stm32-tamp-nvram.yaml
+
 required:
   - compatible
   - reg
@@ -84,11 +90,37 @@ allOf:
         - phy@2800
     else:
       properties:
-        '#address-cells': false
         '#clock-cells': false
-        '#size-cells': false
         phy@2400: false
         phy@2800: false
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: st,stm32-tamp
+    then:
+      required:
+        - "#address-cells"
+        - "#size-cells"
+        - ranges
+    else:
+      properties:
+        ranges: false
+      patternProperties:
+        "^nvram@[0-9a-f]+$": false
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - st,stm32-tamp
+                - st,stm32mp23-syscfg
+                - st,stm32mp25-syscfg
+    then:
+      properties:
+        '#address-cells': false
+        '#size-cells': false
 
 additionalProperties: false
 

-- 
2.43.0


