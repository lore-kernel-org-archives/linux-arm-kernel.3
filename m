Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D26F0C44500
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 10:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b0b2D4HUXbsqu4BC8Qs7kFMu41LSyMMtamPu8J4KQQI=; b=GIfidalXVdhy5JGYuEq5TUDJ+/
	4NUe50qCdDCL4j01sZ5CeLc8cE08EoE5cbWUF+4AqCp9ETXq9TWEuneUl7wZOLb6O14ihh7fr/rX0
	DLP3+CuxWPDZZV7FJDLdaC69LAoQi+LwlM2DohSZiiM1RbAILGjzgxzMdZWa1WytzVjzLqfNuH2/Q
	0bCR+J7asnJ/I8qtYp9g4D0p3YwpQDEvFfNBNadnXPbFg5pGumz6O5lKjaAGZKwm/J7YERwontpbR
	jByAYo3sQjUSGda8iFJn2sERERIXVu8cIWddUEqzM0N145YqafFOwM0iI63Fw9ViHRQZnKR+7mBVm
	600V05bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1virVt-00000006nRc-2F6y;
	Thu, 22 Jan 2026 10:02:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1virVq-00000006nQz-4929
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 10:02:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 548F442ADF;
	Thu, 22 Jan 2026 10:02:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A48B5C19423;
	Thu, 22 Jan 2026 10:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769076122;
	bh=7h+008P1K3Q9jVhJ+zav5FmELojwMkYGr9xmOqdNFI8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gz98mo8N0KWRiRpzZFJuFpKOQg8rZBN1K/NhbZFUP4uwzzouEvz1YIW1Qu6RlEaI/
	 KCkQ54oy3nX6vm0cvgRMsKcfKyZYXdWY5F60P74m8vn6lEBYv7UDNt3iXxUorsK9AS
	 nElZ12YCTCoHdhf7Y0CRxpriIOtpwhw3QFr7TAYqCCFiYII21aMMEp8CDkx0fUXi9U
	 EFCuK0jco0RvXpF54QYpGgtf1BdISsoMdnP+StToAqmldG0zv1QIk5V9fzokcg3lsY
	 xsSBP7sMkxmi+hpgZFMgoo1cwNSbBJWJA0uEg/egL5/+0He2tMj4TxmS+JwL5Bk9Y0
	 rvtlgKiU/7rXQ==
Date: Thu, 22 Jan 2026 11:01:59 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: soc@lists.linux.dev, soc <soc@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [GIT PULL 2/3] Renesas DT binding updates for v6.20
Message-ID: <20260122-fragrant-auburn-oxpecker-33aa7b@quoll>
References: <cover.1768559762.git.geert+renesas@glider.be>
 <cover.1768559767.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1768559767.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_020203_042165_46B56D76 
X-CRM114-Status: GOOD (  12.74  )
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

On Fri, Jan 16, 2026 at 11:50:17AM +0100, Geert Uytterhoeven wrote:
> The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:
> 
>   Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dt-bindings-for-v6.20-tag1
> 
> for you to fetch changes up to f3b795d298a280687ed70211d51043ed5fc7a96a:
> 
>   dt-bindings: soc: renesas: Document RZ/N1 GPIO Interrupt Multiplexer (2026-01-15 11:56:09 +0100)
> 
> ----------------------------------------------------------------
> Renesas DT binding updates for v6.20
> 
>   - Document the RZ/N1 GPIO Interrupt Multiplexer.

This belongs to the driver patch (see submitting patches in DT) and is
not supposed to be separate pull. If you wanted to share with your DTS
branch then maybe just pull it as dependency, but the problem is that
Arnd just merged all driver pulls and this one was skipped.

I'll leave this one to Arnd to decide where to pull this.

Best regards,
Krzysztof


