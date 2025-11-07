Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFC96CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 20:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LzQROINM3PbbAj5ceEbHtqWz5hI6X4RXDXJsLnZLznM=; b=ePig3gjTqXc9dMUKny6wQoIuKg
	GTR0fxCEX/yR33wrnut/isOg0avVNcP0usM6ddcnZUf/3+f3NvjOkdr5SKn2GkysNXZum50g2JEg8
	e0VvYc2Ktv00Xz+863zQc16DxrHLO6ze9rod8TfaAV5pROJ4LlqWfJI575dOfkW3QB2VYVhmTm0un
	m/dZedZPoILKIuO2FEGWGwxk8PBLfemJXAd5gUid6yroe6hgX3lJ+O9buhoNPDLX4day0QgIonP4C
	z1FEp3rAqoWg+0ru5EkvifSMeYUMnAj6daAnXP6hES7GmcnLJZofsPQSU85KdJYRo47wGHPmMVoh9
	A/oJ2VeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHTSG-000000012CO-3zov;
	Fri, 07 Nov 2025 20:53:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHTSE-000000012BT-46H0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 20:53:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 690C960191;
	Fri,  7 Nov 2025 20:53:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86F57C4CEF5;
	Fri,  7 Nov 2025 20:53:04 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: will@kernel.org,
	Dawei Li <dawei.li@linux.dev>
Cc: mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	set_pte_at@outlook.com
Subject: Re: [PATCH] arm64: Remove assertion on CONFIG_VMAP_STACK
Date: Fri,  7 Nov 2025 20:52:59 +0000
Message-ID: <176254876743.3846522.17168409346525738867.b4-ty@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251103152345.175463-1-dawei.li@linux.dev>
References: <20251103152345.175463-1-dawei.li@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Mon, 03 Nov 2025 23:23:45 +0800, Dawei Li wrote:
> CONFIG_VMAP_STACK is selected by arm64 arch unconditionly since commit
> ef6861b8e6dd ("arm64: Mandate VMAP_STACK").
> 
> Remove the redundant assertion and headers.
> 
> 

Applied to arm64 (for-next/misc), thanks!

[1/1] arm64: Remove assertion on CONFIG_VMAP_STACK
      https://git.kernel.org/arm64/c/4002068508ca

-- 
Catalin


