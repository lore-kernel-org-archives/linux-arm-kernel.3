Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13241CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 08:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OJeQdj+r1ZFu2vWzwbCWQs5gW8jjy5Mm335Q34E1WTQ=; b=gyKDkNJiWEOM6cB9b4KCQFoS0R
	8m1mBbMa8RyoJGpv1trviYDno8GMo9tgfjVNrqD5u7/iJHnX5tXODWrVQTVQR+T3ldh/3gtXPHb8g
	nG3uWXYtywji1MoEyvtgiQ0nKmwt+BwmAZ+FPKI9WF8Gp6N59KXeGhscAYuo6Vca46lmbKxpa+VDv
	mEWLCe5oQKpHS3uX6iwtrXzLauNLCuQSdXafml15Af6URz0DQ/fyBHFG2VfaHVMhkxofFAhsJc5aE
	skoJkdQnFHlPZu8XOXhTqew6quaGrVnUSc1Es7EhxK8mHHXdCVp3FWVx5qMLaVT0rksCzUaui/W4Y
	tcBNRICg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUKiW-0000000CaiN-3nAQ;
	Tue, 02 Jun 2026 08:43:20 +0000
Received: from mail-m121148.qiye.163.com ([115.236.121.148])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUKiT-0000000CagE-2Lph
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 08:43:19 +0000
Received: from albert-OptiPlex-7080.. (unknown [112.65.126.162])
	by smtp.qiye.163.com (Hmail) with ESMTP id 40bcd4a9c;
	Tue, 2 Jun 2026 16:43:03 +0800 (GMT+08:00)
From: Albert Yang <yangzh0906@thundersoft.com>
To: arnd@arndb.de
Cc: yangzh0906@thundersoft.com,
	bst-upstream@bstai.top,
	catalin.marinas@arm.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	gordon.ge@bst.ai,
	krzk+dt@kernel.org,
	krzk@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	will@kernel.org
Subject: Re: [PATCH v8 0/2] arm64: dts/defconfig: enable BST C1200 eMMC
Date: Tue,  2 Jun 2026 16:43:01 +0800
Message-ID: <20260602084302.2101364-1-yangzh0906@thundersoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260427062329.3715925-1-yangzh0906@thundersoft.com>
References: <20260427062329.3715925-1-yangzh0906@thundersoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9e8780271c09cdkunme64f759f430087
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDGR0aVkIfGkJDQxpNS01MQlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlKSklVTU5VSklNVUpNSVlXWRYaDxIVHRRZQVlPS0hVSk
	tJT09PSFVKS0tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=AE6I+cDs3Te8sSPwLPNmXaZFtJPNpU0siz6kaUMLNLom0SAuoJD8g7D/+tG5bnhrcW3GjB3yfJ257soMoJbmvriokAH0MPQxNbSoHXj57R6Yrk2CeMXJu1G4JVCL+IMmhwSYSl0DdRbIotL5h59SjwLx4Tv6ebluQ/PSpanga7s=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=OJeQdj+r1ZFu2vWzwbCWQs5gW8jjy5Mm335Q34E1WTQ=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_014317_973694_B7E074C7 
X-CRM114-Status: UNSURE (   4.49  )
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

Hi Arnd,

Gentle ping on this series. It has been about 5 weeks since v8 was posted.

The MMC driver patches from the original series were merged via mmc-next
in v7.1-rc1. These remaining 2 patches (DTS + defconfig) are still pending.

Both patches have Acked-by: Gordon Ge <gordon.ge@bst.ai>.

No code changes needed — still applies cleanly.

Would you be able to pick this up via soc tree?

Thanks,
Albert

