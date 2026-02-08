Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69AF2EF06E2
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Feb 2026 13:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g1UKWvWAZPS30DsVox8xrbk3QgZ4JgiuoKFzZjVfElU=; b=X/JM/j0AuASHLh68Rw8E6xoHVu
	IU41MpulrXkr/I1NEUmbWgfZoXklF2af4SjA0u0jo/h1/CczN4XcqCp8+ic+lkglkt/X8UO75e28W
	iGtIts1N+cY2H34Gkwn0uCwcbupKLa6iXuG8vjI7CpGdhm/cvMjICfBKDpncHbCEDApSMTgw/ohH+
	ErRHWegLgW42WovZLz2fjvE3hayiznXWvOfgEEQ5a8y9TWOFXqTIoHiDG0YejrgzJ4EsfAYO76Tbp
	gwwcfzCrPPe/KPhzTvWULU6vpQaSK4REx6otnqg4hRSc+w8ZCP+/i7VgAlbWbro3+onmwoH13ohgH
	Xoc0boZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vp5Cy-0000000DMZJ-1Pe0;
	Sun, 08 Feb 2026 13:52:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vp5Cx-0000000DMYk-1bEV;
	Sun, 08 Feb 2026 13:52:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 51880600BB;
	Sun,  8 Feb 2026 13:52:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0CE1C4CEF7;
	Sun,  8 Feb 2026 13:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770558734;
	bh=UDs0kVTj4IDI4L0y96iofpybYkZsWZPDP8BPk2cVUjE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ivbuju1ad5UAtUFWwVn6FU+VShKQOhNoQu+79H9uHr5GX+VzEncTzKXlMS1ZxivVz
	 QDBM7N+rXT74htGLVISw94X1SHhRobgeE1TlHsxlNEZHaSp+oixv3EYHNJIp4cT3LY
	 aX23bjqr7trdy9t4824PF+zDAevdGc7NqQVbnTerJbVbpyWfforT4mUyRp8Xz0UxPz
	 x0zYKOnvWRRIDC90RCGcBLfsUqjEfGGBzZB6xbUvBgz89xEJremxXXc5t1U+IU+RB+
	 YpU6R87ny4sFhQhsk6IbQpSPo6T442Su798GCFtv1O2brtHJnQjhKhkr2cBHEn3RtB
	 k3zPxbPKfOM+g==
Date: Sun, 8 Feb 2026 14:52:11 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: heiko@sntech.de, jonas@kwiboo.se, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, Fabio Estevam <festevam@nabladev.com>
Subject: Re: [PATCH v2 3/4] dt-bindings: arm: rockchip: Add Onion RV1103B
 Omega4
Message-ID: <20260208-pearl-ammonite-of-warranty-2c9212@quoll>
References: <20260207131803.2834749-1-festevam@gmail.com>
 <20260207131803.2834749-3-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260207131803.2834749-3-festevam@gmail.com>
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

On Sat, Feb 07, 2026 at 10:18:02AM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@nabladev.com>
> 
> Onion Omega4 board is a board based on the RV1103B SoC.
> 
> Document its compatible.
> 
> Signed-off-by: Fabio Estevam <festevam@nabladev.com>
> ---
> Changes since v1:
> - Fixed sorting.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


