Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A19EF532E6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 06:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lxf5874WBrQj6OEA9G/U289pAf241AtQoKb3enrghNo=; b=zRB0r6xFoTw4dXNf52oWK6aRsT
	7pl2VgJCyloR8O05txBL+vYW+g0GTiKJV366B9OFbGupfX09O3F9iK85IuG1ZI6ZCyszDrp8hPM6q
	vUK1g9U+8VG/S28DJLfS+PAzrVwk5piiRiFCmNv21CImjE2mbv//gpcB/15lYjSlP9GKsmVI0VzCZ
	84NGCAvfnpp18RWmHXmZtNOAl40MMSVDDLxlWZ723Oe0eNQAWJeD4cYQrX/MeKRw36zopQiQVfJC2
	vwk+v8PRFOTUALFAt4GGuUp19b14bU/LbC6MS7u1lTRpm3HaXC9UyomXkn0qdxWp48vnfjP4WoP2i
	u7nNjYPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4vVY-00000000okR-3F9m;
	Tue, 24 Mar 2026 06:44:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4vVW-00000000oh6-37m9
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 24 Mar 2026 06:44:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=lxf5874WBrQj6OEA9G/U289pAf241AtQoKb3enrghNo=; b=JswaUQqxhl+JpHZjIowKbgkpup
	EoJEPKGROJS39OkVciTEV/yF9fz7wIifkZRPgGgYMtJkZnGyf+lhmEFQ/e1fUcWcLjhfWceAxc/7i
	aZqNxmrAsc559wFay8uhSbryhZQECIFpMAfxr5xpL8TqXU5wVa+wlZsiQLM8IJyUXOsa1GhEZKG8G
	qg8KmQXW2CDB+AWwDxrs82GQJ20MAnsnSNh4HQgW3Uyh+JohOkXXZjMMHQgBcSHsFusJXCzXk1hqC
	34p/omOFfIL+Ia5ZKajzsKEOGxscjUjTOAsuVyE4qlXphwte4Ht1CfpuRuz1204NsmeRzhLk3kKXG
	D+nNkc8A==;
