Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40CC5EBFD16
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 08:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a5cfvD79s13RodOBSnnS6MZy+PfOZ1JpGpK2+xNbky4=; b=AwFz5Dr60glHVBNvEFsb9bj4fh
	hP3iOKHfXEj849EukLKmagf/MeEqbH7qTn6tdfBS+o9snFlYavvY5r62kjwMVr4+rpEWxY1vwSo1M
	TTqxuhnupam1Zj6R8ivzsnBYfvRRR/AWF5brp7b+4WeRPHASpqMTFFCNLCBMmLd1YnPBrmYh328LV
	52Dyw4nNXBbfM957qbjYkn6og3tPrALETAOpTTgkKYAVP8m2HO4EonNXOvqIyJUjhNaDk0WsFsAgl
	EH0lyV3fmlBuxtaXK9+P0/hiI9YIFfCceMxTUQJbsJGsmyaRBWutJ28A6RThrqXnjFvB6ThQAuQD3
	AL7DdlOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCCkz-0000000FHYH-2s8W;
	Mon, 13 Apr 2026 08:34:57 +0000
Received: from mail-m32113.qiye.163.com ([220.197.32.113])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCCkw-0000000FHXD-3oml
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 08:34:56 +0000
Received: from albert-OptiPlex-7080.. (unknown [112.65.126.162])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3a8013ec1;
	Mon, 13 Apr 2026 16:34:41 +0800 (GMT+08:00)
From: Albert Yang <yangzh0906@thundersoft.com>
To: krzk@kernel.org,
	arnd@arndb.de
Cc: krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	gordon.ge@bst.ai,
	bst-upstream@bstai.top,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	yangzh0906@thundersoft.com
Subject: [PING] Re: [PATCH v7 0/2] arm64: dts/defconfig: enable BST C1200 eMMC
Date: Mon, 13 Apr 2026 16:34:41 +0800
Message-ID: <20260413083441.1758438-1-yangzh0906@thundersoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260310091211.4171307-1-yangzh0906@thundersoft.com>
References: <20260310091211.4171307-1-yangzh0906@thundersoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9d85fa86b809cckunmf74b8d5778cf66
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCSE1MVkJKHR4eGB4eTk4YTlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSklVTU5VSklNVUpNSVlXWRYaDxIVHRRZQVlPS0hVSktJT09PSFVKS0
	tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=JZktgYiOjdFMsJrxGJj2UQzex9sE2av8KIhm6YmDwj4Sp32hnsDurgnAodc8/nRAkMyd4qcUmCxdnUoxEylVWwzIeINsScDfCcxB99q9nMdBA8oJRS4afVj63efkiPZR0J8s0z5KqliwCz7vOph8io5yYdzsTe0DUoxIKsEqbqI=; s=default; c=relaxed/relaxed; d=thundersoft.com; v=1;
	bh=a5cfvD79s13RodOBSnnS6MZy+PfOZ1JpGpK2+xNbky4=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_013455_468469_1301D39E 
X-CRM114-Status: UNSURE (   5.80  )
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

Hi Krzysztof, Arnd, Rob, and Conor,

Gentle ping for this v7 series posted on 2026-03-10:
https://lore.kernel.org/lkml/20260310091211.4171307-1-yangzh0906@thundersoft.com/

This series only contains the remaining DTS + defconfig parts for BST C1200 eMMC:
- 1/2 arm64: dts: bst: enable eMMC controller in C1200 CDCU1.0 board
- 2/2 arm64: defconfig: enable BST SDHCI controller

The MMC driver-side patches were already applied in mmc-next, so this series is for
arm64/DT review and merge path.

No functional code changes since v7. If preferred, I can send a rebase/refresh (v8)
on top of current mainline immediately.

Could you please help review and let me know if any changes are still needed?

Thanks for your time.

Best regards,
Albert

