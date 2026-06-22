Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B236DCDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 09:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=//Q2BswMnTN5Wfxgn1eprSUPN/0KSr0VWHHUiHGtYxE=; b=d2bT9kz9Au6KDjAFUyQBKdNNkh
	L2HQgODYHDtNYX+Y2m2xTLBW6Hw7ltK2peZeZEIr+AeLmkhhmMbPQJBEMr7CDtQVuVWb/SKNUGT7b
	AATejSryz66ESDkZ1Nfro61Uaagka76xz9r01OkhSaOHJPAV3miFuYa45yZfvj/IjgOGzPA7KIl+C
	2YEPv29SEhAOxVrreieKSjq3jz3g3EFvOPxczfioWa7rOf/TfHBz3DTrY0uORZAP3BMsCGm1mJvSi
	WWXDZvY0WLudSVA35CZf57SjJR8RIjkHTLVLaVn2CvSMGtxvp7gPmf6G2NKfyYGNp+KO2rFB905LX
	jTPr/i8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbaXM-00000004iDp-0xZh;
	Mon, 22 Jun 2026 09:01:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbaXK-00000004iDW-2iaH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 09:01:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F41D34430D;
	Mon, 22 Jun 2026 09:01:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9DDC1F000E9;
	Mon, 22 Jun 2026 09:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782118905;
	bh=//Q2BswMnTN5Wfxgn1eprSUPN/0KSr0VWHHUiHGtYxE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bYGcjHAQouBzYOga14uCNQQIf9FfQV3hIuVYk7CN08n1jOQO7yw9l8C0IsxUyMzoS
	 tfGJdFkmg6gYNqycJY9Mf2gNfENHzqANlkRmO63O0tjDyB7571Xjm1D9aTvOyfvxz9
	 ENAb2OKtIlnANWkjP/iNb6ubPcWkT2RaukSyIj1UkpIoMlrWz7PFuvke3M+BvBAGT2
	 hGnwUn3HpH9Wr2q9tXm/bigBPBoFlbr/FXYmXdJbQFjJmhoOGqj5YT5iIED12AneF+
	 X84u5BOCHAK1jDlpvIs/hg0lgamArAFuKHFfC87jt5VN9BSXfM6YtAXZS/c4v5mmFd
	 Hat6cYhNf5i5w==
Date: Mon, 22 Jun 2026 11:01:41 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: joakim.zhang@cixtech.com
Cc: mturquette@baylibre.com, sboyd@kernel.org, bmasney@redhat.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de, 
	gary.yang@cixtech.com, cix-kernel-upstream@cixtech.com, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 1/4] dt-bindings: soc: cix: add sky1 audss cru
 controller
Message-ID: <20260622-handsome-kagu-from-jupiter-8ebe05@quoll>
References: <20260622022520.3127103-1-joakim.zhang@cixtech.com>
 <20260622022520.3127103-2-joakim.zhang@cixtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260622022520.3127103-2-joakim.zhang@cixtech.com>
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

On Mon, Jun 22, 2026 at 10:25:17AM +0800, joakim.zhang@cixtech.com wrote:
> From: Joakim Zhang <joakim.zhang@cixtech.com>
> 
> The Cix Sky1 Audio Subsystem (AUDSS) Clock and Reset Unit (CRU)
> groups clock muxing, gating and block-level software reset control
> in a single register block.
> 
> Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
> ---
>  .../bindings/soc/cix/cix,sky1-audss-cru.yaml  | 92 +++++++++++++++++++
>  .../dt-bindings/clock/cix,sky1-audss-clock.h  | 60 ++++++++++++
>  .../dt-bindings/reset/cix,sky1-audss-reset.h  | 25 +++++
>  3 files changed, 177 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/cix/cix,sky1-audss-cru.yaml
>  create mode 100644 include/dt-bindings/clock/cix,sky1-audss-clock.h
>  create mode 100644 include/dt-bindings/reset/cix,sky1-audss-reset.h

Both headers should have the same name as the compatible. I already
requested this some time ago, I think.

Best regards,
Krzysztof


