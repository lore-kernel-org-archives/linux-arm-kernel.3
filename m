Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AFFFCA1012
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 07:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AymBqHrTZICGl8BhEGf+rBo7ZF7XfTQ8v7DCBJ41zbA=; b=aNZ1nhZnCz/UPJtlK8+bymdlv9
	tLKl4dwhP+rPHFGo/4+oBEyCXx0SiWedN4v5tj9Zsp3OWFtSXW4f9SBHLYvlMyq/Pa3RJ71vM7D1R
	binVHhaakoiS6eixTN9izo64e42KgMiNarbaKENQOnmdLQlbU65DDcZxN7+pC9BvV+urWOKdMb0Bl
	+fpyxtdpne1WLwqE+45TNLSqbg39hUrD5Ca8CDAblegAtt14ofXOhfhwtkKQyI7pR/1fVkOAtoUp4
	7+G4h5INx/7DjgMUPYuQ+pP3vhoFkcaI/7zuDKnJYPEHo9gtqV9XFP3WAmwl4Gw0208sYi7O4FLpj
	wN35lagQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu4iQ-00000009zeX-2bV9;
	Thu, 04 Sep 2025 07:49:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu4PI-00000009rsL-2O1p
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 07:29:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0F27241B5B;
	Thu,  4 Sep 2025 07:29:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33DC3C4CEF0;
	Thu,  4 Sep 2025 07:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756970958;
	bh=ZfDC/ITMRgaGG6h9hvAFUqwnJEvgAnYkZF1Z1AGJOhw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=MRE6gby3g/PKtN4d283wXDO3RQCpNJ/cS0zZp9OYUHEYIN05Mb7fo42b7vw6srfUS
	 wMRKT5W2AGlOl1EvLwXpVw4ZUruA69531j7AkHeSI9thGPhsufC+G1EsRB+0sWCfb2
	 5RVrZhYzu8S52+Y3gCJATZteAQUoRz1Vm6JN3Sa3T4GdFAilkqzKUH3deOdywx9T9f
	 pOzwHgfk4rpLBaL99ZJDtqfpoOSPSNGiz+LfJBE2Ucvkx5kNVCrYTam5DWaDKKPEIY
	 gbDUNYEMkVJLOhXc6fkF3poKUHo98Z7bxuFGob0GnAFHT13GO760GOsnNugh4zco5n
	 6wspu8B8OOapQ==
From: Srinivas Kandagatla <srini@kernel.org>
To: Chester Lin <chester62515@gmail.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: Ciprian Costea <ciprianmarian.costea@nxp.com>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Fabio Estevam <festevam@gmail.com>, 
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, imx@lists.linux.dev, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Matthias Brugger <mbrugger@suse.com>, NXP S32 Linux Team <s32@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Shawn Guo <shawnguo@kernel.org>
In-Reply-To: <cover.1756800543.git.dan.carpenter@linaro.org>
References: <cover.1756800543.git.dan.carpenter@linaro.org>
Subject: Re: (subset) [PATCH v3 0/3] nvmem: s32g-ocotp: Add driver for S32G
 OCOTP
Message-Id: <175697095597.8283.15697258146228301679.b4-ty@kernel.org>
Date: Thu, 04 Sep 2025 08:29:15 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_002920_631542_E544B20B 
X-CRM114-Status: UNSURE (   7.45  )
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


On Tue, 02 Sep 2025 12:47:40 +0300, Dan Carpenter wrote:
> This driver provides a way to access the On Chip One-Time Programmable
> Controller (OCOTP) on the s32g chipset.  There are three versions of this
> chip but they're compatible.
> 
> v3: Mostly small cleanups.  Re-order device tree entries.  Remove unused
>     label.  Use dev_err_probe().
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: nvmem: Add the nxp,s32g-ocotp yaml file
      commit: a3430382174a78a4a6b981feca44bcaa405e0f2c
[2/3] nvmem: s32g-ocotp: Add driver for S32G OCOTP
      commit: f7605ba1859724d44a7be4994335b31666110c84

Best regards,
-- 
Srinivas Kandagatla <srini@kernel.org>


