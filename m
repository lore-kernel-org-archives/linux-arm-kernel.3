Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A1FECCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 20:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9amNP/JntY57V5aKbomw8j9bwpZYf42WoRqmmZq05p4=; b=k7afjucOnbywwsQcU0gk22TPIc
	cIsmXpHR68r8og4BOvSACXXIOimdIVCpMCphNMX0ooz3eMqdxPZZx/XW0mqFehP0551+YQq4ZZPF0
	wST4uNpNHRD/9Kl23OEl/4U+Cdq2xLxiREWu1xkeyF46G7Be3H4Zn85a5ws/nU33uMwoypitz+Qrh
	fnxW7pQfZoBVHls3EaHA9RK6xo+T2BA5FSi2YDQFXN7tvuWIMNw8rHusUE7aljegDYwM5yls5p1C7
	ofZydvCFz2DfK8sMLhdUdS+UQ5JcDV+LoPgbzxrNqBWTn3MGe+rpaxHdsgBsm6TyOVDJEtyYmsfwB
	0jkxcj/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIuo3-00000007jDD-14W1;
	Tue, 11 Nov 2025 20:17:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIunw-00000007jBN-2QKx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 20:17:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4331743791;
	Tue, 11 Nov 2025 20:17:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29B49C113D0;
	Tue, 11 Nov 2025 20:17:26 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] arm64: entry: Clean out some indirection
Date: Tue, 11 Nov 2025 20:17:17 +0000
Message-ID: <176289222848.1642362.2099543763028619852.b4-ty@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251105-arm64-skip-indirection-v2-1-0ea38e853b5c@linaro.org>
References: <20251105-arm64-skip-indirection-v2-1-0ea38e853b5c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_121728_636192_6A6C0103 
X-CRM114-Status: UNSURE (   8.94  )
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

On Wed, 05 Nov 2025 15:27:01 +0100, Linus Walleij wrote:
> The conversion to generic IRQ entry left some functions
> in the EL1 (kernel) IRQ entry path very shallow, so drop
> the __inner_functions() where appropriate, saving some
> time and stack.
> 
> This is not a fix but an optimization.
> 
> [...]

Applied to arm64 (for-next/misc), thanks!

[1/1] arm64: entry: Clean out some indirection
      https://git.kernel.org/arm64/c/555827a06456

-- 
Catalin


