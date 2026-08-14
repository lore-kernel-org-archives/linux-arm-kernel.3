Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C8B0C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 07:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nJegQlhq+MewOGnUHRHewet7G68KbvwxdB/Y6qxCKYc=; b=gZvnvuXoEwV8LjNicwUUGdnCEf
	qSwJ3UlsPjo51LpvckKviO1gvQ/ZQqDQ5jTzMTQhAL3lhnYYzgrlfJfD4IW/jjEbYb7c8L19N323r
	nbmsOi+qCE263oKcQy0jliUqsfW85d+lFmkY1yR/hWN83Szp7/BHRtNDij5s2t0gHIbItQGfnmi2Z
	mHdr5jaP3LbTPtozCOds73IYSHcqyT+VFshFf3+QtQdntnjbt/caWXyq6pR6ARnPukX624ZBBH4ul
	jy2XiSQMsRdsRYYSo8TLw2lcW9qbog8LowQewdeMWsr67Teo2RRgnskXL4oY4Xaw/XudxX7l6SoIm
	DB8pqt1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wum97-0000000267u-1nkR;
	Fri, 14 Aug 2026 07:16:05 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wum90-0000000266G-30Xx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 07:16:03 +0000
Received: from francesco-nb (2-224-16-253.ip168.fastwebnet.it [2.224.16.253])
	by mail11.truemail.it (Postfix) with ESMTPA id BED5A1FC4F;
	Fri, 14 Aug 2026 09:15:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1786691754;
	bh=nJegQlhq+MewOGnUHRHewet7G68KbvwxdB/Y6qxCKYc=; h=From:To:Subject;
	b=veiWjwlHd6rzmgYHFb7ThT9a8HzK66BDVr5D8gAHGKvhPy1cQJSZknojCU4X11s0w
	 V6k37NA5zyflCR7xOa8JKjl1tDNnTvVcI4qL5s7YYD4lHVwQLZC/IoVtUIXgPqkF57
	 nF1cdCXBWI4xGFczPsbCPpVOYkeCvssCASUZvmGEFXmanDYEXYu4InlM+kAVcOnGuT
	 MmFrj4S56xI2sKfCRw2BaT/X9wcydhRaygKDv9zcyPdhh7x9YWi43p3tIWqVymbn0a
	 SwqAPh6I3u69i/2keYsfzceUMok+p8u/SKKMMl+yl9LX9ZnbIXyMwECdr9RiM0wTiO
	 a4bim8DWgE9dA==
Date: Fri, 14 Aug 2026 09:15:49 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: "Mendez, Judith" <jm@ti.com>
Cc: Francesco Dolcini <francesco@dolcini.it>, Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Moteen Shah <m-shah@ti.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH v1] arm64: dts: ti: k3-am62-verdin: Set MMC clock pins as
 OUTPUT
Message-ID: <20260814071549.GA5246@francesco-nb>
References: <20260813111238.56892-1-francesco@dolcini.it>
 <b4ed6b46-07c3-4ebf-9fc8-b9ae0dc03a51@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b4ed6b46-07c3-4ebf-9fc8-b9ae0dc03a51@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_001559_661593_B5BFFD09 
X-CRM114-Status: UNSURE (   9.01  )
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

On Thu, Aug 13, 2026 at 02:57:52PM -0500, Mendez, Judith wrote:
> Hi Francesco,
> 
> On 8/13/2026 6:12 AM, Francesco Dolcini wrote:
> > From: Francesco Dolcini <francesco.dolcini@toradex.com>
> > 
> > MMC clock pins must be configured as OUTPUT-only per TRM [0] with
> > receiver disabled (RXACTIVE bit = 0). Change MMC CLK pins from
> > PIN_INPUT to PIN_OUTPUT to match documentation.
> > 
> > Link: https://www.ti.com/lit/pdf/spruiv7 Rev. C: Table 12-246. MMCSDi I/O Signals [0]
> > Fixes: 316b80246b16 ("arm64: dts: ti: add verdin am62")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> Assuming defaults are set.

We have

  AM62X_IOPAD(0x11c, PIN_INPUT, 0) /* (#N/A) MMC2_CLKB */

is this what you are referring to here and in the other discussion
thread?

Francesco


