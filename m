Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82512CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Sep 2025 16:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OLzCUaPNQnZMBywzeMC2KTO9NhwhrbpjSGWQN5QYMcM=; b=WtlIXUS8bcFpd8r3ujSZ+1uAu6
	l7wkvWdqEpraQoUwA3jih9hKJua8miG9k6efEdLgCfSUNB7HmBA2bm8V+0AX6GjKOKzCQCsw2P+wX
	GskZLkIDTBXej59UdToCt1b8Y5B7HJU1ao5Njg6383u/1c/JUCjAkrpBeQKcrini5GYrEDu1mcosl
	C+xJ9BapDE7LgWnxwh7B1ufQpkYgkRAd7IveY60R03dEcBeuZbvAj8HBIRPi/liGs413ZkOCw8Bjy
	EQ6I94JPXAncxY6soagHN60WsgPayKJVAoEoIl8kaP5+r9wQFOKXWC9hCSLNa7mpm/jcou137+4Oc
	HAAnJ+3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0NKi-00000007qEh-3Fnl;
	Sun, 21 Sep 2025 16:54:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0NKD-00000007pk7-22lh;
	Sun, 21 Sep 2025 16:54:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0FB334422E;
	Sun, 21 Sep 2025 16:54:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B34CCC4CEE7;
	Sun, 21 Sep 2025 16:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758473648;
	bh=OLzCUaPNQnZMBywzeMC2KTO9NhwhrbpjSGWQN5QYMcM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Tan27LcBErW5Xh4n+sGEYXLm9huWdK6jT2ZJt3b8qh+tDvzRXdXgDE/+HlkPbeVXv
	 8GiVkVxnZryvp/K0MDoI5qqNJU/twJrJXiPsgttMkOSYR1GyFie/VdM1xFUrKVXF+6
	 p2jlmeDTzkkJcMuAFqWgaSOHQT3NAuybn5UwV0x68oTzzfSs1kRTfr3KiZNU2eQ5rB
	 Jjw6cOvesUf6RwcH2edkuAUBjdyuiX3Ijw37OLRrD7NWkUXPoZxO0gzzcGCjXfdFDF
	 C/EZN8h/khDcWw9yYO1WwDUda2aGE7q2YXIJHo6A/p8p1AgyDlN53a/CxaTlHK1L5v
	 XLf9tXQC0e9Uw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250915151947.277983-14-laura.nao@collabora.com>
References: <20250915151947.277983-1-laura.nao@collabora.com> <20250915151947.277983-14-laura.nao@collabora.com>
Subject: Re: [PATCH v6 13/27] clk: mediatek: Add MT8196 vlpckgen clock support
From: Stephen Boyd <sboyd@kernel.org>
Cc: guangjie.song@mediatek.com, wenst@chromium.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, kernel@collabora.com, Laura Nao <laura.nao@collabora.com>
To: Laura Nao <laura.nao@collabora.com>, angelogioacchino.delregno@collabora.com, conor+dt@kernel.org, krzk+dt@kernel.org, matthias.bgg@gmail.com, mturquette@baylibre.com, p.zabel@pengutronix.de, richardcochran@gmail.com, robh@kernel.org
Date: Sun, 21 Sep 2025 09:54:07 -0700
Message-ID: <175847364755.4354.7139891669335992142@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_095409_610130_1D62FCA6 
X-CRM114-Status: UNSURE (   6.68  )
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

Quoting Laura Nao (2025-09-15 08:19:33)
> Add support for the MT8196 vlpckgen clock controller, which provides
> muxes and dividers for clock selection in other IP blocks.
>=20
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> ---

Applied to clk-next

