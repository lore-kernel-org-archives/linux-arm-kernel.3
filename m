Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29329C28B25
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 16:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OD2hOtHQa0uwK+Cr0jnQY97FmNfZwoPMsZKx2Stcwn4=; b=0fzknTA+yzMCLm5lBaiMbWe+cj
	3ea5Nik3qbW6RtoVrPk5i5iabt+zqmIIbFCDt2BsHDCleYVgACjHH7sCZf20R9HCoA7br1woGDhJW
	Nmcda+ZqlqA505OE1HfoTwPJKFlPBhxuw1rmEIiwdnNlDBSYfzqeakmQx9cN8ON5QYipItnKY3Bdt
	ZV+VTNQObC84jpx1minwzlHTHAwsYx3e7X/PSSDzperPPFOoisdgiWYrDN22L1e4C9TvLS2d0HJP0
	rqCQ8s0uPo6vtF0D1/iayevXX15RGlzoTTQVSQDfXxr2quIrWBAr09AtBOrGK7UbG9ucH1XAdsKEy
	eQDX4wLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqx10-0000000GrV0-1gbz;
	Sat, 08 Mar 2025 16:27:06 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqwzN-0000000GrQI-1dbJ;
	Sat, 08 Mar 2025 16:25:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=OD2hOtHQa0uwK+Cr0jnQY97FmNfZwoPMsZKx2Stcwn4=; b=Xt+M408YamdyCB/pMOD0BkKihm
	Hg6ZflaaQS2yqz405faQ82I6AxOV5ze5MwaXsxDiX7jKdOlcr18KDU9B5DRXEe4CHalzrA6aic/MM
	ITyEbZ0xgApQGzSXFTa71eg+cMXC+e9NvmU84UNo8p24AytPE34azJbvb5lU3TqzADoEc+h+nIbAT
	VTHUHySoUwGoyGdt5VQqBXcDVHq1KTZYnQx4OXtPUSrYIX9K1aYSr7O8ORPhsXPJMdipeOTo8byPj
	0aFzVLwicZTfM69yy6XoIt4cW8DCrHzIRLL27pKTUkjOD4ZK9UPEbOnMW+GXEyLIa2la5dZUzh2VN
	gdlbWLzA==;
Received: from [194.95.143.137] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tqwz8-0003oR-SC; Sat, 08 Mar 2025 17:25:10 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Chukun Pan <amadeus@jmu.edu.cn>,
 Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <ukleinek@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Yao Zi <ziyao@disroot.org>, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-pwm@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: pwm: rockchip: Add rockchip,rk3528-pwm
Date: Sat, 08 Mar 2025 17:25:09 +0100
Message-ID: <5942715.DvuYhMxLoT@phil>
In-Reply-To: <pnlkcc2rl7fegltovgtvp4xdxhonw72rclvhn7qmvb7xyuullm@xf5x6lcigji3>
References: <20250307120004.959980-1-amadeus@jmu.edu.cn>
 <20250307120004.959980-2-amadeus@jmu.edu.cn>
 <pnlkcc2rl7fegltovgtvp4xdxhonw72rclvhn7qmvb7xyuullm@xf5x6lcigji3>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_082525_449024_9BC49AD0 
X-CRM114-Status: GOOD (  13.80  )
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

Hi Uwe,

Am Freitag, 7. M=C3=A4rz 2025, 18:07:47 MEZ schrieb Uwe Kleine-K=C3=B6nig:
> On Fri, Mar 07, 2025 at 08:00:03PM +0800, Chukun Pan wrote:
> > Document pwm compatible for rk3528 which is fallback compatible
> > of rk3328-pwm group.
> >=20
> > Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
>=20
> to prevent binding warnings it's probably sensible to let both patches
> go in via the same tree at the same time. Feel free to take the binding
> patch via rockchip/arm-soc.
>=20
> Acked-by: Uwe Kleine-K=C3=B6nig <ukleinek@kernel.org>

You already have the rk3562 binding in your for-next branch [0], which
could create merge-conflicts later on.

This patch already contains it, so should fit neatly onto your branch.

And binding warnings only come from linux-next, so won't trigger as the
pwm will feed the binding there too :-)

So I guess it might be better to take the binding through the pwm tree
and me then picking up the dts patch.

=46or the binding
Reviewed-by: Heiko Stuebner <heiko@sntech.de>


[0] https://web.git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git/=
commit/?h=3Dpwm/for-next&id=3D058210e84b48dbb670a6bf72afaed6fbd8043a37



