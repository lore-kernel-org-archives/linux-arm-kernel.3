Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3AFD606A324
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 10:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3AsSm/Y9;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mY31B47N
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=BMQUGc8pOLTnBJyiTlM+ASww/xGX9AxzZ/D4UbJM1AM=; b=3AsSm/Y95XjVPR
	qgenGGrZfI756aL17T0UCUuRwnenKM/bCUND705mmV9JlOjAqvICChginPQwO6Rt/1NrE4xA+XNjP
	yXgtkCKKAWYwrgfBuFi6sofbhKkDA6aR7tl4k4KS/4AKx9Rlq69QeiXJ5cmiYIa3BzlOrFjApcm5a
	rIl1tO1zP6DqaJrXyB5OaYUXT4N/Y4rINcepwpQHS9ezdUgFu/BdGoKJdA+2wt6FfAieEyFVil8v1
	kgbbz6eaKh3PWnRu/0PO1juAYuOkzLSGm/AFayzCd/Yg5h63IxkMiR3UW6MHmLGE85b+hOIMp/hL1
	sfF8mieHmEuAWTNJcu/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNT6l-0000000E6OJ-3DMM;
	Sun, 01 Nov 2026 10:48:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNT6k-0000000E6O7-1xM9;
	Sun, 01 Nov 2026 10:48:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E0F5643B15;
	Sun,  1 Nov 2026 10:48:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7C421F000C1;
	Sun,  1 Nov 2026 10:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793530093;
	bh=BMQUGc8pOLTnBJyiTlM+ASww/xGX9AxzZ/D4UbJM1AM=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=mY31B47NXm9vGgMA+O9hBvNDxrddozkZjkpapkt/B3TSXFuUrdFVjc6lNgTHiI8GO
	 fpjgx7DylENb/VlnXkCAJSkJ60ODYFBuD3pyQTFlgzsxRAhn0P9QUU+3UHN3QCQeSU
	 nW/M7Wo8eRORGAV7G01YUK4ZDiP6f+l24m6QiOFlqzpsJG0EEKURat59A4RA/ropDp
	 Hh7nOCrZ8k6gqEnrJQDPTVtYLaDmG6Y9Rrw6pnjD9IgoQ45utVTA48hnyTBDpMu92Y
	 TuVxPddN8wRZTkD8oTPPtSsSHgeZZ15ENvHqNEKeg1dMGMWySYlAxyJDfyz9jBwfZw
	 mem4r5y34xRzA==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] phy: rockchip: inno-usb2: Remove redundant dev_err()
From: Manivannan Sadhasivam <mani@kernel.org>
To: Diederik de Haas <diederik@cknow-tech.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261021102155.609575-1-diederik@cknow-tech.com>
References: <20261021102155.609575-1-diederik@cknow-tech.com>
Date: Sun, 01 Nov 2026 16:18:08 +0530
Message-Id: <179353008876.2955.10222865416793608606.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=470; i=mani@kernel.org;
 h=from:subject:message-id; bh=d9qcRACxYqkzjfsatuzXIuqur3dqsdhTxFTZxd6NSNY=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBq5xjqQdU3ny5oNfS60dQBJ4ap7IUaL4G8WCWNS
 y3cxGPUrrKJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaucY6gAKCRBVnxHm/pHO
 9biACACXgFhrDkqPj23vKCbn037hqK6+nC+dX29PpgBSCwTZQgNw0N5SJ71VKP5wXZiZ25dB2ft
 OYM9GrpQFGbikPmT7qiGGUZKEnedYTEVJsZbqMxl7Ulqc/JQyfDErI4CUBPjFYst0euX7J0HEOz
 craIYHCilDNRAdWRpAKDjuAfHdCXfVdrpkmXTeTDYIKK+ZHoUk3krbvtXmBOo3/5PLNAf15gvaa
 x+rk9lDCRhabAV/DJhjGoQuhFKPLiqgm8lhFCxj3PB3zScTxk5ZpKCHJZj3+jeG8ym0kaxloQqX
 Rf0U+s2QPQgKJGM0ffU0Zfdn+TAQNrmbr8ZFR+adx37sFlj4
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-10-21 12:21 +0200, Diederik de Haas wrote:
> The devm_request_threaded_irq() function already automatically logs
> detailed error messages on failure since commit
> 55b48e23f5c4 ("genirq/devres: Add error handling in devm_request_*_irq()")
> So remove the now-redundant driver-specific dev_err() calls.
> 
> Signed-off-by: Diederik de Haas <diederik@cknow-tech.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani



