Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE83607214A
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 22:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=w0eY+pHk;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hq7DLy2T
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gxnzr9CHNsaian4NJ4Y2SZ//tSxSvWjL6cChQq4Rrpg=; b=w0eY+pHkL/lzek
	p9eVUgA/uWjBTISUi5Mis8Te96ZYSUDqxQzwJQlgWJtD7gdJb8/tb6GMMHJRz890ax5Lwg8wS9IVA
	S4Gu7yPaYaEKSnap5S9pgBB6+43Z/B4WWfPS+dJu7h006nv+8yBGqs9CQZEtyghfD38lW9+s/8PA0
	MB5mTDBjbta5pAQ7xWYcIM070jnJ/A6pgoHFsjb2lLFDtTXjNqmbD6y6B4fEnkagkql6LUjNZf7Qx
	jx76MqaDZPQzlclcBgAf/A+/Rxqh5sfK59lCi3wc8t8eVn6wbMCI45lhmcG6lRU9MUhcecbG+B/qu
	+3fjKITW16xFg3DR+NQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdr0-0000000F0y0-0N7S;
	Sun, 01 Nov 2026 22:16:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdqk-0000000F0FL-1VB1;
	Sun, 01 Nov 2026 22:16:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E6317433B9;
	Sun,  1 Nov 2026 22:16:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C51A31F00A26;
	Sun,  1 Nov 2026 22:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571385;
	bh=gxnzr9CHNsaian4NJ4Y2SZ//tSxSvWjL6cChQq4Rrpg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Hq7DLy2TQoJ0Ctl5IHF974aTyizAE09VgM/lIznCEBIAPBAzCRF6N0R6vMGfDQh88
	 ZzPnuzDoBeE59eORO+BV0CP3mKm6caXiWgsMajU+RMHLYEpNy7F7IvqZtfGtSzb29K
	 OvLauvqUW3TWoZ+1XhQsjBL7O2SJwFzOsE3jOwNF2NV2w3SXAkwTTeblh91ABtpkcm
	 rRZbhpvWSbslYoDRFymzfG2rD+hEI3xAYDyP9byGoARdlKLPfvjqA5rrocNCwSJghT
	 3KtfqLzX2TYvpSyLxOW10IX8GiNIaZkm7iWKzry57L096cm4ZRvK26YWCxg4MWsMK5
	 sEA5Ul+BEotnA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA2C638003B8;
	Sun,  1 Nov 2026 22:16:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] irqchip: Use named initializers for acpi_device_id
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <179357138429.2624073.5733369311209292789.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:16:24 +0000
References: <20261014-acpi-irqchip-v1-1-821917378de3@thegoodpenguin.co.uk>
In-Reply-To: <20261014-acpi-irqchip-v1-1-821917378de3@thegoodpenguin.co.uk>
To: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Cc: linux-riscv@lists.infradead.org, maz@kernel.org, lpieralisi@kernel.org,
 tglx@kernel.org, radu@rendec.net, anup@brainfault.org, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 rahul@summations.net, samuel.holland@sifive.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello:

This patch was applied to riscv/linux.git (fixes)
by Thomas Gleixner <tglx@kernel.org>:

On Wed, 14 Oct 2026 12:00:43 +0100 you wrote:
> Use a designated initializer for the acpi_device_id fields which makes the
> code more readable and consistent with how lists are initialized in the
> rest of the kernel code base. Also drop explicitly setting fields to 0
> where it is redundant.
> 
> Unify the list terminator to have a single space between the brackets and
> no trailing comma.
> 
> [...]

Here is the summary with links:
  - irqchip: Use named initializers for acpi_device_id
    https://git.kernel.org/riscv/c/5919f587ea37

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



