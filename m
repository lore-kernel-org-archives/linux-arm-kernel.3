Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC6B160A2611
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 19:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LReW6Zge;
	dkim=pass (2048-bit key, unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=JLr9VliM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=yPMdXhrkVsDgU0CG3yAL/+E1FrHLSRjibkPMaHjchH8=; b=LReW6ZgeVWgxQhQ23VSIYGNc7H
	vfNmVSlelSZ6EHkCmV/gsKnnV5iXKxGaNQIjDiLjL21F4FH7fWqDQziJlI6i8RrXVKRM9JkEYnUTz
	klHSW4nJYF0o7luhz9p6L5RpMC/AHnyxJ0ycg3Aclos4FFylbjvefqsFTI0+U7/ekeNP0CUd25Xvl
	f11gc7ZGExhMYCr8PZIctmtG+TckbLy7t2lW5fiI+Tscm+W4v5ck4w4+dWmu0Tfm5ex86gl1pRs0e
	U81QkKHJ7ys5bKn2PoD5GfD1jolslaWx6Gte3wt3aGe+s7y8fDfeZ4y7ZCMmcrbrOernoogkN3ASF
	zPyWtdDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM9SI-00000007rYt-2dAe;
	Wed, 28 Oct 2026 19:37:02 +0000
Received: from mail-westcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c112::7] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM9SE-00000007rYY-3LIh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 19:37:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fq7UpYFZtd916UTWmYd5Z/lWK+m4XdUSIC2kXgq0FK20EeZaC8c5v70Odpzl4hNUs3q2fzDbgOF+qPGkPoNti2rIgIap/4JS6f0vOEGkB6ehuzxzFQTAzs2UxzucEzZ0GIcFr+g+vkK2UzBW6RoaSWnX2XzOdaPUQRqztKg+Vy8P7rvuWdLJifkWQQU/+BATGnqag66cLUFIb+UsRhgz+3o2UfNVmNyvglRDE8FCo58cfNCUHCgh887arNXv/ssmnk/NbwJjPWMM1S7UQm0GJ4vYjR1R2O6UsT8XKMhpd6i0I5qFDRJbyFjeyi2Pi3lnJK91sbH5xL1oiTdfAksD1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yPMdXhrkVsDgU0CG3yAL/+E1FrHLSRjibkPMaHjchH8=;
 b=X0yRaCjDtkNvVWL4tSv14HTgxjlQR8hl7n9P3OO3mcha/hQy2GQvyQkxq9voAQ1BS0YI4mmuCjNikYNjZ2I93U08G5ZPg5tpVXmLBn1ClKn4+hyzcJs+9r5LvPCvhnW3jGD04bFBCEGD0+QaDYBt+YivmpQq82VcDCTYSGV+EBm9O9cGMsAKrPAAFdPfPDH5wdcqkLn9RD/EX5CgpauymxZc9HypP/QDuOBYrjWSyZlkTdcGCrUmX1O0/p8iNT/lQl2nESIP3lIqjfEmuXHUakadEPZS2zEIh63tZwoj6G7P75C/iimTtcosL9+FtlzpgWuIbIlDCi0dS+XeahjCfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 64.62.143.114) smtp.rcpttodomain=kernel.org smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yPMdXhrkVsDgU0CG3yAL/+E1FrHLSRjibkPMaHjchH8=;
 b=JLr9VliMIwNO35rTZZ3O6+Xjg1yTGU9ta35j6aKR5osGgGb3McIS0qLR9lWVtC5fcm9dWU0evgUk60IZ9COekQdQ/ii17wyc6gRaFDHTFk4r6PF5xa+ktGa1ftOFd8i/UN0HC0ZhxTnI7u793DV/jw6t+ON8FGd6KPNcRAytWX+20cfrd2Y9GGaUjSB7XKt22j6CbvzQmFyvGwL0jNq+G5iP4MuYZOzLwUDlRED3fp9fOoqHxp5PbFyUZ34lkeFyEgpox0eU4boNxwJ9T/IbcjdO9es6Rc8xZcuxBCmNDq4pid0j11q1fDvAr/wfPNZ8gdLuquHbM7Yn7aqPWgP1Bg==
