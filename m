Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4BF5F45A19
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Apr 2026 08:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gS8W8wlAKyrUBFoL4yR36CMl/cRNQf4VMiLlBAVDyCY=; b=KFcJBCxxeLLoLN8SMZxQL5GjTs
	WZNWajyj5Lyr0LeHmyZg9iK1F3GbxJAXNx2uthseZcvMuUsLmr68KDJNme9eVFCTCT7xO72Q1lwg0
	XZS3Uh28grpYHBJcHBBlM3XrsTo5RArnPyEapgsjTGbFCSLwYbLbutxOh8wCrdMEGjfreOjVxe+UR
	pyJCWFviC62QeYTR84JI4ZSt++5yqr1qdQX12LaBgHnK4KH8T434x35OBAtjIlDGcHsOj6bbL5jBv
	DSDTJMtzT4tTPIgrV0z/YfoC7U3aDSYSvqh0ngirhmkwY5ssC+1QXysA0P+h4aUA3ryvo+07aOacJ
	B4SpkW8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBU4d-0000000DHwC-3vBe;
	Sat, 11 Apr 2026 08:52:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBU4c-0000000DHw6-48hv
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Apr 2026 08:52:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 72F3B60142;
	Sat, 11 Apr 2026 08:52:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3DA7C2BC87;
	Sat, 11 Apr 2026 08:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775897534;
	bh=5KvS779vPydsYy9Y4qIf9xIxZNC8Qkf5w3VMNiJ8lcY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tVeEI+CmVhFJDoKSwXrbqztULsQtS49tiDPoXCvh1hTye3zEQRrPxq3BU0Qi6pijA
	 Y7UqCjQaahYL+cqDaKMxmZdbpvGTk4CXwt4nKH+xUxtbudCuB46iAjcRYnNMo+mREv
	 2ZiRZAPeXi11XlOCPj6tkcKK+ep+5I97Rhhq9e1k2nhuiSo8l2qlqgSwHAs7fdVCYZ
	 RHL67PcH83D4GWhdUC9/yPatiHfVmZ9ublNHsNWmlRJcVLTdRcBB9TmWzWQpt2yB46
	 n5vOofOlWlHJUNCg1pGNqP+nM9t5KhK9i8yPpaqsZ2QjDXyWt8WAdE5O78Irtsd01s
	 zLQEQy4Wwp5cw==
Date: Sat, 11 Apr 2026 10:52:11 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: soc@kernel.org, linux-arm-kernel@lists.infradead.org, 
	kernel@pengutronix.de
Subject: Re: [GIT PULL] Reset controller fixes for v7.0, part 3
Message-ID: <20260411-upbeat-unselfish-aardwark-39d04c@quoll>
References: <20260408094152.1698594-1-p.zabel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260408094152.1698594-1-p.zabel@pengutronix.de>
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

On Wed, Apr 08, 2026 at 11:41:52AM +0200, Philipp Zabel wrote:
> Dear arm-soc maintainers,
> 
> The following changes since commit a0e0c2f8c5f32b675f58e25a9338283cedb5ad2b:
> 
>   reset: spacemit: k3: Decouple composite reset lines (2026-03-23 12:25:47 +0100)
> 
> are available in the Git repository at:
> 
>   https://git.pengutronix.de/git/pza/linux.git tags/reset-fixes-for-v7.0-3
> 
> for you to fetch changes up to 9797524ef2b69c6b187b55bd844eb72a8c1cbd99:
> 
>   reset: amlogic: t7: Fix null reset ops (2026-03-31 17:19:18 +0200)
> 
> ----------------------------------------------------------------
> Reset controller fixes for v7.0, part 3
> 
> * Add missing reset ops for amlogic,t7-reset to the reset-meson driver.
>   The resets are unused as of now, but as soon as they are, the driver
>   would otherwise run into a NULL pointer dereference.
> 

Thanks, applied

Best regards,
Krzysztof


