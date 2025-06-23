Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4976C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 15:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YpcF2ZhSIJ+So/RYgOphDpJacDD4AlmBjE4FkDNCIi0=; b=3Hz4jgHCOD7SNeWn8wLxGKf4tt
	XAJhvx5D9MqeehseTdEwM5Dv9eWL91WjFoWBi9tvor4ztG7CG6zUU84MlUqHpuZCPpHHdqT4pBUqd
	s2hZQnutUY9xtdXACtJK9KUCdfx1eoIWNZQ7qvMMjtMUMMToR0O/9BBtgK/OAG9Z+AgFeLN6DbKXq
	8pvxE+HmUvCf2Y3H2mg/+XtXXpOBroHjCR2u5+dpuVm5wxwxqdLurH5MHY0vljIy2B1vVuTkpQstO
	3qqJEDPU5mpNIkpINeIZjxicv6AwJUNoHNvfWHm/9gho1dNrnc6QmyLvMrs3F4RKkPGgT+O2lu8h5
	LME7c2+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTjP5-00000003IlS-3Pek;
	Mon, 23 Jun 2025 15:48:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTg6x-00000002e9I-21LM;
	Mon, 23 Jun 2025 12:17:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D3D78113E;
	Mon, 23 Jun 2025 05:16:58 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1B5A43F58B;
	Mon, 23 Jun 2025 05:17:14 -0700 (PDT)
Date: Mon, 23 Jun 2025 13:17:07 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, sudeep.holla@arm.com,
	cristian.marussi@arm.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, arm-scmi@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH v1 0/2] firmware: Add MediaTek TinySYS SCMI Protocol
Message-ID: <aFlFw-AjqxXcIuBO@pluto>
References: <20250623120136.109311-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623120136.109311-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_051719_560129_55F38827 
X-CRM114-Status: GOOD (  12.25  )
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

On Mon, Jun 23, 2025 at 02:01:34PM +0200, AngeloGioacchino Del Regno wrote:
> This series adds basic support for the MediaTek TinySYS SCMI Protocol,
> found on the MediaTek Dimensity 9200, 9300 and 9400, other than on the
> MT8196 Chromebook SoC.
> 
> This is used to communicate with the CM_MGR and other MCUs for power
> management purposes.

Hi Angelo,

thanks for this.

I will do a proper review in the coming days of this series anyway, but
upfront for future V2:

- you should provide some sort of documentation for this new
  vendor protocol and its messages, as an example from IMX:

	drivers/firmware/arm_scmi/vendors/imx/imx95.rst

- where is the SCMI driver that will call all the new vendor ops
  defined in: scmi_mtk_protocol.h ?

Thanks,
Cristian

