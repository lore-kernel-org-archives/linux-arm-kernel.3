Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DBEEE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 10:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aA6qnH42WYYh5kISJwG4LMMvkK84231WR/IpjJTGcV4=; b=xMSm1vRpE9dG6WMCNmPUVnETb5
	uc/BIsovRxIB0ffOBl/67Uko6xadoZ5jM4ozqPEzhXzVeRGkgL42dQ0KZdVq8LxZUAdxIGkz/AIeu
	gYT7Q7fHFW8n24Z6K2zrDSZuOwSty+jB6JgGZgXtfpLdMPPXKbVnrJNB54S/XJ1A9nYyV9QfAkOEa
	r4OOWVLQLXQjpILN7IMa3exWHoGIhf0djzByxJ8WZUv/YKbRp8VvmsDCOMg1oINu6EbsZ8xGycRa5
	9SIajtFSBT2EsgfErZv+bL9kofm8OxlaBZgale/Nd1ER0gvtU9wD4sUwxUhGhSkS2sYuDGpjREe3b
	Fxay0mIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLg75-000000000GL-3jpf;
	Thu, 12 Dec 2024 10:08:07 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLg3z-0000000HabD-0Sdo;
	Thu, 12 Dec 2024 10:04:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733997893;
	bh=4imzcdqytTqZaeyZyRJF4wFBv511nhafaA/Ho1Wo49Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KceayNH6dmyR2Gd3zsxk5Jc5A17Igi68zq07Ii2zXXwyEnZkWd1gCBCcwLmysCs6Z
	 JS6EhPiiDYmVxAKZ2pXCUSQnhV4LsDylNzoes9n8WkhyqUXKWAUSvFW8YlGGYLTkfs
	 K5ODka/3TEgEoktrjx7z5psfsiPgbz5Ha1CbQmyT34tDJUgkD9EhVAdkLN5l+vlnMH
	 A9jdiTbDIvEvZKcZJE2gsTcSLRLj0nlj9ChgpguVzrFWWTBoNYIQy4urjT1ZH3S1cj
	 sCpHuR/ZfFt4VwPh65kZW/ZJFEAqfWPOR+WtGbbjIDWJGV/jNFHroPNpn2MSMhjpLo
	 nUjiDa8x5nr9Q==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3DA0717E35F4;
	Thu, 12 Dec 2024 11:04:53 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20241210092614.3951748-1-wenst@chromium.org>
References: <20241210092614.3951748-1-wenst@chromium.org>
Subject: Re: [PATCH 1/2] arm64: dts: mediatek: mt8173-elm: Fix MT6397 PMIC
 sub-node names
Message-Id: <173399789318.41280.12144237345151657264.b4-ty@collabora.com>
Date: Thu, 12 Dec 2024 11:04:53 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_020455_321241_0B170BCB 
X-CRM114-Status: UNSURE (   6.40  )
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

On Tue, 10 Dec 2024 17:26:12 +0800, Chen-Yu Tsai wrote:
> The MT6397 PMIC bindings specify exact names for its sub-nodes. The
> names used in the current dts don't match, causing a validation error.
> 
> Fix up the names. Also drop the label for the regulators node, since
> any reference should be against the individual regulator sub-nodes.
> 
> 
> [...]

Applied to v6.13-next/dts64, thanks!

[1/2] arm64: dts: mediatek: mt8173-elm: Fix MT6397 PMIC sub-node names
      commit: beb06b727194f68b0a4b5183e50c88265ce185af
[2/2] arm64: dts: mediatek: mt8173-evb: Fix MT6397 PMIC sub-node names
      commit: 9545ba142865b9099d43c972b9ebcf463606499a

Cheers,
Angelo



