Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A347C83F18
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 08:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/c6PpFZxX2IwuD64HEN0TwJd8WKn9bagu6C1XSQwuQA=; b=ipzvEU7lKwYO6yYWNe1uPSE6O3
	dYoC6Irtbx1fIDslkg/8F4KZhtMqAywD3VDxZePfjs2GWh17Zl1HDVtwZQhaDxjTipRFoZ7QzqqFI
	OoTKBxvGUrEFltM7lbEzTmUoeIFa9sXmn1XAdytxDqSc0HDaCMZ44VJBh6Skjzh9KK9myZQqMi+Pm
	q8W7jO7nO5zJaOHXi//taCBFs6NMC+nHQV5rAtfKghDFXFBHAXe8LoaReZIHMG9kfVDwISuWtvf5L
	p6cpyvwuZRC0+7qdDkKG/Wnbu3Xgm/WvJUW9o9hegl/xfC6BSb5PVWiNKcCjwiayprmz23uBOZ/3u
	XRuH5pWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZn5z-0000000BFt2-3QaP;
	Thu, 10 Jul 2025 08:57:36 +0000
Received: from cpanel.siel.si ([46.19.9.99])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZls7-0000000B2TY-23uw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 07:39:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=/c6PpFZxX2IwuD64HEN0TwJd8WKn9bagu6C1XSQwuQA=; b=JvP0dPmFYZUVUdl1wgJrXB1SaD
	rRq2WFj+DH4ZNfKSIRp0zp/79ug8oz9hbuSi4nyKqqLXaa4aQE7cMf+bOPYJPsfDwRrZnp3RDShkQ
	pY+qc2LaEf+EyKhEOlps0nX9O6gltrDNihJW7sh+u4zp+FrFN11Rp/CJyKW6rhg35QC+93xK+ezdE
	qmuMM400DBI0SJzzOrDYFgjA/h5uEdPs3gfnoGP8YjEwfZrtUtT03u5jI4CNZGZGi/s/DwGz7qSSi
	q8o0YT37TG+LC9rLLMM/FY9AtN+zPZc+JHNJPH/wQlIW7UK90m3fyuEZF0mHFd4fEgJAB87BpBKj2
	5aCntzRA==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:48064 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1uZls3-006IV5-08;
	Thu, 10 Jul 2025 09:39:06 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Haibo Chen <haibo.chen@nxp.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno Sa <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: linux-iio@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de,
	andrej.picej@norik.com
Subject: [PATCH 0/2] Make i.MX 93 ADC calibration params configurable
Date: Thu, 10 Jul 2025 09:39:02 +0200
Message-Id: <20250710073905.1105417-1-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cpanel.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_003911_996770_AB43927D 
X-CRM114-Status: UNSURE (   4.90  )
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

The i.MX 93 ADC calibration parameters are configurable in the MCR
(Main Configuration Register). One can tweak bits:

 - MCR[AVGEN]: Enable calibration averaging function,
 - MCR[NRSMPL]: Select number of calibration samples,
 - MCR[TSAMP]: Select sample time of calibration conversions, 

Make it possible to configure those parameters via the corresponding
device-tree properties.

This patch series is based on the one we submitted in March 2024:
https://lore.kernel.org/linux-arm-kernel/20240320100407.1639082-1-andrej.picej@norik.com/

Changes since the original submission:
- rebase on linux-next
- reorder patches (bindings before users)
- fix checkpatch errors
- reword commit subject & body
- implement feedback from reviewers


Andrej Picej (2):
  dt-bindings: iio: adc: imx93: Add calibration properties
  iio: adc: imx93: Make calibration parameters configurable

 .../bindings/iio/adc/nxp,imx93-adc.yaml       | 21 ++++++
 drivers/iio/adc/imx93_adc.c                   | 75 +++++++++++++++++--
 2 files changed, 91 insertions(+), 5 deletions(-)

-- 
2.34.1


