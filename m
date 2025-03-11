Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FA9DC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 03:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IOD/8eH6MReKw3gPdZRtk1Rage4HyTQ3t3nqYrwuxj4=; b=ma0nHWkKyAcd2/FIEN4Xg2UqBj
	h5jZDHuRdESoG5GjzrsXEDtFhEC3cAGSEeV+t6x5O9ldLKxg2lh4o8K3sPEGSbr7DFAzspD4MGAHM
	yKcDYJr3tWV2lo1d4ByrXJmc2Q0aA9x21U6qcLN4ZalQrEhgT69rJEIBwTXGGoNFy+uW0yJR5Jyob
	9GFL0KB1TUPGMCf39g0hb2j0ZQl+o3n4kMWonGUPg9yx5G4XIN1HHKeodj7PbPJhUv2PQydeXzNuQ
	qvEA0VJHOqlFCj903qI56Dy1qcCtI2vG/ieUBD6r8zsYxGNQamd6IbMMI61GlhqX/rJyZeLS8ZRWP
	r+0FcbLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trqRg-00000004WfW-0mYI;
	Tue, 11 Mar 2025 03:38:20 +0000
Received: from mail-m16.yeah.net ([1.95.21.16])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trqQ1-00000004WSV-33B2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 03:36:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=IOD/8eH6MReKw3gPdZRtk1Rage4HyTQ3t3nqYrwuxj4=;
	b=FipnhvAyKOlglU6eH1sX5EopfIT2wQOpNzsc5WZ/Daaq6TRRIKLz4NgrU0Zm1u
	ePyg6ojedl9PaG7h0gPt1e/qc/C6KLMfce7dtkbrmz435V/FIFwP039HJyQ+j5Qp
	n4Sa4k4rbZwW5qA6mF1OwkBmjq6CZdW3G3IfpfRpdlYZU=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDnUiKzr89nKi21AA--.48775S3;
	Tue, 11 Mar 2025 11:36:21 +0800 (CST)
Date: Tue, 11 Mar 2025 11:36:19 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 0/3] Add Variscite i.MX6UL SoM and Concerto board
 support
Message-ID: <Z8+vs+0dKyBDMU5b@dragon>
References: <20250310-varsom6ul-concerto-dts-v4-0-6034fda6ec64@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250310-varsom6ul-concerto-dts-v4-0-6034fda6ec64@bootlin.com>
X-CM-TRANSID: Ms8vCgDnUiKzr89nKi21AA--.48775S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUsHUqUUUUU
X-Originating-IP: [117.81.240.4]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEhANZWfPpLE8DAAAsn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_203638_070284_932F14B3 
X-CRM114-Status: UNSURE (   5.89  )
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

On Mon, Mar 10, 2025 at 05:39:47PM +0100, Antonin Godard wrote:
> Antonin Godard (3):
>       dt-bindings: arm: fsl: Add VAR-SOM-MX6UL SoM and Concerto board
>       ARM: dts: imx6ul: Add Variscite VAR-SOM-MX6UL SoM support
>       ARM: dts: imx6ul: Add Variscite Concerto board support

Applied all, thanks!


