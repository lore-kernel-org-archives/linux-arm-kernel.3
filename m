Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62F7AD5E12D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 05:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=exMs8dRJNb40qSDWYqjC7kbZHKIwFJKbmdXtVqWShjw=; b=i1CkdtT/INHUxa6GDR2b6t2tqB
	3ba5O8l1GoI4p3RT+uSLxYZ42TBXdJ+wGuk64DSG2FuybnORtOv8KpwP7p0TVjPD8nXF2fYRqB/Ue
	kXo9lcBHcp9lJmeVdSnoSSb90ZbL2Dw5dBTM9ch13M9My3ucEXdiWQix+nzpDRArBc8lJHzkiwER1
	802Q48ZbDTpMpI06ZBEgK1a2D1bQ5NlhRUlWcYwWpFRTqgVucpAlfi5e4XXZXFjn5uZ1s1oZralF+
	ckfv/S2pgL6knlPwRooXuaOVnZbtPKK9tORCxHd7vREeoa3/qevwc2ecKc2fZ6PprTdYaAwjQdSeV
	ERWSRU1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9HDz-00000009Lwh-2JJk;
	Fri, 08 Nov 2024 05:07:59 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9HCF-00000009Lni-1O1j
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 05:06:13 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4A855S67060913;
	Thu, 7 Nov 2024 23:05:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1731042328;
	bh=exMs8dRJNb40qSDWYqjC7kbZHKIwFJKbmdXtVqWShjw=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Rn2hkYvF7K7KgeuKuGTVmUpRIHCIamFuw5xKvt4LWWRSeXQPxN1Oz2aGwd7C1PYUB
	 j5+CR7S2ATyiTGqzjtR/hrgHTTxIftKTpaAkKbxSvue9y3tqtJ1PNDmDLaiLnShGHi
	 jEYIMzpC8sjKXM2vVmqYab3T2kk4imjwmucXCsGs=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4A855SUd030448
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 7 Nov 2024 23:05:28 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 7
 Nov 2024 23:05:28 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 7 Nov 2024 23:05:28 -0600
Received: from localhost (uda0492258.dhcp.ti.com [10.24.72.81])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4A855R5C011753;
	Thu, 7 Nov 2024 23:05:27 -0600
Date: Fri, 8 Nov 2024 10:35:26 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
CC: Siddharth Vadapalli <s-vadapalli@ti.com>,
        Bjorn Helgaas
	<helgaas@kernel.org>, <lpieralisi@kernel.org>,
        <robh@kernel.org>, <bhelgaas@google.com>,
        <manivannan.sadhasivam@linaro.org>, <kishon@kernel.org>,
        <u.kleine-koenig@pengutronix.de>, <cassel@kernel.org>,
        <dlemoal@kernel.org>, <yoshihiro.shimoda.uh@renesas.com>,
        <linux-pci@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>
Subject: Re: [PATCH v2 1/2] PCI: keystone: Set mode as RootComplex for
 "ti,keystone-pcie" compatible
Message-ID: <97561a54-8d80-4786-9171-5208128c3a2f@ti.com>
References: <5983ad5e-729d-4cdc-bdb4-d60333410675@ti.com>
 <20241106154945.GA1526156@bhelgaas>
 <20241106160520.GD2745640@rocinante>
 <4fc87e39-ae2f-4ac9-ace3-26b2b79e2297@ti.com>
 <20241107155144.GB1297107@rocinante>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241107155144.GB1297107@rocinante>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_210611_545060_00DF609E 
X-CRM114-Status: GOOD (  16.83  )
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

On Fri, Nov 08, 2024 at 12:51:44AM +0900, Krzysztof Wilczyński wrote:
> Hello,
> 
> > > Added Cc for stable releases.  Siddharth, let me know how to update the
> > > commit log per Bjorn feedback, so I can do it directly on the branch.
> > 
> > The existing commit message could be replaced by the following:
> > 
> > ------------------------------------------------------------------------
> > commit 23284ad677a9 ("PCI: keystone: Add support for PCIe EP in AM654x
> > Platforms") introduced configuring "enum dw_pcie_device_mode" as part of
> > device data ("struct ks_pcie_of_data"). However it failed to set the mode
> > for "ti,keystone-pcie" compatible.
> > 
> > Since the mode defaults to "DW_PCIE_UNKNOWN_TYPE", the following error
> > message is displayed:
> > 	"INVALID device type 0"
> > for the v3.65a controller. Despite the driver probing successfully, the
> > controller may not be functional in the Root Complex mode of operation.
> > 
> > So, set the mode as Root Complex for "ti,keystone-pcie" compatible to fix
> > this.
> > ------------------------------------------------------------------------
> 
> Done.  See the following:
> 
>   - https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/commit/?h=controller/keystone&id=5a938ed9481b0c06cb97aec45e722a80568256fd

LGTM. Thank you for updating the commit message :)

Regards,
Siddharth.

