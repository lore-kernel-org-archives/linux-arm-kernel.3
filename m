Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0230EC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 14:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OR+9VrcmpwsXDYLq7teC1AZo8u5HWqbjnSTYJJq8cqM=; b=KIh766+arj3gPucxMvDYg+FpzQ
	vdfeHankoEZc5eFLEzkLhxt7AhfSObKFqpsEJ36Ku8PWOYbEmYcchSKRQFZnx2m8cYgqA3h+B7xQc
	hc0CJDj8ugkW4w5pT7jhZo98bqPlOB5RrkuSerQMN8sg3RWZ94GPXLmSx0fOCSPXvRxZESwBLyrhV
	9Q5jweBL4o+AxqWl2WF0k8M9TJoRyJk6N95DxAfB036C4C947RYlHevF7QACKO6SyEvq964yI+HFj
	tFiOxmcrL4QjySyLsJgAdArEoPSkmkzflFAp300hKrmI6rosqYUvgirStGp+lTN2T3LxHrFIjCrRm
	9LmVg6gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x91la-00000005jiv-1rQh;
	Tue, 22 Sep 2026 14:46:42 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x91lW-00000005jgX-45Zs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 14:46:41 +0000
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id D364C1FF51;
	Tue, 22 Sep 2026 16:46:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1790088392;
	bh=OR+9VrcmpwsXDYLq7teC1AZo8u5HWqbjnSTYJJq8cqM=; h=From:To:Subject;
	b=famrD2QCP+T9APJzB+FUkhLM+aPRp2vI1jQt+UEpitwkXLXLH4iHYZMNHNPQDblwi
	 q+EpmY/IxzwdAOyp8sioYMZqpH7LZFmHg5CneLX+OpSB7z/t7Wl4i28+9Cshvbq07e
	 8x3AvM7I3mYTg3U4V0r3IMPG0w8d/FHWen61Tqm8GJujONo2PURYbX9JSOSdKCxJxO
	 Mw5k6nuCtSJE/5JA0z3Yi15gFpH9Ub8yTuSGdjh4v+rPWfrYnAh+TrwuJ3qHd+Gxrb
	 +tn1ZZiDAUuSPYenqEqi5f3A8VkVpYiLcHfYhHLvQe08ZPF1pXPXS0oVULwjO3r7P0
	 r8jwB+nvkvwxA==
Date: Tue, 22 Sep 2026 16:46:28 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Nishanth Menon <nm@ti.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Francesco Dolcini <francesco@dolcini.it>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: ti: k3-am62-verdin: fix
 main_gpio0/main_gpio1 line names size
Message-ID: <20260922144628.GA261268@francesco-nb>
References: <20260914190943.50843-1-francesco@dolcini.it>
 <179008726793.4044824.6786355019611253673.b4-ty@b4>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179008726793.4044824.6786355019611253673.b4-ty@b4>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_074639_914271_F50ECC0F 
X-CRM114-Status: GOOD (  13.35  )
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

Hello Nishanth,

On Tue, Sep 22, 2026 at 09:29:48AM -0500, Nishanth Menon wrote:
> On Mon, 14 Sep 2026 21:09:42 +0200, Francesco Dolcini wrote:
> > gpio-line-names sized main_gpio0/main_gpio1 for 87/88 lines, the SoC's
> > ti,ngpio values before they were corrected to 92/52 in commit
> > 28c8f2189d80 ("arm64: dts: ti: k3-am62-main: Fix GPIO numbers in DT"),
> > four months before this file was written. Resize both arrays to match,
> > keeping every existing label at its original index.
> > 
> > 
> > [...]
> 
> I have applied the following to branch ti-k3-dts-next on [1].
> 
> I have assumed you'd not want this fix for ivy/zinnia which redefines
> the gpio-line-names. Let me know if that is not the case or if additional
> fixes are needed.

I missed them, I'll send 2 more patches to fix it.  Thanks for the
head-up, appreciated.

Francesco



