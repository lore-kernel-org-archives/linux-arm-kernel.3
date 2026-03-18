Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E5EF1077610
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 20:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VTg4GOyvgLOUc2Y0czVWhfuNoX5uHag9t34RNRrwO9k=; b=MB9f5HHecgnkeOFRAoSfjz4Hz4
	0U7CLR41lzDenSEJ0DIzZ5KCQTOShgzipDDv8mh3cCVpjIhi7CsI7ind9ycGGUMRH6vBndWrIDBiE
	UAiWuHcdtljUBdXa6nrBZeVrDsTvPX4QoXCk53sBLc+RNAFym/MUqxm2lePlg6ssyG7YEKhuQoKAK
	3Z++zR+ue1vGh0UhsAtvK/iNbD/32F+zzbZm9Kts0BkplnSNyKLDMy8J+rM/5Z2BMO0QsTcvJenk+
	/r7CyJTw/PMxljq7B23+UMRzDKPBI0Y89i6h6ir4rwdli8x4c2GOcFzK3UZPwl/sBYKrsZIwZnXzk
	sg0v39KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2xKE-00000009Hs9-0S9I;
	Wed, 18 Mar 2026 20:17:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2xKC-00000009Hry-21qk
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 18 Mar 2026 20:17:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:CC:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=VTg4GOyvgLOUc2Y0czVWhfuNoX5uHag9t34RNRrwO9k=; b=Hr6AwNwZ4EZ5bV7BZTWuo5i7/P
	as4P1y3y8F9eZ/yCodDz6PinqGeQjpcNSECC/t9+lfstLHp2Z9ypt7h3inJdxgw76wpL1WwNRSfno
	7Ld0fC9pIevngS40s8QfitX0F/+q7OXGLCF1UjIfXu8RzxkyOs8XS0xoUJIZGFzjVYIjPwIVqc2Ch
	IgicNoIL3FsoStrSbAUjI5wN8axx5F8sjJMucJjuWRpBJlMl7oJmjmbLafVPlR2ujll4yTzAHZBbZ
	M0ovuGwpRfy9rbmvqCXKi0E4v87RSHiM88UREVj9mr4YPKKaT16THHrLsAu7gyn17Yyc7SXyog20T
	nfbYEFeA==;
