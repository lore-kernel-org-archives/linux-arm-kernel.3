Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A9FAD5B16F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 13:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WkV3ZYGagO+HflHRU/1YPFeSRHTuGtO52SiUwSKKXFA=; b=THT7j3eFB385XD5LZop8VqYPEb
	gyy59vhPZu5s2eQ08e81hQOQa7KResBj5gxTMaiS9j9DFSawlT1Gw5VuhIoWGZFI2tsu/3tCNl7DS
	4HLiUSVJHhLKwKFDbetTtDtUrVeak3TB7+CwP+a+jlTsnjiQ7G2HKCKoC5bGvqxQ1o/ISqXYGiONp
	hrlSLtgvp/BWr19Whf3VaujVZBsOJAiwekbWZPjJB1JY5EuIHp0wpqtkRlzNtgaz60QMaK/YvQa8l
	3Yj6Kkayxjgg14WltnTrMbgpmLStWLzeN+/sWm26oJJb6KmwPt7Un5HFLB3Nw3O+grDVMNZtT9ooD
	fvtA74yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV94u-00000003iYi-182P;
	Mon, 15 Dec 2025 13:57:32 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV94r-00000003iXz-36Mt;
	Mon, 15 Dec 2025 13:57:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=WkV3ZYGagO+HflHRU/1YPFeSRHTuGtO52SiUwSKKXFA=; b=BbC6Z7lJ2XItOn0bfXcTYh28bz
	IZKwRg+T0kQqhWqbpfkDUH4ezLHE4P2yoE5FKsxECBBEduda6kKAAQhIPfWAE/Gw85DALaqPsRvFf
	tpkvPaDdhbO/z1juZdJXdJcr0F7mbwl3mVUJXiwt7V2lFIwDQCHequvzBl827mrXOC9DcRChIgk0h
	fqmhDs64qOjKSwxGlr0kVIJy1+GtNNrDsS0DjiP+wk5bxp/2LuWSRge53zvP2bG/32edtNdyFTcc6
	rbj45SkE4OtHtTJ6wloVS5QJLuB7akl9QDTaKHnuFtPzPEiG+fvAKz5vx0mMqiCJGzPznuwkNG5ec
	/94ExG+w==;
Received: from [192.76.154.229] (helo=phil.dip.tu-dresden.de)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vV94f-0001YU-Sa; Mon, 15 Dec 2025 14:57:17 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Heiko Stuebner <heiko@sntech.de>
Cc: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	quentin.schulz@cherry.de,
	andy.yan@rock-chips.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	cn.liweihao@gmail.com
Subject: Re: (subset) [PATCH v2 0/9] General RK3368 HDMI support and 2 outputs for RK3368-Lion
Date: Mon, 15 Dec 2025 14:57:15 +0100
Message-ID: <176580702585.1452104.11896620179705853130.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251021074254.87065-1-heiko@sntech.de>
References: <20251021074254.87065-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_055729_780241_311969AF 
X-CRM114-Status: GOOD (  12.91  )
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


On Tue, 21 Oct 2025 09:42:45 +0200, Heiko Stuebner wrote:
> This series adds the necessary bits for HDMI output on RK3368 and enables
> this on RK3368-Lion. At the same time, use the recently added DSI support
> to enable the generic Video-Demo-adapter as an overlay on Lion as well.
> 
> 
> The reason I'm shaving this Yak is that the recently added DSI support
> created DTC warnings about a single endpoint with an address.
> 
> [...]

Applied, thanks!

[1/9] dt-bindings: display: rockchip: dw-hdmi: Add compatible for RK3368 HDMI
      commit: 0edbd43e0c149152b917c0cde61e4bd34a5bd118
[2/9] drm/rockchip: hdmi: add RK3368 controller variant
      commit: e7a943f0824b584e42847ad9642d7fb751022cf6

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

