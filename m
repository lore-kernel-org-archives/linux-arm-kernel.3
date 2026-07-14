Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 422C4C44508
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 10:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h/cKEzusKTvez21Co26I5/0DvCC9Pvk8ccAqlxL3xcM=; b=gfMfRhwbnIdeJO5qcf3vhwJByX
	7y6wQvfKMAWOT6D3d/A9DxGkEm87Y2inrhN9/KExRWiI0NeL691+jAxkyVakOxlneIbI4zVY0mbfG
	8AxJ1nJWetgOa2TvodJ2sneTZNL2WMif3Syc2JZMi4o8hyfVx0SqAffHCdN38MRMOFkpRdL8r4XcV
	IT5sJGzrpMKEHOWdBYiy8MFTT+VrPsPSVJouR3kLiXBgtM9Z6SsT0jpDul8Qpfmj4O6MoAeka2/GY
	3nZSwrhaQsp3qyEXTCCY+HoE/iCI97kilzwfHxMuaMneV/axXbTCginsSXSD/MZgFizOCKkExazFt
	hPCBXxdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjaiA-0000000BbnJ-2atY;
	Tue, 14 Jul 2026 10:50:02 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjai8-0000000BbmP-0amX;
	Tue, 14 Jul 2026 10:50:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784026197;
	bh=xlMGnc48fbFc8+Ru4QFfeF8rdi+WUHp3YD4YD8Gx9Ng=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=G2piAFD26E6u0wGC9LhlUUHLR5saW450a30ECe61MyVQH8fCCkSl0Sk++lShrhI0M
	 BZmXrD2AiY2W3vLxGH7Wm9MsVyXfJMTap9XoJ5XnxDGNlo9O9Z7uB1j6yHThwyUlrv
	 k1XWkwzyOph2TYEnr2Pu2BbhCURhSoPm9FaGYPKuht7UqFIfGQdIXkbZTtasThakBc
	 ynNS5BeAcx4sNJUKyq5rYdK+roQKd5oQ27SY7Hwlk7mDvgD2N3yNtxMuhxTLvwslHy
	 0y05TMnrlbyD/JE89UoFDwAi2fu4njAEWnzhSuTX4VpgAhuSRIAKqyVNpvVx4jfibm
	 UmwsF9392s7hg==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DF79917E0564;
	Tue, 14 Jul 2026 12:49:56 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20260704124308.6241-1-pengpeng@iscas.ac.cn>
References: <20260704124308.6241-1-pengpeng@iscas.ac.cn>
Subject: Re: [PATCH] soc: mediatek: add missing MODULE_DEVICE_TABLE()
Message-Id: <178402619685.169534.14263276926137765099.b4-ty@b4>
Date: Tue, 14 Jul 2026 12:49:56 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_035000_357846_3C0AA479 
X-CRM114-Status: UNSURE (   8.39  )
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

On Sat, 04 Jul 2026 20:43:08 +0800, Pengpeng Hou wrote:
> The driver has an OF match table wired to .of_match_table, but does
> not export the table with MODULE_DEVICE_TABLE().
> 
> Add the missing MODULE_DEVICE_TABLE(of, ...) entry so module alias
> information is generated for OF based module autoloading.
> 
> This is a source-level fix.  It does not claim dynamic hardware
> reproduction; the evidence is the driver-owned match table, its use by
> the platform driver, and the missing module alias publication.
> 
> [...]

Applied to v7.2-next/soc, thanks!

[1/1] soc: mediatek: add missing MODULE_DEVICE_TABLE()
      commit: 0ef07f74aff2db93450a01fea3296c32b991e72a

Cheers,
Angelo



