Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3790E7716E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 18:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e2bpdCq6L6pJ31eEQUTbG1MbK7fY+12p5ofU0+qRenY=; b=z3AjRxEknYyqzpDgEc65fALLwE
	b4LepIahiuZJwfcNbdfQeRmty44vPdl+0XvRrv15xIx8Sw90wOjkLrEYFE91MPX5Z3xVfWOdsNhC+
	shi0QE8HZ2XoimwC9Hp7qN1ott+pQPF7CHtfsAIIfuRCGek1sJQK43OoPIsZWHREMQqtf3TKfMA1z
	3Wy3nQYgygCPWaW3UnPk9s8EtF2UInIlOEO9mZjyOBNiD2qev/odIPtWnXeECW0u/bzQ25HlhXggP
	bkTqB1LPLNedAMukPfUQH+KpRd7peMezIQQA6dWNs8atDZblpzhl+HDZ7hTr+J1cxam9Cwd3ZJl0X
	aPq95vgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJGZq-0000000H73K-2TOU;
	Thu, 05 Dec 2024 18:27:50 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJGW6-0000000H6d9-2lKR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 18:23:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DCE37A437C5;
	Thu,  5 Dec 2024 18:22:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36EBBC4CEDE;
	Thu,  5 Dec 2024 18:23:56 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: will@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Dan Williams <dan.j.williams@intel.com>,
	Steven Price <steven.price@arm.com>,
	Sami Mujawar <sami.mujawar@arm.com>
Subject: Re: [PATCH] coco: virt: arm64: Do not enable cca guest driver by default
Date: Thu,  5 Dec 2024 18:23:54 +0000
Message-Id: <173342292874.1735998.14336440611825426443.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241205143634.306114-1-suzuki.poulose@arm.com>
References: <20241205143634.306114-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_102358_765206_979CDAE5 
X-CRM114-Status: UNSURE (   5.86  )
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

On Thu, 05 Dec 2024 14:36:34 +0000, Suzuki K Poulose wrote:
> As per the guidelines, new drivers may not be set to default on.
> An expert user can always select it.
> 
> 

Applied to arm64 (for-next/fixes), thanks!

[1/1] coco: virt: arm64: Do not enable cca guest driver by default
      https://git.kernel.org/arm64/c/16d5306629c0

-- 
Catalin


