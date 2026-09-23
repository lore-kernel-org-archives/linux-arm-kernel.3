Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD636C982EA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 09:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dpkfxbn6T1G7p7lIRLe3ir/ZubE3QQzEvQyVg576vgM=; b=BWrpLfHdzUwnNznISuAOQovzNL
	U3onJtP4G6M8b7oi3BB/iC0gd15fF9qzPBsJz52JsQW257RG3aDC3JOozg7XmoqIQwrH+L4iZDeqR
	PJOu6kVB5mf24nJmGlDHZbZLBfHemWYxA/ulkzLuXg9Y4NKb4jB29E7u4MVdEemhoZuFl3S+2eTbg
	1I/YIrqhFGpXjSKZgYCnUWmXizv5LCrdgKWI1uziFmKK8CowP/ppknbnMCyt+/ZU/aOdHO6C3BbX7
	39zqnW2sEcVerkz5IOWlGWtPfn42AX+b0aCa4YcIE2Lxahgm1P+rUsgPM8kMVjeoY3ElAsKimaFEF
	MUqd8bXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9JcC-00000007nqA-3YO7;
	Wed, 23 Sep 2026 09:50:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9JcB-00000007npO-1foQ;
	Wed, 23 Sep 2026 09:50:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 885FE601FB;
	Wed, 23 Sep 2026 09:50:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A3C41F00893;
	Wed, 23 Sep 2026 09:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790157010;
	bh=Dpkfxbn6T1G7p7lIRLe3ir/ZubE3QQzEvQyVg576vgM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mVw8v3yPtxTe3gax/J4dXiqC5bzIurnEJOX9pazK+We0g3pQgbZaKiGeiyRfinSTG
	 yhPzkAUOuMf07sUmVY3NhJU9iLpUGCJjNdvSFgQUOBc7/o/1FTB+yQD9eO8gjzJmP4
	 P6isekAlyeLIRpCw+UuawTpbJbpVJ5QxIMjRtf0Lwpb6dFOUpSKAQ58zb57+as7UjJ
	 TsDjfwuEUro+uPUL49Ab5ziiEejqkSPrKXk9RxPkWZLycjFp6zMl9iWKOFkp4INr5a
	 N3XWgeK3TYz2qVkUrrCWZprDaa8+/h4A4ELP9/Pa+C4HBC0bP23oEvwOhcpxsIwfFW
	 ln3RnwM2zwQSA==
Date: Wed, 23 Sep 2026 10:50:03 +0100
From: Lee Jones <lee@kernel.org>
To: Stefan =?iso-8859-1?Q?D=F6singer?= <stefandoesinger@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Brian Masney <bmasney@redhat.com>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Russell King <linux@armlinux.org.uk>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Manivannan Sadhasivam <mani@kernel.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	mfd@lists.linux.dev
Subject: Re: [PATCH v11 05/12] mfd: zx297520v3: Add a clock and reset MFD
 driver
Message-ID: <20260923095003.GB3864833@google.com>
References: <20260826-zx29clk-v11-0-f8ad59c6426c@gmail.com>
 <20260910161711.GK1051768@google.com>
 <x9tzyTnKRAOyrdtSGnka0g@gmail.com>
 <lIjduhk6Sb-yyUCQAY-CKQ@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <lIjduhk6Sb-yyUCQAY-CKQ@gmail.com>
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

On Thu, 17 Sep 2026, Stefan Dösinger wrote:

> Hi Lee,
> 
> Am Donnerstag, 10. September 2026, 22:14:54 Ostafrikanische Zeit schrieben 
> Sie:
> > Hi Lee,
> > 
> > Thanks again for your review!
> 
> This is a ping regarding my reply[0] to your review from last week. Do you 
> have any comments on my responses?

Nope. =:-)

-- 
Lee Jones

