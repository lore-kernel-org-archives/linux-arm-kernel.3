Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 700B6CD3445
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 14:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f6ps0NliofsEK4SZFJvUJrTW12RWpDlCohR9OArI9gQ=; b=oYInoEhFJbPPMe48vweJf3RZ5y
	Gk2m33f/I32GDp476vv5LD8O7LxapRNLKGPXetdH1xPbPwaUtlpC/xys+pJQESxU+W6Ufjk2FHDyz
	Yrz2cIdJmQ8Yga1/EVPwbLTUViWS4Id7U8HVx4wzxedeYOS1tHgxvdaN86iLwCyFEPJkUxIxf4wQF
	J7iSRxcli1gkb9e2XyPWSVOtveYPL+zTNiOeC1wZyPK1IyeVi7GFoE6J1+zMosFqgi2l5+B+GJWrn
	d7AbZQBkebvgG5mzS4WHbu4K/xNrSkuyLHEoAZtGiCr52u6KAW6U3KH6G6QbyjdxVapMDgQkBVMmf
	TPIbW0gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLM0C-00000006eGn-3whD;
	Fri, 08 May 2026 14:16:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLM0A-00000006eFL-2xqr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 14:16:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 88C1A42A4D;
	Fri,  8 May 2026 14:16:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82131C2BCB8;
	Fri,  8 May 2026 14:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778249785;
	bh=dtZoaePTk4X8dipva16HFTgNbUNAXrez3GknSW8itDc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=f1ZtSnRSiowqAE+O3E8ZQp9fJPzaFZmF4OqdodHXnftciKYF1E0THQh6GFuBaYG1q
	 QROrVfJ7DVcWm5HCz9kRH4mf7pt9APcAYdH4rWfheCggjzokmo5OAlLF+itx4oTFjy
	 bpPTQysVN12SmSbpNbtM4Y5zYQgxzxlXt9qJ+nABjOPDtQK1yH3e/stG6YgYC3dMSm
	 GTOVsLDmhwmUJr70a67F4UMZsn8PGPm6ET7Li12/Z94F46jfWCtTh8+k2yWPPcpwVV
	 o46Z3BtuTSFgzfEXXK2SxakbrwJHGrLGwQV6iWWivxAqWdTTnq4Q+AM/+q0v2tGmAh
	 azRLc1gg+H8iw==
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Michal Piekos <michal.piekos@mmpsystems.pl>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20260506-t113-mangopi-reboot-hang-v3-1-fa15a360a520@mmpsystems.pl>
References: <20260506-t113-mangopi-reboot-hang-v3-1-fa15a360a520@mmpsystems.pl>
Subject: Re: [PATCH v3] arm: dts: allwinner: t113s: enable watchdog for
 reboot
Message-Id: <177824978321.59995.2431541196860204454.b4-ty@kernel.org>
Date: Fri, 08 May 2026 22:16:23 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_071626_768924_9D1C0573 
X-CRM114-Status: UNSURE (   8.09  )
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

On Wed, 06 May 2026 12:14:31 +0200, Michal Piekos wrote:
> Reboot hangs on T113s boards because no restart handler is
> available.
> 
> Enable the SoC watchdog whose driver registers a restart handler.
> 
> Tested on LCPI-PC-T113/F113.
> 
> [...]

Applied to sunxi/dt-for-7.2 in local tree, thanks!

[1/1] arm: dts: allwinner: t113s: enable watchdog for reboot
      commit: c6895beaf5eab889ebdaffeb6210ad1111f3e72e

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>