Received: from mail-japanwestazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c406::3] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4vVJ-00000003Kap-07ve
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 06:44:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pRSmb+woxAYOvNaQ0qGu7ZFE2zzg/RSSwf1BWBMkcZkbwMXlPmAugP1aIoiqPPY7kBHo3Hp5IGNLhc5jiQGcF16Tx0unHDrC/iB4Fx2PPOFR2NxJAMFbVfV0MJeEIxBnaPl8P5i7OfuuLAjWNDfHjJvTAC5CmWuCtXkCf5PbHrqRzmw2AjG+LDJ7VUHhrofKxCaZl5ZjlQLTagYSpzYbRfU82WwagNRZdvEkSmUp3VAXASqL2tBxvA/Rsdn2urvxciXatDj9ZKYWZ0l3vkUJJoIIN/TXTyZpcOFlMGDt5+MffYwzDj6k1bZl0DE3myoydy7yrsLiBbSy9VYBgiVEuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lxf5874WBrQj6OEA9G/U289pAf241AtQoKb3enrghNo=;
 b=h3cDJCMfal/QeIrOgYVzTFC2JYsX+Zw3r7dmy6iXRLXl9m1JUwADrU3tMwbT22WBXTLqvKyn4y1HRwThXQmVdwsXBgUMVY7cvGXV+1ztF98HTX4f4kI5b/KX2mOvDUasb/NgpOO4fvYAHXmUSyIG2WtmVdXlhduThsMKm2phrj5YQGeBn+HLP4vPbSSkNQMBq3QBGB6WBKh9XEAqLzXyk2Xr1yEW0h/ZM9IV0boHe0cx9yeOD9v1cjaenDlnvOUnv7bQAcGfPUUGLNhzxcbgDMfwbLWwU3mxR5xXdwL9UXbG0f9ZGkXXhwfGmaR1taRf9ZUeSuI+OccdbUr65fXxjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI1PR02CA0050.apcprd02.prod.outlook.com (2603:1096:4:1f5::12)
 by OS8PR06MB7302.apcprd06.prod.outlook.com (2603:1096:604:284::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 06:44:27 +0000
Received: from SG2PEPF000B66D0.apcprd03.prod.outlook.com
 (2603:1096:4:1f5:cafe::fb) by SI1PR02CA0050.outlook.office365.com
 (2603:1096:4:1f5::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Tue,
 24 Mar 2026 06:44:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66D0.mail.protection.outlook.com (10.167.240.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Tue, 24 Mar 2026 06:44:26 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id ABF414126F83;
	Tue, 24 Mar 2026 14:44:25 +0800 (CST)
Date: Tue, 24 Mar 2026 14:44:24 +0800
From: Peter Chen <peter.chen@cixtech.com>
To: mani@kernel.org, bhelgaas@google.com
Cc: Gary Yang <gary.yang@cixtech.com>, lpieralisi@kernel.org,
	kwilczynski@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	cix-kernel-upstream@cixtech.com
Subject: Re: [PATCH v4 1/2] dt-bindings: PCI: cix,sky1-pcie-host: Add
 power-domains
Message-ID: <acIyyObf/MJo462O@nchen-desktop>
References: <20260313114914.1564115-1-gary.yang@cixtech.com>
 <20260313114914.1564115-2-gary.yang@cixtech.com>
 <20260314-maize-warthog-of-modernism-f74475@quoll>
 <abfEO6iW3NcnMyNx@nchen-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <abfEO6iW3NcnMyNx@nchen-desktop>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66D0:EE_|OS8PR06MB7302:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c5f8b65-1dcc-4ee0-39d6-08de8970caef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|36860700016|376014|82310400026|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: WY1C/NqsPMBlw8OfwAE1qLO6Z+VwtGj8qwoAUt/1FZAlyyHEVq//ZIFIj9J5BC9sOA1Lwqu7vDeoAiIloekbj9IT0qpzKfCTiUdwI+MKq2kacosKPIFSEbszByLQ/48QX7XZ8K1t7U28Qaxk8bctyDjlOiCUrsKtAuJs75UdsF8Ajwek0DsdF9sQohYjCQJVhFtitTyJbkkddcf3n9/MO+tidU5FWVT0exMOxFvuAKvHmlgacB8313MdJ6KvloyAVsg0zSlqfyJ2vefe6+u6PGd7dBLgJeP5qp2FlmvgabF5mQG/Jz1eYkhBar6lW2VE5jjXihmUoUNEfbVHIeFCJ+aLkaLLe3KakR4PCL1Fi53yG5AOJ3UycKBxi64SNxvgSbuEoE06xYVQJ56HXnOjmb601qIK8Mo4m1KmA3GHEJ5A9FAc5foSc1HTA67lBXOhRXDFTPgrpLkjW5YSCRDBaS1rZdcxZ6e+N7LkOjDzjcGraddhUTqxAmZyuausK1s0zvvSOOAFy7dxO/OygoT4g39JzWQp1TNdu8FyqdqoREP2Q2c5rXix+ZFKZ3jjN+yEkbf6gtd7yjuwZk3cnzClvCaiOZ/PuC5puEFNUigYS3ej7bozf6bY05hldFl4xJ3Zctb46sd9M7DZvACWMjF3+4PYxH4msrvURs35R2NsPrKdrZhqIzoq8IymDfgxUT4FDHqBLsWRAzrpMD0l9VGE//AY/7mqACtiNAr6+a+o4QcsbNx0kVMQueLZSXFLpOJifcf5WtN5o3e3mNBkGts4tw==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(36860700016)(376014)(82310400026)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: RPo3gahqE5FuaHuUWwirP2VHviPt1jtyiRUnbTo7MXk3KmTQgklwEEmq7Mm6qJ9QVzsbRwVUg05yWwbVh5bbs+PZodsvC880WC4p1onQLnX/fNVnhYJU/ykqXP0pA9ze/DbGc2965Ehil43lDK0XrwU3oft7ARTYt/6+X8xDlhSztF1Dptv/H2LwkCasopqr3GbrJmRcAPZGhcyhQFvbS2viGA+tdI87MAzXh4EGgiubZlUFW8Gzvzw+0ny5pvoxz6F/H4lM2658QyOJg9teepd3gQLae1095ye/Da1rzN2toSzuLdgEpIrYZDuf58ONEHW2pE+hgV+jrO/zMjTglMTkC7pJh7128xz/6SkGILYrSJMDMK53KwMcxI8VAgxwLKFQ6Fl07wGmiwJZGM/VIVez/PnWkjEgE7Ca5XBMi+ikgH8oMETbtzvVbtdEKy0N
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 06:44:26.5538
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c5f8b65-1dcc-4ee0-39d6-08de8970caef
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2PEPF000B66D0.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS8PR06MB7302
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_064444_817284_43373C99 
X-CRM114-Status: GOOD (  15.91  )
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

On 26-03-16 16:50:03, Peter Chen wrote:
> On 26-03-14 10:26:11, Krzysztof Kozlowski wrote:
> > EXTERNAL EMAIL
> > 
> > On Fri, Mar 13, 2026 at 07:49:13PM +0800, Gary Yang wrote:
> > > The Sky1 PCIe controller resides in a dedicated power domain managed
> > > via SCMI. Add the power-domains property to the binding to allow
> > > describing this dependency.
> > >
> > > Signed-off-by: Gary Yang <gary.yang@cixtech.com>
> > > ---
> > >  Documentation/devicetree/bindings/pci/cix,sky1-pcie-host.yaml | 3 +++
> > >  1 file changed, 3 insertions(+)
> > 
> > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > 
> Thank Krzysztof for kindly review it.
> 
> Mani, I assume this patch will go to PCIe tree, right?
> 

Hi Bjorn,

Will this patch go to PCIe tree or I queue it at CIX SoC tree since
there is no driver change.

-- 

Best regards,
Peter

