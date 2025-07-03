Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 627B4C83030
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 21:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fuFwSQJm0qYvjPvmYYaerePBZ1t3oRI0ouKDTkJuxkg=; b=eTSAnkQxDbg3UC5l0G3U7cPjBo
	70gFsFDMtOHTSndhDwYiPLG3l01Bflp+WnazR78RqpBJnijZDbtGmMICw5bgodrd6dA5emP8TMu5J
	+QKI0OoDeDQbl3YwHyjKbDGQpG5Yt3RBpr6ZUCtRxuav5zlNNZC8VfAwojC5CeuLviFRBGpSVdWcC
	poupDyaZ0u6nQioXqnYhPR6jSCssI/0JDshnzSbmsmAG089YGSEynUZjjAjzhEjNTsZmR16xLwPOY
	loE+GWVYV1KPDFz9bPhgbqGynWFPbzhixozH4nbSQqTyRB98bXZhSI2rcd89KeguzTFvTjR37CtwU
	MCUA69Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXR3J-0000000CZ1u-35ME;
	Thu, 03 Jul 2025 21:01:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXNlG-0000000C9AK-44Y0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 17:30:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 23DA8461A9;
	Thu,  3 Jul 2025 17:30:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 915A4C4CEE3;
	Thu,  3 Jul 2025 17:30:12 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kselftest/arm64: Convert tpidr2 test to use kselftest.h
Date: Thu,  3 Jul 2025 18:30:10 +0100
Message-Id: <175156379920.3469134.17202297123962878376.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250609-kselftest-arm64-nolibc-header-v1-1-16ee1c6fbfed@kernel.org>
References: <20250609-kselftest-arm64-nolibc-header-v1-1-16ee1c6fbfed@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_103015_031070_A4175E12 
X-CRM114-Status: UNSURE (   8.68  )
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

On Mon, 09 Jun 2025 14:29:10 +0100, Mark Brown wrote:
> Recent work by Thomas Weißschuh means that it is now possible to use
> kselftest.h with nolibc. Convert the tpidr2 test which is nolibc specific
> to use kselftest.h, making it look more standard and ensuring it gets the
> benefit of any work done on kselftest.h.
> 
> 

Applied to arm64 (for-next/kselftest), thanks!

[1/1] kselftest/arm64: Convert tpidr2 test to use kselftest.h
      https://git.kernel.org/arm64/c/6d80cb73131d

-- 
Catalin


