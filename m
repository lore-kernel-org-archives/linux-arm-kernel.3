Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06094CA5FCB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 12:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QTqQJkL63ohXjWLssut7aVeNBPbNyPoug3s4cPnbgPw=; b=FUB0SBtbR/BRZJI9RjrkYHqsY1
	PTds7/dVz2ZEXS4f+U8E6scQUDjTiwcNoNuw7eClH73K39jLNf+M1PCzX73+MOBN2ctRd9iFJV0Rx
	VjJE3wCu1XTc5BUYOxt9OlkY/f1L1VVrKi0pngBtZy6LG+ZsTK7ZvKxOv4PBDmnAz/Mf5+4LdyxzP
	84VNrjkUTUSW/j7CEMDAwo9CNnN1lkseuTqt/HBxSaDNQnqnHwFj5OW3uPGmQrIka/G+S0qnyTSEs
	SDjP2b/MaygHk06dm0Nj8novbbfEosYVBEQ3Bnqr4NlfIc1sXN5m6Z/2eSwLuoBsdOnwV9kp8JEAM
	WQa0yPGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCFcz-000000091Sb-2wqd;
	Thu, 01 Oct 2026 12:11:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCFcx-000000091Pf-2pvY;
	Thu, 01 Oct 2026 12:11:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 338484360A;
	Thu,  1 Oct 2026 12:11:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 493451F000FF;
	Thu,  1 Oct 2026 12:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790856667;
	bh=QTqQJkL63ohXjWLssut7aVeNBPbNyPoug3s4cPnbgPw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=i8/6oesk+nDhLAbk7K5hdssv8WTn/KKU/k/hD5wI0EcIm6J3f3kLBNo8TJCyL4jMp
	 zqWNuit5QKwBo7ymBSYCrhOmTjNsxXVsGUUCedu9uB2986F5RpZMeUTPIV5jFR6hRd
	 F2t0f9hLMrx6+YS0IbaFQfGMQip4S6lwNWuYc46ypZjIj8Y197cs/LsvnQM08eXIjf
	 1VCGnnOXafqZiPC6vwpWiRf7XiqQsZ9K0bgBWj8NKi+cOszmZqlouA0SuQWy0Y7qVA
	 /0iYpGdf6krAXkwJWoK/maXimWzImltBx9Ez/TFLrnPuKTc7lQa2oZamRxSEpjBMfe
	 2YEeyM22dGyZw==
Date: Thu, 1 Oct 2026 14:11:03 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: arm-soc <arm@kernel.org>, soc <soc@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com
Subject: Re: [GIT,PULL,2/3] MediaTek ARM32 Device Tree updates for v7.4
Message-ID: <20261001-thundering-durable-seriema-0aae1a@quoll>
References: <20260923103222.25504-1-angelogioacchino.delregno@collabora.com>
 <20260923103222.25504-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260923103222.25504-2-angelogioacchino.delregno@collabora.com>
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

On Wed, Sep 23, 2026 at 12:32:06PM +0200, AngeloGioacchino Del Regno wrote:
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> 
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git/ tags/mtk-dts32-for-v7.4
> 
> for you to fetch changes up to 2e195497fc9fc0dd89cf95dab80a2d0486dab65b:
> 
>   ARM: dts: mediatek: Add basic support for Amazon ford board (2026-09-10 16:41:20 +0200)
> 

Thanks, applied

Best regards,
Krzysztof


