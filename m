Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B97ECD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 15:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ygVsa5Mz1Di22og/teUQRXXh84FKkFBaUeK6zBbHw5g=; b=1Q/X5H9nkZBeK+xsb4KfbJSXZF
	U3ddvfKek1yzkaUaDvgqL1pdU6DE1QCKs4cI32tJvr4v3rPWuves1/olvmO8L9MNueN4ieDAcmouj
	7Nom7ldGp4XHFAJXwI/CHBAS99LaPvvzfmTzq1d9qOtkjbL96nTv6WU+sID4ua/oy/j8B64U6st5q
	5xLq+xQaADaSzIhSjYPmuaTF4AL2U3yrz0WtUf0Hui9lTz75AyQ/lQ+I34XjFF8RN/1E5g9UwktIB
	qT3aRbTGdQyW3v+m9Wlit3kV7FV/Erxzq1s1ePRGc5eN8XA5oUaWiwvx+sTCTlvqDSf3IeB6bzcYg
	k3NjimhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMIb-000000020o2-0Ki4;
	Tue, 19 May 2026 15:24:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMIV-000000020k1-07At
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 15:23:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BC39B4091E;
	Tue, 19 May 2026 15:23:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91630C2BCB3;
	Tue, 19 May 2026 15:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779204234;
	bh=FN7uMzRTjAP+YHvjen/EgVPRJspom02oX8oIz1mp6rg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sBQ6ae21wBh/ta+/qjIhzUdfRxLHihreiKccr9jss5wZaufPFfOtfcsYBgVRiPNci
	 8oQdSag4QrWha0IYMcmloxwa3GYGwwdLKFYoiulY38DMpXUf2rUlOfkjM8jNkThk87
	 5y3PbeukISJGHyv9Z94w2ppkfaqUrj8DrPwboVuPsgn83PUQ6VDA0VJG3wwN7myNFf
	 qOLGIdHhQkCUhw4Fz+ElHZUy/D1tQZ21plHURJ8jdDHc53KRn/Rl/aa9Jhsb4mS/RL
	 Sp4f6+zKjbAoEifnYZSimxEn5w0t98iUAp6iqXtW2k1vi33STQ9iIldAh2E1EgkDM8
	 sDpnF1jZ8cT8g==
From: Will Deacon <will@kernel.org>
To: Yushan Wang <wangyushan12@huawei.com>,
	Jie Zhan <zhanjie9@hisilicon.com>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	Jonathan Cameron <jic23@kernel.org>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linuxarm@huawei.com
Subject: Re: [PATCH] MAINTAINERS: Update HiSilicon PMU driver maintainer to Yushan Wang
Date: Tue, 19 May 2026 16:22:59 +0100
Message-ID: <177918542479.723638.6401145981850080149.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260416095110.25612-1-Jonathan.Cameron@huawei.com>
References: <20260416095110.25612-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_082355_102791_9638FB09 
X-CRM114-Status: UNSURE (   6.76  )
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

On Thu, 16 Apr 2026 10:51:10 +0100, Jonathan Cameron wrote:
> Replace myself with Yushan Wang who is very familiar with the HiSilicon PMU
> drivers.
> 
> 

Applied to will (for-next/perf), thanks!

[1/1] MAINTAINERS: Update HiSilicon PMU driver maintainer to Yushan Wang
      https://git.kernel.org/will/c/dbd7d67b1318

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

