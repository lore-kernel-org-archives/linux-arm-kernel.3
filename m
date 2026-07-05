Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D77BBC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 18:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X3s+/ParZGutlIjQLSuAI0IrbHulKPYjszcMT2PF/co=; b=fD/FziPZtszLEZwzpPE8ygpoeV
	VM+Zbu36JaW3TvIfLzLwjJJ/Crm5qgtb+2xTs80x/t/UdmgtYTWBSaQtLtaFD3XEvMk2XxoyWn2jF
	H9gjEv/osBRZaU8xCjeIf6jbF69hHH+Kx55DN+JbMBNIq90ZDs5pRxuMZxEVB49nirBqpbrX9caYi
	P0GR29VcV/QVFp6I8U/ALsibMwoMzrgoF8SLVHT4lUKETufEMx1LlN9C05ZLYojfMd+Qna2TbL+AI
	SsPtn7ZUjyOt+kVz/FQUp5/eXQHCefgTJQKola3CsIL/hir/Odke2N748wkol+BxqLrGh3AjAWDXA
	guG1wNPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgS0J-00000009Zh2-1aCb;
	Sun, 05 Jul 2026 18:55:47 +0000
Received: from mail.mdapi.ch ([31.3.128.54])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgS0G-00000009ZgM-3UQE;
	Sun, 05 Jul 2026 18:55:46 +0000
From: Martino Dell'Ambrogio <tillo@tillo.ch>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tillo.ch; s=mail202603;
	t=1783277730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X3s+/ParZGutlIjQLSuAI0IrbHulKPYjszcMT2PF/co=;
	b=NLMUdShJ9c1NiBRPaRo29NTdt5nNsMPDmvNm11/HwY+IG8GqYFGfwmn344/jnfdUqR73XK
	jLBGPmQKEGxQugLMvrwXUuw6l5fSwvNJyDl+mPif8clzU2Qg3xlZIt/nd0nmlyhbatfeWH
	5WKigcKslzMfGuelVuc32QlUvRBEDalCJpBcj3nB7nEyAyyoYO9f0YSPZ2fNEV2TM56V9K
	SG22gcmqLv0Kh0gN8um8xj4tZ0ywhmWDb6baPlFndLrp5z4pL7KZGCSUEYpWEy2C0SM31P
	sihCXpmvzTn04S/6de8+XgeJrFNRCOiYh2n/p7uwAa9mkrjqPAAPJpPRc+3hvA==
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
Subject: Re: [PATCH v2] arm64: dts: mediatek: mt7988a-bananapi-bpi-r4: add ramoops region
Date: Sun,  5 Jul 2026 20:55:13 +0200
Message-ID: <20260705185513.138353-1-tillo@tillo.ch>
In-Reply-To: <20260528123645.2650085-1-tillo@tillo.ch>
References: <20260528123645.2650085-1-tillo@tillo.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_115545_249261_FB400D96 
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

The matching BPI-R3 (mt7986a) patch is at:
https://lore.kernel.org/all/20260528123655.2650868-1-tillo@tillo.ch/

Thanks!
Martino

