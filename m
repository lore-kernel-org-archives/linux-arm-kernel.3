Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F84260A2602
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 18:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jj6VUuAN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uw7E+NXHWi8QV631+w8tMF0xe7Dq5zyhGNqxu6JZU6g=; b=jj6VUuANLCAJ6bNGvN3acAat6C
	SJImfMoiJc2T9krFmKWhJje5dAKbXfvjhv+JJ2Wt3HkDWw3zNI+V+y2yHOykX7x8wIOhSj9navIcL
	WPzQRNrTxj4ZooW/Dcv7uvTMEIgOaxaEnE7W62oYkaPf+Sky36JOS3asbTcaYumezGQpBkdIYHtkC
	lX6iTG57Sg0UKT8QWu/P4lPDVMi3+KmB12TQ5vuP87vkYbmuStAlwD0Aaz3kbLv6p1hERMKugR8Kg
	FBKo8rRUvOMGO6pO3vpRuwcsso1tAdlDM3f1QZL2GWX8UTumwsuwRC+IaMZCZ3Ud+5IeC/m5G3dLx
	9jp3l63A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJEGU-0000000APHl-1pGt;
	Tue, 20 Oct 2026 18:08:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJEGT-0000000APHM-2MVp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 18:08:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BD16460098;
	Tue, 20 Oct 2026 18:08:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56C3C1F000CA;
	Tue, 20 Oct 2026 18:08:44 +0000 (UTC)
Date: Tue, 20 Oct 2026 13:08:38 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: joakim.zhang@cixtech.com
Cc: linux-arm-kernel@lists.infradead.org, cix-kernel-upstream@cixtech.com,
	devicetree@vger.kernel.org, lgirdwood@gmail.com, perex@perex.cz,
	linux-sound@vger.kernel.org, broonie@kernel.org,
	conor+dt@kernel.org, p.zabel@pengutronix.de, krzk+dt@kernel.org,
	tiwai@suse.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/4] ASoC: dt-bindings: Add Cadence I2S-MC controller
Message-ID: <179251971819.480464.16290494535168890075.robh@kernel.org>
References: <20261019122048.1107179-1-joakim.zhang@cixtech.com>
 <20261019122048.1107179-4-joakim.zhang@cixtech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019122048.1107179-4-joakim.zhang@cixtech.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Mon, 19 Oct 2026 20:20:47 +0800, joakim.zhang@cixtech.com wrote:
> From: Joakim Zhang <joakim.zhang@cixtech.com>
> 
> Add the DT binding for the Cadence I2S-MC multi-channel controller
> integrated in the CIX SKY1 audio subsystem. The controller exposes a
> transmit DAI and a receive DAI and moves audio through a configurable
> set of its 8 data pins. Which pins are wired out and in which
> direction is fixed by the board design and described by the
> cix,pin-out-num, cix,pin-rx-mask and cix,pin-tx-mask properties.
> 
> Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
> ---
>  .../bindings/sound/cix,sky1-i2s-mc.yaml       | 119 ++++++++++++++++++
>  1 file changed, 119 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/cix,sky1-i2s-mc.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


