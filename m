Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9683C7EE32
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 12:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qKODjalj5kWtfmO+5KSaCR9DAAEHsE9UFI8k3zNPZfk=; b=UvBMrc34Nrlmya23kXDWDbuRV0
	3QKO8nzCUFbTc8Il8OcmDZfbaBYkY2XIINmN3Jb0giEtouU/rYSWHC+8lg7UIIRXdAjgov3gbO6VS
	ls8Ab7GxVjtfAPaCinNpCwqDrKYD1/Tj019BTkuUy2CwtbtwP4qdqyz+GVz9KbA+jg9j6C7GI8Zjy
	WGyb9hDLLs/ovJxr84R2O9joEQWlPlpy2vW12KYVF07csKKAyGo41MsvpgAQNxyH69OLHkPU2g+B5
	HQihuJPgo09s6UnLt/kaxvymNIePIOztGdbgRcUwWLZEjNBNkBz9psjwCNmytzKI5acXDBwUj+s6D
	mybCnZTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUlsj-0000000BYs3-0q49;
	Thu, 26 Jun 2025 12:39:09 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUkrR-0000000BQeJ-0IzK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 11:33:46 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55QBXXfP1726243;
	Thu, 26 Jun 2025 06:33:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750937613;
	bh=qKODjalj5kWtfmO+5KSaCR9DAAEHsE9UFI8k3zNPZfk=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Z5cbikEMwGFBcMUDjwggH6FA0xT1LLslRV8AiVMoP4RfHy0HFANN/7C7AxIduqI5S
	 DTaHy0BeQLqXvX4E8d+yM3BWfpfhgAsRcXzWl2sgipAJ5vMOepG81zoHADrbgCYBKT
	 9QWC9SoE45BUNWtfrbOAXln8I+XAHJTzdL8fyoa4=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55QBXX5X3583205
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 26 Jun 2025 06:33:33 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 26
 Jun 2025 06:33:33 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 26 Jun 2025 06:33:32 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55QBXWOf1187721;
	Thu, 26 Jun 2025 06:33:32 -0500
Date: Thu, 26 Jun 2025 06:33:32 -0500
From: Bryan Brattlof <bb@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
CC: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: ti: k3-am62: copy bootph flags to Linux
Message-ID: <20250626113332.dlz7uje35wu7aiwj@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20250624-62-uboot-cleanup-v1-1-c36230ab0375@ti.com>
 <02a85bf3-0c2e-48b6-9938-c4f8a50d662b@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <02a85bf3-0c2e-48b6-9938-c4f8a50d662b@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_043345_157434_C1CCC0F8 
X-CRM114-Status: GOOD (  11.34  )
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

On June 26, 2025 thus sayeth Vignesh Raghavendra:
> 
> 
> On 24/06/25 20:20, Bryan Brattlof wrote:
> > To keep things as organized as possible, copy the bootph-all properties
> > from U-Boot for the packet DMA controller to indicate it should be
> > available during all phases of bootup.
> > 
> 
> Above isn't a valid reason to add bootph-all properties to a node. You
> would need to say why this DMA controller is needed during all phases of
> boot, does this enable a certain boot-mode? Fix $subject to reflect the
> same.

Ok will do

~Bryan

