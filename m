Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A44DCCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 10:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fJHWS12yAIJaYR90psMoG46hRXNnLni76uZ22O2VXLk=; b=3TrVC6hV9tqh8stSLZV7RQP9P3
	yzldPMkp5eUGuHWudN0SigpNQ0VvR9E32aWgb1H43dmLGWNVWBY1qB9ru4hFmLTs99+Kd6JLibTZE
	exE+H3JLvwqreBP1zSpaAh0KE0+KcztHc49wv2QiH6AOXuEidauuJJu4xtRIPFyPtJ1uwWE07bg/A
	8SsmPL5U2d4nwG2vKb+Lc0FSllGJG2yIsMq601IZAmDMOdI/EUaNXgjOmZEszJCXjdD02BDpwl5P/
	VOHFcVoX4+URbNUzNSS0dUnQ67mRWKv5owek4uQVCrJppM9FyOy6konxSRf0AK6ObmXoEFur2bsMk
	8nVED1Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB9li-0000000Gerz-2aVo;
	Tue, 21 Oct 2025 10:39:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB9lg-0000000GerG-2CDg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 10:39:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2C3A640517;
	Tue, 21 Oct 2025 10:39:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 719B0C4CEF1;
	Tue, 21 Oct 2025 10:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761043144;
	bh=3q6sXrG7VRtYkwyyX371flcjfB6mMLFODYR2Y1GJ5ro=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lzCFh0QCeSof5RGIYPgGsaVe+nfXHn62yajRTCSVY6Y5LBFLXL7w8glp6OxLn0Ql1
	 Hc+Wp5iftVS8nioy0xmGRMec1B77StL0+tw4bf91loDKoDzJzgv36l3oX48nXFaQVd
	 o13FxnAfXbR7x5ewNSPsHfi1WVA5GkKcvTNlSIDovjH1rZuBTvOR6T585csT4M9YnS
	 Ke9zX83BafZh1gPaY8LFPoqgsWh2dIlqaw+rW4M86Slz5kU+9fcG+O5piM6SmiTeRl
	 lQulycs9DTZDyOmG9PFRuKgc7yY68DnfnMf3U94ZOUm4fvAbJuvyADTbkM6LDb+Rcw
	 XzfAdkChKjTSg==
Date: Tue, 21 Oct 2025 11:38:59 +0100
From: Lee Jones <lee@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>, linux-sunxi@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH resend] MAINTAINERS: Update Chen-Yu's email address
Message-ID: <20251021103859.GB475031@google.com>
References: <20251020045603.2573544-1-wens@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251020045603.2573544-1-wens@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_033904_578358_5DA704F8 
X-CRM114-Status: GOOD (  12.80  )
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

On Mon, 20 Oct 2025, Chen-Yu Tsai wrote:

> The email forwarder I'm using has run into severe problems with Gmail
> lately. Switch over to my kernel.org address for kernel development.
> 
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
> ---
> (resent to correct dri-devel mailing list address)
> 
> This likely needs to go through drm-misc-next following a patch from
> Maxime that removed himself from the Allwinner DRM driver entries.
> 
>  .mailmap    | 1 +
>  MAINTAINERS | 8 ++++----
>  2 files changed, 5 insertions(+), 4 deletions(-)

Acked-by: Lee Jones <lee@kernel.org>

-- 
Lee Jones [李琼斯]

