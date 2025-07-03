Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77EAFC83030
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 09:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=srX6kH0UrTbZhO+d3+7kFfFmGiVeOERQzXEmjHHH1Q0=; b=qTShLdSFsydoCc4qyvtud7Z+cq
	y/LqFfUZfZ46PX710/rshPazeLf+yUZK4BE7MHWb6TyeXYR9x3BCXs/ZiFhSFFs/ANUUlDaof+TS1
	7Qd4Tfcn3xJ4Vv8PW5LVp4942tmvKb0sTLHOvUSI6z01nHCsFQ/ciARJFoCUTz9x9I3HbiRLo+3NP
	Jj7JrGXAGhOvkU/xyjSbyXMTiY6SvxqUTQtgCLn0hyq9ANBew+REdUDYjmnbfY6AbETnjEpgX+/eT
	Fzc2JesdOi9i7I+/+T5Ycw9A7Xy0efTLwzJqTOy5WuxpdpP0gVDGLX0K/evTO0bguVJ/Vn/axFF+u
	fhWUztuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXGJT-0000000Aptb-3Ycb;
	Thu, 03 Jul 2025 09:33:04 +0000
Received: from mail-m49206.qiye.163.com ([45.254.49.206])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXG9D-0000000AoDV-0UiD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 09:22:28 +0000
Received: from localhost.localdomain (unknown [117.184.129.134])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1accb52e0;
	Thu, 3 Jul 2025 17:22:14 +0800 (GMT+08:00)
From: Albert Yang <yangzh0906@thundersoft.com>
To: krzk@kernel.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/8] arm64: Kconfig: add ARCH_BST for bst silicons
Date: Thu,  3 Jul 2025 17:22:13 +0800
Message-Id: <20250703092213.222474-1-yangzh0906@thundersoft.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <d676ddc8-0e4a-456a-8aa2-15ba898c44de@kernel.org>
References: <d676ddc8-0e4a-456a-8aa2-15ba898c44de@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDGEoeVk9NTE9LHxofHRofTVYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSkxVSkNPVUpJQlVKSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpOTE5VSk
	tLVUpCS0tZBg++
X-HM-Tid: 0a97cf97ff7f09cckunmb83f96175e4255
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Mjo6Mxw5MjE9HkI8Fj0NH0hK
	EEoaCQlVSlVKTE5KTkhPTkhOTUlPVTMWGhIXVQIaFRwBE0tCS007DxMOFR8eCQgUHQ9VGBQWRVlX
	WRILWUFZSkpMVUpDT1VKSUJVSkhPWVdZCAFZQUpDSUo3Bg++
DKIM-Signature: a=rsa-sha256;
	b=NBqBLOYnDCn/2rlXT10GVPpUFrc06QR5PA2DEARJJ7Tko0jmjtlrXKxUA2Cftzxp685Pr3C8FNS/0yWYMPoajYQWahA0ElXugzahBEfppwO7wNcJodTmNCGQMi+mLRcqMN5HNLsRBSYZMeh3ZadBWoj9xVAVZhb3Iss9h5bXsEY=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=srX6kH0UrTbZhO+d3+7kFfFmGiVeOERQzXEmjHHH1Q0=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_022227_605641_A0C77003 
X-CRM114-Status: UNSURE (   9.27  )
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

Hi Krzysztof,

Thank you for the feedback.

> All your patches come in some big delays (this one came 2.5h later).
> Maybe there is something with mail server on your side?

You are right, there seems to be an issue with mail delivery timing. I will investigate this and consider using b4 send for future submissions to ensure reliable delivery.

> Why this change?

You are absolutely correct to point this out. The extra blank lines at the end of the file were added accidentally and serve no purpose. I have removed them.

Changes made:
1. Removed the unnecessary blank lines at the end of Kconfig.platforms
2. Corrected changelog placement:
   - Initially I incorrectly placed changelog in the commit message
   - Per Linux kernel documentation, changelog should be placed after the "---" separator
   - Removed changelog from commit message to follow proper kernel conventions
   - The changelog will be included after "---" when sending patches via git format-patch

The updated commit properly describes the purpose and scope of the configuration option without any extraneous whitespace changes, and follows correct Linux kernel commit message format.

Best regards,
Albert Yang

