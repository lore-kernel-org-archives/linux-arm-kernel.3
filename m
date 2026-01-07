Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34B4DCD5859
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 11:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6A2f5pRKLLWCXsGktkZlq1xsZajq+qZGnEChNBYj1bk=; b=VooSzVc+Rb+yqcqrcQAozY91Vu
	eKcOWRrmTh4CMOONnlyyyCqM/TYc1GJFttcPvIjaNXta0YHDs6X6h4OAj/V/cstOCx7K7pd3ICdKp
	q/zHAYFye8h7aiVnrUC/9ijc8raNV0bHKtty2Z9Ul5Zyh8aqOLM9kc43QYQSWUebmCTUCOaEA99op
	fA0eJx9mGgBQHHNdQUD5KEcGI86kKlFsTqsQK15Vj5u3qeirsoKdR3r/KfxcDaArbYDIPhEK0E+lV
	YLhuuF+fMrBa1dyoImvNnH9py564n16YQ8gVXqtTdzfgsQbGhAdjFwyx034POAMvHSsRqp2J8Zpga
	fLNq/LZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdRTP-0000000EnEE-16vH;
	Wed, 07 Jan 2026 11:13:07 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdRTF-0000000En3Z-1RbB;
	Wed, 07 Jan 2026 11:13:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1767784370;
	bh=NpznBBUs1p1Pi9cSELkptVrvzbeU/wyXKScPVQ4IH3Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=OY3xygw57/hKPpm/n4FttZDKEm38ZfY4lU+P1hhBYDndEuuFUVZz81E798FcnklbM
	 XkPmiShY9Q42OV6GBLPDqmBKlj/okVAWld56mjOwkxfH/r6jb+mVsxfzbDXh2CezT8
	 1SB/dIqxF7V1ZUaMWQLpeLsC0/8nR9fmDniyerBMEpYm7NobZhcdfF63eglmwagMuF
	 tTMY+i3urU9eSAHvuA7RDd7pLJ72jUWez2bnf0wLoq3WzuGtsPMY0WrpsS8oybXczy
	 6bgM+tHW9hjM9w0oHmsBJxjJksoqpnleDX0sfY0y61pTcpDFUnUx6zEh0wBVnhXvGS
	 q1TmDVzz90Dyg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5A9B617E13F6;
	Wed,  7 Jan 2026 12:12:50 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Wunderlich <linux@fw-web.de>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 Frank Wunderlich <frank-w@public-files.de>
In-Reply-To: <20251205215940.19287-1-linux@fw-web.de>
References: <20251205215940.19287-1-linux@fw-web.de>
Subject: Re: [PATCH] arm64: dts: mediatek: Apply mt8395-radxa DT overlay at
 build time
Message-Id: <176778437030.39195.12846683317432811759.b4-ty@collabora.com>
Date: Wed, 07 Jan 2026 12:12:50 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_031257_567573_3B15C529 
X-CRM114-Status: UNSURE (   7.33  )
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

On Fri, 05 Dec 2025 22:59:38 +0100, Frank Wunderlich wrote:
> It's a requirement that DT overlays be applied at build time in order to
> validate them as overlays are not validated on their own.
> 
> Add missing target for mt8395-radxa hd panel overlay.
> 
> 

Applied to v6.19-next/dts64, thanks!

[1/1] arm64: dts: mediatek: Apply mt8395-radxa DT overlay at build time
      commit: 34e7595912cfffdbca8c34d7c321d9937e0201ee

Cheers,
Angelo



