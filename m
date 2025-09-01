Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1A6FCA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 00:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4yfnTBAHWboiM2neBWAP1Ps57yPG/p2u/x0DsAt5z9Y=; b=W5znP9CDwhHTMdXPPap0Psf5JC
	5+tY5/lwSORcDLzNw71R1gdnRlCR+9KEvaxJvbe2MeWAjPtkK3QW+/Kwxhuw0SUTF1bl+ZE7Qni7B
	xyJD+COhWkHDViXhaydjF/R6qcnvtPcliiIH60ccdMFmn9V6j2XG2UFxZ4R9Evryya9onQvljh1Np
	sFQgxxAMpT0URNJRTk1EotVR0qAs/lHZQBbwmVFCqB7ndoJi0pD9TYKJ4ROmIMdmIyJTXKqopBBO9
	ohElOQbbmp5CoUvaVnxlZc/SMO4Yp+vNNvnLz+lQwhF4E/KExMZeLu9B3qtRiAShNAyAjcjDTC8O/
	brC/hv5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ussmD-0000000At5M-1TJb;
	Mon, 01 Sep 2025 00:52:05 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usshm-0000000Asre-3bnB;
	Mon, 01 Sep 2025 00:47:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=4yfnTBAHWboiM2neBWAP1Ps57yPG/p2u/x0DsAt5z9Y=; b=Ax2HORdWslwgY5f6VBmuynOf1L
	JbOiW98Umtr8rbLbZpS5mSx2d6DeIIUesyoli1xWKOJp1wArfditVba7ZAXwiclLoz7aCQv/Rznme
	kolJUZZPKkjRMMX+nhO+jsunc2vdnT3lUd/c+c7qr8p+6NkZDX60Gvu64nejJJnCbXzg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1usshd-006i3y-5J; Mon, 01 Sep 2025 02:47:21 +0200
Date: Mon, 1 Sep 2025 02:47:21 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Erik Beck <xunil@tahomasoft.com>
Cc: Chukun Pan <amadeus@jmu.edu.cn>, Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: rockchip: Add HINLINK H68K
Message-ID: <ff06c2eb-5124-45bf-b4dc-a43f7558563d@lunn.ch>
References: <021c2e76-cbde-4a2e-a165-a61223cdff93@lunn.ch>
 <5285B176-5178-4F6F-8FB6-B898AC0EC939@tahomasoft.com>
 <20250831104839.7b71f2fc.xunil@tahomasoft.com>
 <6238650e-7a3c-4dd9-adad-cd2a5e925500@lunn.ch>
 <20250831122800.330c9ab3.xunil@tahomasoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250831122800.330c9ab3.xunil@tahomasoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250831_174730_905688_2AFD0AFE 
X-CRM114-Status: UNSURE (   9.98  )
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

> Just so I am clear, the units are tenths of nanoseconds? So <0x02> is .2
> nanoseconds?
 
Quoting myself: 
 
> > One problem we have with rx_delay and tx_delay is that they are
> > magic. we have no idea what they mean.

I very much doubt 0x02 is 0.2 nano seconds. If you have an
oscilloscope which can handle the signals, you could measure it and
see how the delay changes with different values. But developers have
done that in the past, with mixed results.

	Andrew

