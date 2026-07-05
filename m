Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3FD7C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 18:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hIRVAbhVg74ibPgDqMroiyMfd0QBQnj3/npAxSfKpyU=; b=KV1Pf29rLOagbFp1hGHf73RD51
	UWVHeFkvwFx2cOw3Fh7czFXfHztROglY3lw4b+030syhrVDVbH/TkgLd6Aca7JlDN9R+d1+vIh5zW
	N+ach5NvAF6WQQfnguKcbLUrce5Sa0oFbEf1la51Z5on6mtRY5eHTDudsX+gnwxw0FqLP+RIZi9Ha
	ugALTMTyf9ICcvW42HvWI6S6O4EHzJBWF69XnE8O8DFFTuHusxpn2kKpjrZpQOstpF4SuH/XmMUTm
	a8AZSiYg8DeTBhOVXk4sD4pNQTkhyIIsYfYJ2l51C0vcGWVpFvFBvtqQ9d/PXXOByYPR2O3mwQbQZ
	TEPYCAHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgS0L-00000009Zhc-29b8;
	Sun, 05 Jul 2026 18:55:49 +0000
Received: from mail.mdapi.ch ([31.3.128.54])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgS0J-00000009ZgT-0QVs;
	Sun, 05 Jul 2026 18:55:48 +0000
From: Martino Dell'Ambrogio <tillo@tillo.ch>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tillo.ch; s=mail202603;
	t=1783277738;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hIRVAbhVg74ibPgDqMroiyMfd0QBQnj3/npAxSfKpyU=;
	b=DZ53J28fOH+t2GJWaDWNiWzmumVZO1A89FRjDM36zr7fT2zgsqfBfcZFb4paIoBLW6Hvps
	Iw3w10VgxAQ2IKFOYW0zB+OdMONm78C+xbMUxuKkIM6IHX1DVeYBzZwIVnVSSBA04t/z4O
	oM66GuOtGJ89gjUSYEP+bRQExw9mr4NWYHBylcR1s/qJA+TQ4WsSkoEeRYJLyzSwnOfRsc
	poj/JdFTb53ZVIVHxZeYH+8QgCUGXqGnzBUcizgcB77QQjn7lZ7efa3YlC5dQBFSAi1a3/
	2dcWZAtaQcV6NR2TcbRLkHBH537VlbuKrD7Krk5JrDvDP+zY1qKyuItQ3drUTA==
To: matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: kees@kernel.org,
	tony.luck@intel.com,
	gpiccoli@igalia.com,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Martino Dell'Ambrogio <tillo@tillo.ch>
Subject: Re: [PATCH v2] arm64: dts: mediatek: mt7986a-bananapi-bpi-r3: add ramoops region
Date: Sun,  5 Jul 2026 20:55:32 +0200
Message-ID: <20260705185532.139292-1-tillo@tillo.ch>
In-Reply-To: <20260528123655.2650868-1-tillo@tillo.ch>
References: <20260528123655.2650868-1-tillo@tillo.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_115547_298645_C88D881E 
X-CRM114-Status: UNSURE (   3.16  )
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

Gentle ping - is there anything I should improve on this one?

The matching BPI-R4 (mt7988a) patch is at:
https://lore.kernel.org/all/20260528123645.2650085-1-tillo@tillo.ch/

Thanks!
Martino

