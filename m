Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6085ECCA470
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 10:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5i0195bDU0ilvp9Zfa506MfufREMA3atUU5gCdCT6Dw=; b=OXYc8wzIMuCc2ty33YErK/Jp0X
	Ia8+5WQC1RltyY86gXYxBhm98iTxMHoNFVXcaELpu/hbnGiznQlIgKJuuCmTh8Gb4LD7YhQSPRftL
	OfRMe8iJa8i0FUSBCLMjqEs8CmG2GdWmBdwR896W6vS/MuD3Pg+ZfrlKCRIZXeaR3TiH0yaZcr0nq
	BZVGfgkE3+jJUnOTRAxsayqCT7kuIz5zI4OSbPiXTbeXLH/iq1AUWZzF8kUseFVf/FopMOxXzxie0
	2K9waA4MUHR1272/0wmYE5P+TVLrlw6Ai6eZTKRag4MBT3m/ktO5skUs6FJMzYnBBclEv9ml6dcVh
	JRDSTS1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6o0I-00000005oNJ-1bKU;
	Thu, 09 Oct 2025 10:36:10 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6o0F-00000005oMl-0o61
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 10:36:09 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4cj5nJ5c6kz6GCtF;
	Thu,  9 Oct 2025 18:33:24 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 27D1F1400CA;
	Thu,  9 Oct 2025 18:36:00 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 9 Oct
 2025 11:35:59 +0100
Date: Thu, 9 Oct 2025 11:35:57 +0100
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
CC: <linux-coco@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Steven Price <steven.price@arm.com>, "Gavin
 Shan" <gshan@redhat.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, "Jeremy
 Linton" <jeremy.linton@arm.com>, Sami Mujawar <sami.mujawar@arm.com>
Subject: Re: [PATCH] coco: guest: arm64: Update ARM CCA guest driver
Message-ID: <20251009113557.000053e6@huawei.com>
In-Reply-To: <yq5aldlka6oi.fsf@kernel.org>
References: <20251008132758.784275-1-aneesh.kumar@kernel.org>
	<yq5aldlka6oi.fsf@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500011.china.huawei.com (7.191.174.215) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_033607_378232_AA8FBD85 
X-CRM114-Status: GOOD (  14.90  )
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

On Thu, 09 Oct 2025 12:43:49 +0530
Aneesh Kumar K.V <aneesh.kumar@kernel.org> wrote:

> "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org> writes:
> 
> > Make preparatory updates to the ARM CCA guest driver:
> >
> >  - Switch from using a platform device to a faux device (based on
> >    feedback in [1])
> >  - Rename the device from `arm-cca-dev` to `arm-rsi-dev`, so that the
> >    host driver can register an equivalent `arm-rmi-dev`
> >
> > These changes are purely structural and introduce no new functionality.
> > Subsequent patches will extend this driver to add guest device
> > assignment support.
> >
> > [1] https://lore.kernel.org/all/2025073035-bulginess-rematch-b92e@gregkh
> >  
> 
> I noticed that, this will break autoloading of the driver. 

Ah indeed.  You'd need to arrange for the arch code to call the init()
directly (possibly arch_initcall() as before or maybe directly from
arm64_rsi_init), which makes it tricky to do in a module as there
is nothing to kick off module autoloading. You could kick that off
explicitly but that's a bit ugly.

Jonathan



