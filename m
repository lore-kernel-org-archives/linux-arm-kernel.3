Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95F8FC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 03:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n/JvTCs/sCVXGz6hg3teVfW2as6Q4XHGy/um0GGV72Y=; b=d5bOoOYwSCbR2/HZCAoTrstzDG
	hto1pOlCMUASazh0GKWd5HOuLGP0+cMKL/TnVFZuLe/wdnR9SSjp4f1zWmCHY8xImCGJjRFk3/NVQ
	5EjmrF32XUysjSBtA2LArqndUNQuoj2SYF5pk7+oLT1UwsaKVoxbNOLSN8S/FsW5se7hAxzs+QT56
	y2XyubNwGzalmsDWpQnShQqIzzrEcYVv7V+FlFJm+Ro48SxndI87y9W5CsJMtWAqUaPQyW296QX0K
	Z2HsIuIWm9Jm4XuL5m4cizAqmSuXCkfr+NyiyrEDfGXRRMdse4Qtsp8847FBQ8AUuL0heCFFi/V/v
	q6kC/Npg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u740g-00000005i5Y-13tf;
	Tue, 22 Apr 2025 03:09:22 +0000
Received: from mail-m16.yeah.net ([220.197.32.19])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u73ym-00000005hvx-2QBc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 03:07:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=n/JvTCs/sCVXGz6hg3teVfW2as6Q4XHGy/um0GGV72Y=;
	b=WWBOz97niOMrfuAQf948QNWtsLZb9k2XaXOOyu8avbFG4LiblVDbZQnmyDbBF+
	TEzEtT4BJdWMlk0tF5t67UTUQFFVM2GrVC3dtXZUMDyi6q1m0ZQBKkE5GZvdC+E4
	H+R5SViHRoN16UWNs4aptgkEw1WBKo77y+v4OvUtuBwPI=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgCXbUbXBwdoi1GrAw--.548S3;
	Tue, 22 Apr 2025 11:07:05 +0800 (CST)
Date: Tue, 22 Apr 2025 11:07:03 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: shawnguo@kernel.org, robh@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, krzk+dt@kernel.org, conor+dt@kernel.org,
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	frank.li@nxp.com, aisheng.dong@nxp.com, daniel.baluta@gmail.com,
	laurentiu.mihalcea@nxp.com, shengjiu.wang@nxp.com,
	iuliana.prodan@nxp.com, a.fatoum@pengutronix.de,
	mathieu.poirier@linaro.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v7 0/5] Configure imx8mp dsp node for rproc usage
Message-ID: <aAcH170yqRMMwVXe@dragon>
References: <20250320121004.2542314-1-daniel.baluta@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250320121004.2542314-1-daniel.baluta@nxp.com>
X-CM-TRANSID: Mc8vCgCXbUbXBwdoi1GrAw--.548S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUTHGQDUUUU
X-Originating-IP: [114.216.210.34]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBB83ZWgG2pu5jgACsT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_200724_985089_35C29CB3 
X-CRM114-Status: UNSURE (   5.61  )
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

On Thu, Mar 20, 2025 at 02:09:50PM +0200, Daniel Baluta wrote:
> Daniel Baluta (5):
>   arm64: dts: imx8mp: Use resets property
>   arm64: dts: imx8mp: Add mu2 root clock
>   arm64: dts: imx8mp: Configure dsp node for rproc usage
>   arm64: dts: imx8mp: Add DSP clocks
>   arm64: dts: Enable DSP node for remoteproc usage

arm64: dts: imx8mp-evk: Enable DSP node for remoteproc usage

Changed the subject a bit and applied all, thanks!