Received: from CH0PR03CA0296.namprd03.prod.outlook.com (2603:10b6:610:e6::31)
 by CH3PR18MB5891.namprd18.prod.outlook.com (2603:10b6:610:1d6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.16; Wed, 28 Oct
 2026 19:36:49 +0000
Received: from CH01EPF000BE94E.namprd02.prod.outlook.com
 (2603:10b6:610:e6:cafe::9a) by CH0PR03CA0296.outlook.office365.com
 (2603:10b6:610:e6::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Wed,
 28 Oct 2026 19:36:49 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 64.62.143.114) smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 64.62.143.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.62.143.114; helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (64.62.143.114) by
 CH01EPF000BE94E.mail.protection.outlook.com (10.167.244.203) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.4
 via Frontend Transport; Wed, 28 Oct 2026 19:36:48 +0000
Received: from http://axiado.com (unknown [10.14.1.22])
	by smtp.corp.axiado.com (Postfix) with ESMTPS id 4FAF04186B53;
	Wed, 28 Oct 2026 12:36:48 -0700 (PDT)
From: Tzu-Hao Wei <twei@axiado.com>
To: soc@kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Axiado DT updates for v7.4
Date: Wed, 28 Oct 2026 12:36:48 -0700
Message-Id: <20261028193648.73841-1-twei@axiado.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH01EPF000BE94E:EE_|CH3PR18MB5891:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ec7b5e13-f087-4f3c-3293-08df352acf26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|34020700016|42112799006|82310400026|23010399003|36860700016|376014|1800799024|18002099003|261028144727099003|261026140227099003|13003099007|10067099003|261026121527099003|261009223027099003|56012099006|261021121427099003|261022105027099003|261021123027099003;
X-Microsoft-Antispam-Message-Info: TX08SXCrv7OwyXoqBHVfQsrLz+J4NuE1M2NWrgCOIailQFXO/hcrbdHlMc5UJJ5nzKE7TQyTRlf3MfwbqoJwpXxJ/MFISrky68I7itU9dx8KQgbcZNL9ALoztY7wUOr+INv/zsKqfWLhAkCPhYBaqkRBvWmRDoyI1fMu2ID11UPNqvkgBkIPHjjw9SvZIt9d3hsVWclTDgkvd5pdxg0u9N2CTB4wJNC3g8u4XWzJAQ9imXLsjOLq7T2cWA+eyNQBEkS/cr/sHCNbxuQ7T6dzKscWvnUPSxGDWm+v7PVLEwC+M67OQ8KLevMOCr0RgscY49Fn+YtLe5RBWDxROe1QVtD8Sz/y64XbDb2K4+ljuupPE/0cqORgOWWPksI34+iViAvIEtcA0O8AHOR0i8cNv/N3gKUbj9bS8WldHxP4BKqfQifIsQSg/Vvjf3XKv2kGxtN3Sg1iPr5bjk8lPQcniXynbNsnWadHdjJ0R+OjLzCGuxcCDBSULSqiE+xhVaJx+9sWR0fE4QtW6+fr9SzGQZtPxjF5KoDvc0c2yhapovyjsqMZZ7KRYz7aIjTaHRFLDFxW45ofp73GFIajPOEho1V+v+8coyqMDzNZoDDw9V+tlF82Bq0TLrCWFQ4UNeTmvPqO11n+NeAJ8DgHcETWPpvWiUFK56vdNzZX+F2hHqvk7r0WS/K2IQwsC98vJ9W0PPn9Fp7VEkbgolvsnqxfgQ==
X-Forefront-Antispam-Report: CIP:64.62.143.114;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(34020700016)(42112799006)(82310400026)(23010399003)(36860700016)(376014)(1800799024)(18002099003)(261028144727099003)(261026140227099003)(13003099007)(10067099003)(261026121527099003)(261009223027099003)(56012099006)(261021121427099003)(261022105027099003)(261021123027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 2HymePvVl4i20e+SpK08vfnY/tAdg3hriu/m1BDn9sosF+osrEz7Gribs7oR5ONpQG3jJR90Cw+y4zImqYce2TYgfZjqRTvQ1by9O34AtVnYJI/6ulAcbJC4WSUg7GRTo7PreS+UwRUg+OH6hGRpdDYFf6VzESZ33BhrDAnQDYk/iqRw5Skuqqr5/Oy1K4J3hZGHe3mTlgWXSzNlg4Ums249FvVU9QUbu+n48UwKcS0Xc3kn3/DCd1QYqAcL0a/dg938HkdZ+lmXV2/26x6gR8kUGPQLMpifqDT87oIhqym8Fy8dk1wcD5mCL6qghmPIIZL6ZGGxLgtZX/if+xCEP7NovM69HigLIgrNZTfWsFgFXbszEUW4MrmJ6pm3QHp3VkR4BMpyCTcZQ4pbUrxl/pXGgAthCSQdPVYxJ/tVNslepRpalr7q5utrI/kOzL0q
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 19:36:48.8797
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec7b5e13-f087-4f3c-3293-08df352acf26
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[64.62.143.114];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource: CH01EPF000BE94E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR18MB5891
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_123658_875916_E94D9600 
X-CRM114-Status: UNSURE (   9.61  )
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
X-Spam-Status: No, score=-23.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi SoC maintainers,

Please pull the following Axiado Devicetree updates for v7.4.

This pull request includes:
  Initial Devicetree support for the AX3005 SoC and evaluation board.
  AX3005 EVK compatible string in the Axiado board binding.
  Minor hexadecimal formatting cleanup in the AX3000 Devicetree.

Best regards,
TH

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://github.com/axiado/linux-axiado-dev tags/axiado-soc-for-7.4

for you to fetch changes up to e728a5b8d68e4b567ea9420667450456121136d0:

  arm64: dts: axiado: Add initial support for AX3005 SoC and eval board (2026-10-27 12:25:28 -0700)

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      arm64: dts: axiado: Use lowercase hex

Swark Yang (2):
      dt-bindings: arm: axiado: add AX3005 EVK
      arm64: dts: axiado: Add initial support for AX3005 SoC and eval board

 Documentation/devicetree/bindings/arm/axiado.yaml |   6 +
 arch/arm64/boot/dts/axiado/Makefile               |   1 +
 arch/arm64/boot/dts/axiado/ax3000.dtsi            |   2 +-
 arch/arm64/boot/dts/axiado/ax3005-evk.dts         | 327 +++++++++
 arch/arm64/boot/dts/axiado/ax3005.dtsi            | 844 ++++++++++++++++++++++
 5 files changed, 1179 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/axiado/ax3005-evk.dts
 create mode 100644 arch/arm64/boot/dts/axiado/ax3005.dtsi

