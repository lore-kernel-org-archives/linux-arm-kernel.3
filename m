Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B05DE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 08:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nqIL0cwwUtlBuUNVhLd64QyBG1N1Hi2DpOdH15olLUc=; b=nTxNr1JkCVBID1EM6fFR8Rzk0L
	yDfPbN/7TmjS2xd/S2rwfZm68kqsYdpZGeS7mltGon/s/KyfR0PWp6VAkk8sxMkWQIWxhOp1/eIML
	J5E52jnxrS6cgo+Hpy5VRtuxbCtIhr8Au0Yw25pf6kSM07mAo3Qc9OxPJfwaBhD2mcEVHRBnCJijP
	CvfjIhogQlwFw/01JhSMT1tGGalqznUSRdWQl5tICKsk54tKnqgVKSBkSuyTrO8AWM3bCwIyEm/sB
	lD+jAjJ1oxPHvJMIq+wGHNUuljZoz0xw5eYBhjNZoUmuGH6DJic1DGYrtjz5rppyyUxpt/S8iwRCD
	r2f8EAhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKvhg-0000000Aj9l-44Ny;
	Tue, 10 Dec 2024 08:34:48 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKvbW-0000000AhqF-0oKa;
	Tue, 10 Dec 2024 08:28:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733819304;
	bh=Rc87LvBvn6+J4XVasrmH2iHJ/nSwY3ZpEvgbszBWm5s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=luwUgV1I0OyRSDuufyJArvmnaBDpvVsqrH8oscCnggoaRWgC0c+A/jWP5lHuyo22V
	 BoaKphfBRvsuwYk+eHlzrgPHILUXJyOc11RxCpNoSbITftd74xrnLuKRHo0HJswQjl
	 uDcjCEg4efQigcqjRWSeRAHUXFb9IW9Qej/GyaP+r7/tovZdYmeAitRefxlXJWt51O
	 IhOP166+Gs3DpBbpBikKfWSh52UCWeedGlu3O+inju+saNcnmO7Vs4LfqNb+aSMGT6
	 YYI6SgiI27gRRWC6a0LxBy4dbvFI+ZT4bVdxtYVYqsHzJT803U1aQsONTpWw3bxftp
	 0P5EzU/VHdR7w==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 712D717E1574;
	Tue, 10 Dec 2024 09:28:24 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <20241025075630.3917458-1-wenst@chromium.org>
References: <20241025075630.3917458-1-wenst@chromium.org>
Subject: Re: [PATCH 1/2] arm64: dts: mediatek: mt8183: Disable DPI display
 output by default
Message-Id: <173381930438.18469.15845444123528821647.b4-ty@collabora.com>
Date: Tue, 10 Dec 2024 09:28:24 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_002826_376236_43B7B236 
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

On Fri, 25 Oct 2024 15:56:27 +0800, Chen-Yu Tsai wrote:
> This reverts commit 377548f05bd0905db52a1d50e5b328b9b4eb049d.
> 
> Most SoC dtsi files have the display output interfaces disabled by
> default, and only enabled on boards that utilize them. The MT8183
> has it backwards: the display outputs are left enabled by default,
> and only disabled at the board level.
> 
> [...]

Applied to v6.13-next/dts64, thanks!

[1/2] arm64: dts: mediatek: mt8183: Disable DPI display output by default
      commit: 93a680af46436780fd64f4e856a4cfa8b393be6e
[2/2] arm64: dts: mediatek: mt8183: Disable DSI display output by default
      commit: 26f6e91fa29a58fdc76b47f94f8f6027944a490c

Cheers,
Angelo



