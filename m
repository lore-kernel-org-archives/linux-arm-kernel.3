Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5A1BC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 11:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S9JWwkg2xZByLaR764uBKl+J0JnlvBnOPHlzPl6CgY0=; b=Qj3ojKUQM9LvfI1vcB4FMQxy7c
	TrEY6EIHVQ5BW2IsIHY0C2k+xScVm4kBN0Se/KHlhy6EPp4uDF5GsLw8HlyUWQAoGtAnOTK/xhfII
	2L7LeyZL81eYvcmUPPvaW8o294ZA2DgRZpukvPlKit96+aqWO46G0SaQ/VZOnH9fZleQmR6KhniL9
	7ti8gPkWlk37fsO5Y9KsW+mEqVFYc/KKLlycf1a/T3+UF7BOnbQgyKA4IDP9AglPXEJUQSIT1Abqo
	GMEl792BivauZ5DeHHnxSKQhW1LaVRtWSFhCqHCM2iO272oCPf205ZS9butKxg3wPzvJMUOzLlaA9
	C1THBmFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc0NI-00000007ZE9-2eWR;
	Wed, 16 Jul 2025 11:32:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc019-00000007W2S-2qrb;
	Wed, 16 Jul 2025 11:09:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D695F6115E;
	Wed, 16 Jul 2025 11:09:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D985C4CEF0;
	Wed, 16 Jul 2025 11:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1752664182;
	bh=RZjR+zBNXTDV8Esh9IbuzSTwt+E2KPtd34O2E1kw9CE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KJqdX+uEV25XZ8V+PYzhBOfdC8nG9XiSSNaTauNQAnXakMuWAOiBA0WryVQc0ljES
	 THSz5iSKYWKBOyEOxt0XXR5aoMl1sDDlkbD6CixsHIEDKyP+muT9tPuOKnXGIPZFRN
	 gpGhilsXOq0hXU7pH6ZfVdPz+ehvb0rOY1CbSGBU=
Date: Wed, 16 Jul 2025 13:09:40 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Macpaul Lin <macpaul.lin@mediatek.com>,
	openembedded-core@lists.openembedded.org, patches@lists.linux.dev,
	stable@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sasha Levin <sashal@kernel.org>,
	=?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Bear Wang <bear.wang@mediatek.com>,
	Pablo Sun <pablo.sun@mediatek.com>, Macpaul Lin <macpaul@gmail.com>,
	MediaTek Chromebook Upstream <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 6.12 2/2] arm64: defconfig: enable Maxim TCPCI driver
Message-ID: <2025071601-unwatched-chowtime-82ff@gregkh>
References: <20250716102854.4012956-1-macpaul.lin@mediatek.com>
 <20250716102854.4012956-2-macpaul.lin@mediatek.com>
 <8698f842-a464-47b8-8c47-97cda016e227@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8698f842-a464-47b8-8c47-97cda016e227@linaro.org>
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

On Wed, Jul 16, 2025 at 12:30:20PM +0200, Krzysztof Kozlowski wrote:
> On 16/07/2025 12:28, Macpaul Lin wrote:
> > From: André Draszik <andre.draszik@linaro.org>
> > 
> > [ Upstream commit d2ca319822e071423ab883bc8493053320b8e52c ]
> > 
> > Enable the Maxim max33359 as this is used by the gs101-oriole (Google
> > Pixel 6) board.
> > 
> > Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
> > Signed-off-by: André Draszik <andre.draszik@linaro.org>
> > Link: https://lore.kernel.org/r/20241203-gs101-phy-lanes-orientation-dts-v2-1-1412783a6b01@linaro.org
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > Link: https://lore.kernel.org/r/20241231131742.134329-1-krzysztof.kozlowski@linaro.org
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> 
> No, that's not a fix.

Yeah, defconfig changes don't really make sense for stable updates as
everyone already has a .config file for their systems by now for those
kernel versions, and changing the defconfig will not change anything for
anyone.

Sorry,

greg k-h

