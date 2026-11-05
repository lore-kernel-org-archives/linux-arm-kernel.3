Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717CE606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 08:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=k9lwM/fl;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=lX4Roevo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=rSmEnELfbwYAIBoQiV/ny03M/DIIsFxPkRrucuPQjI4=; b=k9lwM/flt7yrgDevJi1S8VAY2H
	VV4SrBZNgfeYfiM9MrVAfVHQpo3+MaQFBnmqBu45xoV7r/cbKMejKe9nEKyv4XVYRM6qAOicW0qjk
	YMLP7xrXqhkI8Urw92CCmVnxGfy9+yMUjzbwZUUK63EdJPABfUOjObIzYYhQBEq5DmjnSIQ/NKQBg
	gMMLINAo6zZ2vhiKfqUK9bs7GpzONOP18CIUt8++JiOoZSiBaq85sOOX5+uxDUdbCd8hKUVMIl81u
	Dkuk9mHmDKSeQo30FxKeACXZvJsXZTaFcz+zdiCBj/oewXECkVI+LzsFd2XQoPTRhv8RByEfSyD1v
	EvU0VpKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOt3i-00000008BPk-32jR;
	Thu, 05 Nov 2026 08:42:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOt3f-00000008BOs-2psv
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 05 Nov 2026 08:42:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=rSmEnELfbwYAIBoQiV/ny03M/DIIsFxPkRrucuPQjI4=; b=lX4RoevoZaBCZT6ur3HAjk8fF5
	o0Abq5o6RpXI/c75Bxskl6GCGskIo+tKfe/LG8a5JtOwlMVc39Nt2b2XZ/7jy0Cb5ohcyALVt+mPO
	M7+ng7vTP3Rq69aHSUdSvZ8136uNJu0kADh7Qr711IdMbr518tmg7GqsrLbhFzOfZ5UO6+/QEuibr
	RkW/gBL3hnWo1jgD2exIC2iHfwmuwEQlvtvIPgn0cYq7tqKmpUCyt0rSS+PQ/1OsuRlAhwCpoDnNQ
	FjeNJloKi9osAkbIHnTqBGhziGq611mQFLH0YpUhUYjUjIImKa4/NBzCIQYaR1w8kJHhLXcUR4uke
	VFMgyv0A==;
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOt3c-00000002hrm-1lpA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 08:42:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yEuEgSU82oUoyjXtKqOKY+HdYltPTS8aISi+GwyX2mUNMMApGE37108z1F8amu/+uGmZ+HsjN7YPOJaYY2UdGCVBgtYTjsl5R/N4+qH+zcgLSiyPvtONGryb8tVnvWwslPD39oJlZTPKAfpihAISpKQc9p5WGeas3E8rNo/XBEit4JVXvBfF1iCv6Aztk8Twus3lw4SNscDQ8D2dGZcL+P1C3LKAKOkD2UccPbQwmCGzIUBrPSLpwUK6Upu668iZUURDV+0aFehqCLuN4AU/oNdkDRkKlRfT5Csp8tIhYdRNvHpayzGy6d2V0RjXeO6NM+78SvN4Ka7VZ73MLkyPNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rSmEnELfbwYAIBoQiV/ny03M/DIIsFxPkRrucuPQjI4=;
 b=RE0451XeWohvDoCtyiGBwqrcAAOlNuW1AetnxRsP3oHVGMNe6GP67KmUavCEWNjkcJOB6n1fExVFr/EzJ491bN7lonS0gCCHu2ZEEiTkJlsKYSQ5ff58K6hJyxiohU/VaOCFhCBgVxH5/lCrxadkhM9Jg5cr9YicdVYNbgACvwPOnxlg2jbIHvYvaWRACAyumLKFWsUXwPcqmpnvG+o8FUJfWD4NGVophjH9vFm3G5UtNkxrZF6vZseMNEjmHuGLdlv4sPW2sAsWrKQAc0/9wKPy2IYTIvZnqwaIsgQuO5cqEZQiZuDYCOhWqlC8wDnBVimL11XSVc7zdaidfv+lYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PS2PR03CA0015.apcprd03.prod.outlook.com (2603:1096:300:5b::27)
 by SEZPR06MB5455.apcprd06.prod.outlook.com (2603:1096:101:cb::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.4; Thu, 5 Nov 2026
 08:42:39 +0000
Received: from TY2PEPF0000AB88.apcprd03.prod.outlook.com
 (2603:1096:300:5b:cafe::23) by PS2PR03CA0015.outlook.office365.com
 (2603:1096:300:5b::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4 via Frontend Transport; Thu, 5
 Nov 2026 08:42:39 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB88.mail.protection.outlook.com (10.167.253.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Thu, 5 Nov 2026 08:42:38 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 6A66D4102E60;
	Thu,  5 Nov 2026 16:42:37 +0800 (CST)
Date: Thu, 5 Nov 2026 16:42:36 +0800
From: Jelly Jia <Jelly.Jia@cixtech.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, robin.murphy@arm.com,
	devicetree@vger.kernel.org, Frank.Li@kernel.org,
	cix-kernel-upstream@cixtech.com, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/5] dt-bindings: dma: arm,dma-350: Document optional
 clocks and resets
Message-ID: <auxBfKB+KFR13/+g@ubuntu>
References: <20261104124411.296640-1-Jelly.Jia@cixtech.com>
 <20261104124411.296640-4-Jelly.Jia@cixtech.com>
 <auuIrNTtrm7Tn4vb@SMW015318>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auuIrNTtrm7Tn4vb@SMW015318>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB88:EE_|SEZPR06MB5455:EE_
X-MS-Office365-Filtering-Correlation-Id: 6238d206-691b-45bb-045f-08df3b18bfae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700016|7416014|376014|23010399003|10067099003|22082099003|18002099003|4143699003|56012099006|261028144727099003|261022105027099003|261026140227099003;
X-Microsoft-Antispam-Message-Info: izOSKAhRw0pqmx+Eny962D+Mh4YWRTHQnOQkAf1l1rZl+IP2DwJxcp4QwLWAKgCIC8Sm2MaTia8ldGWH8b39zzzq5d3GwEHY5BiEQqCSdrYaHGVQ6DlnMT1VLgCsKW/yhqOVV6oNyz0Aw/8ZdGNQDLtLxIE3twoS9rSANBCReNKFMExbGx9p9oELnofGkng3cdJe6WwRqr6ay7nuIubPL4YSdikDVYSQ/WMqaLhLO2xysx8R14HBNCv5mCZB+6vzAauvMlWhhU3aZ4f5H0TsZ9esMixvz7887dmD3v/fJ5Wr0s4VSnn2MSyezKjAz31V4VoA84c800htKvypDaDcwnIMbfDXhmF7VfR6iapefxGik57RVvOtD+rvnVndnshvETft7hBQVIGCKPkzV8/8WV4r17+ha98HL9HdydjrQJo0Lb9iknd8eUauI5eExMnGyLX+oKx0N+3N1eYFYSs5DAcEl2J20LuV5iFZkMTwBPsfLw6rDFzirSxXlGKZN8Q0JLZYrb6JmUOZVS8azVmYznoQLjncAfRA31YWn8Ow+NdT9FeCbd6pre/8i0wqvaQ7/nXYali1Pd7zKeEZfjiT4LM73r8Yy5B01swn9NK0kxPDnNsaAULIJqNoCHc/qmt6osVEVLzQui4I5meS/3JbJ+1r2Nu+psdPtCCqjyO+rIFjrZYtsNr5Da3OgtxrAenzjZeGNgi8OIAUYQGciAz0dA==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(7416014)(376014)(23010399003)(10067099003)(22082099003)(18002099003)(4143699003)(56012099006)(261028144727099003)(261022105027099003)(261026140227099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: QkkoeXhU5dzvq65EhS895YGIqORXT154Wxt4FxAw4b7saUq738jHkAK6Qx5ztCOm27mKwZKsimfnM7XoH2fJY6IUh2fNQ3u0FuRmEo094y9tqzg5OJUwIsSo4AzzNO/h4uwCfrjTE81I8EwD499Ncti9IAAYvgJAK15hqLfxvyiVGKhppRXZSvem9jCJwUNj94ZluNGLq6AqHlAm2O2XsTQ92xCydbp3kzLBX+aL5yys+OYYpd1eKKTsp0I3Y5a+7OQhaN5V+qyZc/pKt5clQSMKWk0DxBQn6PQyvHHG6Yol8M0dZjnDxfx34x8nK+8Cbm1r3NYhGYe0t31NtGF719lmSWq+wrikCDqJXJNk9HwKn3rJm52zv5ll6tqhZpIkndAdVOo/X/BibTKVQ/EowFqMbbsV7XPmsSKNIIlxJ1xMmao6yUD716mvTOBx4gOQ
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 08:42:38.6968
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6238d206-691b-45bb-045f-08df3b18bfae
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF0000AB88.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5455
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_084252_438810_4FC5B7B4 
X-CRM114-Status: UNSURE (   9.45  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 0.0 (/)
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Frank,

> Suppose you should add front compatible string and fall back to arm,dma-350
>
> and use front compatible at if branch to restrict clocks and resets.

Thanks. I've updated the binding locally as follows:

  compatible:
    oneOf:
      - const: arm,dma-350
      - items:
          - const: cix,sky1-dma350
          - const: arm,dma-350

and added this condition under allOf:

  - if:
      properties:
        compatible:
          contains:
            const: cix,sky1-dma350
    then:
      required:
        - clocks

This requires a clock for Sky1, while resets remain optional. Both
resources remain optional for the generic compatible alone.

Both FCH and AUDSS DMA nodes now use the CIX compatible with the generic
fallback. The driver's optional clock/reset helpers remain unchanged.

I've tested the updated tree on Sky1 and will include these changes
in the next revision.

Best regards,
Jelly

