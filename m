Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9014EE77197
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Dec 2024 04:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T730CnmYeW1A7reDzp3gdGNzgsA+p2z7bTHc+UQZJGY=; b=FNAI73+g/EnEr3wuhTaRehHyJy
	GnuzbsKD6pErh1nwV46rYLxsYlokTTj/gkIghQc+ey9eITgt1VGyzsLdMNkSunYGU1im3SoWHvVw/
	2ElTHmeyqDCczSlzk53ixAM+ce+QkmOkmQZJ8wd3Zy4KMImzH8ncw0hVvqIDaD+F8wVIanfjyz6EH
	2uWXOOL7LIxjF6mZ1lftp+wWJ2thovkjLbngA+n80ED1DG0B+zsGOpCxXeiyYrT36aVdbuQLp1iv6
	88RInq1pdFET9c+2pjNqSI/1zGCo2UZ9HVucoVMqNzK0cKjayhHaRJK5e3yTr4LM9js8liFeAORoN
	g7xFWfmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tS7Im-00000004VJA-15iz;
	Mon, 30 Dec 2024 04:22:48 +0000
Received: from mail-m16.yeah.net ([1.95.21.16])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tS7Hb-00000004VFP-3p1R
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Dec 2024 04:21:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=T730CnmYeW1A7reDzp3gdGNzgsA+p2z7bTHc+UQZJGY=;
	b=DoGSUBpmsxOfocmQZw8r5Q2bS3t12yhstNh1LSyXF9IMzWL6jTki1IRdIaF3BL
	ue8dvBDRmse4whppRGswL4IaWCCkZJ8zgUld0VUPcZUn9pw1/uA1w3GKYcPtcBUD
	VHv6FPUmP11Z3fRUSoUmAoxr2AMEOqmxSCTfPDSTVWFak=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgB3vXy8H3Jn7u_1BQ--.60295S3;
	Mon, 30 Dec 2024 12:21:17 +0800 (CST)
Date: Mon, 30 Dec 2024 12:21:15 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Fabio Estevam <festevam@gmail.com>
Cc: shawnguo@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	francesco.dolcini@toradex.com, Fabio Estevam <festevam@denx.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH RESEND v2] ARM: dts: imx6qdl-apalis: Change to
 "adi,force-bt656-4"
Message-ID: <Z3Ifu23f/Zb/azGb@dragon>
References: <20241202131423.586743-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202131423.586743-1-festevam@gmail.com>
X-CM-TRANSID: M88vCgB3vXy8H3Jn7u_1BQ--.60295S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU2HGQDUUUU
X-Originating-IP: [114.216.146.204]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEQ-FZWdyDppGaQAAsQ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241229_202136_306490_5ED82385 
X-CRM114-Status: GOOD (  11.21  )
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

On Mon, Dec 02, 2024 at 10:14:23AM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> According to adv7180.yaml, the correct property name is
> "adi,force-bt656-4".
> 
> Update it accordingly to fix several dt-schema warnings:
> 
> adv7280@21: 'adv,force-bt656-4' does not match any of the regexes: ...
> 
> imx6qdl-apalis.dtsi is the only in-tree kernel user of this property.
> 
> BSD does have a adv7180 driver, so should not be impacted.
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied, thanks!


