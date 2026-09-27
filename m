Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 406FCC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 16:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qkb44GxQlkJlaGvSbdXr/VqLO2OL9eSsLbx5+2uugSw=; b=RNyGLgGuFM2+H6wqQm1fWZZMv+
	ZK0YZbKHHIlL4HyP+8vR2lARrmxaHcDJIkQagKbcVB2Bb0B0LMrkjRbjycit2VDTa50m3ohfd5p9Y
	4UpL95pCrRkbS7+0w8i/5NNLB18knb1C1g+0n4PmG3hF4FcmPhCNqINYaAl1VBftCxKl6Zvs9aPhr
	N4N4mMgTlBXoHssg+9y1WQ7FESeAy/HxH7uQ449/A4j2hjYaYIRnALEbLjcYP29mxZccqeuSoR0pb
	OUwQqj//uOTxUlMo5yj1FXttrWbfraNEzqqBEreBwYMZUBXIKnV5O+KKdaK1Uxp8Zv9BweV8HLI6a
	qPFDjJWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xArSp-0000000GYD0-2lP4;
	Sun, 27 Sep 2026 16:10:55 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xArSn-0000000GYCE-0MhQ;
	Sun, 27 Sep 2026 16:10:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Qkb44GxQlkJlaGvSbdXr/VqLO2OL9eSsLbx5+2uugSw=; b=QJ9NYif8+G+w6Kao0mVbEdQGg2
	ip5qdp0JOj3TqDJ6gbeys1zKRezu1GqXg0YeQAXaewSJHK15K03NVP2Nm8KX5Bk0nXr8E45Kfdfhb
	LWU51QcP+wDLt/PMs1ffXuaCjnux5t+Is5Qhmy+PKjP/7WLiIWYsjia5CYEkaputd39Q=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xArSk-007XPL-HJ; Sun, 27 Sep 2026 18:10:50 +0200
Date: Sun, 27 Sep 2026 18:10:50 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: BG9OXA <bg9oxa@163.com>
Cc: linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v2 0/2] arm64: dts: rockchip: add ALIENTEK QuarkPi-CA2
Message-ID: <de8c3f72-26d1-4c9a-86c6-12afb3fe97d6@lunn.ch>
References: <179051708448.31632.16350193430088134671@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179051708448.31632.16350193430088134671@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_091053_128261_D48DA38C 
X-CRM114-Status: UNSURE (   7.08  )
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

On Sun, Sep 27, 2026 at 09:51:24PM +0800, BG9OXA wrote:

> Changes in v2:

How much time was there between v1 and v2? You need to give reviewers
time to actually do a review and point out issues.

At minimum, wait 24 hours, but ideally 2-3 work days, and allow the
discussion to come to a conclusion.

	   Andrew

