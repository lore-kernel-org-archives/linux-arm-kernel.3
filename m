Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55A4AC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 09:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wZC23h+Tk5+JtUklVm+Zy+QRYNNNb+9yK79RMdexoN4=; b=ku9EjwLB0sw8uZ0FWoJ3RHFBzb
	LHiOuYHjcFle39PebF16iaano9QMxP7iM399uE/1b7GUviQ2nkN1P3rJCiTH2mkI0L0adsXVukVqC
	UKzlI8JaBnnh11rmX0BfOUCgZrfrTOxdOa8yXu6BsFgTmCs516VUtqH/joWL/Pkd7Qg8NJzkvWujH
	pJYm9cIFKpByOE5WtJg6yI0EjVgcWH+UjF0LzYwIo6phZm3bzrHHDcy7nxHMV+tEgCLwpklH8r8/+
	Ip5xDa0j1cN0Bkib9FKb31x5iwo/GtjGhfOI3F7kJc/rtK4G/YxIk5gB73vMyQ98qB7lo+tXd0tl6
	nJWG3EfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tseRF-0000000Add3-06RH;
	Thu, 13 Mar 2025 09:01:13 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tseL0-0000000AcKF-1nou
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 08:54:47 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tseKr-00025H-Ib; Thu, 13 Mar 2025 09:54:37 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tseKr-005VRu-10;
	Thu, 13 Mar 2025 09:54:37 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tseKr-00041e-0i;
	Thu, 13 Mar 2025 09:54:37 +0100
Message-ID: <a37615a87d242df0ad858e3926f33e4246bc00ef.camel@pengutronix.de>
Subject: Re: [PATCH v5 0/8] imx8mp: Add support to Run/Stall DSP via reset
 API
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Mathieu Poirier <mathieu.poirier@linaro.org>, Daniel Baluta
	 <daniel.baluta@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, shawnguo@kernel.org, 
 devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 conor+dt@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
 festevam@gmail.com, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, andersson@kernel.org,
 Frank.Li@nxp.com,  peng.fan@nxp.com, laurentiu.mihalcea@nxp.com,
 iuliana.prodan@nxp.com,  shengjiu.wang@nxp.com
Date: Thu, 13 Mar 2025 09:54:37 +0100
In-Reply-To: <Z9BkbVHlx60VFD7q@p14s>
References: <20250311085812.1296243-1-daniel.baluta@nxp.com>
	 <Z9BkbVHlx60VFD7q@p14s>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_015446_467375_E72B2B94 
X-CRM114-Status: UNSURE (   5.34  )
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

Hi Mathieu,

On Di, 2025-03-11 at 10:27 -0600, Mathieu Poirier wrote:
> Thanks for the re-spin.  I will wait for Shawn and Sascha to review their
> respective bits before picking up this set.

Acked-by: Philipp Zabel <p.zabel@pengutronix.de>

for merging the whole series via rproc.

regards
Philipp

