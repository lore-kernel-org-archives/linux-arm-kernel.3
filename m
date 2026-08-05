Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C5C2C561E6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 22:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FjILvXEt+TVt06DtDqq9lTL9f4+qBfAWo3fOmpMkvZ8=; b=D7T2pCfp+9rbYNxfpEVBU3piA9
	3WBmCHxjqCeJD1yvPF7PiBQ8GmNDCyaDssFnoBqyqoSwn8zHiwp+ivdDKGp5ndBt0/TgGHiH28s0z
	fI8+zMTfW9Nn119Pemcb9xIAzMcCADBTlhpu8v4FFj4gAI96SRM+sW2NBGxeANR3hY5M5i/cXc4BL
	s98wKFLcsGrn2TilG8rEnXwYwM9kItfBLVOSxGsHvZEQv0z6eobUf0LW5JL90OLw/wkyHSZvYKeyK
	M6El1bKNftkoIh2TH+dbw0OT5zi4f9KUoh5+cPYsQfnRSgfNMjnkC7a7ZDRT88UInmO8hKiCUK2Q2
	rcsw7smg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrkVm-00000004csO-0HWM;
	Wed, 05 Aug 2026 22:54:58 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrkVj-00000004cqL-1EyW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 22:54:56 +0000
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 675HVMxw2892404;
	Wed, 5 Aug 2026 17:54:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=FjILvXEt+TVt0
	6DtDqq9lTL9f4+qBfAWo3fOmpMkvZ8=; b=NT4vQta1OxO/3+pBv7nXaDEERg+7s
	vXR4g4eIlH4nJCX7gaTzZx2jEmNVAXyRRTWuLzwzO5JYPZfc9zSsaC7ASpdLu8Q/
	Mo6CpkpFbMxtim3SbuER0qkA3sjJ4qeMCYgfXjtr9i+17QGTr3qmPIRyTmhJHv0M
	k6coXqZHegr1EZGggR5elkujJ72mVZHQ/d+Nx3TM286NMRQVrGmvoWBW4rrt3gsw
	NkGBCt51nEVLJkW75p7IfHSJRgj3pDWfMSpOEIkQ5aS/ASlqcc01LKkCtHkjiMCw
	4qkzwXiXIXC2PLGlwNRfYityrZGiiwY8GquSDIDCgXcJ1he7yKKaguriQ==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012006.outbound.protection.outlook.com [40.93.195.6])
	by m0384305.ppops.net (PPS) with ESMTPS id 4fv5sac1b2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 05 Aug 2026 17:54:46 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GrDk21QyuzuxhAWousg3rJI+jn18vOLVVsmqZKF9HYxaN9YBC5BcxEldvviT3nYhyl+KTR7RexkLiqUoXzZ/PwtIWWpjglv5Gx2TyIOFMMq6O9qYsWeM8M6EQXoeDTvEiKaLRsJoSgXRSVZ6iiRWME7+hR09/wJfflSh2A4Y4oci0a7WO5CUd82vZsOSPuqWAyJPwWbtLCiVQ+ISoozGubzDLnHGYZ8daGLJh/dApnHIevgX8RMSq59Rw8dVRTthsP4+ZU8suByMJVpWKoBZpnt7vhcWFh63/H7ToyczLMDpSK68jn68fJdgvn4eey1YVmvHzSslm/ThwVuBxlktag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FjILvXEt+TVt06DtDqq9lTL9f4+qBfAWo3fOmpMkvZ8=;
 b=tnxc6A5ci8ShfZsybQw0/r4pVuMGlxzzfTo9qwJBD/PWtpS8WuvPJJnsOc/2agorErt1fyb0LZ+9cKT0/ePybBcK6Zeo6Cb3Bp/dJG44xX1pdRAgJi83ESHtIAFcRz6G4p88yP5eeDGuY36/QfZb4aadDKMs0cZQ9Nl2epXuEg3qhBfYhfba60IFsXiEBAMLoWvgxAW5fDdu21DB0/gFMkMAwtS2JlgexgUDJi6CY2GaLmTvz2DAMpLcT01OmsKdQq8n+y8RoBeGASsVD6+Ypgm6NPELNKiaWpk8xEH6tMIMBMxj/2KjeUQo9GoWGW2G6TpTFx3oqItF0PVR45Hakg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FjILvXEt+TVt06DtDqq9lTL9f4+qBfAWo3fOmpMkvZ8=;
 b=vzXms6v3902nMxVLbv0fh3LQQPyyEVXljnHJra3e+HsAlULmjhU4O3wqcAc9lOyquaQP0bJbjVbCBG40Eia2AdVkI2ekSQx9S+64XMR0vJupGZQwWPc60PiktNRdO08POfbAMvOOeFXGrm0gU4cX5H9KYgMjhvn/xJRNSh9fHvo=
