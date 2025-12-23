Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0BB4E6B272
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 11:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n3blCkFD2bGyqrCdYZcY3qId+HQBSwff9c2RA9slkbk=; b=lKwZIH5VbzWMmkfQ2VD53wKZNg
	Bz64pnVRiR8lCd4HgQG87zLvNdlG6+t+6jP8Dex48gVkHmKaaFwzoZb/Wzfok48YcSaxswOLw4X3k
	xVP1G+l8ek2aolXp/x9TF9OEPZ+yK6AjIUfBDXnUCcm28dXCEPPjpLikBFGcmRiI4pDqjV08xspDK
	Uc03E3W9PIyVtLUyJioblaNgdp5mhjUcpMR83owPhDjq7yNZtewcJVOyFoGuMMH1/OH+K4WYn1MNT
	9Wk2Mhh1GWpnw2DD1xHthcV8l2kVbn8roSSubhajIg/285xftupJCjLwIL8Vl6Obdv3s62+/tD3Ow
	oevnKeyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY0ZM-0000000Ewty-0kOb;
	Tue, 23 Dec 2025 11:28:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY0ZD-0000000Ewn8-0XmL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 11:28:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A66E044429;
	Tue, 23 Dec 2025 11:28:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26E1EC113D0;
	Tue, 23 Dec 2025 11:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766489318;
	bh=Tm8R2leKhxvnmeFGXEZGpqxajmXEOFr0rcTR1ZihUU8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=JCBcBDjlQFTElL7ukWRUxSymq3CFEcVXnU2TlXqMIlrSVcq2refTFz7qEtg36PJln
	 jeJFkUO15tP/WrhZWKW74Lg8db2O7Edw5kMykz4+3XrZQkkdrmfF43SevQWDP7t0nQ
	 z9ZZJN9VebljRdwvPVdYKZWCfSneJj1yfYRMFEuVPXC4LWXCJGDgl4ih2fQrbpJ5b9
	 +/eKcBNwatf3sCIUl9y3bSqXbHFdZxd32yPYInibaZ4uaBLu4kVGbQYMlLa5YfvcVM
	 qtyWKlDeZdruKoOI+k09VtyDfAxjOOAe9r7XQd3biOoAYFr7t+fA0J0tiXfkzyzDIX
	 Aj9ErDx/zMBSQ==
From: Vinod Koul <vkoul@kernel.org>
To: dmaengine@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20251106022015.84970-1-rosenp@gmail.com>
References: <20251106022015.84970-1-rosenp@gmail.com>
Subject: Re: [PATCH dmaengine 0/2] dmaengine: st_fdma: support COMPILE_TEST
Message-Id: <176648931679.697163.16396174417183020187.b4-ty@kernel.org>
Date: Tue, 23 Dec 2025 16:58:36 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_032839_222042_8A85F6B2 
X-CRM114-Status: UNSURE (   5.00  )
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


On Wed, 05 Nov 2025 18:20:13 -0800, Rosen Penev wrote:
> First commit fixes compilation under 64-bit and second actually enables
> it.
> 
> Rosen Penev (2):
>   dmaengine: st_fdma: change dreg_line to long
>   dmaengine: st_fdma: add COMPILE_TEST support
> 
> [...]

Applied, thanks!

[1/2] dmaengine: st_fdma: change dreg_line to long
      commit: 19fed6ca15c4c41c28059c25f9cc85c0058cc4fd
[2/2] dmaengine: st_fdma: add COMPILE_TEST support
      commit: c3af05623e079c2a9a9363386796fdea20defa18

Best regards,
-- 
~Vinod



