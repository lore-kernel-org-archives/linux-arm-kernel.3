Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32742606A335
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 07:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lyVtFa/H
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=HT7jUrCuY5V7+p1SNsQmj6EMybnOkBDHv9drPm0pQKE=; b=lyVtFa/HBWrRW/
	FY9bM09XhraJZkfh2qdZQ20JlO9e7yxlFMalg01Me1731uBcs0G4c92bJbcej6kTa1XJGNN4FMo5v
	CKtPLddzjThORtwtolPX8TYaBaC07qefpATLtZ6K1R3qkMCtZeu6w06pHqMXr4f3ohqo1MYSLZv26
	Ki2Is1nXQhCkwVWwtSRjRLWUGocn7KL+wBAj0sbr0Ap//fgzBM9XAxeeHILUMVowJxzNcwo4L0dib
	whsK1h2ZWs2tdYWIDyOxZIaWzH6VNqh1N+yMyY03EMvSa0Z0tP8xAAJ/gi7HCrS2yU8M/irk3M2Wk
	AAsRjX0sCIVa8o16uqjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPENl-0000000BSBc-0WAk;
	Fri, 06 Nov 2026 07:29:05 +0000
Received: from mail-japaneastazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c405::5] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPENi-0000000BSAl-179P
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 07:29:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R7bgUob3YoDiUtr6AzJBRCe24ejq+Gu3zLklEX/cQeTrqTtZ6r+RCfcigM+Jzve+cyBmhVoZ4Tw/iFCfkqeID0U9uxK7MAt7AMdSVbmmVRv96pE4esSxW1LCaf5HSCTgu27kbehXKYgJ0YmTFXiR2zeMNN54wm+pK4QfnrzTw/AnaP6WuCjGLqXIyLr/yTRby9AxvHD6bBa+Y6FQA6ByA85lyu0hi5rtdGsLDp99OyTs3tYtkr0FMarjCjQJRCZ2P2HiQ7nJns0L/EdlPxy631uSosicaf9mQ2ckARNbreF0nmB9KAdINiGVLUib+QIQ1a0vZyHh02s6S2WhjFdk6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HT7jUrCuY5V7+p1SNsQmj6EMybnOkBDHv9drPm0pQKE=;
 b=Yp2apqTLsYoF/LiVz3l5896D4fzlHmAbdhdNLrPZ765KS0QSPigoeN28WLupilc4T0/pfF6HGhQeeINlMf1ZULh4UZ8z814yAW+kWLtkH7ehYbr+P/SJhFewyYucmD5uvujplAhxI3Ch6ltjOtwD9qtsZDz384g6VT/Tgs4+vS5GTDrOdGaVIwiOPOya/xvTUyiqg1J2RO2QDVKsHYxl7RCcIhNUNNnCZBijY+8faSCPb7PFunWT2Pmi3lKIppZOcp1FaaGuYVXqKz3uvb4QBeqyzen7TAjPnmK0fdkUu6CFIsvsd3frhr4DfpAn+qkdP44Vr5i4lAindAd+hD8prQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cadence.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from JH0PR01CA0073.apcprd01.prod.exchangelabs.com
 (2603:1096:990:57::15) by TY0PR06MB5152.apcprd06.prod.outlook.com
 (2603:1096:400:1b3::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.4; Fri, 6 Nov 2026
 07:28:54 +0000
Received: from OSA0EPF000000C7.apcprd02.prod.outlook.com
 (2603:1096:990:57:cafe::49) by JH0PR01CA0073.outlook.office365.com
 (2603:1096:990:57::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Fri, 6
 Nov 2026 07:28:53 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C7.mail.protection.outlook.com (10.167.240.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 07:28:51 +0000
Received: from hongliang-System-Product-Name (unknown [172.20.64.180])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 35D724102E6B;
	Fri,  6 Nov 2026 15:28:50 +0800 (CST)
From: Hongliang Yang <hongliang.yang@cixtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Hongliang Yang <hongliang.yang@cixtech.com>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	Gary Yang <gary.yang@cixtech.com>,
	Fugang Duan <fugang.duan@cixtech.com>
Subject: Re: [PATCH v6 1/3] dt-bindings: usb: Add CIX Sky1 USBSSP controller
Date: Fri,  6 Nov 2026 15:28:49 +0800
Message-ID: <20261106072849.985274-1-hongliang.yang@cixtech.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <8ffdf2f9-dd67-419f-83af-8dd4206d54de@kernel.org>
References: <20261105011803.4058557-1-hongliang.yang@cixtech.com> <4d075b70-f2af-4aad-a1d7-cd8ea26387ca@kernel.org> <20261106055050.948470-1-hongliang.yang@cixtech.com> <8ffdf2f9-dd67-419f-83af-8dd4206d54de@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C7:EE_|TY0PR06MB5152:EE_
X-MS-Office365-Filtering-Correlation-Id: f371f4fa-bf65-4913-3ee2-08df3bd79b5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700016|82310400026|7416014|1800799024|23010399003|6133799003|15056099003|18002099003|22082099003|3023799007|10067099003|261021121427099003|261026140227099003|4143699003|261022105027099003|261102123227099003|261022075727099003|261028144727099003|261026121527099003|56012099006;
X-Microsoft-Antispam-Message-Info: zu2l3sBXZUSeT01OKEFxsB4giJO+rkIogZej2AuVCWfpVFU6dX8aTHwnAxz0EoRodFZyNokm0LQcti0P4WTKX4WaF01Lc0rAm017nS7kEw0KwiyPATaYK0ynQ8hj+DQQNiL7SqHIct9S/o3SvV06Q6eEOylUhhpniHNewI2G+x9xSYKhQR/vEeOy9jJ1r5cF1O/Fgx2+HOOjAAzdKCjjpitK1FWfmmdmS/9tlgsdW57jPiAUu7oxUJM+B9XSDuLRo+Qq9CrwIoPFXbEK5UjT9OJ6JfQGBO3wLCC7hAN24LNDp84JjBGt4yksCyQUUyR4jEQNhZUFMMkJ7APY6eZJC8hmLTGZS0rbETxx4g021iASx0TE88YssGvzhtY0lKh0rsfjypHYZmFHFdaK2bFq8bbMT+Fn4LNTDF2iExB7EB19RLDXavJSKG4bg21lZo7GrUiwtyN5RXQ47Z13Ir3b7g5M6tcCCbnxNskWaT7ZUa5QlUW1NVeyX7SFuvnwrBRFPvEOYMXWe2pZfzRYj/0Dhm1e0x+hjryJXacL0WHSdYBfna8pzNJvVD4RHc4v79wVkk1w/qBK1qhn3I01H/L0Eb1wu9nCzDwS55lPrIFEjeq8S+X3jA7EkS8414QG2yKM50Az080TWLNTAqr+XqyQmA==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(7416014)(1800799024)(23010399003)(6133799003)(15056099003)(18002099003)(22082099003)(3023799007)(10067099003)(261021121427099003)(261026140227099003)(4143699003)(261022105027099003)(261102123227099003)(261022075727099003)(261028144727099003)(261026121527099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: fL5HZlA6mrM4qk7PvbCA+TpoJrn3ZqNxD86xAn/KqZlapDjhU9xSgPkYTCsRBWMwq1+HOtUW6IuuLgpeHvDyw4CydgVaM+jEWuC8uFPPiBWEaNimueHVzRaNwIMw97X3Jq0wlZP52GAreAYKHu3cBI2NoPF7cURKVnp1Cqi1jP+FAgk9YeISmWluaK828oOEF5Fm0wtzFvzmcVnRFETspIb5ENGtdQYeSIgfxVnItfMDVasaxaTpncfXAPk9wAw0Myb4eeUfxEhIep27NTdEaZLkWX/QXSk955m6bIvhz/mLLKwnspL7BU6LH8mEwHPIWE+BwJ0gr2RO9sLK5wF9OJ5bLyDF/irip6BRGbK0sm/PoLCfsxMlQnFauT2ZUW5MW23Nzd/rKd431VNFeq3+TYzQZKgIpicIbJfGZ9AwtW6mfE/EoamS89Gp/lQueKv4
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 07:28:51.8181
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f371f4fa-bf65-4913-3ee2-08df3bd79b5d
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: OSA0EPF000000C7.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_232902_329924_8AD965CA 
X-CRM114-Status: GOOD (  15.15  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 06/11/2026 08:01, Krzysztof Kozlowski wrote:
> So instead of replying under each comment, you selected a few of them
> and expect me to map/figure out which ones you ignored?

No. Compressing eight separate comments into one mail was the wrong way
to answer a review, and it is what made you match numbered paragraphs to
quotes yourself. I will answer under the individual messages instead.

> OK, then find me where did you reply to this:
>
> "And do not combine USB patches with other subsystems."
>
> "I do not see how you addressed my feedback from v1. I asked, not to
> combine USB patches with other subsystems, within one patchset. These
> are separate patchsets."

The first one, in the v1 thread:

  https://lore.kernel.org/all/20260902032306.1182941-1-hongliang.yang@cixtech.com/

where I wrote "Done in v2: the combined bindings patch is split into
separate patches with dt-bindings: phy: and dt-bindings: usb: subject
prefixes, one schema per patch". That answer was only half true: v2
split the bindings into separate patches, but the PHY and the USB series
were still submitted together. The series were actually split in v4, and
have been separate since:

  [PATCH v4 0/3] Add CIX Sky1 USB3 PHY support
    <20260906032431.470744-1-hongliang.yang@cixtech.com>
  [PATCH v4 0/4] Add CIX Sky1 USBSSP controller support
    <20260906032440.470788-1-hongliang.yang@cixtech.com>

The second one, on the v3 cover (6ca4ba08): I did not reply to it. The
split went into v4 with no mail saying so. There is no reply I can point
you to for that message, and I am not going to claim there is.

What remains are the per-patch comments on the binding that my previous
mail answered in summary form. I will reply to those under your original
messages, one at a time, rather than restate them here.

Hongliang