Received: from SJ0PR13CA0084.namprd13.prod.outlook.com (2603:10b6:a03:2c4::29)
 by SA2PR10MB4731.namprd10.prod.outlook.com (2603:10b6:806:11e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Wed, 5 Aug
 2026 22:54:43 +0000
Received: from SJ5PEPF000001ED.namprd05.prod.outlook.com
 (2603:10b6:a03:2c4:cafe::cb) by SJ0PR13CA0084.outlook.office365.com
 (2603:10b6:a03:2c4::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.6 via Frontend Transport; Wed, 5
 Aug 2026 22:54:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ5PEPF000001ED.mail.protection.outlook.com (10.167.242.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Wed, 5 Aug 2026 22:54:41 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 5 Aug
 2026 17:54:39 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 5 Aug
 2026 17:54:38 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 5 Aug 2026 17:54:38 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 675Msctf2968446;
	Wed, 5 Aug 2026 17:54:38 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Moteen Shah <m-shah@ti.com>
Subject: [PATCH v3 0/4] MMC pinmux configuration fixes
Date: Wed, 5 Aug 2026 17:54:34 -0500
Message-ID: <20260805225438.464184-1-jm@ti.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001ED:EE_|SA2PR10MB4731:EE_
X-MS-Office365-Filtering-Correlation-Id: c17bf1e0-cb5b-4d73-58fc-08def3448933
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|36860700016|82310400026|18002099003|13003099007|3023799007|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: UhAFaKWhN7WN9LIuD34JtPLNIzIL0Qs65dw7nPky5egi1thXPyK0Aibn+Sol5c2ik/8+9Ft1JhnPt6cWKL2K/ICwzBHNTRlbmMxmQR4OTlrFdq98U1HijJBbbjayaTzkpMrP4P4+aXaBadGdx/nf24tOlFMLtNLg3VWmY1DK27UuQR37OB300a4wXlU6MhCBJ8mkAx9GH+Vgx5PvqlZDsihTXAW4Bnmo4Pmjyo/voQ33mYicdPkVu5D5lqbEvMoW9djayoan1ovpyRUavvnas3orsYTf6xCXB3siwP6HcDAGAlQuv6WbV0kXH/1/00lDvKy4RuZeT2Ju5W6BEKpJoPwD2j2HLFRT2EY90+RBnJxGoFtUhFyzDeBcGA4GMpZukmj7ekwC8+uLX7NFPQ0s6PwS4k5QfWyqoylVCfi80KDRBAuSMIyVy+r+n5UmuJ479/yMaPxzEBg9qm1EIoBl+1Biyv09oDidiyfEJ64sWPXsbUr7b4MrrpCChTJlNROuIpDYIHOC8ozggTk0c3qnnwn6UvLD/RcsS6xHwOhz+PmBQmavPjkhUH02f8BJZ+zY37zYn7+VwsmdcwS4sVStPGJ7QUlAP4GE1H1dt1Nx1jrblZ1qijUNrLWyj7y5SrwAmjhjJGj9ZRojH5psH7Vw/FISOe8tkVUZDPlLKNglOlMelxcW/2bVppH2jkedtBh3SPB4rTm5ELW4JHT6417vSQ==
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(36860700016)(82310400026)(18002099003)(13003099007)(3023799007)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: IZAYVCdXzw/A3tnBJrG3AmVjmDVyZdv5JZ2TqBlfHkpiP4bfe19K0/DfxD41IO7Gi7EeN3z12KRqREiQuREauhlbGKesge2/A7v/X1XcGIuDKhRJVqyGEsPdY0piNlZ1zngFgJvDjIKPS7C3GHVYC/qWx2tamE+Q9d1fhwU2Dz94sY5lE82xVTQjoQ7NWn2ryK8lFiXth4gJSPaR54ClUGnb0zXcyvKp81zJEAWD5y5qToxi8DXPpbsyQqr95ZSbPari74rTAEfFl8IgR7hDnygjENInsridwIvLqd91T45Kx4gHjWRyIWjhdojO/lmHCu5SbiJw9KgMCHFS+zyIh/hDHFGQZ1/OufSAv6gI4/fEOCVx8Z1rUjBNbPsbU0KICbhpJm3uGL7u4q9cQ3lWhDT6esdeF7LqbO6MC3dYeTVooL+1QGym1b3PfcIXApz8
X-Exchange-RoutingPolicyChecked: Aocm1H2ay0LYRmd8DTZy3JrPpv7Ky3Aac9W0UXN10cYH0/HYfj3Jn46tg1FK0ioodCT6mRlm/G1xnddjTp5xQ5IrSVGee3tOtp1yuIpt2NSS1rzk5BsFVlMSAsllVy9kQvPdRDFl+JyKxY/PTXgImXnbro+Mqdy76G5znwFz63nbXzS9ftEauaqDqe1HpqvkZFEPGFKcEuURjLmkbjQPez841AyyRbLkLjCqO5fnYG8cj2s7bPxj8ElN0mwB4gp/E3jJV7zwytvwgnYWL7StTLHMgEotgJ9qWJjCNu8x62n0Vyd2486yuMN0OuRYNIPNQgLcA1QNqNKPhhyPO+ewYg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 22:54:41.7056
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c17bf1e0-cb5b-4d73-58fc-08def3448933
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001ED.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4731
X-Proofpoint-ORIG-GUID: uAm-ajIhn8Zy7x0FUpbJtHjW8xjongoo
X-Authority-Analysis: v=2.4 cv=UbFhjqSN c=1 sm=1 tr=0 ts=6a73bf36 cx=c_pps
 a=NVT6GquIkcOJbfF4gP4t1A==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8
 a=8Qwaqj8ODS7pGffCHfgA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDE4NyBTYWx0ZWRfX9rqANM4dHnUl
 qiUh0sAX2CooKuu9xw7+DJrX+hZfcnCz7APYy9EY//LwBdutp73isX8Yi3nzT5WBkG0Z/ntF8Qx
 uw17DuKl0W/ktpNW6Zh6jAKIDTKUzlCkeDWfs4lTj5fnCkoT4rDr//U6laabF6KBBFfZZXn/9YN
 nyrc1rs0hA8cS5fAgltcmXNjW+yXuj1xl8yNYxxj8eDP14vb6rnCW6GbMpmYAkxBtqYvTe99CuM
 2VqTGUZ5KW8g4dw4h36rtc3Lv4/cgA90QgPoaThvIobnjLJPk2QoxShvfRw9stLjI2TUsIjSqI7
 Z1rmqfBq1+snoYE3uE+f4v4FZxIf4DcNB+Q051y2rHBfiW1EBpVWhrsR7pJ1MtHkjLuOqdUu5hc
 sZzOGjYlGW0lLO3BxuAVTCdbKKttxZP+CP5uYaZ+HWKM/7++G51c18pfih+DXnl3zL54pNwydRN
 FaRss7uTVBJzha8JWYw==
X-Proofpoint-GUID: uAm-ajIhn8Zy7x0FUpbJtHjW8xjongoo
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDE4NyBTYWx0ZWRfX1E6l1kulKf7t
 eCAOS32x/IWbzhmcaiUJC/wSM4/QPi2krXurfDb/z7mMGI7adO7iQxkzEhTZ9anL4D+6Bj3kzgc
 c+3LLiim17YP8/7d9gMULQHCM8zG2Gw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_05,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050187
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_155455_340639_C95842C1 
X-CRM114-Status: GOOD (  13.63  )
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

This series fixes MMC pin input/output and pullup/pulldown settings
across AM62x, AM62Ax, and AM62Lx boards.

All patches have been tested on their appropriate SK & EVM boards.
BeaglePlay and Pocketbeagle boards have also been tested.

Changes since v3:
- Include Moteen's review tags
- Add changelogs & links
- Switch out io expander patch for the correct AM62Lx patch 4/4
- Fixup cover letter description

Link to v1:
https://lore.kernel.org/linux-devicetree/20260729195958.671147-1-jm@ti.com/
Link to v2:
https://lore.kernel.org/linux-devicetree/20260805004821.416613-1-jm@ti.com/

According to review on v2 of the patch series, I included
Fixes tags for all patches. For patch 3/4, blaming
the original commits that introduced the "bug" will cause bad
backport conflicts so I tried to blame superficially and only
fix the files as they are currently structed, LMK if this is not
good enough.

Judith Mendez (4):
  arm64: dts: ti: k3-am62a: Fix MMC0_CLK register address
  arm64: dts: ti: k3-am62a: Set MMC clock pins as OUTPUT
  arm64: dts: ti: k3-am62: Set MMC clock pins as OUTPUT
  arm64: dts: ti: k3-am62l-evm: Remove unnecessary internal pullups for
    MMC0

 arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts         | 2 +-
 arch/arm64/boot/dts/ti/k3-am62-pocketbeagle2.dts | 2 +-
 arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts   | 6 +++---
 arch/arm64/boot/dts/ti/k3-am625-sk-common.dtsi   | 2 +-
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts          | 5 ++---
 arch/arm64/boot/dts/ti/k3-am62l3-evm.dts         | 4 ++--
 arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi   | 2 +-
 7 files changed, 11 insertions(+), 12 deletions(-)

-- 
2.54.0


