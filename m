Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6C56D10DB3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 07:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J8VMD0BkiWShbLvxfTXBSOa8Vj3bzIkg4O35bxVGg7A=; b=EciZUbiegZAv445Mz/7eReup7/
	PksIbrADgO6HwXyuXbo8mHMwpQglcewYRZyldpN5ToJAD1U8IEl6XH9sYPaHBZIYpSYeLrgoxSGoP
	znLN/osJ33FwrEuQnT0f6DRR6mgS2xJOsdUK2LfeqFDFz1vAJ3C4Vi+ZSJgxrra/n11TIegzqVCFx
	E0VaA0S9HgG4d1/cBBrXdXrynhIkoSQlD42ESmcxOMCTsEK7sczBxSNg7w5vAzyxB/W050uHhHbEf
	TGZRROQ18LgMy2z1SkfipTQ/SMt+udQ0ITSN8io4wiiL6y7P/Ch1hrHxM4tKXAGaZbttDafOUfaBj
	/jTJO+QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI11T-00000005Jeu-0PwV;
	Mon, 02 Dec 2024 07:39:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI0ud-00000005IUx-2DSd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 07:32:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 752325C63CA;
	Mon,  2 Dec 2024 07:31:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A7C0C4CED2;
	Mon,  2 Dec 2024 07:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733124726;
	bh=rrI/w0h27qiFcRLiB1wSawa+cqjjA8wFsGznCJjR4Ko=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iVnrarODfqLQ655qPXx1I73QfWdmJix3/vb2TRHKMx0YLVgmd//4wXzmckszFqsjH
	 yOOYoZFS/65WMV2vvrT8I/ayW8liEswRMbMG64dJGLJVdjXXpZnduPRGbNG9BOPk0V
	 sn0JXNhBRCeE0veG9XDNhc7+mFiMkeMFRWajAz/jzJ3vIXUM246j4pjCfaktjCPiE0
	 GNazn+X7TRxKOsGZKv7hgz68Qt79VJ88ECXsuTm9Pqj49mSMWqYrBBJMoLAntKucYP
	 CCfCUkX+xAjKhjJAyKTECJ+8TnTf0QgpE3khvN7uTIbnfIHnMGc+TEH32MP2uwtYGN
	 HLlCJU4YBUdBQ==
Date: Mon, 2 Dec 2024 08:32:02 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	Abel Vesa <abelvesa@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Peng Fan <peng.fan@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v4 01/18] clk: imx8mm: rename video_pll1 to video_pll
Message-ID: <hdpndzf6jpywogsdcgl7wwmqzgbcvhportoieieohfmp7dwmyq@l6eujnohfe3s>
References: <20241201174639.742000-1-dario.binacchi@amarulasolutions.com>
 <20241201174639.742000-2-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241201174639.742000-2-dario.binacchi@amarulasolutions.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241201_233207_608679_F1A65101 
X-CRM114-Status: GOOD (  12.16  )
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

On Sun, Dec 01, 2024 at 06:46:01PM +0100, Dario Binacchi wrote:
> Unlike audio_pll1 and audio_pll2, there is no video_pll2. Further, the
> name used in the RM is video_pll. So, let's rename "video_pll1" to
> "video_pll" to be consistent with the RM and avoid misunderstandings.
> 
> The IMX8MM_VIDEO_PLL1* constants have not been removed to ensure
> backward compatibility of the patch.
> 
> No functional changes intended.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 
>  - Added in v4

Wrongly placed changelog.

Please run scripts/checkpatch.pl and fix reported warnings. Then please
run 'scripts/checkpatch.pl --strict' and (probably) fix more warnings.
Some warnings can be ignored, especially from --strict run, but the code
here looks like it needs a fix. Feel free to get in touch if the warning
is not clear.

Bindings are separate from drivers. Always.

Best regards,
Krzysztof


