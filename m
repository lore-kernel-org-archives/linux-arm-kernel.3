Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 202A4EEB57F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Jan 2026 11:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sVqcwHS0dtROqVGkS5nvvxWoAEA3UqXPMeg1HgCTG1w=; b=jkEhEiEO7S0CBdB0loG2LKV/uZ
	pq3lV6IOy+2pMEpxsIrN1l8hELQX5lWhbNDSa+ODwhlikfD6WmmY/fjORN3Bl6sGAs+5koO53trIK
	vFO0IaJhT+qWSHQwFSauJRRPIi++Sd4UfXwYAo5Vk8nSOAKBqXXPyqnkErBNSiQ6L/P3B6maMK040
	BrY/+m+d4ytAvBdzrd/1i50uHCBEBp6+/RbR+PF2nT/1TaAc69I6m/UPDVkVK/d8AIfnIA/Irj2ec
	unYqefW6fxLvozygINILPxW1sBUM/GFBrjPOcqj/S11+j81y4rZarE7X7fU6UIqJLIA6YL6f1Vwq0
	F2eLSwpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbGXN-00000006nvn-0pwc;
	Thu, 01 Jan 2026 11:08:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbGXL-00000006nv3-0nwZ;
	Thu, 01 Jan 2026 11:08:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9E21660017;
	Thu,  1 Jan 2026 11:08:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04B80C116B1;
	Thu,  1 Jan 2026 11:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767265690;
	bh=N6McmWiRC3gUWWXsSzP6Zof/WeqDCPbzzKSq7ESrF5c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=tS6o9/uNs0qTT1xMfl2bqk0gutgChmWa5+rDXyA0MNxl0n7tIljGpg0mMovrNAbNU
	 UdPKJtJdviTBuRjgGVpPj3kE4LMryKUqREmAOHkzUle7qAYPXvAAH2FfOF+KHzRoL2
	 x/zVlKwszm9GukiLGwXxPQK4k8NK0Z8UpQMoX+8gM/9aMsalQQMPafLkQeVoaxGcXj
	 QntKmrrvGAlaobzaY9Aw4EvthO8nRdigsqkOAPGt7hDMBFOWsSw38YNhEFsdK2vpG7
	 zmKTPgmo5AMC/8vWVBJ/owZiSm2n9k05zdGnmqFAfFMJ4zAkAJLGbA5TKadF89Hbgg
	 D9Q3AgvG+Pxqw==
From: Vinod Koul <vkoul@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>, 
 Julia Lawall <Julia.Lawall@inria.fr>
Cc: yunbolyu@smu.edu.sg, kexinsun@smail.nju.edu.cn, ratnadiraw@smu.edu.sg, 
 xutong.ma@inria.fr, Qingfang Deng <dqfext@gmail.com>, 
 SkyLake Huang <SkyLake.Huang@mediatek.com>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20251230140601.93474-1-Julia.Lawall@inria.fr>
References: <20251230140601.93474-1-Julia.Lawall@inria.fr>
Subject: Re: [PATCH] phy: adjust function name reference
Message-Id: <176726568565.201416.1248729430822286493.b4-ty@kernel.org>
Date: Thu, 01 Jan 2026 16:38:05 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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


On Tue, 30 Dec 2025 15:06:01 +0100, Julia Lawall wrote:
> There is no function clk_bulk_prepare_disable.  Refer instead to
> clk_bulk_disable_unprepare, which is called in the function
> defined just below.
> 
> 

Applied, thanks!

[1/1] phy: adjust function name reference
      commit: 6c1cdea6bafea96a818181e1289e22fbdc09f1d3

Best regards,
-- 
~Vinod



