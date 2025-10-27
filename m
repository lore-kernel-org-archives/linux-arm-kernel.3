Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0C4ECCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 05:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=06tZjU29VwqByqyIrPkQHEnCjRdvf/czRzQRFH3f6Es=; b=H00eoxa2sKEzS8el+iVhnlRZG7
	7Jfz+yfMOSV+N1iWASSyAwQU/xasWo22eiq3gI2JTbniUb4bsvsRZeu/YkG4OMDeeZDje+OqfQSWv
	1+h/u/9r8LDh29LnjHtBcnDY/qEaOfuXY1MGd5kw5p6lbxNL6X2GWsBap2EcAdi5UZyfFuKSUt0a3
	mluiyap17YE7L2hLB9Qxund3B3YtU/hfdug4mNbPU2bzPUNkVor+RUIkxHvFJunO4TbpMIr+994GF
	YlCMJPpsFxLwJbw5jRfgjl8xF8rK9rT1AlqleUyIiUg14JnkVvOj57SCPmhOef2ajdQnfPPUJP6If
	dRCVbQEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDGG8-0000000DA4G-0ouG;
	Mon, 27 Oct 2025 05:59:12 +0000
Received: from mail-m16.yeah.net ([1.95.21.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDGG5-0000000DA3w-3tvQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 05:59:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=06tZjU29VwqByqyIrPkQHEnCjRdvf/czRzQRFH3f6Es=;
	b=KuNZD90719RC4PCN7bHia9QNSl/2bCZTq17vXE0WAnM8BXAykaYGV7Qu4Fl3cg
	SqmO9LabkeKZXrHWfntfe6ejdjxNi91Y3WKOhAKzBGdu964e3XXVPDe3F4wPpxDL
	bc19wccwDo5ARVg55yIj854uaCR+zboGPrpCc/BgaOz98=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgD3_1YeCv9oMlm+AA--.27868S3;
	Mon, 27 Oct 2025 13:58:56 +0800 (CST)
Date: Mon, 27 Oct 2025 13:58:54 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: =?iso-8859-1?Q?Jo=E3o_Paulo_Gon=E7alves?= <jpaulo.silvagoncalves@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?Jo=E3o_Paulo_Gon=E7alves?= <joao.goncalves@toradex.com>
Subject: Re: [PATCH v1] arm64: dts: imx8-ss-img: Avoid gpio0_mipi_csi GPIOs
 being deferred
Message-ID: <aP8KHmFbGFRmgtQz@dragon>
References: <20251014-imx8-gpio-csi-deferred-probe-v1-1-62dd1b949731@toradex.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251014-imx8-gpio-csi-deferred-probe-v1-1-62dd1b949731@toradex.com>
X-CM-TRANSID: Ms8vCgD3_1YeCv9oMlm+AA--.27868S3
X-Coremail-Antispam: 1Uf129KBjvdXoWruFWDKFy5Wr4rWr4kKFW3KFg_yoWxtrg_AF
	yvgr4kCw4DGrn7Jr4YvF42gFWFkF9xW34UKws3Jr43AFySqw4rAF47tr4rAry3Wrs0qry7
	JFZIyw43Jw1Y9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjOVy7UUUUU==
X-Originating-IP: [117.80.155.87]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNQCkCmj-CiBa0AAA3s
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_225910_286312_E57DC501 
X-CRM114-Status: UNSURE (   8.75  )
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

On Tue, Oct 14, 2025 at 09:56:43AM -0300, João Paulo Gonçalves wrote:
> From: João Paulo Gonçalves <joao.goncalves@toradex.com>
> 
> The gpio0_mipi_csi DT nodes are enabled by default, but they are
> dependent on the irqsteer_csi nodes, which are not enabled. This causes
> the gpio0_mipi_csi GPIOs to be probe deferred. Since these GPIOs can be
> used independently of the CSI controller, enable irqsteer_csi by default
> too to prevent them from being deferred and to ensure they work out of
> the box.
> 
> Fixes: 2217f8243714 ("arm64: dts: imx8: add capture controller for i.MX8's img subsystem")
> Signed-off-by: João Paulo Gonçalves <joao.goncalves@toradex.com>

Applied, thanks!