Received: from mail-eastusazlp17011000f.outbound.protection.outlook.com ([2a01:111:f403:c100::f] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2xK8-0000000CCiN-47iW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 20:17:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mH63NaR85gt0x0j5GRYz8Q+ikIvCvVJsjVVXZ4Lwl659nvtM7moDigaysEwYWVbqQoJydv8icnAR9FJ4hDYNWF6ABNI8htSOZiW+8VPZs7srEVUTHVnsg+qwDe8sgIEvXHuybj+klok6G/EAIWUixUBwlrFFHBJ2mPPx0Db8AZFvEXUOnwCcgyfjupLHR0vEeWq76f89omp04m8Tvgl+nimtpVkKSwPgRRVjRb9J+2ShYNENKBHfjcuWfXGfrvT9Nb6X4sUFHhqdA7I7I1ytGv4yyuJ9KZVB5woaFLnLhi4wRP9+eW0JkK9MNKk/XkQU5QfH3djd5IBBN1FOR/vV5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VTg4GOyvgLOUc2Y0czVWhfuNoX5uHag9t34RNRrwO9k=;
 b=x7N6nu/i0QdbsQT2E7v8IgYnYJBQhWbV9jV6ueCovdaRuRz2X46K93lDK4Jv47eduH07H1JFtG7iM9vqKBzRz4LaYhBmyunQKZLxXlcndQSNIsjWVfomyamP7Yk9v3aTOd94rVclnWJjewv/CCHJBMYwPbuki27d6eewnFmnxhkbLBgU2kVrd8oaeeBB2lSjw0ENrAgh4VIh9+WGV3tJlRswp6wsnfGqHgH0IbcfdfX5iFv1M2TqKsdXncm7hmUIFzXZ2pp0AVnYCpfnF6m/v+hE3x+SyWuOsniRBtpWBsfjzCTSU8Y+5evC0n8y692QbjM/5xK6FKWV7sv/FjTlPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VTg4GOyvgLOUc2Y0czVWhfuNoX5uHag9t34RNRrwO9k=;
 b=IdiEHfK9Axey6szwvcsUbCwvMO5yuPgH2l5JGttOxB72DBjvLDDEwLFdW5k3oBmYbWeeL/4U8iV7+4chdTfe4Bde/8UufMwGZlUk2USiR4HuLAXZp45DKcZmRedbwCWFM1GFFZFnleUklHClbd4lDpSsRqc+sJJw+3rGhHgzdiRdHpd0C+2KA0Rc+PYAausYDvXeOra4QNpafQW8xWcDzgID3U2FiZufWcAfeHPd3jeC1/+vLiUqfaB21SK4oxR+Ad/g00VajUGTOZZABgG/F1zd9oThuWROWtr+NC78tqSWTgU0jRb6V4I2/oSjxY1pzkTnyyR8n20tziMj9Jg8Jg==
Received: from BYAPR05CA0020.namprd05.prod.outlook.com (2603:10b6:a03:c0::33)
 by LV3PR12MB9142.namprd12.prod.outlook.com (2603:10b6:408:198::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 20:16:53 +0000
Received: from BY1PEPF0001AE18.namprd04.prod.outlook.com
 (2603:10b6:a03:c0:cafe::32) by BYAPR05CA0020.outlook.office365.com
 (2603:10b6:a03:c0::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19 via Frontend Transport; Wed,
 18 Mar 2026 20:16:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BY1PEPF0001AE18.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Wed, 18 Mar 2026 20:16:53 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Mar
 2026 13:16:32 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Mar
 2026 13:16:32 -0700
Received: from Asurada-Nvidia (10.127.8.9) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 18 Mar 2026 13:16:30 -0700
Date: Wed, 18 Mar 2026 13:16:29 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
CC: "will@kernel.org" <will@kernel.org>, "robin.murphy@arm.com"
	<robin.murphy@arm.com>, "joro@8bytes.org" <joro@8bytes.org>,
	"bhelgaas@google.com" <bhelgaas@google.com>, "jgg@nvidia.com"
	<jgg@nvidia.com>, "rafael@kernel.org" <rafael@kernel.org>, "lenb@kernel.org"
	<lenb@kernel.org>, "praan@google.com" <praan@google.com>,
	"baolu.lu@linux.intel.com" <baolu.lu@linux.intel.com>,
	"xueshuai@linux.alibaba.com" <xueshuai@linux.alibaba.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "iommu@lists.linux.dev"
	<iommu@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-acpi@vger.kernel.org"
	<linux-acpi@vger.kernel.org>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, Vikram Sethi <vsethi@nvidia.com>
Subject: Re: [PATCH v2 1/7] iommu: Do not call pci_dev_reset_iommu_done()
 unless reset succeeds
Message-ID: <absIHQIDAicBEwm0@Asurada-Nvidia>
References: <cover.1773774441.git.nicolinc@nvidia.com>
 <21fa71d59c8ab787c0f3d8cf3e9fc725330fd0d5.1773774441.git.nicolinc@nvidia.com>
 <BN9PR11MB5276706AE4E0BBE86F0F6E158C4EA@BN9PR11MB5276.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <BN9PR11MB5276706AE4E0BBE86F0F6E158C4EA@BN9PR11MB5276.namprd11.prod.outlook.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE18:EE_|LV3PR12MB9142:EE_
X-MS-Office365-Filtering-Correlation-Id: 254c09fc-710d-460a-9ec5-08de852b4b95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|376014|7416014|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: /qK+tzBcvY4vqP1sRdJAlUVASPYJlgZdxQooyehwb3pwhgoG2rIM6QeAxGx/v87Efbc64cCd+G2WLejFZ6uICCSLg5lYLGZKum4L/s0Y5VJiEU+QSJNQp/lt4A6olBE5e4qfohhg+dsT85PvQDwkSRuSXriAR2HFpiEorDb9437ACWqtI1mgYqmLrjSflJpF/3s4BRitBNcaxQWy2He01eXelfR4VFVzXr/FvCs6ae9cOiaWAULIA69JRRvC8apCqJ64Fzhwa8HARdvCLFdwp8wyeWk8JqTAzj2AjAhvEVGW8AzhmuAKWAU4IqoO5rJ/bmRy+wtQxtt/3rytECT+eQG2pVdvcBDXlrsHCaFOxH9pUw8Yk0kCiPXSqALR3bKnmiZgfSwCswMHwVH9Mj/IyEhb4XKsX5RGdR+EeUXz9G23wRLme45JyYKa4oM3nz1KHHsxFlmmOI2VHB3yyuNHimzrAA2ubjly9oNHdmzSQLXQ6q/PGBC+IRG3pn9dOUkNyn9wW8lVEaXpRiHFLM8vXmXpWqXwqL7cefgpAPBs3BWA3VHeS4D1XAmE7Gb5AWZookDTf/KPn40lTy4svTmUo9VOPez4LW3G1wZDGzLzwmabX1KUC9QZImiUU0vk/GeLcBnaJxtqB7jjLJaA39q79FhevFKlvNTcyaASExcgwSZIst/pmPGTW0IjNwO4QDSCOvgWTw+3dDdNnu5IPUkSvc/7U/fNdJhd/widZ6BtONmn27QISlN1HFIZtxwI048tjRtQzTd2PJn3zug1te+xhQ==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(7416014)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 0jFR8pTO5QeICnQJF2YR2vC5gE1akA2ExTolKEZPquUrVNG8g4rZbS8c69BEBdr5Ze2eLx/f97QAopWxPS3tgfCWaQlGmggJdiRD1dqPCZap67pu8WJRv+yhZjUjoApfmy+aokmxVH2zW2IK4Q4dCTCdNBSsSdcD3OXzg8G9xnRNMm7DXIiYgORUHOK8IBfsBO8csk544ThHfawdWgVdgk0jxqOxq8JxGN3/WTyYHDQJwij3rak6C6KwOmrlXk4PkfSLoGzyluV0g6IaNw8jo9Dokl6yxfSC2wmE1oxJR5Jd3JPdxpisLaDqgyyW42rb4MdiF/0GUN4axcYDSIEghhjgfHwnjNcwPTA4QB19LSRVZAroyUvyaLlkGN5Wz6YUJpJIsA57mfs2VTHaKHIudW2la8Fa8BdtmfsLpIDWdRMw4OqQAF+74Ue2NE/Hhh7J
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 20:16:53.0951
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 254c09fc-710d-460a-9ec5-08de852b4b95
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE18.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_201701_123616_52F5F4A3 
X-CRM114-Status: GOOD (  15.16  )
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

On Wed, Mar 18, 2026 at 07:21:53AM +0000, Tian, Kevin wrote:
> > From: Nicolin Chen <nicolinc@nvidia.com>
> > Sent: Wednesday, March 18, 2026 3:16 AM
> > 
> > @@ -977,7 +978,15 @@ int pci_dev_acpi_reset(struct pci_dev *dev, bool
> > probe)
> >  		ret = -ENOTTY;
> >  	}
> > 
> > -	pci_dev_reset_iommu_done(dev);
> > +	/*
> > +	 * The reset might be invoked to recover a serious error. E.g. when
> > the
> > +	 * ATC failed to invalidate its stale entries, which can result in data
> > +	 * corruption. Thus, do not unblock ATS until a successful reset.
> > +	 */
> > +	if (!ret || !pci_ats_supported(dev))
> > +		pci_dev_reset_iommu_done(dev);
> > +	else
> > +		pci_warn(dev, "Reset failed. Blocking ATS to protect
> > memory\n");
> >  	return ret;
> 
> let's pass the reset status to pci_dev_reset_iommu_done() then
> put above detail inside. 

Yea, that's cleaner. I will make a change:
@@ -4014,7 +4014,7 @@ EXPORT_SYMBOL_GPL(pci_dev_reset_iommu_prepare);
  * Note that, although unlikely, there is a risk that re-attaching domains might
  * fail due to some unexpected happening like OOM.
  */
-void pci_dev_reset_iommu_done(struct pci_dev *pdev)
+void pci_dev_reset_iommu_done(struct pci_dev *pdev, bool reset_succeeds)
 {
        struct iommu_group *group = pdev->dev.iommu_group;
        const struct iommu_ops *ops;
@@ -4025,6 +4025,11 @@ void pci_dev_reset_iommu_done(struct pci_dev *pdev)
                return;
        ops = dev_iommu_ops(&pdev->dev);

+       if (!reset_succeeds) {
+               pci_err(pdev, "Reset failed. Blocking ATS to protect memory\n");
+               return;
+       }
+
        guard(mutex)(&group->mutex);

        /* pci_dev_reset_iommu_prepare() was bypassed for the device */


Thanks
Nicolin

