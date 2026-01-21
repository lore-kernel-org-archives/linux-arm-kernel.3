Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A737EC4451E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 11:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EHnoo6jsWKMh3RwGK+x0GrMu6SJ4jIy6xOR9GwEQ6CE=; b=FdFyP1JAyoQs2CGzbJC46BuTzD
	wZ+OjXjNo7JRdEGy2ui12Q7GX2p4TcaDc4pEPWvnhmglwStoh8XeRhQuxjJu7p4LRVJHNiyVlrUe+
	Ye4GgQn1wPHfIkaLMGDBHvW83cBao1Pxfz+DAwzUJy1wcMfZodEFOMzarHSuB2ZqYsAv5ZX4de35+
	ynxXldnPcxui5Aj4ZDgrcADGjgbNOSm7WwyW9fzee2wmZr5h4zrrzjC5bQ/jZnXV2uL49tKeNm4eC
	ICBE0IkKbpE+5ofPoJNiIePYmGp0MvD92QCuLr3dJ6jdqNhIO3TrE3/nM2nxKoy0p53ZITLt/Xvki
	EhgPHPbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viWn3-00000005NA3-3e0p;
	Wed, 21 Jan 2026 11:54:25 +0000
Received: from mail.8bytes.org ([85.214.250.239])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viWn1-00000005N9V-3EGk;
	Wed, 21 Jan 2026 11:54:25 +0000
Received: from 8bytes.org (p4ffe051a.dip0.t-ipconnect.de [79.254.5.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 3B2FB1A268D;
	Wed, 21 Jan 2026 12:54:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1768996460;
	bh=EHnoo6jsWKMh3RwGK+x0GrMu6SJ4jIy6xOR9GwEQ6CE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NKJZCtHUJI53ywbSRKz+BAeVcA/rpeZUWA7m+TgaMBgFefYc7Ht6L6xas7eZcnotX
	 pbP2TPR/lDUrp2vwBBQ1ugibuiRT2CTazgktOEHUn/D8Cg/GBVNAMXjQTYjgznNvFH
	 rujktX34V/R5exHXsaTq0Cwmst/ar8VBkgbbFJ72gBQU38T0Aoemj7mibtXBfEcBo8
	 1UDac/gTZQ6x51vKqz1OwpSER6QSUpq2mdwmDRcbbNIrErn7wyZuwhPDXjG2TL9WaI
	 86ePOCjup+gexdCw7AQc7dd4E6WUHADWnoU0RngN4RVROMLLcYa7yIW+06F0KXDwdr
	 AaZPr6TIXx7oQ==
Date: Wed, 21 Jan 2026 12:54:19 +0100
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: will@kernel.org, robin.murphy@arm.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de, 
	nicolas.dufresne@collabora.com, p.zabel@pengutronix.de, mchehab@kernel.org, 
	iommu@lists.linux.dev, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org, 
	kernel@collabora.com
Subject: Re: [PATCH v12 3/6] iommu: Add verisilicon IOMMU driver
Message-ID: <25htwrdapwwvumlaqlu5oywcnnbss5kjyvnv6cxrx42q7mfhuw@wyagcnc3scgf>
References: <20260114100922.149187-1-benjamin.gaignard@collabora.com>
 <20260114100922.149187-4-benjamin.gaignard@collabora.com>
 <3082a454-31dc-42a2-85a6-0fd0c87bf31b@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3082a454-31dc-42a2-85a6-0fd0c87bf31b@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_035423_953037_BFC157DD 
X-CRM114-Status: UNSURE (   6.63  )
X-CRM114-Notice: Please train this message.
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

Note that I stop taking changes for v6.20 (except fixes) by next week. I you
want a chance to have this code in 6.20, please make sure a v13 is in my inbox
by tomorrow.

-Joerg

