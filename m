Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 034AFCCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 01:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IaTmX9G3UENJWUpcQIJrd3kiZNYfexjLahMXatIssO0=; b=CgEwtvnQeD4KVM9mbZGjo3FyAd
	6ojncitwJYLdV1x7wUm7cSbkGlvYwDb2n18JRkV1Jy2hNX9T/isT3nH82zLP20VD5LjP4qOBUlx2O
	Nnt30sbXfrLfhMW41ZUYilJawI4hJ8DFpPUNDXiS370I6MqsyQCrXRFSV006BW/qk+9BfF3BEHci3
	z+RaI/0UXbn1L6h/2bmo8gUXvkZxjAIqtof5j4/xhI/tv3JJMvWO6YhO1Y5qVRDQcuIiHA93fLqm0
	Up6DeQx1nFpclq+vZWzR/sjNVoOTJ6s5erqFOLRccdhzaTjyN1TQE9LZM2hbLxaJJjQvcqJgSwdqt
	O0IHTMYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDBd0-0000000CvAF-02VH;
	Mon, 27 Oct 2025 01:02:30 +0000
Received: from mail-m16.yeah.net ([1.95.21.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDBcw-0000000Cv9m-2mSi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 01:02:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=IaTmX9G3UENJWUpcQIJrd3kiZNYfexjLahMXatIssO0=;
	b=gwMHe0bZ8zz3GwLalwVcb668364HoXdnTJ6ECy1b5A5z3oBW2wB8iRJRI6y/xD
	bM1Po+J2vz2Vk92uacw30kOKEhiB7yLZkLxRZAMdGAB5AS5xF4Ow3QAYPkpkMd8g
	bn6xO1OKfXj8PEW9ZhduKk3Tw+eqFlvMcF+lGFa6yKaGU=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with UTF8SMTPSA id Mc8vCgD3H7x8xP5oF+E6AA--.41307S3;
	Mon, 27 Oct 2025 09:01:50 +0800 (CST)
Date: Mon, 27 Oct 2025 09:01:48 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Hiago De Franco <hiago.franco@toradex.com>,
	Joao Goncalves <joao.goncalves@toradex.com>,
	Joao Goncalves <jpaulo.silvagoncalves@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Max Merchel <Max.Merchel@ew.tq-group.com>,
	Michael Walle <mwalle@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, Tim Harvey <tharvey@gateworks.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: imx: document i.MX 95 Verdin
 Evaluation Kit (EVK)
Message-ID: <aP7EfJddKvEepv3T@dragon>
References: <20250925205211.171699-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925205211.171699-1-marek.vasut@mailbox.org>
X-CM-TRANSID: Mc8vCgD3H7x8xP5oF+E6AA--.41307S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrury7Zr4xXr4kCryfJry7ZFb_yoWxAFgE9F
	n7Kws29FWfGF47Xw1DtFsaq395Kw4F9rn8J3y7W3sxC3s0yF1fJF97AwsYya13WFnavF1a
	k3ZxJr42v3yUZjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU1qQ6JUUUUU==
X-Originating-IP: [117.80.155.87]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIgArkGj+xIAhKgAA3A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_180227_083865_6DB716DD 
X-CRM114-Status: UNSURE (   8.89  )
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

On Thu, Sep 25, 2025 at 10:51:54PM +0200, Marek Vasut wrote:
> Document support for i.MX 95 Verdin Evaluation Kit (EVK), which
> used to be the Titan EVK.
> 
> Note that the SoM used in this EVK is a derivative SoM from Verdin
> line of SoMs, an actual i.MX95 Verdin SoM is under development.
> 
> [1] https://www.toradex.com/computer-on-modules/verdin-arm-family/nxp-imx95-evaluation-kit
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> Reviewed-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>

Applied both, thanks!


