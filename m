Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7DE6C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 10:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=onm1rS1mxSV1bJWjghMpBfWA93PUl1xrcbo/qJEavTA=; b=3Q84rVGCKbphRJlZWWzyVBHd4v
	QQDFomMjAfqr8RM9r7YWuMrdC3mysTiol0M813bbvilqse1sdlJHCxzbEN8cTe6oZznt1i2u0o4ps
	XkMAy8FguSLCUWNBP/8uo1PWB2qeB/rXAMnvxoXD2nNz6AoMiuFBw80sB+OGtikfOFKVRy1E1XaXw
	bl8qtUfYik0lGxfGNa61+Wt0ZvkoqR7dlkmpicdfNqRK7sdYAGdZA/VaRMLeVl64HJ7+vBl7oSDCk
	e2Q/MpcTpXKjloN6JC39CMEC6VCyg0w8znv3VWdjg4wMtOzP61EZQBWcC2yyownTZEbDgnM+kUjh5
	nJs/WkKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkKSU-00000007eqL-0sf5;
	Tue, 18 Feb 2025 10:04:06 +0000
Received: from mail-m16.yeah.net ([220.197.32.16])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkKBO-00000007aA3-1ljt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 09:46:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=onm1rS1mxSV1bJWjghMpBfWA93PUl1xrcbo/qJEavTA=;
	b=JRYbGWXNxNTc3fQD3n1Nod4sZvyt7wZlNtAe/m1AmszDqyjzw8m6DK6d156Y/F
	oxdLYsPezw+v0qyX429aucWeOhcoQjlkk6JCMRarWykIkIA3lniM00lTYm6xgEHl
	osLY2DhfEW0At1JLJOwMdP6kKdxaEHW0IYfsKdjLc2Ny0=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgBnKqjhVrRnFZhhCQ--.20238S3;
	Tue, 18 Feb 2025 17:46:11 +0800 (CST)
Date: Tue, 18 Feb 2025 17:46:09 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Martyn Welch <martyn.welch@collabora.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, kernel@collabora.com,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 RESEND] arm64: dts: ls1028a-rdb: Add iio-hwmon
 compatibility table
Message-ID: <Z7RW4WK0qYs7Vo9l@dragon>
References: <20250109112457.553169-1-martyn.welch@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109112457.553169-1-martyn.welch@collabora.com>
X-CM-TRANSID: Ms8vCgBnKqjhVrRnFZhhCQ--.20238S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUsco2UUUUU
X-Originating-IP: [114.218.218.231]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEQ33ZWe0S+AuKwAAsz
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_014626_778481_A48D851F 
X-CRM114-Status: UNSURE (   7.25  )
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

On Thu, Jan 09, 2025 at 11:24:57AM +0000, Martyn Welch wrote:
> Add an iio-hwmon map to utilise the iio framework and access power
> information via the hwmon framework at the same time.
> 
> Signed-off-by: Martyn Welch <martyn.welch@collabora.com>

I do not quite understand "compatibility table" in the subject.  Could
you elaborate a bit?

Shawn


