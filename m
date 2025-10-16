Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF975CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 09:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ldtgl2QDb6WHs/lIjWd9pCqPEt5hb6hzzbk0mA4Ew7E=; b=fXlGNjeHpS+7AwFsTFGUx0CK/j
	zarDXLyM2yVUcNF3zhbgGW+ssETy+iaKfvL9WBHaboz29PDxCSsiGZnbxsBwu4fJQClcNZ7M8A9MW
	EpiPQ/tXWX2TjiUqUqBev41eGQWxXyULVcGq7EAgNYIcEaANdT+oXbe9XBXLpJB5FMTy7Xq5kpU01
	MUl1+CySNpLUcTFwotvZCZd4EhEx5f9u9AuLQp3fq9dSY8m48YLof5AWqSTl7mZjqpMgDW6qEBGC6
	W6OOrS2g4SptS8SDNdbjH28VzGgaAHPYpGx3FSLUrYHbrYn9dkELj7AKGHwIggXhLYmaoytviKBAv
	arZw8C9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9KII-00000004BnR-2rEJ;
	Thu, 16 Oct 2025 09:29:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9KIF-00000004BmQ-2Q66
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 09:29:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A74321688;
	Thu, 16 Oct 2025 02:28:58 -0700 (PDT)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 711813F6A8;
	Thu, 16 Oct 2025 02:29:05 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	philip.radford@arm.com
Subject: Re: [PATCH 1/3] firmware: arm_scmi: Account for failed debug initialization
Date: Thu, 16 Oct 2025 10:28:57 +0100
Message-Id: <176060686586.943664.9077379123610100540.b4-ty@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251014115346.2391418-1-cristian.marussi@arm.com>
References: <20251014115346.2391418-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_022907_648168_7B23DDD0 
X-CRM114-Status: UNSURE (   7.21  )
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

On Tue, 14 Oct 2025 12:53:44 +0100, Cristian Marussi wrote:
> When the SCMI debug subsystem fails to initialize the related debug root
> will be missing and the underlying descriptor will be NULL.
> 
> Address this fault condition in the SCMI debug helpers that account for
> metrics counters.
> 
> [...]

Applied to sudeep.holla/linux (for-next/scmi/fixes), thanks!

[1/3] firmware: arm_scmi: Account for failed debug initialization
      https://git.kernel.org/sudeep.holla/c/2290ab43b9d8
[2/3] include: trace: Fix inflight count helper on failed initialization
      https://git.kernel.org/sudeep.holla/c/289ce7e9a5e1
[3/3] firmware: arm_scmi: Skip RAW initialization on failure
      https://git.kernel.org/sudeep.holla/c/092b9e2ce6dd
-- 
Regards,
Sudeep


