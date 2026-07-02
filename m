Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B51FBC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 15:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8QPQN776u8pNnifYQMrCaM/NOh8UOt440RxwMKhi7fk=; b=glrt09wwakwKpQRFuSIrzJxFtX
	+svXeNFjAolUV9R6yvbdqcI9WfTK4rIAMtFQ0DnZt0RYXxvz5P8ymHNeNk9X8jlE6h2NcUhyn+/7m
	45Snm2eTaAvQMwHLYl6t+vWfJWay9rCOE1GrmhMw8HzXzhRI2anmtIbOcuRMqodbQ6Robjf8nLT0P
	0v7bFC/eH8O4cA0GQtd+cJxEJXzr4QtmYKNDt9YcxesBsGoTM2AVM9Tw11mvfTcJnQ1Xlac6WUPLV
	8b5ois2c9RCCteKjrcss7iqtMRdMTBMcth6QQMGx7AA9+vkPNwTYGf/34rZkLgEESyFE+YbHEsfHl
	iEA8KtZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJjY-00000004soM-2zg8;
	Thu, 02 Jul 2026 15:53:48 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJjV-00000004snb-3DU8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 15:53:47 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 22CDE202631;
	Thu, 02 Jul 2026 17:53:44 +0200 (CEST)
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wfJjU-005lgD-0C;
	Thu, 02 Jul 2026 17:53:44 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wfJjT-00000000Feq-44uq;
	Thu, 02 Jul 2026 17:53:43 +0200
Message-ID: <4fa5149db18bfac88780382cf8d2d6ee18470c71.camel@pengutronix.de>
Subject: Re: [PATCH v3 1/1] reset: imx7: Correct polarity of MIPI CSI resets
 on i.MX8MQ
From: Philipp Zabel <p.zabel@pengutronix.de>
To: robby.cai@oss.nxp.com, Frank.Li@nxp.com, s.hauer@pengutronix.de, 
	festevam@gmail.com
Cc: krzk+dt@kernel.org, andrew.smirnov@gmail.com, kernel@pengutronix.de, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, aisheng.dong@nxp.com, guoniu.zhou@nxp.com
Date: Thu, 02 Jul 2026 17:53:43 +0200
In-Reply-To: <20260619073115.3778313-1-robby.cai@oss.nxp.com>
References: <20260619073115.3778313-1-robby.cai@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_085345_955654_DC231624 
X-CRM114-Status: UNSURE (   7.76  )
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

On Fr, 2026-06-19 at 15:31 +0800, robby.cai@oss.nxp.com wrote:
> From: Robby Cai <robby.cai@nxp.com>
>=20
> On i.MX8MQ, the MIPI CSI reset lines are active-low and not self-clearing=
.
> Writing '0' asserts reset and it remains asserted until explicitly
> deasserted by software.
>=20
> This driver previously treated the MIPI CSI reset signals as active-high,
> which led to incorrect reset assert/deassert sequencing. This issue was
> exposed by commit 6d79bb8fd2aa ("media: imx8mq-mipi-csi2: Explicitly
> release reset").
>=20
> Fix this by reflecting the correct reset polarity and ensuring proper
> reset handling.
[...]

Applied to reset/fixes, thanks!

[1/1] reset: imx7: Correct polarity of MIPI CSI resets on i.MX8MQ
      https://git.kernel.org/pub/scm/linux/kernel/git/pza/linux.git/commit/=
?id=3D71827776667f

regards
Philipp

