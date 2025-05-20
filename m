Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1BCEC3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 10:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q4x/AkwyJQSAy4i6mvUHDo+31S9sEdf6fX54O8AnvGM=; b=yADBVYRIwawiIneJ9eUz+jFdD1
	jFkoT/d7OzFwjDoaaPEH2LXUw7DthvQMfuNaVDrpueoIrixymB6Uy90oWCEnVwTpeP+unLi9uDlAP
	NriFK+rqThDbDhE39+PtikF+3wo6ONdbJ1NlN1Gr5jICxoCTYyVkrwI2Gzw/Ahq6/aFN4nm3HWaMz
	wm+sc74MK9fls7yI03xbB2TrF7p/bIQQzs6/3/EMO4RrWdZslktCU8q+Ix4Y6ZlBkHcw1Z2yxjfJM
	BEi4kJXNHGvQQtp1ajqDqX1Mjlg5K4yd15O0NrT6RYx8zg+7t1knz32woHcowW2kDw1SQW7gEq03/
	0XbjTeSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHKGB-0000000CMkU-0IHr;
	Tue, 20 May 2025 10:31:47 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHK2T-0000000CJNB-0JC4;
	Tue, 20 May 2025 10:17:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747736255;
	bh=8hgPJy0IXANIe9SWlDAL1LevAW3h1brtXJfLzCl37G4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=QB/ULZ1BgoDxrnppI9dWX9xAj4tnmFRrk0pdY5sd5lnE+ooKC54xWHTVgexggZtXH
	 tJpLUpvtJVw7YhNotrPYnAiEatRwwVB0hiqn6L7N49dM6/pJjDZvXIHZyZ2SM7k/uG
	 BsWqIMKdsOwLsZbZvdTYlkXCuG7WduaXI0EsF/2d2R65v1lXpT7BiV8FqJUCLRb8pd
	 TUbYGTxSaw02Gs3kotb6Gm4VMg6tMImJh5KOSsQcN6kBDi43GElpiVXJS+ASb25D1L
	 euTWLgd3f6nlZgSpf0HWtSoeIWW0kslUnmQmowD4GNMYsfgSc639ilFnF2A0lR+6Jy
	 tMvp6J+QCe/MQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5E0D717E0FD3;
	Tue, 20 May 2025 12:17:35 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
In-Reply-To: <20250517-en7581-evb-pcie-v1-0-97297eb063bb@kernel.org>
References: <20250517-en7581-evb-pcie-v1-0-97297eb063bb@kernel.org>
Subject: Re: [PATCH 0/2] Add PCIe nodes to Airoha EN7581 SoC evaluation
 board
Message-Id: <174773625531.3349397.17842206398806297808.b4-ty@collabora.com>
Date: Tue, 20 May 2025 12:17:35 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_031737_260933_8FA822E1 
X-CRM114-Status: UNSURE (   5.28  )
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

On Sat, 17 May 2025 17:19:42 +0200, Lorenzo Bianconi wrote:
> Introduce PCIe controller nodes to EN7581 SoC and EN7581 evaluation
> board.
> 

Applied to v6.15-next/dts64, thanks!

[1/2] arm64: dts: airoha: en7581: Add gpio-ranges property for gpio controller
      commit: 3893ad42d371352ddc1aee8b28938618f5e06054
[2/2] arm64: dts: airoha: en7581: Add PCIe nodes to EN7581 SoC evaluation board
      commit: 0e94bee0b40ea99c0c874e99373f58a1b57e7433

Cheers,
Angelo



